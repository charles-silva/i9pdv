unit uFrmConfig_NFCe;

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
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Buttons,
  Spin,
  ComCtrls,
  IniFiles,
  acbrUtil,
  ACBrNFe,
  pcnConversao,
  ACBrDFeUtil,
  filectrl,
  ACBrCTe,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxPC,
  Menus,
  cxButtons,
  cxContainer,
  cxEdit,
  cxGroupBox,
  cxTextEdit,
  dxGDIPlusClasses,
  cxMaskEdit,
  cxDropDownEdit,
  cxImageComboBox,
  cxRadioGroup,
  cxCheckBox,
  cxCurrencyEdit,
  cxMemo,
  ImgList,
  XMLIntf,
  XMLDoc,
  xmldom,
  msxmldom,
  Printers, cxPCdxBarPopupMenu, ACBrNFeDANFEClass,
  dxBarBuiltInMenu, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ACBrNFeConfiguracoes,
  ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver,
  dxSkinscxPCPainter, cxRichEdit, dxSkinWhiteprint, ACBrDFeSSL, blcksock,
  frxClass;

const
  BufferMemoResposta = 1000; { Maximo de Linhas no MemoResposta }
  _C                 = 'tYk*5W@';
  wm_IconMessage     = wm_User;

type
  TSendMail = record
    aSmtpHost: String;
    aSmtpPort: String;
    aSmtpUser: String;
    aSmtpPass: String;
    aEmailAssunto: String;
    aEmailSSL: Boolean;
    aEmailBody: String;
  end;

type
  TFrmConfig_NFCe = class(TForm)
    OpenDialog1: TOpenDialog;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label28: TLabel;
    cxGroupBox1: TcxGroupBox;
    edNumeroSerieCert: TcxTextEdit;
    edSenhaCert: TcxTextEdit;
    Image1: TImage;
    Label8: TLabel;
    lblSenhaCert: TLabel;
    sbArquivoCert: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cbuf: TcxImageComboBox;
    rbAmbiente: TcxRadioGroup;
    ckSalvarArquivo: TcxCheckBox;
    edCaminhoEnvioResposta: TcxTextEdit;
    cxButton1: TcxButton;
    Label6: TLabel;
    rbFormaEmissao: TcxRadioGroup;
    edAguardaTime: TcxCurrencyEdit;
    edAguardaTentativas: TcxCurrencyEdit;
    edAguardaIntervalo: TcxCurrencyEdit;
    ckAjustarAguardar: TcxCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edServidorSMTP: TcxTextEdit;
    edUserMail: TcxTextEdit;
    edSenhaMail: TcxTextEdit;
    edAssuntoMail: TcxTextEdit;
    edPortaSMTP: TcxCurrencyEdit;
    ckExigeSSL: TcxCheckBox;
    Label22: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    Label20: TLabel;
    Bevel1: TBevel;
    cxTabSheet6: TcxTabSheet;
    cxPageControl2: TcxPageControl;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet8: TcxTabSheet;
    rbModelo: TcxRadioGroup;
    rbFormaImpressao: TcxRadioGroup;
    gbMargens: TcxGroupBox;
    edMargemInferior: TcxCurrencyEdit;
    edMargemSuperior: TcxCurrencyEdit;
    edMargemDireita: TcxCurrencyEdit;
    edMargemEsquerda: TcxCurrencyEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ckDescontoPerc: TcxCheckBox;
    ckPreview: TcxCheckBox;
    ckHoraSaida: TcxCheckBox;
    ckStatus: TcxCheckBox;
    ckExpandirLogo: TcxCheckBox;
    edSite: TcxTextEdit;
    Label18: TLabel;
    edEmail: TcxTextEdit;
    Label19: TLabel;
    edFoneFax: TcxTextEdit;
    Label27: TLabel;
    edLogoMarca: TcxTextEdit;
    Label36: TLabel;
    cxButton2: TcxButton;
    ckSalvarPastaSepar: TcxCheckBox;
    ckPastaMensal: TcxCheckBox;
    ckPastaLiteral: TcxCheckBox;
    ckSalvarCTeData: TcxCheckBox;
    edPastaCTe: TcxTextEdit;
    edPastaCancel: TcxTextEdit;
    edPastaPDF: TcxTextEdit;
    edPastaInutil: TcxTextEdit;
    edPastaDPEC: TcxTextEdit;
    sbPathNFe: TcxButton;
    sbPathCan: TcxButton;
    sbPathInu: TcxButton;
    sbPathDPEC: TcxButton;
    sbPathPDF: TcxButton;
    XMLDocument1: TXMLDocument;
    Label1: TLabel;
    edCopias: TcxCurrencyEdit;
    btnRestaurarPadrao: TcxButton;
    edCorpoMail: TcxRichEdit;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    Label38: TLabel;
    Shape16: TShape;
    Shape27: TShape;
    frxReport1: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure sbLogoMarcaClick(Sender: TObject);
    procedure sbArquivoCertClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure sbPathNFeClick(Sender: TObject);
    procedure sbPathCanClick(Sender: TObject);
    procedure sbPathPDFClick(Sender: TObject);
    procedure sbPathInuClick(Sender: TObject);
    procedure sbPathDPECClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnRestaurarPadraoClick(Sender: TObject);
    procedure cxTabSheet5Show(Sender: TObject);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Fem_codigo: String;
    FACBrNFe  : TACBrNFe;
    FFileName : String;
    procedure CriaXMLConfig;
    procedure PathClick(Sender: TObject);
    { Private declarations }
  public
    function LerXMLConfig(aEmpresa: String; var aACBrNFe: TACBrNFe; var aACBrNFeDANFEFR: TACBrNFeDANFEFR;
      var aSendMail: TSendMail): Boolean;
  end;

var
  FrmConfig_NFCe: TFrmConfig_NFCe;

const
  SELDIRHELP = 1000;

implementation

uses
  IdStack, uGlobalLibWiBi, pcnConversaoNFe, uFrmPDV_DModule, uFrmPDV;
{$R *.dfm}

procedure TFrmConfig_NFCe.CriaXMLConfig;
var
  FNode, FNodeChild: IXMLNode;
  xml              : TXMLDocument;
  INI              : TIniFile;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + FFileName + '.xml') then
    DeleteFile(ExtractFilePath(Application.ExeName) + FFileName + '.xml');

  INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + FFileName + '.pwd');

  xml := TXMLDocument.Create(nil);
  try
    xml.Active := true;

    FNode := xml.AddChild('Config');

    FNodeChild                              := FNode.AddChild('Geral');
    FNodeChild.AddChild('Certificado').Text := edNumeroSerieCert.Text;
    GravaINICrypt(INI, 'Certificado', 'Senha', edSenhaCert.Text, _C);
    FNodeChild.AddChild('Software').Text := 'I9 PDV';

    FNodeChild                                       := FNode.AddChild('WebService');
    FNodeChild.AddChild('UF').Text                   := cbuf.Text;
    FNodeChild.AddChild('Ambiente').Text             := rbAmbiente.EditValue;
    FNodeChild.AddChild('SalvarEnvioResposta').Text  := ckSalvarArquivo.EditValue;
    FNodeChild.AddChild('CaminhoEnvioResposta').Text := edCaminhoEnvioResposta.Text;
    FNodeChild.AddChild('AjustarAguardar').Text      := ckAjustarAguardar.EditValue;
    FNodeChild.AddChild('AguardarTempo').Text        := edAguardaTime.Text;
    FNodeChild.AddChild('AguardarTentativas').Text   := edAguardaTentativas.Text;
    FNodeChild.AddChild('AguardarIntervalo').Text    := edAguardaIntervalo.Text;
    FNodeChild.AddChild('FormaEmissao').Text         := rbFormaEmissao.EditValue;

    FNodeChild                               := FNode.AddChild('EMail');
    FNodeChild.AddChild('ServidorSMTP').Text := edServidorSMTP.Text;
    FNodeChild.AddChild('PortaSMTP').Text    := edPortaSMTP.Text;
    FNodeChild.AddChild('UserMail').Text     := edUserMail.Text;
    GravaINICrypt(INI, 'EMail', 'Senha', edSenhaMail.Text, _C);
    FNodeChild.AddChild('ExigeSSL').Text     := ckExigeSSL.EditValue;
    FNodeChild.AddChild('AssuntoEmail').Text := edAssuntoMail.Text;
    FNodeChild.AddChild('CorpoEmail').Text   := edCorpoMail.Text;

    FNodeChild                                   := FNode.AddChild('DANFe');
    FNodeChild                                   := FNodeChild.AddChild('Impressao');
    FNodeChild.AddChild('ModeloImpressao').Text  := rbModelo.EditValue;
    FNodeChild.AddChild('FormatoImpressao').Text := rbFormaImpressao.EditValue;
    // FNodeChild.AddChild('Impressora').Text := cbImpressora.Text;
    FNodeChild.AddChild('Copias').Text   := edCopias.Text;
    FNodeChild                           := FNodeChild.AddChild('Margens');
    FNodeChild.AddChild('Superior').Text := edMargemSuperior.Text;
    FNodeChild.AddChild('Inferior').Text := edMargemInferior.Text;
    FNodeChild.AddChild('Esquerda').Text := edMargemEsquerda.Text;
    FNodeChild.AddChild('Direita').Text  := edMargemDireita.Text;

    FNodeChild                                      := FNodeChild.ParentNode;
    FNodeChild                                      := FNodeChild.AddChild('Opcoes');
    FNodeChild.AddChild('DescontoPerc').Text        := ckDescontoPerc.EditValue;
    FNodeChild.AddChild('VisualizarImpressao').Text := ckPreview.EditValue;
    FNodeChild.AddChild('ImprimirHoraSaida').Text   := ckHoraSaida.EditValue;
    FNodeChild.AddChild('MostrarStatus').Text       := ckStatus.EditValue;
    FNodeChild.AddChild('ExpandirLogoMarca').Text   := ckExpandirLogo.EditValue;

    FNodeChild                            := FNodeChild.ParentNode;
    FNodeChild                            := FNodeChild.ParentNode;
    FNodeChild                            := FNodeChild.AddChild('Empresa');
    FNodeChild.AddChild('Site').Text      := edSite.Text;
    FNodeChild.AddChild('EMail').Text     := edEmail.Text;
    FNodeChild.AddChild('Fone').Text      := edFoneFax.Text;
    FNodeChild.AddChild('LogoMarca').Text := edLogoMarca.Text;

    FNodeChild                                        := FNode.AddChild('Diretorio');
    FNodeChild.AddChild('SalvarPastasSeparadas').Text := ckSalvarPastaSepar.EditValue;
    FNodeChild.AddChild('CriarPastaMensal').Text      := ckPastaMensal.EditValue;
    FNodeChild.AddChild('AdicionarLiteralPasta').Text := ckPastaLiteral.EditValue;
    FNodeChild.AddChild('SalvoCTeDataEmissao').Text   := ckSalvarCTeData.EditValue;
    FNodeChild.AddChild('PastaCTe').Text              := edPastaCTe.Text;
    FNodeChild.AddChild('PastaCancel').Text           := edPastaCancel.Text;
    FNodeChild.AddChild('PastaPDF').Text              := edPastaPDF.Text;
    FNodeChild.AddChild('PastaInutil').Text           := edPastaInutil.Text;
    FNodeChild.AddChild('PastaDPEC').Text             := edPastaDPEC.Text;

    xml.SaveToFile(ExtractFilePath(Application.ExeName) + FFileName + '.xml');
  finally
    xml.Active := false;
    INI.Free;
  end;
end;

procedure TFrmConfig_NFCe.cxButton1Click(Sender: TObject);
begin
  PathClick(edCaminhoEnvioResposta);
end;

procedure TFrmConfig_NFCe.cxTabSheet2Show(Sender: TObject);
begin
  if edCaminhoEnvioResposta.Text = '' then
    edCaminhoEnvioResposta.Text := ExtractFilePath(Application.ExeName) + 'XML\Log';
end;

procedure TFrmConfig_NFCe.cxTabSheet5Show(Sender: TObject);
begin
  if edPastaCTe.Text = '' then
    edPastaCTe.Text := ExtractFilePath(Application.ExeName) + 'XML\Emitidas';
  if edPastaCancel.Text = '' then
    edPastaCancel.Text := ExtractFilePath(Application.ExeName) + 'XML\Canceladas';
  if edPastaPDF.Text = '' then
    edPastaPDF.Text := ExtractFilePath(Application.ExeName) + 'XML';
  if edPastaInutil.Text = '' then
    edPastaInutil.Text := ExtractFilePath(Application.ExeName) + 'XML\Inutilizadas';
  if edPastaDPEC.Text = '' then
    edPastaDPEC.Text := ExtractFilePath(Application.ExeName) + 'XML';
end;

function TFrmConfig_NFCe.LerXMLConfig(aEmpresa: String; var aACBrNFe: TACBrNFe; var aACBrNFeDANFEFR: TACBrNFeDANFEFR;
  var aSendMail: TSendMail): Boolean;
var
  FNode, FNodeChild: IXMLNode;
  INI              : TIniFile;
  OK               : Boolean;
begin
  Fem_codigo     := aEmpresa;
  FACBrNFe       := aACBrNFe;
  FACBrNFe.DANFE := aACBrNFeDANFEFR;

  Result    := false;
  FFileName := 'Config' + aEmpresa;
  if not FileExists(ExtractFilePath(Application.ExeName) + FFileName + '.xml') then
  begin
    CopyFile(pChar('C:\SimNFe3\' + FFileName + '.xml'),
      pChar(ExtractFilePath(Application.ExeName) + FFileName + '.xml'), true);
    CopyFile(pChar('C:\SimNFe3\' + FFileName + '.pwd'),
      pChar(ExtractFilePath(Application.ExeName) + FFileName + '.pwd'), true);
    if not FileExists(ExtractFilePath(Application.ExeName) + FFileName + '.xml') then
      CriaXMLConfig;
  end;

  try
    // cbImpressora.Properties.Items.Assign(Printer.Printers);
    INI := TIniFile.Create(ExtractFilePath(Application.ExeName) + FFileName + '.pwd');

    XMLDocument1.LoadFromFile(ExtractFilePath(Application.ExeName) + FFileName + '.xml');
    XMLDocument1.Active := true;

    FNode := XMLDocument1.DocumentElement;

    FNodeChild := FNode.ChildNodes.FindNode('Geral');

    { Aplica dados aos componentes da tela }
    edNumeroSerieCert.Text := FNodeChild.ChildNodes.FindNode('Certificado').Text;
    edSenhaCert.Text       := LeINICrypt(INI, 'Certificado', 'Senha', _C);
    // edSoftwareEmissor.Text := FNodeChild.ChildNodes.FindNode('Software').Text;

    { Aplica dados ao componente CTe }
{$IFDEF ACBrNFeOpenSSL}
    edSenhaCert.Enabled                             := true;
    lblSenhaCert.Enabled                            := true;
    ACBrNFe1.Configuracoes.Certificados.Certificado := edNumeroSerieCert.Text;
    ACBrNFe1.Configuracoes.Certificados.Senha       := edSenhaCert.Text;
{$ELSE}
    edSenhaCert.Enabled  := true;
    lblSenhaCert.Enabled := true;

    FACBrNFe.Configuracoes.Geral.SSLLib        := libWinCrypt;
    FACBrNFe.Configuracoes.Geral.SSLCryptLib   := cryWinCrypt;
    FACBrNFe.Configuracoes.Geral.SSLHttpLib    := httpWinHttp;
    FACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;
    FACBrNFe.ssl.SSLType                       := LT_TLSv1_2;

    // FACBrNFe.Configuracoes.Certificados.ArquivoPFX  := ExtractFilePath(Application.ExeName) + '\Disgel_2017.pfx';
    FACBrNFe.Configuracoes.Certificados.NumeroSerie := edNumeroSerieCert.Text;
    FACBrNFe.Configuracoes.Certificados.Senha       := edSenhaCert.Text;
{$ENDIF}
    FNodeChild := FNode.ChildNodes.FindNode('WebService');
    if FNodeChild <> nil then
    begin
      { Aplica dados aos componentes da tela }
      cbuf.EditValue              := FNodeChild.ChildNodes.FindNode('UF').Text;
      rbAmbiente.EditValue        := FNodeChild.ChildNodes.FindNode('Ambiente').Text;
      ckSalvarArquivo.EditValue   := FNodeChild.ChildNodes.FindNode('SalvarEnvioResposta').Text;
      edCaminhoEnvioResposta.Text := FNodeChild.ChildNodes.FindNode('CaminhoEnvioResposta').Text;
      if edCaminhoEnvioResposta.Text = '' then
        edCaminhoEnvioResposta.Text := ExtractFilePath(Application.ExeName) + 'XML\Log';
      ckAjustarAguardar.EditValue   := FNodeChild.ChildNodes.FindNode('AjustarAguardar').Text;
      edAguardaTime.Text            := FNodeChild.ChildNodes.FindNode('AguardarTempo').Text;
      edAguardaTentativas.Text      := FNodeChild.ChildNodes.FindNode('AguardarTentativas').Text;
      edAguardaIntervalo.Text       := FNodeChild.ChildNodes.FindNode('AguardarIntervalo').Text;
      rbFormaEmissao.EditValue      := FNodeChild.ChildNodes.FindNode('FormaEmissao').Text;
    end;

    FNodeChild := FNode.ChildNodes.FindNode('EMail');
    if FNodeChild <> nil then
    begin
      edServidorSMTP.Text  := FNodeChild.ChildNodes.FindNode('ServidorSMTP').Text;
      edPortaSMTP.Text     := FNodeChild.ChildNodes.FindNode('PortaSMTP').Text;
      edUserMail.Text      := FNodeChild.ChildNodes.FindNode('UserMail').Text;
      edSenhaMail.Text     := LeINICrypt(INI, 'EMail', 'Senha', _C);
      ckExigeSSL.EditValue := FNodeChild.ChildNodes.FindNode('ExigeSSL').Text;
      edAssuntoMail.Text   := FNodeChild.ChildNodes.FindNode('AssuntoEmail').Text;
      edCorpoMail.Text     := FNodeChild.ChildNodes.FindNode('CorpoEmail').Text;

      aSendMail.aSmtpHost     := FNodeChild.ChildNodes.FindNode('ServidorSMTP').Text;
      aSendMail.aSmtpPort     := FNodeChild.ChildNodes.FindNode('PortaSMTP').Text;
      aSendMail.aSmtpUser     := FNodeChild.ChildNodes.FindNode('UserMail').Text;
      aSendMail.aSmtpPass     := LeINICrypt(INI, 'EMail', 'Senha', _C);
      aSendMail.aEmailSSL     := (FNodeChild.ChildNodes.FindNode('ExigeSSL').Text = '1');
      aSendMail.aEmailAssunto := FNodeChild.ChildNodes.FindNode('AssuntoEmail').Text;
      aSendMail.aEmailBody    := FNodeChild.ChildNodes.FindNode('CorpoEmail').Text;
    end;

    FNodeChild := FNode.ChildNodes.FindNode('DANFe');
    if FNodeChild <> nil then
    begin
      FNodeChild                 := FNodeChild.ChildNodes.FindNode('Impressao');
      rbModelo.EditValue         := FNodeChild.ChildNodes.FindNode('ModeloImpressao').Text;
      rbFormaImpressao.EditValue := FNodeChild.ChildNodes.FindNode('FormatoImpressao').Text;
      if FNodeChild.ChildNodes.FindNode('Copias') <> nil then
        edCopias.Text := FNodeChild.ChildNodes.FindNode('Copias').Text;

      // if FNodeChild.ChildNodes.FindNode('Impressora') <> nil then
      // cbImpressora.ItemIndex := cbImpressora.Properties.Items.IndexOf(FNodeChild.ChildNodes.FindNode('Impressora').Text);

      FNodeChild            := FNodeChild.ChildNodes.FindNode('Margens');
      edMargemSuperior.Text := FNodeChild.ChildNodes.FindNode('Superior').Text;
      edMargemInferior.Text := FNodeChild.ChildNodes.FindNode('Inferior').Text;
      edMargemEsquerda.Text := FNodeChild.ChildNodes.FindNode('Esquerda').Text;
      edMargemDireita.Text  := FNodeChild.ChildNodes.FindNode('Direita').Text;

      FNodeChild := FNodeChild.ParentNode;
      FNodeChild := FNodeChild.ChildNodes.FindNode('Opcoes');
      if FNodeChild <> nil then
      begin
        ckDescontoPerc.EditValue := FNodeChild.ChildNodes.FindNode('DescontoPerc').Text;
        ckPreview.EditValue      := FNodeChild.ChildNodes.FindNode('VisualizarImpressao').Text;
        ckHoraSaida.EditValue    := FNodeChild.ChildNodes.FindNode('ImprimirHoraSaida').Text;
        ckStatus.EditValue       := FNodeChild.ChildNodes.FindNode('MostrarStatus').Text;
        ckExpandirLogo.EditValue := FNodeChild.ChildNodes.FindNode('ExpandirLogoMarca').Text;

        FNodeChild       := FNodeChild.ParentNode;
        FNodeChild       := FNodeChild.ParentNode;
        FNodeChild       := FNodeChild.ChildNodes.FindNode('Empresa');
        edSite.Text      := FNodeChild.ChildNodes.FindNode('Site').Text;
        edEmail.Text     := FNodeChild.ChildNodes.FindNode('EMail').Text;
        edFoneFax.Text   := FNodeChild.ChildNodes.FindNode('Fone').Text;
        edLogoMarca.Text := FNodeChild.ChildNodes.FindNode('LogoMarca').Text;
      end;
    end;
    FNodeChild := FNode.ChildNodes.FindNode('Diretorio');

    if FNodeChild <> nil then
    begin
      { Aplica dados aos componentes da tela }
      ckSalvarPastaSepar.EditValue := FNodeChild.ChildNodes.FindNode('SalvarPastasSeparadas').Text;
      ckPastaMensal.EditValue      := FNodeChild.ChildNodes.FindNode('CriarPastaMensal').Text;
      ckPastaLiteral.EditValue     := FNodeChild.ChildNodes.FindNode('AdicionarLiteralPasta').Text;
      ckSalvarCTeData.EditValue    := FNodeChild.ChildNodes.FindNode('SalvoCTeDataEmissao').Text;

      edPastaCTe.Text := FNodeChild.ChildNodes.FindNode('PastaCTe').Text;
      if edPastaCTe.Text = '' then
        edPastaCTe.Text := ExtractFilePath(Application.ExeName) + 'XML\Emitidas';

      edPastaCancel.Text := FNodeChild.ChildNodes.FindNode('PastaCancel').Text;
      if edPastaCancel.Text = '' then
        edPastaCancel.Text := ExtractFilePath(Application.ExeName) + 'XML\Canceladas';

      edPastaPDF.Text := FNodeChild.ChildNodes.FindNode('PastaPDF').Text;
      if edPastaPDF.Text = '' then
        edPastaPDF.Text := ExtractFilePath(Application.ExeName) + 'XML';

      edPastaInutil.Text := FNodeChild.ChildNodes.FindNode('PastaInutil').Text;
      if edPastaInutil.Text = '' then
        edPastaInutil.Text := ExtractFilePath(Application.ExeName) + 'XML\Inutilizadas';

      edPastaDPEC.Text := FNodeChild.ChildNodes.FindNode('PastaDPEC').Text;
      if edPastaDPEC.Text = '' then
        edPastaDPEC.Text := ExtractFilePath(Application.ExeName) + 'XML';
    end;

    { Aplica dados ao componente CTe }
    FACBrNFe.Configuracoes.WebServices.UF                       := cbuf.Text;
    FACBrNFe.Configuracoes.WebServices.Ambiente                 := rbAmbiente.EditValue;
    FACBrNFe.Configuracoes.WebServices.Visualizar               := false;
    FACBrNFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := ckAjustarAguardar.Checked;
    FACBrNFe.Configuracoes.WebServices.AguardarConsultaRet      := StrToInt64Def(edAguardaTime.Text, 1000);
    FACBrNFe.Configuracoes.WebServices.Tentativas               := StrToIntDef(edAguardaTentativas.Text, 0);
    FACBrNFe.Configuracoes.WebServices.IntervaloTentativas      := StrToIntDef(edAguardaIntervalo.Text, 0);

    FACBrNFe.Configuracoes.Geral.FormaEmissao  := StrToTpEmis(OK, rbFormaEmissao.EditValue);
    FACBrNFe.Configuracoes.Geral.Salvar        := false; // ckSalvarArquivo.Checked;
    FACBrNFe.Configuracoes.Arquivos.PathSalvar := edCaminhoEnvioResposta.Text;
    FACBrNFe.Configuracoes.Geral.VersaoDF      := ve400;

    // TACBrNFeDANFERave(FACBrNFe.DANFE).RavFile := PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Report\NotaFiscalEletronica.rav';
    FACBrNFe.DANFE.TipoDANFE := rbFormaImpressao.EditValue;
    FACBrNFe.DANFE.Logo      := edLogoMarca.Text;
    FACBrNFe.DANFE.Sistema   := 'I9 PDV';
    FACBrNFe.DANFE.Site      := 'www.i9mobile.com.br'; // edSite.Text;
    FACBrNFe.DANFE.Email     := 'comercial@i9mobile.com.br';
    edEmail.Text;
    //FACBrNFe.DANFE.Fax := edFoneFax.Text;
    // FACBrNFe.DANFE.ImprimirDescPorc := ckDescontoPerc.Checked;
    FACBrNFe.DANFE.MostraPreview := ckPreview.Checked;
    // FACBrNFe.DANFe.ImprimirHoraSaida := ckHoraSaida.Checked;
    // Printer.PrinterIndex := cbImpressora.ItemIndex;
    // FACBrNFe.DANFE.Impressora := cbImpressora.Text;
    FACBrNFe.DANFE.NumCopias := StrToIntDef(edCopias.Text, 1);
    // FACBrNFe.DANFe.ProdutosPorPagina := StrToIntDef(edProdPag.Text, 0);
    TACBrNFeDANFCEClass(FACBrNFe.DANFE).LarguraBobina := 275;
    FACBrNFe.DANFE.MargemInferior                     := StrToFloatDef(edMargemInferior.Text, 2);
    FACBrNFe.DANFE.MargemSuperior                     := StrToFloatDef(edMargemSuperior.Text, 2);
    FACBrNFe.DANFE.MargemDireita                      := StrToFloatDef(edMargemDireita.Text, 5);
    FACBrNFe.DANFE.MargemEsquerda                     := StrToFloatDef(edMargemEsquerda.Text, 5);
    FACBrNFe.DANFE.PathPDF                            := GetTemporaryDir;
    FACBrNFe.DANFE.CasasDecimais.qCom                 := 3;
    FACBrNFe.DANFE.CasasDecimais.vUnCom               := 4;
    // FACBrNFe.DANFe.ExibirResumoCanhoto := cbxExibeResumo.Checked;
    // FACBrNFe.DANFe.ImprimirTotalLiquido := cbxImpValLiq.Checked;
    // FACBrNFe.DANFe.FormularioContinuo := cbxFormCont.Checked;
    FACBrNFe.DANFE.MostraStatus     := ckStatus.Checked;
    FACBrNFe.DANFE.ExpandeLogoMarca := ckExpandirLogo.Checked;

    FACBrNFe.Configuracoes.Arquivos.Salvar           := false; // ckSalvarPastaSepar.Checked;
    FACBrNFe.Configuracoes.Arquivos.SepararPorMes    := ckPastaMensal.Checked;
    FACBrNFe.Configuracoes.Arquivos.AdicionarLiteral := ckPastaLiteral.Checked;
    FACBrNFe.Configuracoes.Arquivos.EmissaoPathNFe   := ckSalvarCTeData.Checked;
    FACBrNFe.Configuracoes.Arquivos.PathNFe          := edPastaCTe.Text;
    // FACBrNFe.Configuracoes.Arquivos.c PathCan := edPastaCancel.Text;
    FACBrNFe.Configuracoes.Arquivos.PathInu := edPastaInutil.Text;
    // FACBrNFe.Configuracoes.Arquivos.PathDPEC := edPastaDPEC.Text;
    Result := true;
  finally
    INI.Free;
  end;
end;

procedure TFrmConfig_NFCe.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConfig_NFCe.btnConfirmarClick(Sender: TObject);
begin
  CriaXMLConfig;
  MessageBox(handle, 'Configurações gravadas com sucesso!', 'I9 PDV', MB_ICONINFORMATION);
  ModalResult := mrOk;
end;

procedure TFrmConfig_NFCe.btnRestaurarPadraoClick(Sender: TObject);
begin
  edPastaCTe.Text    := ExtractFilePath(Application.ExeName) + 'XML\Emitidas';
  edPastaCancel.Text := ExtractFilePath(Application.ExeName) + 'XML\Canceladas';
  edPastaPDF.Text    := ExtractFilePath(Application.ExeName) + 'XML';
  edPastaInutil.Text := ExtractFilePath(Application.ExeName) + 'XML\Inutilizadas';
  edPastaDPEC.Text   := ExtractFilePath(Application.ExeName) + 'XML';
end;

procedure TFrmConfig_NFCe.FormCreate(Sender: TObject);
var
  I: integer;
begin
  for I := 0 to self.ComponentCount - 1 do
    if Components[I] is TcxCheckBox then
      TcxCheckBox(Components[I]).Checked := false;
end;

procedure TFrmConfig_NFCe.FormShow(Sender: TObject);
var
  LACBrNFe       : TACBrNFe;
  LACBrNFeDANFERV: TACBrNFeDANFEFR;
  LSendMail      : TSendMail;
begin
  LACBrNFe        := TACBrNFe.Create(self);
  LACBrNFeDANFERV := TACBrNFeDANFEFR.Create(LACBrNFe);

  { LACBrNFe.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
    LACBrNFe.Configuracoes.Geral.SSLHttpLib := httpIndy;
    LACBrNFe.Configuracoes.Geral.SSLLib := libCustom; // libWinCrypt;
    LACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsMsXml;
  }

  LerXMLConfig(IntToStr(ServerEmpresa), LACBrNFe, LACBrNFeDANFERV, LSendMail);
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
end;

// procedure TFrmNfeConfig.SalvarIni;
// var
// Ini: TIniFile;
// StreamMemo: TMemoryStream;
// OldMonitoraTXT, OldMonitoraTCP: Boolean;
//
// begin
//
// Ini := TIniFile.Create(Fini);
// try
// // Verificando se modificou o Modo de Monitoramento //
// OldMonitoraTCP := Ini.ReadBool('ACBrNFeMonitor', 'Modo_TCP', False);
// OldMonitoraTXT := Ini.ReadBool('ACBrNFeMonitor', 'Modo_TXT', False);
//
// // Parametros do Monitor //
//
// Ini.WriteString('Certificado', 'Caminho', edtCaminho.Text);
// {$IFDEF ACBrNFeOpenSSL}
// GravaINICrypt(Ini, 'Certificado', 'Senha', edtSenha.Text, _C);
// {$ENDIF}
// Ini.WriteInteger('Geral', 'DANFE', rgTipoDanfe.ItemIndex);
// Ini.WriteInteger('Geral', 'FormaEmissao', rgFormaEmissao.ItemIndex);
// Ini.WriteString('Geral', 'LogoMarca', edtLogoMarca.Text);
// Ini.WriteBool('Geral', 'Salvar', ckSalvar.Checked);
// Ini.WriteString('Geral', 'PathSalvar', edtPathLogs.Text);
// Ini.WriteString('Geral', 'Impressora', cbxImpressora.Text);
//
// Ini.WriteString('WebService', 'UF', cbUF.Text);
// Ini.WriteInteger('WebService', 'Ambiente', rgTipoAmb.ItemIndex);
// Ini.WriteBool('WebService', 'AjustarAut', cbxAjustarAut.Checked);
// Ini.WriteString('WebService', 'Aguardar', edtAguardar.Text);
// Ini.WriteString('WebService', 'Tentativas', edtTentativas.Text);
// Ini.WriteString('WebService', 'Intervalo', edtIntervalo.Text);
//
// // GravaINICrypt( INI, 'Proxy','Pass',edtProxySenha.Text, _C) ;
//
// Ini.WriteString('Email', 'Host', edtSmtpHost.Text);
// Ini.WriteString('Email', 'Port', edtSmtpPort.Text);
// Ini.WriteString('Email', 'User', edtSmtpUser.Text);
// // GravaINICrypt(INI, 'Email','Pass'  ,edtSmtpPass.Text, _C) ;
// Ini.WriteString('Email', 'Assunto', edtEmailAssunto.Text);
// Ini.WriteBool('Email', 'SSL', cbEmailSSL.Checked);
// StreamMemo := TMemoryStream.Create;
// mmEmailMsg.Lines.SaveToStream(StreamMemo);
// StreamMemo.Seek(0, soFromBeginning);
// Ini.WriteBinaryStream('Email', 'Mensagem', StreamMemo);
// StreamMemo.Free;
//
// Ini.WriteInteger('DANFE', 'Modelo', rgModeloDanfe.ItemIndex);
// Ini.WriteString('DANFE', 'SoftwareHouse', edtSoftwareHouse.Text);
// Ini.WriteString('DANFE', 'Site', edtSiteEmpresa.Text);
// Ini.WriteString('DANFE', 'Email', edtEmailEmpresa.Text);
// Ini.WriteString('DANFE', 'Fax', edtFaxEmpresa.Text);
// Ini.WriteBool('DANFE', 'ImpDescPorc', cbxImpDescPorc.Checked);
// Ini.WriteBool('DANFE', 'MostrarPreview', cbxMostrarPreview.Checked);
// Ini.WriteBool('DANFE', 'ImprimirHora', cbxHoraSaida.Checked);
// Ini.WriteString('DANFE', 'Copias', edtNumCopia.Text);
// Ini.WriteString('DANFE', 'ProdutosPagina', edtProdPag.Text);
// Ini.WriteString('DANFE', 'Margem', edtMargemInf.Text);
// Ini.WriteString('DANFE', 'MargemSup', edtMargemSup.Text);
// Ini.WriteString('DANFE', 'MargemDir', edtMargemDir.Text);
// Ini.WriteString('DANFE', 'MargemEsq', edtMargemEsq.Text);
// Ini.WriteString('DANFE', 'PathPDF', edtPathPDF.Text);
// Ini.WriteInteger('DANFE', 'DecimaisQTD', rgCasasDecimaisQtd.ItemIndex);
// Ini.WriteInteger('DANFE', 'DecimaisValor', rgCasasDecimaisValor.ItemIndex);
// Ini.WriteBool('DANFE', 'ExibeResumo', cbxExibeResumo.Checked);
// Ini.WriteBool('DANFE', 'ImprimirValLiq', cbxImpValLiq.Checked);
// Ini.WriteBool('DANFE', 'PreImpresso', cbxFormCont.Checked);
// Ini.WriteBool('DANFE', 'MostrarStatus', cbxMostraStatus.Checked);
// Ini.WriteBool('DANFE', 'ExpandirLogo', cbxExpandirLogo.Checked);
// Ini.WriteInteger('DANFE', 'Fonte', rgTipoFonte.ItemIndex);
//
// Ini.WriteBool('Arquivos', 'Salvar', cbxSalvarArqs.Checked);
// Ini.WriteBool('Arquivos', 'PastaMensal', cbxPastaMensal.Checked);
// Ini.WriteBool('Arquivos', 'AddLiteral', cbxAdicionaLiteral.Checked);
// Ini.WriteBool('Arquivos', 'EmissaoPathNFe', cbxEmissaoPathNFe.Checked);
// Ini.WriteString('Arquivos', 'PathNFe', edtPathNFe.Text);
// Ini.WriteString('Arquivos', 'PathCan', edtPathCan.Text);
// Ini.WriteString('Arquivos', 'PathInu', edtPathInu.Text);
// Ini.WriteString('Arquivos', 'PathDPEC', edtPathDPEC.Text);
//
// finally
// Ini.Free;
// end;
//
// end;

procedure TFrmConfig_NFCe.sbArquivoCertClick(Sender: TObject);
begin
{$IFDEF ACBrCTeOpenSSL}
  OpenDialog1.Title      := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter     := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := GetCurrentDir;
  if OpenDialog1.Execute then
  begin
    edtCaminho.Text := OpenDialog1.FileName;
  end;
{$ELSE}
  FACBrNFe.Configuracoes.Geral.SSLLib      := libWinCrypt; // libCapicom;
  FACBrNFe.Configuracoes.Geral.SSLCryptLib := cryWinCrypt; // cryCapicom;
  // FACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsXmlSec;
  // FACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsXmlSec;
  // FACBrNFe.SSL.SSLType                     := LT_all;

  { FACBrNFe.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
    FACBrNFe.Configuracoes.Geral.SSLHttpLib := httpIndy;
    FACBrNFe.Configuracoes.Geral.SSLLib := libCustom; // libWinCrypt;
    FACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsMsXml; }

  edNumeroSerieCert.Text := FACBrNFe.SSL.SelecionarCertificado;

  // FACBrNFe.SSL.CarregarCertificado; // FACBrNFe.Configuracoes.Certificados.SelecionarCertificado;
  // edNumeroSerieCert.Text := FACBrNFe.SSL.CertNumeroSerie;
{$ENDIF}
end;

procedure TFrmConfig_NFCe.sbLogoMarcaClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Logo';
  // if rgModeloDanfe.ItemIndex = 0 then
  // begin
  OpenDialog1.DefaultExt := '*.bmp';
  OpenDialog1.Filter     := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
  // end
  // else
  // begin
  // OpenDialog1.DefaultExt := '*.jpg';
  // OpenDialog1.Filter := 'Arquivos JPG (*.jpg)|*.jpg|Todos os Arquivos (*.*)|*.*';
  // end;
  OpenDialog1.InitialDir := GetCurrentDir;
  if OpenDialog1.Execute then
  begin
    edLogoMarca.Text := OpenDialog1.FileName;
  end;

  if Length(Trim(edLogoMarca.Text)) > 0 then
  begin
    // if rgModeloDanfe.ItemIndex = 0 then
    // begin
    if ExtractFileExt(edLogoMarca.Text) <> '.bmp' then
    begin
      MessageDlg('O arquivo de logo deve ser no formato BMP.', mtError, [mbOk], 0);
      edLogoMarca.SetFocus;
    end;
    // end
    // else
    // begin
    // if ExtractFileExt(edLogoMarca.Text) <> '.jpg' then
    // begin
    // MessageDlg('O arquivo de logo deve ser no formato JPG.', mtError, [mbOk], 0);
    // edLogoMarca.SetFocus;
    // end;
    // end;
  end;

end;

procedure TFrmConfig_NFCe.sbPathNFeClick(Sender: TObject);
begin
  PathClick(edPastaCTe);
end;

procedure TFrmConfig_NFCe.sbPathPDFClick(Sender: TObject);
begin
  PathClick(edPastaPDF);
end;

procedure TFrmConfig_NFCe.sbPathCanClick(Sender: TObject);
begin
  PathClick(edPastaCancel);
end;

procedure TFrmConfig_NFCe.PathClick(Sender: TObject);
var
  LDir: string;
begin
  if Length(TEdit(Sender).Text) <= 0 then
    LDir := ExtractFileDir(Application.ExeName)
  else
    LDir := TEdit(Sender).Text;

  if SelectDirectory(LDir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
    TEdit(Sender).Text := LDir;
end;

// procedure TFrmNfeConfig.LerIni(var CTe: TACBrCTe; var DACTe: TACBrCTeDACTeQR);
// var
// Ini: TIniFile;
// Senha: String;
// StreamMemo: TMemoryStream;
// OK: Boolean;
// begin
// Ini := TIniFile.Create(Fini);
//
// try
// { Lendo Senha }
// fsHashSenha := StrToIntDef(LeINICrypt(INI, 'ACBrNFeMonitor', 'HashSenha', _C), -1);
//
// if fsHashSenha < 1 then { INI antigo não tinha essa chave }
// begin
// Senha := Ini.ReadString('ACBrNFeMonitor', 'Senha', '');
// if Senha <> '' then
// fsHashSenha := StringCrc16(Senha);
// end;
//
// { Parametros do Monitor }
// rgFormaEmissao.ItemIndex := Ini.ReadInteger('Geral', 'FormaEmissao', 0);
// ckSalvar.Checked := Ini.ReadBool('Geral', 'Salvar', True);
// edtPathLogs.Text := Ini.ReadString('Geral', 'PathSalvar',
// PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Logs');
// cbxImpressora.ItemIndex := cbxImpressora.Items.IndexOf(Ini.ReadString('Geral', 'Impressora', '0'));
//
// CTe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(OK, IntToStr(rgFormaEmissao.ItemIndex + 1));
// CTe.Configuracoes.Geral.Salvar := ckSalvar.Checked;
// CTe.Configuracoes.Geral.PathSalvar := edtPathLogs.Text;
//
// cbxAjustarAut.Checked := Ini.ReadBool('WebService', 'AjustarAut', False);
// edtAguardar.Text := Ini.ReadString('WebService', 'Aguardar', '0');
// edtTentativas.Text := Ini.ReadString('WebService', 'Tentativas', '5');
// edtIntervalo.Text := Ini.ReadString('WebService', 'Intervalo', '0');
//
// CTe.Configuracoes.WebServices.AjustaAguardaConsultaRet := cbxAjustarAut.Checked;
// if NotaUtil.NaoEstaVazio(edtAguardar.Text) then
// CTe.Configuracoes.WebServices.AguardarConsultaRet := NotaUtil.SeSenao
// (StrToInt(edtAguardar.Text) < 1000, StrToInt(edtAguardar.Text) * 1000, StrToInt(edtAguardar.Text))
// else
// edtAguardar.Text := IntToStr(CTe.Configuracoes.WebServices.AguardarConsultaRet);
// if NotaUtil.NaoEstaVazio(edtTentativas.Text) then
// CTe.Configuracoes.WebServices.Tentativas := StrToInt(edtTentativas.Text)
// else
// edtTentativas.Text := IntToStr(CTe.Configuracoes.WebServices.Tentativas);
// if NotaUtil.NaoEstaVazio(edtIntervalo.Text) then
// CTe.Configuracoes.WebServices.IntervaloTentativas := NotaUtil.SeSenao
// (StrToInt(edtIntervalo.Text) < 1000, StrToInt(edtIntervalo.Text) * 1000, StrToInt(edtIntervalo.Text))
// else
// edtIntervalo.Text := IntToStr(CTe.Configuracoes.WebServices.IntervaloTentativas);
//
// cbUF.ItemIndex := cbUF.Items.IndexOf(Ini.ReadString('WebService', 'UF', 'SP'));
// rgTipoAmb.ItemIndex := Ini.ReadInteger('WebService', 'Ambiente', 0);
// CTe.Configuracoes.WebServices.UF := cbUF.Text;
// CTe.Configuracoes.WebServices.Ambiente := StrToTpAmb(OK, IntToStr(rgTipoAmb.ItemIndex + 1));
// {$IFDEF ACBrCTeOpenSSL}
// gbxCertificado.Height := 109;
// rgFormaEmissao.Top := 105;
// lblCaminho.Caption := 'Arquivo PFX';
// edtSenha.Visible := True;
// lblSenha.Visible := True;
// edtCaminho.Text := Ini.ReadString('Certificado', 'Caminho', '');
// edtSenha.Text := LeINICrypt(Ini, 'Certificado', 'Senha', _C);
// CTe.Configuracoes.Certificados.Certificado := edtCaminho.Text;
// CTe.Configuracoes.Certificados.Senha := edtSenha.Text;
// {$ELSE}
// edtSenha.Visible := False;
// lblSenha.Visible := False;
// gbxCertificado.Height := 69;
// lblCaminho.Caption := 'Número de Série';
// edtCaminho.Text := Ini.ReadString('Certificado', 'Caminho', '');
// CTe.Configuracoes.Certificados.NumeroSerie := edtCaminho.Text;
// edtCaminho.Text := CTe.Configuracoes.Certificados.NumeroSerie;
// {$ENDIF}
// rgTipoDanfe.ItemIndex := Ini.ReadInteger('Geral', 'DANFE', 0);
// edtLogoMarca.Text := Ini.ReadString('Geral', 'LogoMarca', '');
// rgModeloDanfe.ItemIndex := Ini.ReadInteger('DANFE', 'Modelo', 0);
// edtSoftwareHouse.Text := Ini.ReadString('DANFE', 'SoftwareHouse', '');
// edtSiteEmpresa.Text := Ini.ReadString('DANFE', 'Site', '');
// edtEmailEmpresa.Text := Ini.ReadString('DANFE', 'Email', '');
// edtFaxEmpresa.Text := Ini.ReadString('DANFE', 'Fax', '');
// cbxImpDescPorc.Checked := Ini.ReadBool('DANFE', 'ImpDescPorc', False);
// cbxMostrarPreview.Checked := Ini.ReadBool('DANFE', 'MostrarPreview', False);
// cbxHoraSaida.Checked := Ini.ReadBool('DANFE', 'ImprimirHora', False);
// edtNumCopia.Text := Ini.ReadString('DANFE', 'Copias', '1');
// edtProdPag.Text := Ini.ReadString('DANFE', 'ProdutosPagina', '0');
// edtMargemInf.Text := Ini.ReadString('DANFE', 'Margem', '0,8');
// edtMargemSup.Text := Ini.ReadString('DANFE', 'MargemSup', '0,8');
// edtMargemDir.Text := Ini.ReadString('DANFE', 'MargemDir', '0,51');
// edtMargemEsq.Text := Ini.ReadString('DANFE', 'MargemEsq', '0,6');
// edtPathPDF.Text := PathWithDelim(Ini.ReadString('DANFE', 'PathPDF', ExtractFilePath(Application.ExeName)));
// rgCasasDecimaisQtd.ItemIndex := Ini.ReadInteger('DANFE', 'DecimaisQTD', 0);
// rgCasasDecimaisValor.ItemIndex := Ini.ReadInteger('DANFE', 'DecimaisValor', 0);
// cbxExibeResumo.Checked := Ini.ReadBool('DANFE', 'ExibeResumo', False);
// cbxImpValLiq.Checked := Ini.ReadBool('DANFE', 'ImprimirValLiq', False);
// cbxFormCont.Checked := Ini.ReadBool('DANFE', 'PreImpresso', False);
// cbxMostraStatus.Checked := Ini.ReadBool('DANFE', 'MostrarStatus', True);
// cbxExpandirLogo.Checked := Ini.ReadBool('DANFE', 'ExpandirLogo', False);
// rgTipoFonte.ItemIndex := Ini.ReadInteger('DANFE', 'Fonte', 0);
//
// if rgModeloDanfe.ItemIndex = 0 then
// CTe.DACTe := DACTe;
// // else
// // CTe.DANFE := ACBrNFeDANFERaveCB1;
//
// if CTe.DACTe <> nil then
// begin
// CTe.DANFe.TipoDACTE := StrToTpImp(OK, IntToStr(rgTipoDanfe.ItemIndex + 1));
// CTe.DANFe.Logo := edtLogoMarca.Text;
// CTe.DANFe.Sistema := edtSoftwareHouse.Text;
// CTe.DANFe.Site := edtSiteEmpresa.Text;
// CTe.DANFe.Email := edtEmailEmpresa.Text;
// CTe.DANFe.Fax := edtFaxEmpresa.Text;
// CTe.DANFe.ImprimirDescPorc := cbxImpDescPorc.Checked;
// CTe.DANFe.MostrarPreview := cbxMostrarPreview.Checked;
// CTe.DANFe.ImprimirHoraSaida := cbxHoraSaida.Checked;
// CTe.DANFe.Impressora := cbxImpressora.Text;
// CTe.DANFe.NumCopias := StrToIntDef(edtNumCopia.Text, 1);
/// /       CTe.DANFe.ProdutosPorPagina := StrToIntDef(edtProdPag.Text, 0);
// CTe.DANFe.MargemInferior := StrToFloatDef(edtMargemInf.Text, 0.8);
// CTe.DANFe.MargemSuperior := StrToFloatDef(edtMargemSup.Text, 0.8);
// CTe.DANFe.MargemDireita := StrToFloatDef(edtMargemDir.Text, 0.51);
// CTe.DANFe.MargemEsquerda := StrToFloatDef(edtMargemEsq.Text, 0.6);
// CTe.DANFe.PathPDF := edtPathPDF.Text;
// // CTe.DANFe.CasasDecimais._qCom := rgCasasDecimaisQtd.ItemIndex + 2;
// // CTe.DANFe.CasasDecimais._vUnCom := rgCasasDecimaisValor.ItemIndex + 2;
/// /       CTe.DANFe.ExibirResumoCanhoto := cbxExibeResumo.Checked;
// // CTe.DANFe.ImprimirTotalLiquido := cbxImpValLiq.Checked;
// // CTe.DANFe.FormularioContinuo := cbxFormCont.Checked;
// CTe.DANFe.MostrarStatus := cbxMostraStatus.Checked;
// CTe.DANFe.ExpandirLogoMarca := cbxExpandirLogo.Checked;
// // if CTe.DACTe = DACTe then
// // DANFe.avFile := PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Report\NotaFiscalEletronica.rav';
// // 'Report\DANFE_Rave513.rav'
// // else
// // ACBrNFeDANFERaveCB1.Fonte  := NotaUtil.SeSenao(rgTipoFonte.ItemIndex=0,ftTimes,ftCourier);
// end;
//
// DANFe.
//
// edtSmtpHost.Text := Ini.ReadString('Email', 'Host', '');
// edtSmtpPort.Text := Ini.ReadString('Email', 'Port', '');
// edtSmtpUser.Text := Ini.ReadString('Email', 'User', '');
// edtSmtpPass.Text := LeINICrypt(Ini, 'Email', 'Pass', _C);
// edtEmailAssunto.Text := Ini.ReadString('Email', 'Assunto', '');
// cbEmailSSL.Checked := Ini.ReadBool('Email', 'SSL', False);
// StreamMemo := TMemoryStream.Create;
// Ini.ReadBinaryStream('Email', 'Mensagem', StreamMemo);
// mmEmailMsg.Lines.LoadFromStream(StreamMemo);
// StreamMemo.Free;
//
// cbxSalvarArqs.Checked := Ini.ReadBool('Arquivos', 'Salvar', False);
// cbxPastaMensal.Checked := Ini.ReadBool('Arquivos', 'PastaMensal', False);
// cbxAdicionaLiteral.Checked := Ini.ReadBool('Arquivos', 'AddLiteral', False);
// cbxEmissaoPathNFe.Checked := Ini.ReadBool('Arquivos', 'EmissaoPathNFe', False);
// edtPathNFe.Text := Ini.ReadString('Arquivos', 'PathNFe', '');
// edtPathCan.Text := Ini.ReadString('Arquivos', 'PathCan', '');
// edtPathInu.Text := Ini.ReadString('Arquivos', 'PathInu', '');
// edtPathDPEC.Text := Ini.ReadString('Arquivos', 'PathDPEC', '');
//
// CTe.Configuracoes.Arquivos.Salvar := cbxSalvarArqs.Checked;
// CTe.Configuracoes.Arquivos.PastaMensal := cbxPastaMensal.Checked;
// CTe.Configuracoes.Arquivos.AdicionarLiteral := cbxAdicionaLiteral.Checked;
// CTe.Configuracoes.Arquivos.EmissaoPathCTe := cbxEmissaoPathNFe.Checked;
// CTe.Configuracoes.Arquivos.PathCTe := edtPathNFe.Text;
// CTe.Configuracoes.Arquivos.PathCan := edtPathCan.Text;
// CTe.Configuracoes.Arquivos.PathInu := edtPathInu.Text;
// CTe.Configuracoes.Arquivos.PathDPEC := edtPathDPEC.Text;
// finally
// Ini.Free;
// end;
//
// end;

procedure TFrmConfig_NFCe.sbPathInuClick(Sender: TObject);
begin
  PathClick(edPastaInutil);
end;

procedure TFrmConfig_NFCe.sbPathDPECClick(Sender: TObject);
begin
  PathClick(edPastaDPEC);
end;

end.
