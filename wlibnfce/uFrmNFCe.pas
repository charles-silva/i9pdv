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
  Dialogs, Xml.xmldom, Xml.XMLIntf, ACBrSATExtratoClass, ACBrSATExtratoESCPOS, ACBrPosPrinter, ACBrBase, ACBrSAT, Vcl.ExtCtrls,
  Xml.Win.msxmldom, Xml.XMLDoc, Vcl.StdCtrls, ACBrUtil, pcnVFPe,
  ACBrSATMFe_integrador, ACBrDFe, ACBrNFe, pcnConversaoNFe, ACBrNFeDANFEFRDM, ACBrNFeDANFEClass, ACBrNFeDANFEFR,
  pcnNFe;

type

  TFrmNFCe = class(TForm)
    XMLDocMensagem: TXMLDocument;
    lblStatus: TLabel;
    Timer1: TTimer;
    Shape16: TShape;
    lblTitle: TLabel;
    Shape27: TShape;
    lblMensagemRodape: TLabel;
    TimerPisca: TTimer;
    ACBrNFe: TACBrNFe;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerPiscaTimer(Sender: TObject);
    // procedure Timer1Timer(Sender: TObject);
  private
    goAbrirGaveta  : Boolean;
    goReturnPressed: Boolean;
    goLog          : TStringList;
    goNFe          : TNFe;
    procedure doSendNFCe;
  public

    procedure doSetStartNFCe(         //
      Aem_cnpj,                       //
      Aem_razaosocial,                //
      Aem_fantasia,                   //
      Aem_ie,                         //
      Aem_endereco,                   //
      Aem_numero,                     //
      Aem_complemento,                //
      Aem_bairro,                     //
      Aem_cidade,                     //
      Aem_uf,                         //
      Aem_fone: String;               //
      Aem_ibge_id,                    //
      Aem_cep: Integer;               //
      Aem_simples_nacional: Boolean); //
    procedure doSetHeaderNFCe(        //
      Apnf_id,                        //
      Apnf_serie,                     //
      Apnf_numero_fiscal,             //
      Apnf_ibge_origem: Integer;      //
      Apnf_natureza,                  //
      Apnf_obs,                       //
      Aem_csc,                        //
      Aen_cnpjcpf: string;            //
      Apnf_data_emissao,              //
      Apnf_data_entrada_saida: TDateTime);
    // procedure doSetDetailNFCe(aCodProd, aEAN, aNomeProd, aNCM, aCFOP, aUnidade: String; aQtd, aVlrUnit, aVlrDesc, aVlrLei12741: Double; aOrigemMercadoria: Integer; aCSTPis, aCSTCofins, aCSTCSOSNIcms, aCSTIcms: String; aICMSAliq, aICMS, aBCPis, aPisAliq, aPis, aBCCofins, aCofinsAliq, aCofins: Double;
    // aObs: String);
    // procedure doSetPaysNFCe(aTipoMP: String; aVlrMP: Double);
    // function doSendNFCe: TSendRetorno;
    // function doSetCancelNFCe(aXML: String): TSendRetorno;
    procedure doSetItensNFCe( //
      AnItem,                 //
      Aorig: Integer;         //
      AcProd,                 //
      AxProd,                 //
      AcEAN,                  //
      ANCM,                   //
      ACFOP,                  //
      AuCom,                  //
      AcEANTrib,              //
      AuTrib,                 //
      ACEST,                  //
      ACSTICMS,               //
      ACSOSNICMS,             //
      ACSTPIS,                //
      ACSTIPI,                //
      ACSTCOFINS,             //
      AIPIcEnq: String;       //
      AqCom,                  //
      AvUnCom,                //
      AvDesc,                 //
      AvProd,                 //
      AqTrib,                 //
      AvUnTrib,               //
      AvOutro,                //
      AvFrete,                //
      AvSeg,                  //
      AvTotTrib,              //
      vBCUFDest,              //
      AvBCICMS,               //
      ApICMS,                 //
      AvICMS,                 //
      AvICMSBCST,             //
      ApICMSST,               //
      AvICMSST,               //
      APISvBC,                //
      APISpPIS,               //
      APISvPIS,               //
      AIPIvBC,                //
      AIPIpIPI,               //
      AIPIvIPI,               //
      ACOFINSvBC,             //
      ACOFINSpCOFINS,         //
      ACOFINSvCOFINS,         //
      ApRedBC: Currency);
    procedure doSetTotaisNFCe( //
      AvTotTrib,               //
      AvBC,                    //
      AvICMS,                  //
      AvBCST,                  //
      AvST,                    //
      AvProd,                  //
      AvFrete,                 //
      AvSeg,                   //
      AvDesc,                  //
      AvII,                    //
      AvIPI,                   //
      AvPIS,                   //
      AvCOFINS,                //
      AvOutro,                 //
      AvNF: Currency);
    procedure doSetPaysNFCe(AtPag: Integer; AvPag: Currency);

    procedure doKeyDown(var Key: Word; Shift: TShiftState);
    destructor Destroy; override;
  end;

var
  FrmNFCe: TFrmNFCe;

var
  goCodigoDeAtivacao, goSignAC: String;

implementation

uses pcnConversao;
{$R *.dfm}

destructor TFrmNFCe.Destroy;
begin
  goLog.Destroy;
  inherited;
end;

procedure TFrmNFCe.FormCreate(Sender: TObject);
begin
  goLog := TStringList.create;
end;

procedure TFrmNFCe.doSetStartNFCe( //
  Aem_cnpj,                        //
  Aem_razaosocial,                 //
  Aem_fantasia,                    //
  Aem_ie,                          //
  Aem_endereco,                    //
  Aem_numero,                      //
  Aem_complemento,                 //
  Aem_bairro,                      //
  Aem_cidade,                      //
  Aem_uf,                          //
  Aem_fone: String;                //
  Aem_ibge_id,                     //
  Aem_cep: Integer;                //
  Aem_simples_nacional: Boolean);  //
begin
  goNFe := ACBrNFe.NotasFiscais.Add.NFe;
  with goNFe do
  begin
    if Aem_simples_nacional then
      emit.CRT := crtSimplesNacional
    else
      emit.CRT   := crtRegimeNormal;
    emit.CNPJCPF := Aem_cnpj;
    emit.xNome   := Aem_razaosocial;
    emit.xFant   := Aem_fantasia;
    emit.IE      := Aem_ie;
    with emit.enderEmit do
    begin
      xLgr    := Aem_endereco;
      nro     := Aem_numero;
      xCpl    := Aem_complemento;
      xBairro := Aem_bairro;
      cMun    := Aem_ibge_id;
      xMun    := Aem_cidade;
      UF      := Aem_uf;
      CEP     := Aem_cep;
      cPais   := 1058;
      xPais   := 'BRASIL';
      fone    := Aem_fone;
    end;
  end;
end;

procedure TFrmNFCe.doSetHeaderNFCe( //
  Apnf_id,                          //
  Apnf_serie,                       //
  Apnf_numero_fiscal,               //
  Apnf_ibge_origem: Integer;        //
  Apnf_natureza,                    //
  Apnf_obs,                         //
  Aem_csc,                          //
  Aen_cnpjcpf: string;              //
  Apnf_data_emissao,                //
  Apnf_data_entrada_saida: TDateTime);
begin
  with goNFe do
  begin
    Ide.cNF                                           := Apnf_id;
    Ide.natOp                                         := Apnf_natureza;
    Ide.indPag                                        := ipVista;
    Ide.modelo                                        := 65;
    Ide.serie                                         := Apnf_serie;
    Ide.nNF                                           := Apnf_numero_fiscal;
    Ide.dEmi                                          := Apnf_data_emissao;
    Ide.dSaiEnt                                       := Apnf_data_entrada_saida;
    Ide.hSaiEnt                                       := now;
    Ide.tpNF                                          := tnSaida;
    Ide.tpEmis                                        := teNormal;
    Ide.tpAmb                                         := ACBrNFe.Configuracoes.WebServices.Ambiente;
    Ide.cUF                                           := StrToInt(Copy(IntToStr(Apnf_ibge_origem), 1, 2));
    Ide.cMunFG                                        := Apnf_ibge_origem;
    Ide.finNFe                                        := fnNormal;
    Ide.tpImp                                         := tiNFCe;
    Ide.indFinal                                      := cfConsumidorFinal;
    Ide.indPres                                       := pcPresencial;
    ACBrNFe.Configuracoes.Geral.ModeloDF              := moNFce;
    ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe  := true;
    ACBrNFe.Configuracoes.Geral.CSC                   := Aem_csc;
    InfAdic.infAdFisco                                := Apnf_obs;
    TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFile           := PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Report\DANFeNFCe.fr3';
    TACBrNFeDANFEFR(ACBrNFe.DANFE).TipoDANFE          := tiNFCe;
    TACBrNFeDANFEFR(ACBrNFe.DANFE).TributosFonte      := 'IBPT';
    TACBrNFeDANFEFR(ACBrNFe.DANFE).URLConsultaPublica := ACBrNFe.GetURLConsultaNFCe(Ide.cUF, Ide.tpAmb, 4);
    // Ide.dhCont := date;
    // Ide.xJust  := 'Justificativa Contingencia';
    if Aen_cnpjcpf <> '' then
      dest.CNPJCPF := Aen_cnpjcpf;
  end;
end;

procedure TFrmNFCe.doSetItensNFCe( //
  AnItem,                          //
  Aorig: Integer;                  //
  AcProd,                          //
  AxProd,                          //
  AcEAN,                           //
  ANCM,                            //
  ACFOP,                           //
  AuCom,                           //
  AcEANTrib,                       //
  AuTrib,                          //
  ACEST,                           //
  ACSTICMS,                        //
  ACSOSNICMS,                      //
  ACSTPIS,                         //
  ACSTIPI,                         //
  ACSTCOFINS,                      //
  AIPIcEnq: String;                //
  AqCom,                           //
  AvUnCom,                         //
  AvDesc,                          //
  AvProd,                          //
  AqTrib,                          //
  AvUnTrib,                        //
  AvOutro,                         //
  AvFrete,                         //
  AvSeg,                           //
  AvTotTrib,                       //
  vBCUFDest,                       //
  AvBCICMS,                        //
  ApICMS,                          //
  AvICMS,                          //
  AvICMSBCST,                      //
  ApICMSST,                        //
  AvICMSST,                        //
  APISvBC,                         //
  APISpPIS,                        //
  APISvPIS,                        //
  AIPIvBC,                         //
  AIPIpIPI,                        //
  AIPIvIPI,                        //
  ACOFINSvBC,                      //
  ACOFINSpCOFINS,                  //
  ACOFINSvCOFINS,                  //
  ApRedBC: Currency);
var
  Lok: Boolean;
begin
  with goNFe do
  begin
    with Det.Add do
    begin
      Prod.nItem    := AnItem;
      Prod.cProd    := AcProd;
      Prod.xProd    := AxProd;
      Prod.cEAN     := AcEAN;
      Prod.NCM      := ANCM;
      Prod.CFOP     := ACFOP;
      Prod.uCom     := AuCom;
      Prod.qCom     := AqCom;
      Prod.vUnCom   := AvUnCom;
      Prod.vDesc    := AvDesc;
      Prod.vProd    := AvProd;
      Prod.cEANTrib := AcEANTrib;
      Prod.uTrib    := AuTrib;
      Prod.qTrib    := AqTrib;
      Prod.vUnTrib  := AvUnTrib;
      Prod.vOutro   := AvOutro;
      Prod.vFrete   := AvFrete;
      Prod.vSeg     := AvSeg;
      Prod.CEST     := ACEST;
      with Imposto do
      begin
        vTotTrib                  := AvTotTrib;
        ICMSUFDest.vBCUFDest      := vBCUFDest;
        ICMSUFDest.pFCPUFDest     := 0;
        ICMSUFDest.pICMSUFDest    := 0;
        ICMSUFDest.pICMSInter     := 0;
        ICMSUFDest.pICMSInterPart := 0;
        ICMSUFDest.vFCPUFDest     := 0;
        ICMSUFDest.vICMSUFDest    := 0;
        ICMSUFDest.vICMSUFRemet   := 0;

        ICMS.CST   := StrToCSTICMS(Lok, ACSTICMS);
        ICMS.CSOSN := StrToCSOSNIcms(Lok, ACSOSNICMS);
        ICMS.orig  := TpcnOrigemMercadoria(Aorig);
        ICMS.modBC := dbiValorOperacao;
        ICMS.vBC   := AvBCICMS;

        ICMS.pICMS := ApICMS;
        ICMS.vICMS := AvICMS;

        ICMS.modBCST := dbisPrecoTabelado;
        ICMS.vBCST   := AvICMSBCST;
        ICMS.pICMSST := ApICMSST;
        ICMS.vICMSST := AvICMSST;
        ICMS.pRedBC  := ApRedBC;

        ICMS.pMVAST   := 0;
        ICMS.pRedBCST := 0;

        { PIS }
        PIS.CST  := StrToCSTPIS(Lok, ACSTPIS);
        PIS.vBC  := APISvBC;
        PIS.pPIS := APISpPIS;
        PIS.vPIS := APISvPIS;

        { IPI }
        IPI.CST  := StrToCSTIPI(Lok, ACSTIPI);
        IPI.cEnq := AIPIcEnq;
        IPI.vBC  := AIPIvBC;
        IPI.pIPI := AIPIpIPI;
        IPI.vIPI := AIPIvIPI;

        { COFINS }
        COFINS.CST     := StrToCSTCOFINS(Lok, ACSTCOFINS);
        COFINS.vBC     := ACOFINSvBC;
        COFINS.pCOFINS := ACOFINSpCOFINS;
        COFINS.vCOFINS := ACOFINSvCOFINS;
      end;
    end;
  end;
end;

procedure TFrmNFCe.doSetTotaisNFCe( //
  AvTotTrib,                        //
  AvBC,                             //
  AvICMS,                           //
  AvBCST,                           //
  AvST,                             //
  AvProd,                           //
  AvFrete,                          //
  AvSeg,                            //
  AvDesc,                           //
  AvII,                             //
  AvIPI,                            //
  AvPIS,                            //
  AvCOFINS,                         //
  AvOutro,                          //
  AvNF: Currency);

begin
  with goNFe do
  begin
    with total.ICMSTot do
    begin
      vTotTrib     := AvTotTrib;
      vFCPUFDest   := 0;
      vICMSUFDest  := 0;
      vICMSUFRemet := 0;

      vBC     := AvBC;
      vICMS   := AvICMS;
      vBCST   := AvBCST;
      vST     := AvST;
      vProd   := AvProd;
      vFrete  := AvFrete;
      vSeg    := AvSeg;
      vDesc   := AvDesc;
      vII     := AvII;
      vIPI    := AvIPI;
      vPIS    := AvPIS;
      vCOFINS := AvCOFINS;
      vOutro  := AvOutro;
      vNF     := AvNF;
    end;

    total.ISSQNtot.vServ   := 0;
    total.ISSQNtot.vBC     := 0;
    total.ISSQNtot.vISS    := 0;
    total.ISSQNtot.vPIS    := 0;
    total.ISSQNtot.vCOFINS := 0;
    Transp.modFrete        := mfSemFrete;
  end;
end;

procedure TFrmNFCe.doSetPaysNFCe(AtPag: Integer; AvPag: Currency);
begin
  with goNFe do
  begin
    with pag.Add do
    begin
      tPag := TpcnFormaPagamento(AtPag);
      vPag := AvPag;
    end;
  end;
end;

procedure TFrmNFCe.doSendNFCe;
begin
  ACBrNFe.NotasFiscais.GerarNFe;
  ACBrNFe.NotasFiscais.Assinar;
  ACBrNFe.Enviar(0);
end;

procedure TFrmNFCe.doKeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        goReturnPressed := true;
      end;
  end;
end;

procedure TFrmNFCe.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TFrmNFCe.TimerPiscaTimer(Sender: TObject);
begin
  lblMensagemRodape.visible := not lblMensagemRodape.visible;
end;

end.
