unit uSimBoletos;

interface

uses
  ACBrBoleto, Windows, cxGridDBTableView, uGlobalLibWiBi, Graphics, Dialogs, ACBrBoletoFCFR,
  uFrmDModule, forms, FireDAC.Comp.Client;

type
  TSimBoletos = class
  private
    FSimBoleto        : TACBrBoleto;
    FSimBoletoPrint   : TACBrBoletoFCFR;
    FSimTitulo        : TACBrTitulo;
    FEmpresa          : Integer;
    FLogImpressao     : Boolean;
    FDirArquivoRemessa: string;
    FDirArquivoRetorno: string;
    FNomeArquivo      : string;
  protected
    function GetBancobyCodigo(ABanco: Integer): TACBrTipoCobranca;
    procedure UpdateBoletoLog(Boleto: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    function LerRetorno(Abop_id: Integer): Boolean;
    procedure GerarBoleto(Boleto: Integer; var ABoletos: TFDQuery; var ABoletoParam: TFDQuery; var AEmpresaLogo: TFDQuery);
    procedure Imprimir(const Preview: Boolean = false; const Setup: Boolean = true; const aPrinterName: String = '');
    function GerarRemessa(Remessa: Integer): Boolean;
    function PegaCodigoBarras: String;
    function PegaLinhaDigitavel: String;
    property SimBoleto: TACBrBoleto read FSimBoleto;
    property Empresa: Integer read FEmpresa write FEmpresa;
    property NomeArquivo: string read FNomeArquivo write FNomeArquivo;
    property DirArquivoRemessa: string read FDirArquivoRemessa write FDirArquivoRemessa;
    property DirArquivoRetorno: string read FDirArquivoRetorno write FDirArquivoRetorno;
    property LogImpressao: Boolean read FLogImpressao write FLogImpressao default true;
  end;

implementation

uses DB, SysUtils, ACBrValidador;

{ TSimBoletos }

constructor TSimBoletos.Create;
begin
  inherited;
  FSimBoleto := TACBrBoleto.Create(nil);
  // FSimBoleto.ImprimirMensagemPadrao := false;
  FSimBoletoPrint                := TACBrBoletoFCFR.Create(nil);
  FSimBoletoPrint.FastReportFile := ExtractFilePath(Application.ExeName) + 'report\BoletoFR.fr3';
  FSimBoletoPrint.DirLogo        := ExtractFilePath(Application.ExeName) + 'logos\colorido';
  FSimBoleto.ACBrBoletoFC        := FSimBoletoPrint;
end;

destructor TSimBoletos.Destroy;
begin
  FSimBoleto.Free;
  FSimBoletoPrint.Free;
end;

function TSimBoletos.GetBancobyCodigo(ABanco: Integer): TACBrTipoCobranca;
begin
  Result := cobBancoDoBrasil;
  case ABanco of
    1:
      Result := cobBancoDoBrasil;
    4:
      Result := cobBancoDoNordeste;
    21:
      Result := cobBanestes;
    33, 353, 8:
      Result := cobSantander;
    41:
      Result := cobBanrisul;
    70:
      Result := cobBRB;
    85:
      Result := cobBancoCECRED;
    104:
      Result := cobCaixaEconomica;
    237:
      Result := cobBradesco;
    341:
      Result := cobItau;
    389:
      Result := cobBancoMercantil;
    748:
      Result := cobSicred;
    756:
      Result := cobBancoob;
    399:
      Result := cobHSBC;
    422:
      Result := cobBancoSafra;

    // cobSafraBradesco:
    // fBancoClass := TACBrBancoSafraBradesco.Create(Self); { 422 + 237 }
  end;
end;

procedure TSimBoletos.Imprimir(const Preview: Boolean = false; const Setup: Boolean = true; const aPrinterName: String = '');
begin
  FSimBoletoPrint.MostrarPreview := Preview;
  FSimBoletoPrint.MostrarSetup   := Setup;
  if (not Setup) and (aPrinterName <> '') then
    FSimBoletoPrint.Impressora := aPrinterName;
  FSimBoleto.Imprimir;
end;

function TSimBoletos.PegaCodigoBarras: String;
var
  I: Integer;
begin
  for I    := 0 to FSimBoleto.ListadeBoletos.Count - 1 do
    Result := FSimBoleto.Banco.MontarCodigoBarras(TACBrTitulo(FSimBoleto.ListadeBoletos.Items[I]));

end;

function TSimBoletos.PegaLinhaDigitavel: String;
var
  I: Integer;
begin
  for I    := 0 to FSimBoleto.ListadeBoletos.Count - 1 do
    Result := FSimBoleto.Banco.MontarLinhaDigitavel(PegaCodigoBarras, TACBrTitulo(FSimBoleto.ListadeBoletos.Items[I]));

end;

procedure TSimBoletos.UpdateBoletoLog(Boleto: Integer);
begin
  with FrmDModule do
  begin
    adStoreProc1.Connection     := ADConnection1;
    adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
    adStoreProc1.StoredProcName := 'proc_update_boleto_log';
    adStoreProc1.SchemaName     := 'dbo';
    adStoreProc1.Prepare;
    adStoreProc1.Params.ParamByName('@bo_id').AsInteger := Boleto;
    adStoreProc1.Params.ParamByName('@bo_printing').AsSmallint := 1;
    adStoreProc1.execProc;

    // if adStoreProc1.FindParam('@max') <> nil then
    // LReturn := adStoreProc1.ParamByName('@max').AsInteger;
  end;
end;

procedure TSimBoletos.GerarBoleto(Boleto: Integer; var ABoletos: TFDQuery; var ABoletoParam: TFDQuery; var AEmpresaLogo: TFDQuery);
var
  loGlobalSQL  : string;
  BField       : TField;
  bmpFile      : TBitmap;
  picture      : TPicture;
  loQrBoleto   : TFDQuery;
  loBoletoParam: TFDQuery;
  loEmpresaLogo: TFDQuery;
  loValidador  : TACBrValidador;
begin
  loQrBoleto    := TFDQuery.Create(nil);
  loEmpresaLogo := TFDQuery.Create(nil);
  loBoletoParam := TFDQuery.Create(nil);
  loValidador   := TACBrValidador.Create(nil);
  bmpFile       := TBitmap.Create;
  try
    try
      { Carregando parametros dos boletos }
      if not Assigned(ABoletoParam) then
      begin
        loBoletoParam.ConnectionName := 'SimERPConn';
        loBoletoParam.Close;
        loBoletoParam.SQL.Text := 'select * from financ_boletos_param where em_codigo = ' + QuotedStr(IntToStr(Empresa));
        loBoletoParam.Open;
        ABoletoParam := loBoletoParam;
      end
      else
      begin
        loBoletoParam := ABoletoParam;
      end;

      if not Assigned(AEmpresaLogo) then
      begin
        loEmpresaLogo.ConnectionName := 'SimERPConn';
        loEmpresaLogo.SQL.Text       := 'select * from t_empresa_logo where em_codigo = ' + QuotedStr(IntToStr(Empresa));
        loEmpresaLogo.Close;
        loEmpresaLogo.Open;
        AEmpresaLogo := loEmpresaLogo;
      end
      else
      begin
        loEmpresaLogo := AEmpresaLogo;
      end;

      if not Assigned(ABoletos) then
      begin
        loGlobalSQL := 'select bo_altera_venc,bo_valor_iof,bo_valor_abatimento,bo_data_desconto,lo_numero,vd_data_venda,en_pessoa,lo_cep,lo_logradouro,br_descricao,cd_descricao,' + 'en_email,uf_id,Status,StatusBanco,bop_id,ca_id,bo_id,cr_id,crp_id,' +
          'vd_codigo,bo_nosso_numero,bo_numero_documento,en_cnpjcpf,cl_codigo,en_nome_completo,' + 'bo_convenio,bo_convenio_dig,bo_local_pagamento,bo_aceite,bo_carteira,bo_carteira_var,' + 'bo_emissao_boleto,bo_especie_documento,bo_data_abatimento,bo_data_baixa,bo_data_credito,' +
          'bo_data_documento,bo_data_mora_juros,bo_data_multa,bo_data_ocorrencia,' + 'bo_data_processamento,bo_data_protesto,bo_data_recebimento,bo_data_vencimento,' + 'bo_valor_despesa_cobr,bo_valor_documento,bo_valor_mora_juros,bo_valor_multa,' +
          'bo_valor_outras_desp,bo_valor_outros_creditos,bo_ocorrencia_original,bo_registro_banco,' + 'bo_tamanho_nosso_numero,bo_instrucoes,bo_motivo_rejeicao,bo_descricao_motivo_rejeicao,' + 'bo_descricao_ocorrencia_original,bo_valor_documento,bo_valor_mora_juros,bo_valor_multa,' +
          'bo_taxa_juros,bo_taxa_multa,bo_valor_desconto,bo_valor_outras_desp,bo_valor_pago,' + 'es_codigo ,es_regiao,es_area,es_setor,es_rota,bo_status,crp_fatgroup from v_boletos where bo_id = %d';

        loQrBoleto.ConnectionName := 'SimERPConn';
        loQrBoleto.SQL.Text       := Format(loGlobalSQL, [Boleto]);
        loQrBoleto.Open;
        ABoletos := loQrBoleto;
      end
      else
      begin
        loQrBoleto := ABoletos;
        if not loQrBoleto.Locate('bo_id', Boleto, [loCaseInsensitive]) then
          exit;
      end;

      { Validação }

      if loQrBoleto.FieldByName('en_pessoa').AsString = '0' then
        loValidador.TipoDocto := docCPF;
      if loQrBoleto.FieldByName('en_pessoa').AsString = '1' then
        loValidador.TipoDocto := docCNPJ;

      loValidador.Documento := loQrBoleto.FieldByName('en_cnpjcpf').AsString;
      if not loValidador.Validar then
      begin
        MessageBox(0, pChar('CNPJ ou CPF inválido para ' + loQrBoleto.FieldByName('en_nome_completo').AsString), 'WiBiERP - Vendas', MB_ICONERROR);
        exit;
      end;

      if not loBoletoParam.Locate('bop_id', loQrBoleto.FieldByName('bop_id').AsString, [loCaseInsensitive]) then
      begin
        MessageBox(0, pChar('Não foi encontrada parametrização para o boleto de ' + loQrBoleto.FieldByName('en_nome_completo').AsString), 'WiBiERP - Vendas', MB_ICONERROR);
        exit;
      end;

      { Dados de configuração do BOLETO }
      FSimBoleto.NomeArqRemessa     := NomeArquivo;
      FSimBoleto.DirArqRemessa      := DirArquivoRemessa;
      FSimBoleto.DataArquivo        := ServerDate;
      FSimBoleto.Banco.TipoCobranca := GetBancobyCodigo(loBoletoParam.FieldByName('bop_banco').AsInteger);

      case loBoletoParam.FieldByName('bop_CNAB400').AsInteger of
        0:
          FSimBoleto.LayoutRemessa := c240;
        1:
          FSimBoleto.LayoutRemessa := c400;
      end;

      { Dados do Cedente - Conta }
      // FSimBoleto.Cedente.DigitoCodigoCedente := loQrBoleto.FieldByName('bo_convenio_dig').AsString;
      FSimBoleto.Banco.Numero                := loBoletoParam.FieldByName('bop_banco').AsInteger;
      FSimBoleto.Banco.TamanhoMaximoNossoNum := loBoletoParam.FieldByName('bop_tamanho_nosso_numero').AsInteger;

      FSimBoleto.Cedente.Agencia       := loBoletoParam.FieldByName('bop_agencia').AsString;
      FSimBoleto.Cedente.AgenciaDigito := loBoletoParam.FieldByName('bop_agencia_dig').AsString;
      FSimBoleto.Cedente.Conta         := loBoletoParam.FieldByName('bop_conta').AsString;
      FSimBoleto.Cedente.ContaDigito   := loBoletoParam.FieldByName('bop_conta_dig').AsString;
      FSimBoleto.Cedente.CodigoCedente := loBoletoParam.FieldByName('bop_convenio').AsString;
      { Dados do Cedente - Cadastrais }
      FSimBoleto.Cedente.Nome := loBoletoParam.FieldByName('bop_nome_cliente').AsString;
      // FSimBoleto.Cedente.NomeSacador := loBeletoParam.FieldByName('bop_nome_sacador').AsString;
      FSimBoleto.Cedente.CNPJCPF := loBoletoParam.FieldByName('bop_cpf_cnpj').AsString;
      // FSimBoleto.Cedente.NumeroCPFCNPJSacador := loBeletoParam.FieldByName('bop_cpf_cnpj_sacador').AsString;
      FSimBoleto.Cedente.TipoInscricao := TACBrPessoaCedente(Ord(loBoletoParam.FieldByName('bop_tipo_inscricao').AsInteger));
      // FSimBoleto.Cedente.TipoInscricaoSacador := TTipoInscricao(Ord(loBeletoParam.FieldByName('bop_tipo_inscricao_sacador').AsInteger));
      FSimBoleto.Cedente.Logradouro := loBoletoParam.FieldByName('bop_logradouro').AsString;
      FSimBoleto.Cedente.Bairro     := loBoletoParam.FieldByName('bop_bairro').AsString;
      FSimBoleto.Cedente.Cidade     := loBoletoParam.FieldByName('bop_cidade').AsString;
      FSimBoleto.Cedente.UF         := loBoletoParam.FieldByName('bop_estado').AsString;
      // FSimBoleto.Cedente.EMail := loBeletoParam.FieldByName('bop_email').AsString;
      FSimBoleto.Cedente.CEP         := loBoletoParam.FieldByName('bop_cep').AsString;
      FSimBoleto.Cedente.NumeroRes   := loBoletoParam.FieldByName('bop_numero').AsString;
      FSimBoleto.Cedente.Complemento := loBoletoParam.FieldByName('bop_complemento').AsString;
      FSimBoleto.Cedente.Convenio    := loQrBoleto.FieldByName('bo_convenio').AsString;
      FSimBoleto.Cedente.Modalidade  := loQrBoleto.FieldByName('bo_carteira_var').AsString;

      // FSimBoleto.EstruturaRota := loQrBoleto.FieldByName('es_codigo').AsString;
      BField := loEmpresaLogo.FieldByName('em_logo');
      bmpFile.LoadFromStream(loEmpresaLogo.CreateBlobStream(BField, bmRead));
      if bmpFile <> nil then
      begin
        picture := TPicture.Create;
        picture.Assign(bmpFile);
        FSimBoleto.ACBrBoletoFC.CarregaLogo(picture, 341);
      end;

      FSimTitulo := FSimBoleto.CriarTituloNaLista;
      { Dados do Boleto }
      FSimTitulo.Carteira        := loQrBoleto.FieldByName('bo_carteira').AsString;
      FSimTitulo.NossoNumero     := loQrBoleto.FieldByName('bo_nosso_numero').AsString;
      FSimTitulo.NumeroDocumento := loQrBoleto.FieldByName('bo_numero_documento').AsString;
      FSimTitulo.SeuNumero       := loQrBoleto.FieldByName('bo_numero_documento').AsString;
      FSimTitulo.LocalPagamento  := loQrBoleto.FieldByName('bo_local_pagamento').AsString;

      case loQrBoleto.FieldByName('bo_aceite').AsInteger of
        1:
          FSimTitulo.Aceite := atSim;
        0:
          FSimTitulo.Aceite := atNao;
      end;

      { Dados do Sacado }
      FSimTitulo.Sacado.CNPJCPF    := loQrBoleto.FieldByName('en_cnpjcpf').AsString;
      FSimTitulo.Sacado.NomeSacado := loQrBoleto.FieldByName('en_nome_completo').AsString;
      FSimTitulo.Sacado.Logradouro := loQrBoleto.FieldByName('lo_logradouro').AsString;
      FSimTitulo.Sacado.Cidade     := loQrBoleto.FieldByName('cd_descricao').AsString;
      FSimTitulo.Sacado.Bairro     := loQrBoleto.FieldByName('br_descricao').AsString;
      FSimTitulo.Sacado.UF         := loQrBoleto.FieldByName('uf_id').AsString;
      FSimTitulo.Sacado.CEP        := loQrBoleto.FieldByName('lo_cep').AsString;
      FSimTitulo.Sacado.Numero     := loQrBoleto.FieldByName('lo_numero').AsString;
      FSimTitulo.Sacado.EMail      := loQrBoleto.FieldByName('en_email').AsString;
      if loQrBoleto.FieldByName('en_pessoa').AsString = '0' then
        FSimTitulo.Sacado.Pessoa := pFisica;
      if loQrBoleto.FieldByName('en_pessoa').AsString = '1' then
        FSimTitulo.Sacado.Pessoa := pJuridica;
      // loTitulo.EmissaoBoleto := TEmissaoBoleto(Ord(loQrBoleto.FieldByName('bo_emissao_boleto').AsInteger));
      // loTitulo.TipoOcorrencia := TTipoOcorrencia(Ord(loQrBoleto.FieldByName('bo_tipo_ocorrencia').AsInteger));
      if (loQrBoleto.FieldByName('bo_status').AsInteger = 0) or (loQrBoleto.FieldByName('bo_status').AsInteger = 5) then
        FSimTitulo.OcorrenciaOriginal.Tipo := toRemessaRegistrar;
      // REMESSA DE BAIXA DE TITULO CANCELADO NO WiBiERP
      if (loQrBoleto.FieldByName('bo_status').AsInteger = 2) or (loQrBoleto.FieldByName('bo_status').AsInteger = 3) then
        FSimTitulo.OcorrenciaOriginal.Tipo := toRemessaBaixar;
      if (loQrBoleto.FieldByName('bo_altera_venc').AsBoolean) then
        FSimTitulo.OcorrenciaOriginal.Tipo := toRemessaAlterarVencimento;

      FSimTitulo.EspecieDoc        := 'DM'; // TEspecieDocumento(Ord(loQrBoleto.FieldByName('bo_especie_documento').AsInteger));
      FSimTitulo.DataAbatimento    := loQrBoleto.FieldByName('bo_data_abatimento').AsDateTime;
      FSimTitulo.DataProtesto      := loQrBoleto.FieldByName('bo_data_protesto').AsDateTime;
      FSimTitulo.DataBaixa         := loQrBoleto.FieldByName('bo_data_baixa').AsDateTime;
      FSimTitulo.DataCredito       := loQrBoleto.FieldByName('bo_data_credito').AsDateTime;
      FSimTitulo.DataDesconto      := loQrBoleto.FieldByName('bo_data_desconto').AsDateTime;
      FSimTitulo.DataDocumento     := loQrBoleto.FieldByName('bo_data_documento').AsDateTime;
      FSimTitulo.DataMoraJuros     := loQrBoleto.FieldByName('bo_data_mora_juros').AsDateTime;
      FSimTitulo.DataOcorrencia    := loQrBoleto.FieldByName('bo_data_ocorrencia').AsDateTime;
      FSimTitulo.DataProcessamento := loQrBoleto.FieldByName('bo_data_documento').AsDateTime;
      FSimTitulo.DataProtesto      := loQrBoleto.FieldByName('bo_data_protesto').AsDateTime;
      // loTitulo.DataRecebimento := loQrBoleto.FieldByName('bo_data_recebimento').AsDateTime;
      FSimTitulo.Vencimento           := loQrBoleto.FieldByName('bo_data_vencimento').AsDateTime;
      FSimTitulo.ValorAbatimento      := loQrBoleto.FieldByName('bo_valor_abatimento').AsFloat;
      FSimTitulo.ValorDesconto        := loQrBoleto.FieldByName('bo_valor_desconto').AsFloat;
      FSimTitulo.ValorDespesaCobranca := loQrBoleto.FieldByName('bo_valor_despesa_cobr').AsFloat;
      FSimTitulo.ValorDocumento       := loQrBoleto.FieldByName('bo_valor_documento').AsFloat;
      FSimTitulo.ValorIOF             := loQrBoleto.FieldByName('bo_valor_IOF').AsFloat;
      FSimTitulo.TextoLivre           := loQrBoleto.FieldByName('es_codigo').AsString;

      // FSimTitulo.ValorMoraJuros := loQrBoleto.FieldByName('bo_taxa_juros').AsFloat;
      FSimTitulo.PercentualMulta := loQrBoleto.FieldByName('bo_taxa_multa').AsFloat;
      FSimTitulo.ValorMoraJuros  := loQrBoleto.FieldByName('bo_valor_mora_juros').AsFloat / 30;
      // FSimTitulo.ValorMulta := loQrBoleto.FieldByName('bo_valor_multa').AsFloat;

      FSimTitulo.ValorOutrasDespesas := loQrBoleto.FieldByName('bo_valor_outras_desp').AsFloat;
      FSimTitulo.ValorOutrosCreditos := loQrBoleto.FieldByName('bo_valor_outros_creditos').AsFloat;
      FSimTitulo.EspecieMod          := 'R$';
      // loTitulo. RegistroBanco := loQrBoleto.FieldByName('bo_registro_banco').AsString;

      FSimTitulo.MotivoRejeicaoComando.Text          := loQrBoleto.FieldByName('bo_motivo_rejeicao').AsString;
      FSimTitulo.DescricaoMotivoRejeicaoComando.Text := loQrBoleto.FieldByName('bo_descricao_motivo_rejeicao').AsString;

      if loQrBoleto.FieldByName('crp_fatgroup').AsInteger = 1 then
      begin
        FSimTitulo.Mensagem.Text := 'Fatura de cigarros' + sLineBreak + 'ESTRUTURA: ' + loQrBoleto.FieldByName('es_codigo').AsString + sLineBreak + UpperCase(loBoletoParam.FieldByName('bop_instrucoes').AsString);
      end
      else
        FSimTitulo.Mensagem.Text := 'ESTRUTURA: ' + loQrBoleto.FieldByName('es_codigo').AsString + sLineBreak + UpperCase(loBoletoParam.FieldByName('bop_instrucoes').AsString);

      if LogImpressao then
        UpdateBoletoLog(Boleto);
      // FSimTitulo.Instrucao2 := 'ESTRUTURA: ' + loQrBoleto.FieldByName('es_codigo').AsString;
      // FSimTitulo.Instrucao3 := StringReplace(UpperCase(loBeletoParam.FieldByName('bop_instrucoes').AsString), UpperCase('@juros'),
      // FormatCurr('R$ #,##0.00', ((FSimTitulo.ValorDocumento * (FSimTitulo.PercentualMulta / 100)) / 30)), [rfReplaceAll]);
      //
      // FSimTitulo.Instrucao3 := StringReplace(UpperCase(FSimTitulo.Instrucao3), UpperCase('@multa'),
      // FormatCurr('R$ #,##0.00', FSimTitulo.ValorDocumento * (FSimTitulo.PercentualMulta / 100)), [rfReplaceAll]);
      // end
      // else
      // begin
      // FSimTitulo.Instrucao1 := 'ESTRUTURA: ' + loQrBoleto.FieldByName('es_codigo').AsString;
      // FSimTitulo.Instrucao2 := StringReplace(UpperCase(loBeletoParam.FieldByName('bop_instrucoes').AsString), UpperCase('@juros'),
      // FormatCurr('R$ #,##0.00', ((FSimTitulo.ValorDocumento * (FSimTitulo.PercentualMulta / 100)) / 30)), [rfReplaceAll]);
      //
      // FSimTitulo.Instrucao2 := StringReplace(UpperCase(FSimTitulo.Instrucao2), UpperCase('@multa'),
      // FormatCurr('R$ #,##0.00', FSimTitulo.ValorDocumento * (FSimTitulo.PercentualMulta / 100)), [rfReplaceAll]);
      // end;
      // if loQrBoleto.FieldByName('bo_valor_desconto').AsFloat > 0 then
      // begin
      // // loTitulo.Instrucoes.Add('');
      // FSimTitulo.Instrucao3 := 'VALOR A SER PAGO ATÉ ' + FormatDateTime('dd/mm/yyyy', loQrBoleto.FieldByName('bo_data_desconto').AsDateTime) + ': ' + FormatCurr('R$ #,##0.00',
      // loQrBoleto.FieldByName('bo_valor_documento').AsFloat - loQrBoleto.FieldByName('bo_valor_desconto').AsFloat) + ' (VALOR DO DESCONTO: ' + FormatCurr('R$ #,##0.00',
      // loQrBoleto.FieldByName('bo_valor_desconto').AsFloat) + ').';
      // end;
      // FSimBoleto.AdicionarMensagensPadroes(FSimTitulo, FSimTitulo.Mensagem);
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;

    { Atualização dos boletos como impresso }
  finally
    bmpFile.Free;
    loValidador.Free;
    if ABoletos = nil then
      loQrBoleto.Free;
    if AEmpresaLogo = nil then
      loEmpresaLogo.Free;
    if ABoletoParam = nil then
      loBoletoParam.Free;
  end;
end;

function TSimBoletos.GerarRemessa(Remessa: Integer): Boolean;
begin
  try
    FSimBoleto.GerarRemessa(Remessa);
    Result := true;
  Except
    on E: Exception do
      Result := false;
  end;
end;

function TSimBoletos.LerRetorno(Abop_id: Integer): Boolean;
var
  loBeletoParam: TFDQuery;
begin
  try
    loBeletoParam := TFDQuery.Create(nil);
    try
      loBeletoParam.ConnectionName := 'SimERPConn';
      loBeletoParam.Close;
      loBeletoParam.SQL.Text := 'select * from financ_boletos_param where bop_id = ' + QuotedStr(IntToStr(Abop_id));
      loBeletoParam.Open;

      FSimBoleto.DirArqRetorno               := DirArquivoRetorno;
      FSimBoleto.NomeArqRetorno              := NomeArquivo;
      FSimBoleto.Banco.TipoCobranca          := GetBancobyCodigo(loBeletoParam.FieldByName('bop_banco').AsInteger);
      FSimBoleto.Banco.Numero                := loBeletoParam.FieldByName('bop_banco').AsInteger;
      FSimBoleto.Banco.TamanhoMaximoNossoNum := loBeletoParam.FieldByName('bop_tamanho_nosso_numero').AsInteger;
      FSimBoleto.Cedente.Agencia             := loBeletoParam.FieldByName('bop_agencia').AsString;
      FSimBoleto.Cedente.AgenciaDigito       := loBeletoParam.FieldByName('bop_agencia_dig').AsString;
      FSimBoleto.Cedente.Conta               := loBeletoParam.FieldByName('bop_conta').AsString;
      FSimBoleto.Cedente.ContaDigito         := loBeletoParam.FieldByName('bop_conta_dig').AsString;
      FSimBoleto.Cedente.CodigoCedente       := loBeletoParam.FieldByName('bop_convenio').AsString;
      FSimBoleto.Cedente.Nome                := loBeletoParam.FieldByName('bop_nome_cliente').AsString;
      FSimBoleto.Cedente.CNPJCPF             := loBeletoParam.FieldByName('bop_cpf_cnpj').AsString;
      FSimBoleto.Cedente.TipoInscricao       := TACBrPessoaCedente(Ord(loBeletoParam.FieldByName('bop_tipo_inscricao').AsInteger));
      // FSimBoleto.Cedente.TipoInscricaoSacador := TTipoInscricao(Ord(loBeletoParam.FieldByName('bop_tipo_inscricao_sacador').AsInteger));
      FSimBoleto.Cedente.Logradouro  := loBeletoParam.FieldByName('bop_logradouro').AsString;
      FSimBoleto.Cedente.Bairro      := loBeletoParam.FieldByName('bop_bairro').AsString;
      FSimBoleto.Cedente.Cidade      := loBeletoParam.FieldByName('bop_cidade').AsString;
      FSimBoleto.Cedente.UF          := loBeletoParam.FieldByName('bop_estado').AsString;
      FSimBoleto.Cedente.CEP         := loBeletoParam.FieldByName('bop_cep').AsString;
      FSimBoleto.Cedente.Complemento := loBeletoParam.FieldByName('bop_complemento').AsString;
      FSimBoleto.Cedente.Convenio    := loBeletoParam.FieldByName('bop_convenio').AsString;
      FSimBoleto.Cedente.Modalidade  := loBeletoParam.FieldByName('bop_carteira_var').AsString;
      FSimBoleto.LerRetorno;
      Result := true;
    finally
      loBeletoParam.Destroy;
    end;
  Except
    on E: Exception do
      Result := false;
  end;
end;

end.
