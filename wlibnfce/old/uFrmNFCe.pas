unit uFrmNFCe;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs, Xml.xmldom, Xml.XMLIntf, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, ACBrNFeDANFEFRDM, ACBrNFeDANFEClass, ACBrNFeDANFEFR, ACBrDFe,
  ACBrNFe, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, ACBrBase, ACBrMail, Xml.Win.msxmldom, Xml.XMLDoc, Vcl.StdCtrls,
  ACBRUtil, pcnConversaoNFe, uFrmNfeConfig, Vcl.ExtCtrls, uGlobalLibNFCe,
  ACBrDFeReport, ACBrDFeDANFeReport;

type
  TFrmNFCe = class(TForm)
    XMLDocMensagem: TXMLDocument;
    ACBrMail1: TACBrMail;
    frxReport1: TfrxReport;
    Label1: TLabel;
    dsNFCe: TFDQuery;
    dsNFCeItens: TFDQuery;
    ACBrNFe: TACBrNFe;
    DanfeFR: TACBrNFeDANFEFR;
    Timer1: TTimer;
    Shape27: TShape;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FSendMail: TSendMail;
    procedure UpdateProtocolo(anf_id: Integer; Protocolo: string; DataAutorizacao: TDateTime);
    procedure StoreXML(aXMLEnviado: WideString; anf_id: Integer);
    procedure doLog(ALog: String);
    procedure GerarNFCe(Apnf_id: Integer);
    procedure doEnviarNFCe(Apnf_id: Integer);
  public
    goPnf_id: Integer;
  end;

var
  FrmNFCe: TFrmNFCe;

implementation

uses
  pcnConversao,
  pcnNFe,
  uFrmDModuleNFCe;
{$R *.dfm}
// function ConsultaServicoCertificado(aNFE: TACBrNFe; Memo: TcxMemo; ImgSerivoON, ImgServicoOFF: TImage): Boolean;
// var
// FEmpresa    : string;
// LCertificado: ICertificate2;
// begin
// Result := false;
// Memo.Clear;
// with aNFE do
// begin
// // LCertificado := SSL.CertSubjectName;
// // Configuracoes.Certificados.GetCertificado;
// FEmpresa := Copy(SSL.CertSubjectName, 1, pos(',', SSL.CertSubjectName) - 1);
// Memo.Lines.Add('Consultando status do serviço...');
// Result                := WebServices.StatusServico.Executar;
// ImgSerivoON.visible   := Result;
// ImgServicoOFF.visible := not ImgSerivoON.visible;
// Memo.Lines.Add(WebServices.StatusServico.Msg);
// Memo.Lines.Add('Dados do Certificado');
// Memo.Lines.Add('Empresa: ' + FEmpresa);
// // Memo.Lines.Add(LCertificado.IssuerName);
// Memo.Lines.Add(SSL.CertSubjectName);
// Memo.Lines.Add('Vencimento: ' + FormatDateTime('dd/mm/yyyy', SSL.CertDataVenc)); // DateToStr(Configuracoes.Certificados.DataVenc))
// end;
// end;

procedure TFrmNFCe.StoreXML(aXMLEnviado: WideString; anf_id: Integer);
begin
  FrmDModuleNFCe.adStoreProc1.StoredProcName := 'fiscal_proc_update_nf_xml';
  FrmDModuleNFCe.adStoreProc1.Prepare;
  FrmDModuleNFCe.adStoreProc1.ParamByName('@nf_id').AsInteger := anf_id;
  FrmDModuleNFCe.adStoreProc1.ParamByName('@xml').AsMemo := aXMLEnviado;
  FrmDModuleNFCe.adStoreProc1.ExecProc;
end;

procedure TFrmNFCe.UpdateProtocolo(anf_id: Integer; Protocolo: string; DataAutorizacao: TDateTime);
begin
  FrmDModuleNFCe.ADConnection1.ExecSQL('update fiscal_nota_fiscal set nf_protocolo = ' + QuotedStr(Protocolo) + ', nf_data_autorizacao = ' + QuotedStr(FormatDateTime('yyyymmdd hh:mm:ss', DataAutorizacao)) + ' where nf_id = ' + IntToStr(anf_id));
end;

procedure TFrmNFCe.GerarNFCe(Apnf_id: Integer);
var
  i  : Integer;
  Lok: Boolean;
begin
  dsNFCe.Open('SELECT * FROM pdv.vw_nota_fiscal where pnf_id = ' + IntToStr(Apnf_id));
  with ACBrNFe.NotasFiscais.Add.NFe do
  begin
    Ide.cNF                                           := dsNFCe.FieldByName('pnf_id').AsInteger;
    Ide.natOp                                         := dsNFCe.FieldByName('pnf_natureza').Value;
    Ide.indPag                                        := ipVista;
    Ide.modelo                                        := 65;
    Ide.serie                                         := dsNFCe.FieldByName('pnf_serie').AsInteger;
    Ide.nNF                                           := dsNFCe.FieldByName('pnf_numero_fiscal').AsInteger;
    Ide.dEmi                                          := dsNFCe.FieldByName('pnf_data_emissao').AsDateTime;
    Ide.dSaiEnt                                       := dsNFCe.FieldByName('pnf_data_entrada_saida').AsDateTime;
    Ide.hSaiEnt                                       := now;
    Ide.tpNF                                          := tnSaida;
    Ide.tpEmis                                        := teNormal;
    Ide.tpAmb                                         := ACBrNFe.Configuracoes.WebServices.Ambiente;
    Ide.cUF                                           := StrToInt(Copy(dsNFCe.FieldByName('pnf_ibge_origem').AsString, 1, 2));
    Ide.cMunFG                                        := dsNFCe.FieldByName('pnf_ibge_origem').Value;
    Ide.finNFe                                        := fnNormal;
    Ide.tpImp                                         := tiNFCe;
    Ide.indFinal                                      := cfConsumidorFinal;
    Ide.indPres                                       := pcPresencial;
    ACBrNFe.Configuracoes.Geral.ModeloDF              := moNFce;
    ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe  := true;
    ACBrNFe.Configuracoes.Geral.CSC                   := FrmDModuleNFCe.CdsEmpresa.FieldByName('em_csc').AsString;
    InfAdic.infAdFisco                                := dsNFCe.FieldByName('pnf_obs').AsString;
    TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFile           := PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Report\DANFeNFCe.fr3';
    TACBrNFeDANFEFR(ACBrNFe.DANFE).TipoDANFE          := tiNFCe;
    TACBrNFeDANFEFR(ACBrNFe.DANFE).TributosFonte      := 'IBPT';
    TACBrNFeDANFEFR(ACBrNFe.DANFE).URLConsultaPublica := ACBrNFe.GetURLConsultaNFCe(Ide.cUF, Ide.tpAmb, 4);


    // Ide.dhCont := date;
    // Ide.xJust  := 'Justificativa Contingencia';

    with FrmDModuleNFCe do
    begin
      if CdsEmpresa.FieldByName('em_simples_nacional').AsInteger = 1 then
        emit.CRT := crtSimplesNacional
      else
        emit.CRT   := crtRegimeNormal;
      emit.CNPJCPF := CdsEmpresa.FieldByName('em_cnpj').Value;
      emit.xNome   := CdsEmpresa.FieldByName('em_razaosocial').Value;
      emit.xFant   := CdsEmpresa.FieldByName('em_fantasia').Value;
      emit.IE      := CdsEmpresa.FieldByName('em_ie').Value;
      with emit.enderEmit do
      begin
        xLgr    := CdsEmpresa.FieldByName('em_endereco').AsString;
        nro     := CdsEmpresa.FieldByName('em_numero').AsString;
        xCpl    := CdsEmpresa.FieldByName('em_complemento').AsString; // 'casa 2';
        xBairro := CdsEmpresa.FieldByName('em_bairro').AsString;
        cMun    := CdsEmpresa.FieldByName('em_ibge_id').AsInteger;
        xMun    := CdsEmpresa.FieldByName('em_cidade').AsString;
        UF      := CdsEmpresa.FieldByName('em_uf').AsString;
        CEP     := CdsEmpresa.FieldByName('em_cep').AsInteger;
        cPais   := 1058;
        xPais   := 'BRASIL';
        fone    := CdsEmpresa.FieldByName('em_fone').AsString;
      end;
    end;
    if dsNFCe.FieldByName('pnf_nfce_identif').AsBoolean then
    begin
      dest.CNPJCPF := dsNFCe.FieldByName('en_cnpjcpf').AsString;
      dest.xNome   := dsNFCe.FieldByName('en_nome_completo').AsString;
      dest.ISUF    := '';
      with dest.enderDest do
      begin
        xLgr    := dsNFCe.FieldByName('tlo_sigla').AsString + ' ' + dsNFCe.FieldByName('ed_logradouro').AsString;
        nro     := dsNFCe.FieldByName('ed_numero').AsString;
        xCpl    := dsNFCe.FieldByName('ed_complemento').AsString;
        xBairro := dsNFCe.FieldByName('br_descricao').AsString;
        cMun    := dsNFCe.FieldByName('cd_ibge_id').AsInteger;
        xMun    := dsNFCe.FieldByName('cd_descricao').AsString;
        UF      := dsNFCe.FieldByName('uf_id').AsString;
        if dsNFCe.FieldByName('ed_cep').AsString <> '' then
          CEP := dsNFCe.FieldByName('ed_cep').AsInteger;
        cPais := 1058;
        xPais := 'BRASIL';
        fone  := dsNFCe.FieldByName('_fone_dest').AsString;
      end;

      dest.indIEDest := inNaoContribuinte;
      dest.IE        := '';
      dest.Email     := dsNFCe.FieldByName('en_email').AsString; // e-mail do cliente
    end;

    dsNFCeItens.Open('select * from v_fiscal_nota_fiscal_itens where nf_id = ' + QuotedStr(dsNFCe.FieldByName('nf_id').AsString) + ' order by pr_codigo');
    dsNFCeItens.First;
    for i := 0 to dsNFCeItens.RecordCount - 1 do
    begin
      with Det.Add do
      begin
        Prod.nItem := i + 1;
        Prod.cProd := dsNFCeItens.FieldByName('pr_codigo_fiscal').AsString;
        Prod.xProd := dsNFCeItens.FieldByName('pr_descricao_fiscal').AsString;
        Prod.cEAN  := dsNFCeItens.FieldByName('pr_codigo_barras').AsString;
        Prod.NCM   := dsNFCeItens.FieldByName('nfi_ncm').AsString;
        Prod.CFOP  := dsNFCeItens.FieldByName('cfop_id').AsString;
        if Prod.CFOP = '' then
        begin
          MessageBox(Application.Handle, pChar('CFOP do produto ' + dsNFCeItens.FieldByName('pr_codigo').AsString + ' - ' + dsNFCeItens.FieldByName('pr_descricao').AsString + ' é obrigatório, confira a operação fiscal e redigite o item.'), 'SigoNFe', MB_ICONERROR);
          exit;
        end;
        Prod.uCom     := dsNFCeItens.FieldByName('un_sigla').AsString;
        Prod.qCom     := dsNFCeItens.FieldByName('nfi_qtd').AsCurrency;
        Prod.vUnCom   := dsNFCeItens.FieldByName('nfi_valor_unit').AsCurrency;
        Prod.vDesc    := dsNFCeItens.FieldByName('nfi_desconto').AsCurrency;
        Prod.vProd    := dsNFCeItens.FieldByName('nfi_qtd').AsCurrency * dsNFCeItens.FieldByName('nfi_valor_unit').AsCurrency;
        Prod.cEANTrib := dsNFCeItens.FieldByName('pr_codigo_barras').AsString;
        Prod.uTrib    := dsNFCeItens.FieldByName('un_sigla').AsString;
        Prod.qTrib    := dsNFCeItens.FieldByName('nfi_qtd').AsCurrency;
        Prod.vUnTrib  := dsNFCeItens.FieldByName('nfi_valor_unit').AsCurrency;
        Prod.vOutro   := dsNFCeItens.FieldByName('nfi_outras_desp').AsCurrency;
        Prod.vFrete   := dsNFCeItens.FieldByName('nfi_frete').AsCurrency;
        Prod.vSeg     := dsNFCeItens.FieldByName('nfi_seguro').AsCurrency;
        Prod.CEST     := dsNFCeItens.FieldByName('nfi_cest').AsString;
        with Imposto do
        begin
          vTotTrib                  := dsNFCeItens.FieldByName('pnfi_total_tributos').AsCurrency;
          ICMSUFDest.vBCUFDest      := dsNFCeItens.FieldByName('pnfi_icms_base').AsCurrency;
          ICMSUFDest.pFCPUFDest     := 0; // dsNFCeItens.FieldByName('nfi_fcp_aliq_ufdest').AsCurrency; // Aliquota do Fundo de Amparo a Probreza
          ICMSUFDest.pICMSUFDest    := 0; // dsNFCeItens.FieldByName('nfi_icms_aliq_ufdest').AsCurrency; // Aliquota Interna do Estado de Destino
          ICMSUFDest.pICMSInter     := 0; // dsNFCeItens.FieldByName('nfi_icms_inter_aliq').AsCurrency; // Aliquota interestadual entre origem e destino
          ICMSUFDest.pICMSInterPart := 0; // dsNFCeItens.FieldByName('nfi_icms_inter_part_aliq').AsCurrency; // Aliquota da Partilha -> 40% em 2016; - 60% em 2017; - 80% em 2018; - 100% a partir de 2019.
          ICMSUFDest.vFCPUFDest     := 0; // dsNFCeItens.FieldByName('nfi_fcp_valor_ufdest').AsCurrency; // vBCUFDest*(pFCPUFDest/100)
          ICMSUFDest.vICMSUFDest    := 0; // dsNFCeItens.FieldByName('nfi_icms_valor_ufdest').AsCurrency; // vBCUFDest*(pICMSInter/100) * (pICMSInterPart/100)
          ICMSUFDest.vICMSUFRemet   := 0; // dsNFCeItens.FieldByName('nfi_icms_valor_ufremet').AsCurrency;

          ICMS.CST   := StrToCSTICMS(Lok, dsNFCeItens.FieldByName('stb_codigo').AsString);
          ICMS.CSOSN := StrToCSOSNIcms(Lok, dsNFCeItens.FieldByName('stb_codigo_sn').AsString);
          ICMS.orig  := TpcnOrigemMercadoria(dsNFCeItens.FieldByName('pnfi_origem_trib').AsInteger);
          ICMS.modBC := dbiValorOperacao;
          ICMS.vBC   := dsNFCeItens.FieldByName('pnfi_icms_base').AsCurrency;

          if dsNFCeItens.FieldByName('pnfi_icms_aliq_sn').AsCurrency > 0 then
          begin
            ICMS.pICMS := dsNFCeItens.FieldByName('pnfi_icms_aliq_sn').AsCurrency;
            ICMS.vICMS := dsNFCeItens.FieldByName('pnfi_icms_sn').AsCurrency;
          end
          else
          begin
            ICMS.pICMS := dsNFCeItens.FieldByName('pnfi_icms_aliq').AsCurrency;
            ICMS.vICMS := dsNFCeItens.FieldByName('pnfi_icms').AsCurrency;
          end;

          ICMS.modBCST := dbisPrecoTabelado;
          ICMS.vBCST   := dsNFCeItens.FieldByName('pnfi_icms_base_ST').AsCurrency;
          ICMS.pICMSST := dsNFCeItens.FieldByName('pnfi_icms_aliq_st').AsCurrency;
          ICMS.vICMSST := dsNFCeItens.FieldByName('pnfi_icms_st').AsCurrency;
          ICMS.pRedBC  := dsNFCeItens.FieldByName('pnfi_reducao_perc').AsCurrency;

          ICMS.pMVAST   := 0;
          ICMS.pRedBCST := 0;

          { PIS }
          PIS.CST  := StrToCSTPIS(Lok, dsNFCeItens.FieldByName('stb_codigo_pis').AsString);
          PIS.vBC  := dsNFCeItens.FieldByName('pnfi_pis_base').AsCurrency;
          PIS.pPIS := dsNFCeItens.FieldByName('pnfi_pis_aliq').AsCurrency;
          PIS.vPIS := dsNFCeItens.FieldByName('pnfi_pis').AsCurrency;

          { IPI }
          IPI.CST  := StrToCSTIPI(Lok, dsNFCeItens.FieldByName('stb_codigo_ipi').AsString);
          IPI.cEnq := dsNFCeItens.FieldByName('').AsString;
          IPI.vBC  := dsNFCeItens.FieldByName('pnfi_ipi_base').AsCurrency;
          IPI.pIPI := dsNFCeItens.FieldByName('pnfi_ipi_aliq').AsCurrency;
          IPI.vIPI := dsNFCeItens.FieldByName('pnfi_ipi').AsCurrency;

          { COFINS }
          COFINS.CST     := StrToCSTCOFINS(Lok, dsNFCeItens.FieldByName('stb_codigo_cofins').AsString);
          COFINS.vBC     := dsNFCeItens.FieldByName('pnfi_cofins_base').AsCurrency;
          COFINS.pCOFINS := dsNFCeItens.FieldByName('pnfi_cofins_aliq').AsCurrency;
          COFINS.vCOFINS := dsNFCeItens.FieldByName('pnfi_cofins').AsCurrency;
        end;
      end;

      dsNFCeItens.Next;
    end;

    { fim dos itens }
    with total.ICMSTot do
    begin
      vTotTrib     := dsNFCe.FieldByName('pnf_total_tributos').AsCurrency;
      vFCPUFDest   := 0; // dsNFCe.FieldByName('nf_fcp_valor_ufdest').AsCurrency;
      vICMSUFDest  := 0; // dsNFCe.FieldByName('nf_icms_valor_ufdest').AsCurrency;
      vICMSUFRemet := 0; // dsNFCe.FieldByName('nf_icms_valor_ufremet').AsCurrency;

      vBC     := dsNFCe.FieldByName('pnf_icms_base').AsCurrency;
      vICMS   := dsNFCe.FieldByName('pnf_icms').AsCurrency;
      vBCST   := dsNFCe.FieldByName('pnf_icms_base_ST').AsCurrency;
      vST     := dsNFCe.FieldByName('pnf_icms_st').AsCurrency;
      vProd   := dsNFCe.FieldByName('pnf_total_prods').AsCurrency;
      vFrete  := dsNFCe.FieldByName('pnf_frete').AsCurrency;
      vSeg    := dsNFCe.FieldByName('pnf_seguro').AsCurrency;
      vDesc   := dsNFCe.FieldByName('pnf_desconto').AsCurrency;
      vII     := 0.00;
      vIPI    := dsNFCe.FieldByName('pnf_ipi').AsCurrency;
      vPIS    := dsNFCe.FieldByName('pnf_pis').AsCurrency;
      vCOFINS := dsNFCe.FieldByName('pnf_cofins').AsCurrency;
      vOutro  := dsNFCe.FieldByName('pnf_outras_desp').AsCurrency;
      vNF     := dsNFCe.FieldByName('pnf_total_nota').AsCurrency;
    end;

    total.ISSQNtot.vServ   := 0;
    total.ISSQNtot.vBC     := 0;
    total.ISSQNtot.vISS    := 0;
    total.ISSQNtot.vPIS    := 0;
    total.ISSQNtot.vCOFINS := 0;

    Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE
    with pag.Add do                // PAGAMENTOS apenas para NFC-e
    begin
      // case dsNFCe.FieldByName('FPGTO_id').AsInteger of
      // 1:
      tPag := fpDinheiro;
      // 2:
      // tPag := fpCheque;
      // 3:
      // tPag := fpCartaoDebito;
      // 4:
      // tPag := fpCartaoCredito;
      // end;

      vPag := dsNFCe.FieldByName('pnf_total_nota').AsCurrency;
    end;

  end;
  ACBrNFe.NotasFiscais.GerarNFe;
  doLog('[>] Assinando ...');
  ACBrNFe.NotasFiscais.Assinar;
end;

// procedure TFrmNFCe.btnCancelarClick(Sender: TObject);
// var
// i      : Integer;
// LMotivo: string;
// LXML   : string;
// begin
//
// if not(InputQuery('Cancelamento', 'Justificativa do Cancelamento', LMotivo)) then
// exit;
//
// ACBrNFE.NotasFiscais.Clear;
// ACBrNFE.Configuracoes.Geral.ModeloDF := moNFce;
// ACBrNFE.Configuracoes.Geral.VersaoDF := ve310;
// MemResult.Lines.Add('[>] Preparando cancelamento ...');
// dsNFCe.Open('SELECT * FROM v_notas_fiscais_nfce where nf_id in ' + uGlobalLib.ConcColumnsSelValues(cxGridDBTableView2, cxGridDBColumn12.Index));
// dsNFCe.First;
// while not dsNFCe.Eof do
// begin
// MemResult.Lines.Add('[>] Cancelando NFC-e ' + dsNFCe.FieldByName('nf_chave').AsString + ' ...');
// cdsNFeXML.CommandText := 'select nf_xml from fiscal_nota_fiscal where nf_id = ' + dsNFCe.FieldByName('nf_id').AsString;
// cdsNFeXML.Close;
// cdsNFeXML.Open;
// LXML := StringReplace(cdsNFeXML.FieldByName('nf_xml').AsVariant, '?', '', [rfReplaceAll]);
// ACBrNFE1.NotasFiscais.LoadFromString(LXML);
// MemResult.Lines.Add('[>] Cancelando nota fiscal');
// ACBrNFE1.EventoNFe.Evento.Clear;
// ACBrNFE1.EventoNFe.idLote := 0;
// with ACBrNFE1.EventoNFe.Evento.Add do
// begin
// infEvento.dhEvento        := ServerDateTime;
// infEvento.tpEvento        := teCancelamento;
// infEvento.detEvento.xJust := LMotivo;
// end;
// if ACBrNFE1.EnviarEvento(0) then
// begin
// UpdateNfeCancelamento(dsNFCe.FieldByName('nf_id').AsString, ACBrNFE1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt, ACBrNFE1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento, LMotivo);
// if ACBrNFE1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat > 136 then
// MemResult.Lines.Add('[X] ' + ACBrNFE1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo)
// else
// MemResult.Lines.Add('[OK] ' + ACBrNFE1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
// end
// else
// MemResult.Lines.Add('[X] Falha ao cancelar nota fiscal!');
// dsNFCe.Next;
// end;
// MemResult.Lines.Add('[>] Cancelamento realizado com sucesso!');
// cdsNFe.Refresh;
// end;
//
// procedure TFrmNFCe.doConsultaNFCe(anf_ids: String);
// var
// i         : Integer;
// lonProt   : string;
// lodhRecbto: TDateTime;
// begin
//
// ACBrNFE1.NotasFiscais.Clear;
// ACBrNFE1.Configuracoes.Geral.ModeloDF := moNFce;
// ACBrNFE1.Configuracoes.Geral.VersaoDF := ve310;
// MemResult.Lines.Add('[>] Gerando NFC-e ...');
// GerarNFCe(anf_ids);
// MemResult.Lines.Add('[>] Consultando NFC-e ...');
// if ACBrNFE1.Consultar then
// begin
// if ACBrNFE1.WebServices.Consulta.retCancNFe.nProt = '' then
// begin
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.cStat    := ACBrNFE1.WebServices.Consulta.retCancNFe.cStat;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.nProt    := ACBrNFE1.WebServices.Consulta.Protocolo;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := ACBrNFE1.WebServices.Consulta.dhRecbto;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.chNFe    := dsNFCe.FieldByName('nf_chave').AsString;
// end
// else
// begin
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.cStat    := ACBrNFE1.WebServices.Consulta.retCancNFe.cStat;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.xMotivo  := ACBrNFE1.WebServices.Consulta.retCancNFe.xMotivo;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.nProt    := ACBrNFE1.WebServices.Consulta.retCancNFe.nProt;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := ACBrNFE1.WebServices.Consulta.retCancNFe.dhRecbto;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.chNFe    := dsNFCe.FieldByName('nf_chave').AsString;
// end;
// MemResult.Lines.Add('[>] Gravando XML ...');
// StoreXML(ACBrNFE1.NotasFiscais.Items[0].Xml, dsNFCe.FieldByName('nf_id').AsInteger);
// if ACBrNFE1.WebServices.Consulta.retCancNFe.nProt = '' then
// begin
// lonProt    := ACBrNFE1.WebServices.Consulta.Protocolo;
// lodhRecbto := ACBrNFE1.WebServices.Consulta.dhRecbto;
// end
// else
// begin
// lonProt    := ACBrNFE1.WebServices.Consulta.retCancNFe.nProt;
// lodhRecbto := ACBrNFE1.WebServices.Consulta.retCancNFe.dhRecbto;
// end;
// MemResult.Lines.Add('[>] Gravando Procotolo ...');
// UpdateProtocolo(dsNFCe.FieldByName('nf_id').AsInteger, lonProt, lodhRecbto);
// end;
// MemResult.Lines.Add('[>] Consulta realizada!');
// end;
//
// procedure TFrmNFCe.btnConsultaClick(Sender: TObject);
// var
// X     : Integer;
// Lnf_id: String;
// begin
// for X := 0 to cxGridDBTableView1.DataController.GetSelectedCount - 1 do
// begin
// Lnf_id := cxGridDBTableView1.DataController.GetDisplayText(cxGridDBTableView1.DataController.GetRowInfo(cxGridDBTableView1.DataController.GetSelectedRowIndex(X)).RecordIndex, cxGridDBColumn3.Index);
// doConsultaNFCe('(' + Lnf_id + ')');
// end;
//
// end;
//
// procedure TFrmNFCe.btnConsultar2Click(Sender: TObject);
// var
// X     : Integer;
// Lnf_id: String;
// begin
// for X := 0 to cxGridDBTableView2.DataController.GetSelectedCount - 1 do
// begin
// Lnf_id := cxGridDBTableView2.DataController.GetDisplayText(cxGridDBTableView2.DataController.GetRowInfo(cxGridDBTableView2.DataController.GetSelectedRowIndex(X)).RecordIndex, cxGridDBColumn12.Index);
// doConsultaNFCe('(' + Lnf_id + ')');
// end;
// end;

procedure TFrmNFCe.doLog(ALog: String);
begin
  Label1.Caption := ALog;
  Label1.Refresh;
end;

procedure TFrmNFCe.doEnviarNFCe(Apnf_id: Integer);
var
  vNumLote: Integer;
  Sincrono: Boolean;
begin

  vNumLote := 0;

  Sincrono := false;

  ACBrNFe.NotasFiscais.Clear;
  ACBrNFe.Configuracoes.Geral.ModeloDF := moNFce;
  ACBrNFe.Configuracoes.Geral.VersaoDF := ve400;
  doLog('[>] Gerando NFC-e ...');
  GerarNFCe(Apnf_id);
  StoreXML(ACBrNFe.NotasFiscais.Items[0].Xml, Apnf_id);
  doLog('[>] Enviando ...');
  ACBrNFe.Enviar(vNumLote, false, Sincrono);
  doLog('[>] Registrando protocolo ...');
  FrmDModuleNFCe.ADConnection1.ExecSQL('update fiscal_nota_fiscal set nf_chave = ' + QuotedStr(uGlobalLibNFCe.OnlyNumbers(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID)) + ' where nf_id = ' + IntToStr(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cNF));
  UpdateProtocolo(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cNF, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);
  doLog('[>] Imprimindo...');
  ACBrNFe.NotasFiscais.Imprimir;
  doLog('[>] Enviado com sucesso!');
  ACBrNFe.NotasFiscais.Clear;

end;

// procedure TFrmNFCe.UpdateNfeCancelamento(anf_id: string; ProtCancelamento: string; DataCancelamento: TDateTime; Motivo: string);
// begin
// FrmDModuleNFCe.ADConnection1.ExecSQL('update fiscal_nota_fiscal set nf_protocolo_cancel = ' + QuotedStr(ProtCancelamento) + ',nf_data_cancel = ' + QuotedStr(FormatDateTime('yyyymmdd hh:mm:ss', DataCancelamento)) + ',nf_motivo_cancel = ' + QuotedStr(Motivo) + ' where nf_id = ' + anf_id);
// end;

// procedure TFrmNFCe.btnImprimirClick(Sender: TObject);
// var
// i         : Integer;
// lonProt   : string;
// lodhRecbto: TDateTime;
// begin
//
// ACBrNFE1.NotasFiscais.Clear;
// ACBrNFE1.Configuracoes.Geral.ModeloDF := moNFce;
// ACBrNFE1.Configuracoes.Geral.VersaoDF := ve310;
// doLog('[>] Preparando impressão ...');
// GerarNFCe(uGlobalLibPDV.ConcColumnsSelValues(cxGridDBTableView2, cxGridDBColumn12.Index));
// if ACBrNFE1.Consultar then
// begin
// if ACBrNFE1.WebServices.Consulta.retCancNFe.nProt = '' then
// begin
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.cStat    := ACBrNFE1.WebServices.Consulta.retCancNFe.cStat;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.nProt    := ACBrNFE1.WebServices.Consulta.Protocolo;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := ACBrNFE1.WebServices.Consulta.dhRecbto;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.chNFe    := CdsNFeSelect.FieldByName('nf_chave').AsString;
// end
// else
// begin
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.cStat    := ACBrNFE1.WebServices.Consulta.retCancNFe.cStat;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.xMotivo  := ACBrNFE1.WebServices.Consulta.retCancNFe.xMotivo;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.nProt    := ACBrNFE1.WebServices.Consulta.retCancNFe.nProt;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := ACBrNFE1.WebServices.Consulta.retCancNFe.dhRecbto;
// ACBrNFE1.NotasFiscais.Items[0].NFe.procNFe.chNFe    := CdsNFeSelect.FieldByName('nf_chave').AsString;
// end;
// end;
// doLog('[>] Imprimindo ...');
// ACBrNFE1.NotasFiscais.Imprimir;
// ACBrNFE1.NotasFiscais.Clear;
// doLog('[>] Impressão realizada!');
// end;
//
// procedure TFrmNFCe.btnInutilizarClick(Sender: TObject);
// var
// X      : Integer;
// Lnf_id : String;
// LMotivo: String;
// begin
// for X := 0 to cxGridDBTableView1.DataController.GetSelectedCount - 1 do
// begin
// Lnf_id := cxGridDBTableView1.DataController.GetDisplayText(cxGridDBTableView1.DataController.GetRowInfo(cxGridDBTableView1.DataController.GetSelectedRowIndex(X)).RecordIndex, cxGridDBColumn3.Index);
//
// CdsNFeSelect.Open('SELECT * FROM v_notas_fiscais_nfce where nf_id = ' + Lnf_id);
// if CdsNFeSelect.IsEmpty then
// exit;
//
// while true do
// begin
// if not(InputQuery('Inutilização de Nota', 'Justificativa para Inutilização, mínimo 15 caracteres', LMotivo)) then
// exit;
// if Length(LMotivo) >= 15 then
// break
// else
// MessageBox(Handle, 'No mínimo 15 caracteres.', 'SigoNFe', MB_ICONINFORMATION);
// end;
//
// doLog('');
// doLog('[>] Nota Fiscal Nº ' + CdsNFeSelect.FieldByName('nf_numero_fiscal').AsString);
//
// try
// try
// doLog('[>] Inutilizando');
// ACBrNFE1.WebServices.Inutiliza(FrmDModuleNFCe.CdsEmpresa.FieldByName('em_cnpj').AsString, LMotivo, StrToInt(FormatDateTime('yyyy', (CdsNFeSelect.FieldByName('nf_data_emissao').AsDateTime))), 55, StrToInt(CdsNFeSelect.FieldByName('nf_serie').AsString),
// CdsNFeSelect.FieldByName('nf_numero_fiscal').AsInteger, CdsNFeSelect.FieldByName('nf_numero_fiscal').AsInteger);
//
// if ACBrNFE1.WebServices.Inutilizacao.Protocolo <> '' then
// begin
// FrmDModuleNFCe.ADConnection1.ExecSQL('update fiscal_nota_fiscal set nf_protocolo_inutilizada = ' + QuotedStr(ACBrNFE1.WebServices.Inutilizacao.Protocolo) + ',nf_data_inutilizada = ' + QuotedStr(FormatDateTime('yyyymmdd hh:mm:ss', ACBrNFE1.WebServices.Inutilizacao.dhRecbto)) +
// ',nf_motivo_rejeicao = ' + QuotedStr(LMotivo) + ' where nf_id = ' + CdsNFeSelect.FieldByName('nf_id').AsString);
// end;
//
// doLog('[OK] Nota fiscal ao consumidor inutilizada com sucesso!');
// finally
// // LoadXML(UTF8Encode(NFE.WebServices.Inutilizacao.RetWS), WBResposta);
// end;
// except
// on E: Exception do
// doLog('[X] Erro ao inutilizar nota fiscal' + #10 + '(' + E.Message + ')');
// end;
// end;
// end;

procedure TFrmNFCe.FormCreate(Sender: TObject);
begin
  XMLDocMensagem.FileName := ExtractFilePath(Application.ExeName) + 'Schemas\tiposBasico_v1.03.xsd';
  XMLDocMensagem.Active   := true;
end;

procedure TFrmNFCe.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TFrmNFCe.Timer1Timer(Sender: TObject);
// var
// FForm   : TFrmNfeConfig;
// LEmpresa: String;
begin
  Timer1.Enabled := false;
  // ACBrNFe.Destroy;
  // ACBrNFe := TACBrNFe.Create(self);
  // FForm   := TFrmNfeConfig.Create(Application);
  // FForm.LerXMLConfig(IntToStr(ServerEmpresa), ACBrNFe, DanfeFR, FSendMail);
  // ACBrNFe.DANFE                                    := DanfeFR;
  // ACBrNFe.Configuracoes.Geral.VersaoDF             := ve400;
  // ACBrNFe.Configuracoes.Geral.ModeloDF             := moNFce;
  // ACBrNFe.Configuracoes.Geral.ValidarDigest        := false;
  // ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := true;
  // TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFile          := PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Report\DANFeNFCe.fr3';
  // TACBrNFeDANFEFR(ACBrNFe.DANFE).TipoDANFE         := tiNFCe;
  doEnviarNFCe(goPnf_id);
  ModalResult := mrOk;
end;

// procedure TFrmNFCe.lblConfigClick(Sender: TObject);
// var
// Form: TFrmNfeConfig;
// begin
// try
// Form := TFrmNfeConfig.Create(Application);
// Form.LerXMLConfig(IntToStr(ServerEmpresa), ServerEmpresaSite, ServerEmpresaEmail, ServerEmpresaFone, ServerEmpresaLogo, ACBrNFE1, ACBrNFeDANFEFR1);
// ACBrNFE1.Configuracoes.Geral.VersaoDF := ve310;
// // LDefPrinter := ACBrNFeDANFEFR1.Impressora;
// if Form.ShowModal = mrOk then
// SimThread1.Load('Carregando Configurações...');
// finally
// Form.Release;
// end;
//
// end;

end.
