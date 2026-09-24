unit uFrmPDV_NFCe;

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
  Dialogs, Xml.xmldom, Xml.XMLIntf, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  ACBrNFeDANFEFRDM, ACBrNFeDANFEClass, ACBrNFeDANFEFR, ACBrDFe,
  ACBrNFe, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass,
  ACBrBase, ACBrMail, Xml.XMLDoc, Vcl.StdCtrls,
  ACBRUtil, pcnConversaoNFe, Vcl.ExtCtrls, ACBrPosPrinter, uFrmConfig_NFCe,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrSAT, ACBrIntegrador, Data.Win.ADODB,
  AdvSmoothPanel, AdvSmoothExpanderPanel, AdvSmoothExpanderButtonPanel,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, cxTextEdit, cxMemo, AdvGDIP, Xml.Win.msxmldom,
  ACBrNFeDANFeESCPOS;

type
  TFrmPDV_NFCe = class(TForm)
    XMLDocMensagem: TXMLDocument;
    ACBrMail1: TACBrMail;
    frxReport1: TfrxReport;
    dsNFCe: TFDQuery;
    dsNFCeItens: TFDQuery;
    ACBrNFe: TACBrNFe;
    Timer1: TTimer;
    Shape16: TShape;
    lblTitle: TLabel;
    dsNFCePags: TFDQuery;
    ACBrPosPrinter1: TACBrPosPrinter;
    DanfeFR: TACBrNFeDANFEFR;
    ACBrSAT1: TACBrSAT;
    a1: TADOQuery;
    ds1: TDataSource;
    lblStatus: TLabel;
    expandedPanel: TAdvSmoothExpanderButtonPanel;
    lblMensagemRodape: TLabel;
    memErrorLog: TcxMemo;
    fdqryItensPedido: TFDQuery;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure expandedPanelEndCollapsePanel(Sender: TObject);
    procedure expandedPanelBeforeDrawExpander(Sender: TObject; AGraphics: TGPGraphics; ARect: TGPRectF;
      AExpanded, ADown, AHover: Boolean; var ADefaultDraw: Boolean);
  private
    FSendMail: TSendMail;
    function doConsultaNFCe(Apnf_id: Integer; AOffline: Boolean): Boolean;
    procedure UpdateProtocolo(anf_id: Integer; Protocolo: string; DataAutorizacao: TDateTime);
    procedure StoreXML(aXMLEnviado: AnsiString; anf_id: Integer; cnf: Integer);
    procedure doLog(ALog: String);
    procedure GerarNFCe(Apnf_id: Integer; AModoOffLine: Boolean);
    function doEnviarNFCe(Apnf_id: Integer; AOffline: Boolean): Boolean;
    procedure UpdateRejeicao(anf_id: Integer; aMsg: string; AOffline: Boolean = false);
    procedure UpdateNfeCancelamento(Apnf_id: Integer; ProtCancelamento: string; DataCancelamento: TDateTime;
      Motivo: string);
    procedure updateEstoqueFical(Pedido: Integer);
    procedure UpdateProtocoloI9(anf_id: Integer; Protocolo: string; DataAutorizacao: TDateTime);
    function doCancelaNFCe: Boolean;
    procedure ProdutoInList(Avalue: string);
    procedure EventNFeTransmitError(const HttpError, InternalError: Integer;
      const URL, DadosEnviados, SoapAction: string; var Retentar, Tratado: Boolean);
    procedure ImprimirConfigencia(Apnf_id: Integer);
    procedure updateEstoqueFicalContigencia(Pedido: Integer);
    procedure doLogFile(ALog: string);
  public
    goPnf_id               : Integer;
    goTerminal             : String;
    goXMLToCancel          : String;
    goPathNFe, goImpressora: String;
    goContigencia          : Boolean;
    goOffLine, goCancelMode: Boolean;
    procedure doSetConfigNFCe;
  end;

var
  FrmPDV_NFCe: TFrmPDV_NFCe;

implementation

uses
  pcnConversao,
  uFrmPDV_DModule, uGlobalLibPDV, uFrmPDV_DModule_DS, uFrmPDV, ACBrDFeSSL,
  ACBrDFe.Conversao,
  blcksock, ACBrNFe.Classes;
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

procedure TFrmPDV_NFCe.EventNFeTransmitError(const HttpError, InternalError: Integer;
  const URL, DadosEnviados, SoapAction: string; var Retentar, Tratado: Boolean);
begin
  ACBrNFe.Tag := 0;
  if InternalError <> 0 then
    ACBrNFe.Tag := InternalError;

  doLogFile('ERRO TRANSMISSAO NFCE HttpError:' + IntToStr(HttpError) + #13#10 + 'InternalError:' +
    IntToStr(InternalError) + #13#10 + 'URL:' + URL);

  Retentar := false;

end;

procedure TFrmPDV_NFCe.StoreXML(aXMLEnviado: AnsiString; anf_id: Integer; cnf: Integer);
begin
  if goContigencia then
    Exit;
  try
    with FrmPDV_DModule do
    begin
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_update_nota_xml';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      adStoreProc1.Params.ParamByName('@pnf_id').AsInteger          := anf_id;
      adStoreProc1.Params.ParamByName('@pterm_id').AsString         := goTerminal;
      adStoreProc1.Params.ParamByName('@pnf_xml').AsMemo            := aXMLEnviado;
      adStoreProc1.Params.ParamByName('@pnf_nnotamodulo').AsInteger := cnf;

      adStoreProc1.execProc;
    end;
  except
    raise;
  end;
end;

procedure TFrmPDV_NFCe.UpdateProtocolo(anf_id: Integer; Protocolo: string; DataAutorizacao: TDateTime);
begin
  FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_offline = 0,pnf_protocolo = ' +
    QuotedStr(Protocolo) + ', pnf_data_autorizacao = ' + QuotedStr(FormatDateTime('yyyymmdd hh:mm:ss', DataAutorizacao))
    + ' where pnf_id = ' + IntToStr(anf_id));

end;

procedure TFrmPDV_NFCe.UpdateProtocoloI9(anf_id: Integer; Protocolo: string; DataAutorizacao: TDateTime);
begin
  with a1 do
  begin
    Close;
    sql.clear;
    sql.add('update  basei9..CFPDV_Cabecalho set pnf_data_autorizacao = :v0 , pnf_status = 4 , pnf_protocolo = :v1 ' +
      ' where pnf_id = :v2  and pterm_id = :v3  ');
    Parameters[0].Value := DataAutorizacao;
    Parameters[1].Value := ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt;
    Parameters[2].Value := IntToStr(anf_id);
    Parameters[3].Value := goTerminal;
    ExecSQL;
  end;
end;

procedure TFrmPDV_NFCe.UpdateRejeicao(anf_id: Integer; aMsg: string; AOffline: Boolean);
begin
  if AOffline or goContigencia then
    FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_offline = 1, pnf_motivo_rejeicao = ' +
      QuotedStr(aMsg) + ' where pnf_id = ' + IntToStr(anf_id))
  else
    FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_offline = 0,pnf_motivo_rejeicao = ' +
      QuotedStr(aMsg) + ' where pnf_id = ' + IntToStr(anf_id))
end;

procedure TFrmPDV_NFCe.updateEstoqueFical(Pedido: Integer);
begin
  FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set  pnf_status = 4 where pnf_id = ' +
    IntToStr(Pedido));

  FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal_itens set dtcontrole = getdate() ' +
    'where pnfi_id = ' + IntToStr(Pedido));
end;

procedure TFrmPDV_NFCe.updateEstoqueFicalContigencia(Pedido: Integer);
begin
  FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set  pnf_status = 2 where pnf_id = ' +
    IntToStr(Pedido));

  FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal_itens set dtcontrole = getdate() ' +
    'where pnfi_id = ' + IntToStr(Pedido));
end;

procedure TFrmPDV_NFCe.GerarNFCe(Apnf_id: Integer; AModoOffLine: Boolean);
var
  i                                              : Integer;
  Lok                                            : Boolean;
  vIndPag                                        : string;
  vIndBandeira                                   : String;
  ok                                             : Boolean;
  vtotPago, vtotPedido, totcbs, totibs, totcbsibs: real;
begin
  vtotPago   := 0;
  vtotPedido := 0;
  totcbsibs  := 0;
  totcbs     := 0;
  totibs     := 0;
  dsNFCe.Open('SELECT * FROM pdv.vw_nota_fiscal where pnf_id = ' + IntToStr(Apnf_id));
  FrmPDV_DModule.cdsEmpresa.Open
    ('SELECT a.* FROM v_empresa a, t_users_empresas b WHERE a.em_codigo =b.em_codigo AND b.us_codigo = ' +
    FrmPDV_DModule.User.UserId);
  with ACBrNFe.NotasFiscais.add.NFe do
  begin

    Dest.ISUF := '';
    Ide.cnf   := dsNFCe.FieldByName('pnf_id').AsInteger;
    Ide.natOp := dsNFCe.FieldByName('pnf_natureza').AsString;
    if Ide.natOp = '' then
      Ide.natOp := 'Venda';
    Ide.indPag  := ipVista;
    Ide.modelo  := 65;
    Ide.serie   := dsNFCe.FieldByName('pnf_serie').AsInteger;
    Ide.nNF     := dsNFCe.FieldByName('pnf_numero_fiscal').AsInteger;
    Ide.dEmi    := ServerDateTime;
    Ide.dSaiEnt := ServerDateTime;
    Ide.hSaiEnt := ServerDateTime;
    Ide.tpNF    := tnSaida;
    if AModoOffLine then
    begin
      Ide.tpEmis                               := teOffLine;
      ACBrNFe.Configuracoes.Geral.FormaEmissao := teOffLine;
    end
    else
    begin
      Ide.tpEmis                               := teNormal;
      ACBrNFe.Configuracoes.Geral.FormaEmissao := teNormal;
    end;
    Ide.tpAmb    := ACBrNFe.Configuracoes.WebServices.Ambiente;
    Ide.cUF      := StrToInt(Copy(dsNFCe.FieldByName('pnf_ibge_origem').AsString, 1, 2));
    Ide.cMunFG   := dsNFCe.FieldByName('pnf_ibge_origem').Value;
    Ide.finNFe   := fnNormal;
    Ide.tpImp    := tiNFCe;
    Ide.indFinal := cfConsumidorFinal;

    Ide.indPres                          := pcPresencial;
    ACBrNFe.Configuracoes.Geral.ModeloDF := moNFce;
    // 000001
    ACBrNFe.Configuracoes.Geral.IdCSC := FrmPDV_DModule.cdsEmpresa.FieldByName('em_idcsc').AsString;;
    // '000001' ERIMAR  em_idcsc
    ACBrNFe.Configuracoes.Geral.CSC         := FrmPDV_DModule.cdsEmpresa.FieldByName('em_csc').AsString;
    InfAdic.infAdFisco                      := dsNFCe.FieldByName('pnf_obs').AsString;
    TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFile := PathWithDelim(ExtractFilePath(Application.ExeName)) +
      'Report\DANFeNFCe.fr3';
    TACBrNFeDANFEFR(ACBrNFe.DANFE).TipoDANFE := tiNFCe;
    // TACBrNFeDANFEFR(ACBrNFe.DANFE).TributosFonte      := 'IBPT';
    // TACBrNFeDANFEFR(ACBrNFe.DANFE).URLConsultaPublica := ACBrNFe.GetURLConsultaNFCe(Ide.cUF, Ide.tpAmb, 4);


    // Ide.dhCont := date;
    // Ide.xJust  := 'Justificativa Contingencia';

    with FrmPDV_DModule do
    begin
      if cdsEmpresa.FieldByName('em_simples_nacional').AsInteger = 1 then
        emit.CRT := crtSimplesNacional
      else
        emit.CRT   := crtRegimeNormal;
      emit.CNPJCPF := cdsEmpresa.FieldByName('em_cnpj').Value;
      emit.xNome   := cdsEmpresa.FieldByName('em_razaosocial').Value;
      emit.xFant   := cdsEmpresa.FieldByName('em_fantasia').Value;
      emit.IE      := cdsEmpresa.FieldByName('em_ie').Value;
      with emit.enderEmit do
      begin
        xLgr    := cdsEmpresa.FieldByName('em_endereco').AsString;
        nro     := cdsEmpresa.FieldByName('em_numero').AsString;
        xCpl    := cdsEmpresa.FieldByName('em_complemento').AsString; // 'casa 2';
        xBairro := cdsEmpresa.FieldByName('em_bairro').AsString;
        cMun    := cdsEmpresa.FieldByName('cd_ibge_id').AsInteger;
        xMun    := cdsEmpresa.FieldByName('em_cidade').AsString;
        UF      := cdsEmpresa.FieldByName('em_uf').AsString;
        CEP     := cdsEmpresa.FieldByName('em_cep').AsInteger;
        cPais   := 1058;
        xPais   := 'BRASIL';
        fone    := cdsEmpresa.FieldByName('em_fone').AsString;
      end;
    end;
    if dsNFCe.FieldByName('pnf_cnpjcpf').AsString <> '' then
    begin
      Dest.CNPJCPF := dsNFCe.FieldByName('pnf_cnpjcpf').AsString;
      Dest.xNome   := dsNFCe.FieldByName('pnf_nome_cliente').AsString;
      // dest.idEstrangeiro := dsNFCe.FieldByName('en_id_estrangeiro').AsString;
      // dest.ISUF          := '';
      // with dest.enderDest do
      // begin
      // xLgr    := dsNFCe.FieldByName('tlo_sigla').AsString + ' ' + dsNFCe.FieldByName('ed_logradouro').AsString;
      // nro     := dsNFCe.FieldByName('ed_numero').AsString;
      // xCpl    := dsNFCe.FieldByName('ed_complemento').AsString;
      // xBairro := dsNFCe.FieldByName('br_descricao').AsString;
      // cMun    := dsNFCe.FieldByName('cd_ibge_id').AsInteger;
      // xMun    := dsNFCe.FieldByName('cd_descricao').AsString;
      // UF      := dsNFCe.FieldByName('uf_id').AsString;
      // if dsNFCe.FieldByName('ed_cep').AsString <> '' then
      // CEP := dsNFCe.FieldByName('ed_cep').AsInteger;
      // cPais := dsNFCe.FieldByName('pa_cod_bacen').AsInteger;
      // xPais := dsNFCe.FieldByName('pa_nome').AsString;
      // fone  := dsNFCe.FieldByName('_fone_dest').AsString;
      // end;

      Dest.indIEDest := inNaoContribuinte;
      Dest.IE        := '';
      // dest.Email     := dsNFCe.FieldByName('en_email').AsString; // e-mail do cliente
    end;

    dsNFCeItens.Open('select * from pdv.vw_nota_fiscal_itens where pnfi_cancelado = 0 and pnf_id = ' +
      QuotedStr(dsNFCe.FieldByName('pnf_id').AsString) + ' order by itemseq');
    dsNFCeItens.First;
    for i := 0 to dsNFCeItens.RecordCount - 1 do
    begin
      with Det.add do
      begin
        Prod.nItem := i + 1;
        Prod.cProd := dsNFCeItens.FieldByName('pr_codigo_fiscal').AsString;
        Prod.xProd := dsNFCeItens.FieldByName('pr_descricao_fiscal').AsString;
        Prod.cEAN  := dsNFCeItens.FieldByName('pr_codigo_barras').AsString;
        Prod.NCM   := dsNFCeItens.FieldByName('pnfi_ncm').AsString;
        Prod.CFOP  := dsNFCeItens.FieldByName('pnfi_cfop').AsString;
        // if Prod.CFOP = '' then
        // begin
        // MessageBox(Application.Handle, pChar('CFOP do produto ' + dsNFCeItens.FieldByName('pr_codigo').AsString + ' - ' + dsNFCeItens.FieldByName('pr_descricao_fiscal').AsString + ' é obrigatório, confira a operação fiscal e redigite o item.'), 'SigoNFe', MB_ICONERROR);
        // exit;
        // end;
        Prod.uCom   := dsNFCeItens.FieldByName('un_sigla').AsString;
        Prod.qCom   := dsNFCeItens.FieldByName('pnfi_qtd').AsCurrency;
        Prod.vUnCom := dsNFCeItens.FieldByName('pnfi_valor_unit').AsCurrency;
        Prod.vDesc  := dsNFCeItens.FieldByName('pnfi_desconto').AsCurrency;
        // Prod.vProd  := dsNFCeItens.FieldByName('pnfi_qtd').AsCurrency * dsNFCeItens.FieldByName('pnfi_valor_unit').AsCurrency;
        Prod.vProd    := dsNFCeItens.FieldByName('pnfi_valor_total').AsCurrency;
        Prod.cEANTrib := dsNFCeItens.FieldByName('pr_codigo_barras').AsString;
        Prod.uTrib    := dsNFCeItens.FieldByName('un_sigla').AsString;
        Prod.qTrib    := dsNFCeItens.FieldByName('pnfi_qtd').AsCurrency;
        Prod.vUnTrib  := dsNFCeItens.FieldByName('pnfi_valor_unit').AsCurrency;
        Prod.vOutro   := dsNFCeItens.FieldByName('pnfi_outras_desp').AsCurrency;
        Prod.vFrete   := dsNFCeItens.FieldByName('pnfi_frete').AsCurrency;
        Prod.vSeg     := dsNFCeItens.FieldByName('pnfi_seguro').AsCurrency;
        Prod.CEST     := dsNFCeItens.FieldByName('pnfi_cest').AsString;
        // Prod.tpCredPresIBSZFM := tcpSemCredito;
        with Imposto do
        begin
          vTotTrib              := dsNFCeItens.FieldByName('pnfi_total_tributos').AsCurrency;
          ICMSUFDest.vBCUFDest  := dsNFCeItens.FieldByName('pnfi_icms_base').AsCurrency;
          ICMSUFDest.pFCPUFDest := 0;
          // dsNFCeItens.FieldByName('nfi_fcp_aliq_ufdest').AsCurrency; // Aliquota do Fundo de Amparo a Probreza
          ICMSUFDest.pICMSUFDest := 0;
          // dsNFCeItens.FieldByName('nfi_icms_aliq_ufdest').AsCurrency; // Aliquota Interna do Estado de Destino
          ICMSUFDest.pICMSInter := 0;
          // dsNFCeItens.FieldByName('nfi_icms_inter_aliq').AsCurrency; // Aliquota interestadual entre origem e destino
          ICMSUFDest.pICMSInterPart := 0;
          // dsNFCeItens.FieldByName('nfi_icms_inter_part_aliq').AsCurrency; // Aliquota da Partilha -> 40% em 2016; - 60% em 2017; - 80% em 2018; - 100% a partir de 2019.
          ICMSUFDest.vFCPUFDest := 0;
          // dsNFCeItens.FieldByName('nfi_fcp_valor_ufdest').AsCurrency; // vBCUFDest*(pFCPUFDest/100)
          ICMSUFDest.vICMSUFDest := 0;
          // dsNFCeItens.FieldByName('nfi_icms_valor_ufdest').AsCurrency; // vBCUFDest*(pICMSInter/100) * (pICMSInterPart/100)
          ICMSUFDest.vICMSUFRemet := 0;
          // dsNFCeItens.FieldByName('nfi_icms_valor_ufremet').AsCurrency;

          if FrmPDV_DModule.cdsEmpresa.FieldByName('em_simples_nacional').Value = 0 then
          begin
            ICMS.CST := StrToCSTICMS(dsNFCeItens.FieldByName('stb_codigo').AsString);
          end
          else
            ICMS.CSOSN := StrToCSOSNIcms(dsNFCeItens.FieldByName('stb_codigo_sn').AsString);
          ICMS.orig    := TpcnOrigemMercadoria(dsNFCeItens.FieldByName('pnfi_origem_trib').AsInteger);
          ICMS.modBC   := dbiValorOperacao;
          ICMS.vBC     := dsNFCeItens.FieldByName('pnfi_icms_base').AsCurrency;

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
          PIS.CST  := StrToCSTPIS(dsNFCeItens.FieldByName('stb_codigo_pis').AsString);
          PIS.vBC  := dsNFCeItens.FieldByName('pnfi_pis_base').AsCurrency;
          PIS.pPIS := dsNFCeItens.FieldByName('pnfi_pis_aliq').AsCurrency;
          PIS.vPIS := dsNFCeItens.FieldByName('pnfi_pis').AsCurrency;

          { IPI }
          IPI.CST  := StrToCSTIPI(Lok, dsNFCeItens.FieldByName('stb_codigo_ipi').AsString);
          IPI.cEnq := dsNFCeItens.FieldByName('pnfi_ipi_cenq').AsString;
          IPI.vBC  := dsNFCeItens.FieldByName('pnfi_ipi_base').AsCurrency;
          IPI.pIPI := dsNFCeItens.FieldByName('pnfi_ipi_aliq').AsCurrency;
          IPI.vIPI := dsNFCeItens.FieldByName('pnfi_ipi').AsCurrency;

          { COFINS }
          COFINS.CST     := StrToCSTCOFINS(dsNFCeItens.FieldByName('stb_codigo_cofins').AsString);
          COFINS.vBC     := dsNFCeItens.FieldByName('pnfi_cofins_base').AsCurrency;
          COFINS.pCOFINS := dsNFCeItens.FieldByName('pnfi_cofins_aliq').AsCurrency;
          COFINS.vCOFINS := dsNFCeItens.FieldByName('pnfi_cofins').AsCurrency;

          // NOVA REGRA TRIBUTÁRIA

          if FrmPDV_DModule.cdsEmpresa.FieldByName('em_simples_nacional').Value = 0 then
          begin

            IBSCBS.CST        := cst000;
            IBSCBS.cClassTrib := dsNFCeItens.FieldByName('cclasstrib').AsString; // '000001';
            IBSCBS.indDoacao  := tieNenhum;

            IBSCBS.gIBSCBS.vBC := dsNFCeItens.FieldByName('vBC_CBSIBS_item').AsCurrency; // 100;
            totcbsibs          := totcbsibs + dsNFCeItens.FieldByName('vBC_CBSIBS_item').AsCurrency;

            IBSCBS.gIBSCBS.gIBSUF.pIBSUF   := dsNFCeItens.FieldByName('pibs').AsCurrency; // 0.10;
            IBSCBS.gIBSCBS.gIBSUF.vIBSUF   := dsNFCeItens.FieldByName('vIBS').AsCurrency; // 0.10;
            totibs                         := totibs + dsNFCeItens.FieldByName('vIBS').AsCurrency;
            totcbs                         := totcbs + dsNFCeItens.FieldByName('vcbs').AsCurrency;
            IBSCBS.gIBSCBS.gIBSMun.pIBSMun := 0;
            IBSCBS.gIBSCBS.gIBSMun.vIBSMun := 0;

            // vIBS = vIBSUF + vIBSMun
            IBSCBS.gIBSCBS.vIBS := dsNFCeItens.FieldByName('vIBS').AsCurrency; // ;

            IBSCBS.gIBSCBS.gCBS.pCBS := dsNFCeItens.FieldByName('pCBS').AsCurrency; // 0.9;
            IBSCBS.gIBSCBS.gCBS.vCBS := dsNFCeItens.FieldByName('vcbs').AsCurrency; // 0.9;

            IBSCBS.gIBSCBS.gCBS.gRed.pRedAliq  := 0;
            IBSCBS.gIBSCBS.gCBS.gRed.pAliqEfet := 0;
          end;

          // Informações do Crédito Presumido IBS ZFM
          // tcpNenhum, tcpSemCredito, tcpBensConsumoFinal, tcpBensCapital,
          // tcpBensIntermediarios, tcpBensInformaticaOutros
          { erimar
            IBSCBS.gCredPresIBSZFM.competApur := Date;
            IBSCBS.gCredPresIBSZFM.tpCredPresIBSZFM := tcpBensInformaticaOutros;
            IBSCBS.gCredPresIBSZFM.vCredPresIBSZFM := 0;
          }

        end;
      end;

      dsNFCeItens.Next;

      //
    end;

    { fim dos itens }
    with total.ICMSTot do
    begin
      vTotTrib    := dsNFCe.FieldByName('pnf_total_tributos').AsCurrency;
      vFCPUFDest  := 0; // dsNFCe.FieldByName('nf_fcp_valor_ufdest').AsCurrency;
      vICMSUFDest := 0;
      // dsNFCe.FieldByName('nf_icms_valor_ufdest').AsCurrency;
      vICMSUFRemet := 0;
      // dsNFCe.FieldByName('nf_icms_valor_ufremet').AsCurrency;

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

    vtotPedido := dsNFCe.FieldByName('pnf_total_nota').AsCurrency;

    total.ISSQNtot.vServ   := 0;
    total.ISSQNtot.vBC     := 0;
    total.ISSQNtot.vISS    := 0;
    total.ISSQNtot.vPIS    := 0;
    total.ISSQNtot.vCOFINS := 0;


    // cbs e ibs totais

    total.IBSCBSTot.vBCIBSCBS := totcbsibs; // 100;

    total.IBSCBSTot.gIBS.vIBS             := totibs; // 0.1;
    total.IBSCBSTot.gIBS.vCredPres        := 0;
    total.IBSCBSTot.gIBS.vCredPresCondSus := 0;

    total.IBSCBSTot.gIBS.gIBSUFTot.vDif     := 0;
    total.IBSCBSTot.gIBS.gIBSUFTot.vDevTrib := 0;
    total.IBSCBSTot.gIBS.gIBSUFTot.vIBSUF   := totibs; // 0.1;

    // Total.IBSCBSTot.gIBS.gIBSMunTot.vDif := 100;
    // Total.IBSCBSTot.gIBS.gIBSMunTot.vDevTrib := 100;
    total.IBSCBSTot.gIBS.gIBSMunTot.vIBSMun := 0;

    total.IBSCBSTot.gCBS.vDif     := 0;
    total.IBSCBSTot.gCBS.vDevTrib := 0;
    total.IBSCBSTot.gCBS.vCBS     := totcbs; // 0.9;


    // Total.IBSCBSTot.gEstornoCred.vIBSEstCred := 100;
    // Total.IBSCBSTot.gEstornoCred.vCBSEstCred := 100;

    // Valor total da NF-e com IBS / CBS / IS
    // Total.vNFTot := 100;


    // final

    dsNFCePags.Open('select * from pdv.vw_nota_fiscal_pag_to_nf where pnf_id = ' +
      QuotedStr(dsNFCe.FieldByName('pnf_id').AsString));
    dsNFCePags.First;
    Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE

    while not dsNFCePags.eof do
    begin
      with pag.add do // PAGAMENTOS apenas para NFC-e
      begin
        { case dsNFCePags.FieldByName('fp_indice_nfce').AsInteger of
          1:
          tPag := fpDinheiro;
          2:
          tPag := fpCheque;
          3:
          tPag := fpCartaoCredito;
          4:
          tPag := fpCartaoDebito;
          5:
          tPag := fpCreditoLoja;
          6:
          tPag := fpValeAlimentacao;
          7:
          tPag := fpValeRefeicao;
          9:
          tPag := fpValePresente;
          10:
          tPag := fpValeCombustivel;
          11:
          tPag := fpDuplicataMercantil;
          12:
          tPag := fpBoletoBancario;
          13:
          tPag := fpSemPagamento;
          14:
          tPag := fpOutro;
          end; }
        vIndPag  := ACBRUtil.PadLeft(dsNFCePags.FieldByName('fp_indice_pdv').AsString, 2, Char('0'));
        tPag     := StrToFormaPagamento(ok, vIndPag);
        vPag     := dsNFCePags.FieldByName('pnfp_valor_bruto').AsCurrency;
        vtotPago := vtotPago + vPag;
        if tPag = fpOutro then
          xPag := dsNFCePags.FieldByName('fp_descricao').AsString;
        if tPag in [fpCartaoCredito, fpCartaoDebito, fpPagamentoInstantaneo] then
        begin
          tpIntegra    := tiPagNaoIntegrado;
          vIndBandeira := ACBRUtil.PadLeft(dsNFCePags.FieldByName('op_codigo').AsString, 2, Char('0'));
          CNPJ         := dsNFCePags.FieldByName('adq_cnpj').AsString;
          tBand        := StrToBandeiraCartao(ok, vIndBandeira);
          cAut         := dsNFCePags.FieldByName('pnfp_pos_codigo_aut').AsString;
        end;
      end;
      dsNFCePags.Next;
    end;
    if vtotPago > vtotPedido then
      pag.vTroco := vtotPago - vtotPedido;
  end;
  ACBrNFe.NotasFiscais.GerarNFe;
  doLog('Assinando ...');
  ACBrNFe.NotasFiscais.Assinar;
end;

function TFrmPDV_NFCe.doCancelaNFCe: Boolean;
var
  i    : Integer;
  loXML: string;
begin
  result := false;
  try
    ACBrNFe.NotasFiscais.clear;
    doLog('Preparando cancelamento ...');
    loXML := StringReplace(goXMLToCancel, '?', '', [rfReplaceAll]);
    ACBrNFe.NotasFiscais.LoadFromString(loXML);
    doLog('Cancelando...');
    ACBrNFe.EventoNFe.Evento.clear;
    ACBrNFe.EventoNFe.idLote := 0;
    with ACBrNFe.EventoNFe.Evento.add do
    begin
      infEvento.dhEvento        := ServerDateTime;
      infEvento.tpEvento        := teCancelamento;
      infEvento.detEvento.xJust := 'Erro de preenchimento';
    end;
    if ACBrNFe.EnviarEvento(0) then
    begin
      UpdateNfeCancelamento(goPnf_id, ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt,
        ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento,
        'Erro de preenchimento');
      if ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat > 136 then
        doLog(ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo)
      else
        doLog(ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
      ACBrNFe.ImprimirEvento;
    end
    else
    begin
      doLog('Falha no cancelamento do cupom fiscal!');
      Exit;
    end;
  except
    on e: Exception do
    begin
      doLog(e.Message);
      Exit;
    end;
  end;
  doLog('Sucesso!');
  result := true;
end;

function TFrmPDV_NFCe.doConsultaNFCe(Apnf_id: Integer; AOffline: Boolean): Boolean;
var
  i         : Integer;
  lonProt   : string;
  lodhRecbto: TDateTime;
begin
  if AOffline then
  begin
    result := false;
    Exit;
  end;
  result := false;
  doLog('[>] Consultando NFC-e ...');
  doLogFile('[>] Consultando NFC-e ...');
  if ACBrNFe.Consultar then
  begin
    if not ACBrNFe.WebServices.Consulta.Protocolo.IsEmpty then
    begin
      doLog('Registrando protocolo ...');
      doLogFile('Registrando protocolo ...');
      UpdateProtocolo(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
        ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);
      updateEstoqueFical(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf);

      UpdateProtocoloI9(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
        ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);

      FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_chave = ' +
        QuotedStr(uGlobalLibPDV.OnlyNumbers(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID)) + ', pnf_xml = ' +
        ACBrNFe.NotasFiscais.Items[0].Xml.QuotedString + ' where pnf_id = ' +
        IntToStr(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf));

      StoreXML(ACBrNFe.NotasFiscais.Items[0].Xml, Apnf_id, ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF);
      result := true;
    end;

  end;

end;
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

procedure TFrmPDV_NFCe.doLog(ALog: String);
begin
  lblStatus.Caption := ALog;
  lblStatus.Refresh;
end;

procedure TFrmPDV_NFCe.doLogFile(ALog: string);
var
  loLista: TStringList;
begin
  try
    loLista := TStringList.Create;
    try
      if FileExists('logfilanfe.log') then
        loLista.LoadFromFile('logfilanfe.log');
      loLista.add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) + ' - ' + ALog);
    except
      on e: Exception do
        loLista.add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) + ' - ' + ALog);
    end
  finally
    loLista.SaveToFile('logfilanfe.log');
    loLista.Free;
  end;
end;

procedure TFrmPDV_NFCe.ImprimirConfigencia(Apnf_id: Integer);
begin
  GerarNFCe(Apnf_id, true);
  UpdateRejeicao(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf, 'Off-line por parametrização', true);
  FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_chave = ' +
    QuotedStr(uGlobalLibPDV.OnlyNumbers(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID)) + ', pnf_xml = ' +
    ACBrNFe.NotasFiscais.Items[0].Xml.QuotedString + ' where pnf_id = ' +
    IntToStr(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf));
  updateEstoqueFicalContigencia(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf);

  UpdateProtocoloI9(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
    ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);

  StoreXML(ACBrNFe.NotasFiscais.Items[0].Xml, Apnf_id, ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF);
end;

function TFrmPDV_NFCe.doEnviarNFCe(Apnf_id: Integer; AOffline: Boolean): Boolean;
var
  vNumLote: Integer;
  Sincrono: Boolean;
begin
  vNumLote := 0;
  Sincrono := true;
  try
    ACBrNFe.NotasFiscais.clear;
    doLog('Gerando NFC-e ...');
    doLogFile('Gerando NFC-e ...');
    GerarNFCe(Apnf_id, AOffline);
    if doConsultaNFCe(Apnf_id, AOffline) then
    begin
      result := true;
      Exit;
    end;
    if AOffline then // PROCESSO QUANDO ESTÁ EMITINDO EM CONTIGENCIA
    begin
      ImprimirConfigencia(Apnf_id);
      result := true;
    end
    else
    begin
      try
        doLog('Enviando ...');
        ACBrNFe.Enviar(vNumLote, false, Sincrono);
        doLog('Registrando protocolo ...');
        UpdateProtocolo(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
          ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);
        updateEstoqueFical(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf);

        UpdateProtocoloI9(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
          ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);

        FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_chave = ' +
          QuotedStr(uGlobalLibPDV.OnlyNumbers(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID)) + ', pnf_xml = ' +
          ACBrNFe.NotasFiscais.Items[0].Xml.QuotedString + ' where pnf_id = ' +
          IntToStr(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf));

        StoreXML(ACBrNFe.NotasFiscais.Items[0].Xml, Apnf_id, ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF);
        doLog('Protocolo registrado ...');
        doLog('Enviada com sucesso!');
        result := true;

      except
        On e: Exception do
        begin
          if (ACBrNFe.Tag <> 0) then
          begin
            ImprimirConfigencia(Apnf_id);
            result := true;
            Exit;
          end;

          doLog('Erro. Pressione ESC e F2 para reenviar!');
          doLog('Erro1: ' + e.Message);
          lblMensagemRodape.Visible := true;
          expandedPanel.Visible     := true;
          memErrorLog.Lines.Text    := e.Message;
          ProdutoInList(IntToStr(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf));
          UpdateRejeicao(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf, e.Message);
          result := false;
        end;
      end;
    end;
  except
    On e: Exception do
    begin
      if (ACBrNFe.Tag <> 0) then
      begin
        ImprimirConfigencia(Apnf_id);
        result := true;
        Exit;
      end;
      doLog('Erro. Pressione ESC e F2 para reenviar!');
      doLog('Erro2: ' + e.Message);
      lblMensagemRodape.Visible := true;
      expandedPanel.Visible     := true;
      memErrorLog.Lines.Text    := e.Message;
      ProdutoInList(IntToStr(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf));
      UpdateRejeicao(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf, e.Message);
      result := false;
    end;
  end;

end;

procedure TFrmPDV_NFCe.UpdateNfeCancelamento(Apnf_id: Integer; ProtCancelamento: string; DataCancelamento: TDateTime;
  Motivo: string);
begin
  FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_protocolo_cancel = ' +
    QuotedStr(ProtCancelamento) + ',pnf_data_cancel = ' + QuotedStr(FormatDateTime('yyyymmdd hh:mm:ss',
    DataCancelamento)) + ',pnf_motivo_cancel = ' + QuotedStr(Motivo) + ' where pnf_id = ' + Apnf_id.ToString);
end;

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

procedure TFrmPDV_NFCe.FormCreate(Sender: TObject);
begin
  XMLDocMensagem.FileName := ExtractFilePath(Application.ExeName) + 'Schemas\tiposBasico_v1.03.xsd';
  XMLDocMensagem.Active   := true;
end;

procedure TFrmPDV_NFCe.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      if lblMensagemRodape.Visible then
      BEGIN
        ModalResult := mrCancel;
      END;
  end;
end;

procedure TFrmPDV_NFCe.ProdutoInList(Avalue: string);
var
  i                                                     : Integer;
  Prod, descricao, NCM, PIS, aliqPIS, COFINS, aliqCOFINS: String;
  Imposto                                               : TImposto;
  sqlCMD                                                : string;
begin

  sqlCMD := 'select pr_codigo, substring(pr_descricao_fiscal,1,30) as Descricao, ''NCM: '' + pnfi_ncm as Ncm, ''CstPis: '' + stb_codigo_pis as CstPis, ''AliqPis: '' + substring(cast(pnfi_pis_aliq as varchar),1,6) as aliqPis,'
    + '''CstCof: '' + stb_codigo_cofins as cstCofins, ''AliqCof: '' + substring(cast(pnfi_cofins_aliq as varchar),1,6) as aliqCofins '
    + 'from pdv.vw_nota_fiscal_itens where pnf_id = ' + Avalue;

  fdqryItensPedido.Open(sqlCMD);
  memErrorLog.Lines.add
    ('-------------------------------------------------------------------------------------------------------------');
  memErrorLog.Lines.add('RELAÇÃO DE PRODDUTOS');
  memErrorLog.Lines.add
    ('-------------------------------------------------------------------------------------------------------------');
  for i := 0 to fdqryItensPedido.RecordCount - 1 do
  begin
    Prod       := fdqryItensPedido.FieldByName('pr_codigo').AsString;
    descricao  := fdqryItensPedido.FieldByName('Descricao').AsString;
    NCM        := fdqryItensPedido.FieldByName('ncm').AsString;
    PIS        := fdqryItensPedido.FieldByName('cstpis').AsString;
    aliqPIS    := fdqryItensPedido.FieldByName('aliqPIS').AsString;
    COFINS     := fdqryItensPedido.FieldByName('cstCofins').AsString;
    aliqCOFINS := fdqryItensPedido.FieldByName('aliqCofins').AsString;
    memErrorLog.Lines.add(Prod + ' ' + descricao + '  ' + NCM);
    memErrorLog.Lines.add(' -> ' + PIS + ' ' + aliqPIS + ' ' + COFINS + ' ' + aliqCOFINS);
    memErrorLog.Lines.add('');
    memErrorLog.Lines.add
      ('-------------------------------------------------------------------------------------------------------------');
    memErrorLog.Lines.add('');
    fdqryItensPedido.Next;
  end;
  memErrorLog.SetSelection(0, 0);
  memErrorLog.SelStart := 0;
  memErrorLog.SetFocus;
end;

procedure TFrmPDV_NFCe.FormShow(Sender: TObject);
begin
  doSetConfigNFCe;
  Timer1.Enabled      := true;
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_NFCe.Timer1Timer(Sender: TObject);
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
  // TACBrNFeDANFEFR(ACBrNFe.DANFE).TipoDANFE         := t8iNFCe;
  if goCancelMode then
  begin
    if doCancelaNFCe then
      ModalResult := mrOk
  end
  else
  begin
    if doEnviarNFCe(goPnf_id, goOffLine) then
      ModalResult := mrOk
    else if not lblMensagemRodape.Visible then
      ModalResult := mrCancel;
  end;

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

procedure TFrmPDV_NFCe.doSetConfigNFCe;
var
  FForm: TFrmConfig_NFCe;
  // LCertificado: ICertificate2;
  LEmpresa: String;
begin

  DanfeFR.FastFile       := PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Report\DANFeNFCe.fr3';
  DanfeFR.TipoDANFE      := tiNFCe;
  DanfeFR.FastFileEvento := ExtractFilePath(Application.ExeName) + 'report\EventosNFCe.fr3';
  DanfeFR.Impressora     := goImpressora;

  ACBrNFe.Destroy;
  ACBrNFe := TACBrNFe.Create(self);
  FForm   := TFrmConfig_NFCe.Create(Application);
  try
    goPathNFe := ExtractFilePath(Application.ExeName);
    FForm.LerXMLConfig(IntToStr(ServerEmpresa), ACBrNFe, DanfeFR, FSendMail);
    ACBrNFe.OnTransmitError                   := EventNFeTransmitError;
    ACBrNFe.Configuracoes.Geral.ModeloDF      := moNFce;
    ACBrNFe.DANFE                             := DanfeFR;
    ACBrNFe.MAIL                              := ACBrMail1;
    ACBrNFe.Configuracoes.Geral.VersaoDF      := ve400;
    ACBrNFe.Configuracoes.Geral.VersaoQRCode  := veqr200;
    ACBrNFe.Configuracoes.Geral.SSLLib        := libWinCrypt;
    ACBrNFe.Configuracoes.Geral.SSLCryptLib   := cryWinCrypt;
    ACBrNFe.Configuracoes.Geral.SSLHttpLib    := httpWinHttp;
    ACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;
    ACBrNFe.ssl.SSLType                       := LT_TLSv1_2;

    // pastas
    ACBrNFe.Configuracoes.Geral.Salvar           := false;
    ACBrNFe.Configuracoes.Geral.ValidarDigest    := false;
    ACBrNFe.Configuracoes.Arquivos.Salvar        := true;
    ACBrNFe.Configuracoes.Arquivos.SepararPorMes := true;
    ACBrNFe.Configuracoes.Arquivos.PathNFe       := goPathNFe + 'XML\';
    ACBrNFe.Configuracoes.Arquivos.PathInu       := goPathNFe + 'Inutilizadas';
    ACBrNFe.Configuracoes.Arquivos.PathSchemas   := goPathNFe + 'Schemas\';
    ACBrNFe.Configuracoes.Arquivos.PathSalvar    := goPathNFe + 'XML\';
    ACBrNFe.Configuracoes.WebServices.TimeOut    := 60000;
    // tempo de timeout, coloque um tempo maior para resolver problemas
    ACBrNFe.Configuracoes.WebServices.AguardarConsultaRet := 18000;
    // tempo padrão que vai aguardar para consultar após enviar a NF-e
    ACBrNFe.Configuracoes.WebServices.IntervaloTentativas      := 10000; // Intervalo entre as tentativas de envio
    ACBrNFe.Configuracoes.WebServices.Tentativas               := 10;    // quantidade de tentativas de envio
    ACBrNFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := false;

    ACBrNFe.Configuracoes.Arquivos.SalvarEvento               := false;
    ACBrNFe.Configuracoes.Arquivos.SalvarApenasNFeProcessadas := false;

  finally
    FForm.Destroy;
  end;
end;

procedure TFrmPDV_NFCe.expandedPanelBeforeDrawExpander(Sender: TObject; AGraphics: TGPGraphics; ARect: TGPRectF;
  AExpanded, ADown, AHover: Boolean; var ADefaultDraw: Boolean);
begin
  if AExpanded then
    self.Height := 385
end;

procedure TFrmPDV_NFCe.expandedPanelEndCollapsePanel(Sender: TObject);
begin
  self.Height := 175;
end;

end.
