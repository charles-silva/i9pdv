unit uFrmPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ACBrUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uWiEventsForm,
  dxGDIPlusClasses, Vcl.ExtCtrls,
  System.AnsiStrings, uFrmConfig_Terminais, cxGraphics, cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinCaramel,
  dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, cxContainer, cxEdit, Vcl.ComCtrls, cxListView,
  cxTextEdit, cxCurrencyEdit, uFrmOperacao_EncerraCaixaOperador,
  uFrmOperacao_AbreCaixaOperador, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FmtBcd, uPDVLib,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uWiFDQuery,
  dxLayoutContainer, cxGridViewLayoutContainer, cxGridLayoutView,
  cxGridDBLayoutView, cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView,
  cxGridBandedTableView, cxGridDBBandedTableView,
  System.Generics.Collections, Vcl.WinXCtrls, uFrmConfig_Adquirentes,
  uFrmConfig_POS, pcnVFPe, Vcl.AppEvnts, uFrmConfig_NFCe, ppParameter,
  ppDesignLayer, ppCtrls, ppStrtch, ppMemo, ppBands, ppBarCod, ppVar, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppSubRpt, cxLabel, cxDBLabel, uFrmPDV_DModule_DS, ACBrBase, ACBrBAL,
  ACBrDevice, cxCheckBox, ACBrPosPrinter, cxMemo, cxDBEdit,
  uFrmConfig_Connection, uPDV_SetModos, Clipbrd,
  cxDataControllerConditionalFormattingRulesManagerDialog, AdvGlowButton, strutils,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, cxButtons, dxDateRanges,
  dxScrollbarAnnotations, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, cxGeometry, dxFramedControl, dxPanel,
  Vcl.Imaging.pngimage, ACBrTEFAPIComum, ACBrTEFAPI, uFrmPDV_TEF_Operacoes, uFrmPDV_TEF_QRCode, uFrmPDV_TEF_Campo,
  ACBrTEFComum;

type
  TListItemPag = record
    Pnfp_id: Integer;
  end;

  TTipoCancelaItem = (tciPorCodigo, tciPorSeq);

  TFrmPDV = class(TForm)
    Timer1: TTimer;
    lblDataAbertura: TLabel;
    Label14: TLabel;
    lblSequencial: TLabel;
    Label16: TLabel;
    TimerShow: TTimer;
    lblLastSync: TLabel;
    Label4: TLabel;
    cxPageControl1: TcxPageControl;
    cxtabPrincipal: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    shp2: TShape;
    shp3: TShape;
    Label10: TLabel;
    lblQtd: TLabel;
    shpFoto: TShape;
    imgProduto: TImage;
    lblMainProdutoDescr: TLabel;
    lblCodigo: TLabel;
    lblQuantProd: TLabel;
    lblMensagem: TLabel;
    shp8: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Label15: TLabel;
    lblTotalCompraEncerra: TLabel;
    Label18: TLabel;
    lblVolumesEncerra: TLabel;
    Shape19: TShape;
    Label28: TLabel;
    lblTotalPagoEncerra: TLabel;
    shpValorAPagar: TShape;
    lblValoraPagarTitle: TLabel;
    lblValorAPagarEncerra: TLabel;
    Shape22: TShape;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Shape23: TShape;
    Shape24: TShape;
    Bevel1: TBevel;
    edValorForma: TcxCurrencyEdit;
    lstListFormas: TcxListView;
    Shape16: TShape;
    Label38: TLabel;
    Shape27: TShape;
    cxTabSheet3: TcxTabSheet;
    cxStyleRepository1: TcxStyleRepository;
    srCancelItemDef: TcxStyle;
    srCancelItemStrike: TcxStyle;
    Image1: TImage;
    ImgServiceUP: TImage;
    ImgServiceDown: TImage;
    Label17: TLabel;
    lblVrUnitProd: TLabel;
    lblVrTotalProd: TLabel;
    shp1: TShape;
    Label9: TLabel;
    Label13: TLabel;
    lblLabelSubTotal: TLabel;
    lblSubTotal: TLabel;
    shp7: TShape;
    Label7: TLabel;
    lblVolumes: TLabel;
    shp6: TShape;
    shpFotoBack: TShape;
    Shape10: TShape;
    Label5: TLabel;
    cxStyle1: TcxStyle;
    Shape1: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape25: TShape;
    Label35: TLabel;
    lblVrUnitProd21: TLabel;
    Label37: TLabel;
    lblVrTotalProd21: TLabel;
    lblProdutoDescr21: TLabel;
    Label43: TLabel;
    lblVrUnitProd22: TLabel;
    Label45: TLabel;
    lblVrTotalProd22: TLabel;
    Label47: TLabel;
    lblVrUnitProd23: TLabel;
    Label49: TLabel;
    lblVrTotalProd23: TLabel;
    Label51: TLabel;
    lblVrUnitProd24: TLabel;
    Label53: TLabel;
    lblVrTotalProd24: TLabel;
    Label55: TLabel;
    lblVrUnitProd25: TLabel;
    Label57: TLabel;
    lblVrTotalProd25: TLabel;
    Label59: TLabel;
    lblVrUnitProd26: TLabel;
    Label61: TLabel;
    lblVrTotalProd26: TLabel;
    lblProdutoDescr22: TLabel;
    lblProdutoDescr23: TLabel;
    lblProdutoDescr24: TLabel;
    lblProdutoDescr25: TLabel;
    lblProdutoDescr26: TLabel;
    lblMsgRapida: TLabel;
    cxTabSheet4: TcxTabSheet;
    Shape3: TShape;
    lblQueryPriceTitle: TLabel;
    shpQueryPrice: TShape;
    lblQueryPriceValor: TLabel;
    Shape4: TShape;
    Label11: TLabel;
    lblQueryPriceUnit: TLabel;
    Label36: TLabel;
    lblQueryPriceStock: TLabel;
    Shape11: TShape;
    Label34: TLabel;
    lblUnidadeProd: TLabel;
    cxTabSheet5: TcxTabSheet;
    cxgrdReimpressaoDBTableView1: TcxGridDBTableView;
    cxgrdReimpressaoLevel1: TcxGridLevel;
    cxgrdReimpressao: TcxGrid;
    cxgrdReimpressaoDBTableView1pnf_id: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1pnf_serie: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1pnf_numero_fiscal: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1pnf_data_emissao: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1pnf_volumes: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1en_cnpjcpf: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1en_nome_completo: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1pnf_total_nota: TcxGridDBColumn;
    lblCancelReprintMsg: TLabel;
    Shape7: TShape;
    lblCancelReprint: TLabel;
    cxgrdReimpressaoDBTableView1pnf_status_str: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1pnf_data_autorizacao: TcxGridDBColumn;
    Shape5: TShape;
    Label41: TLabel;
    cxgrdReimpressaoDBTableView1pnf_status: TcxGridDBColumn;
    Cancelado: TcxStyle;
    Enviado: TcxStyle;
    NaoEnviado: TcxStyle;
    cxStyle2: TcxStyle;
    fdDataHoraServer: TFDQuery;
    cxTabSheet6: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Shape8: TShape;
    Shape9: TShape;
    Label3: TLabel;
    Label20: TLabel;
    cxGridDBTableView1Unnamed1: TcxGridDBColumn;
    cxGridDBTableView1contar: TcxGridDBColumn;
    cxGridDBTableView1total: TcxGridDBColumn;
    Label29: TLabel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2fp_descricao: TcxGridDBColumn;
    cxGridDBTableView2Calculado: TcxGridDBColumn;
    Label42: TLabel;
    Label44: TLabel;
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Label46: TLabel;
    lblDescontoAcrescimo: TLabel;
    Shape13: TShape;
    Label48: TLabel;
    ACBrBAL1: TACBrBAL;
    cxgrdReimpressaoDBTableView1pnf_sat: TcxGridDBColumn;
    cxgrdReimpressaoDBTableView1pnf_nfce: TcxGridDBColumn;
    cxGridDBTableView3us_apelido: TcxGridDBColumn;
    Image2: TImage;
    Label39: TLabel;
    imgBalancaOK: TImage;
    edpnf_motivo_rejeicao: TcxDBMemo;
    Shape26: TShape;
    lblQueryCodigoInterno: TLabel;
    Label40: TLabel;
    FinalizarVenda: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    CordoMes: TPanel;
    pnItens: TPanel;
    Shape6: TShape;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    lblItem1: TLabel;
    lblCodigo1: TLabel;
    lblDescricao1: TLabel;
    lblUnidade1: TLabel;
    lblQtd1: TLabel;
    lblVrUnitario1: TLabel;
    lblVrTotal1: TLabel;
    lblItem2: TLabel;
    lblCodigo2: TLabel;
    lblDescricao2: TLabel;
    lblVrUnitario2: TLabel;
    lblVrTotal2: TLabel;
    lblUnidade2: TLabel;
    lblQtd2: TLabel;
    lblItem3: TLabel;
    lblCodigo3: TLabel;
    lblDescricao3: TLabel;
    lblVrUnitario3: TLabel;
    lblVrTotal3: TLabel;
    lblUnidade3: TLabel;
    lblQtd3: TLabel;
    lblitem4: TLabel;
    lblCodigo4: TLabel;
    lblDescricao4: TLabel;
    lblVrUnitario4: TLabel;
    lblVrTotal4: TLabel;
    lblUnidade4: TLabel;
    lblQtd4: TLabel;
    lblItem5: TLabel;
    lblCodigo5: TLabel;
    lblDescricao5: TLabel;
    lblVrUnitario5: TLabel;
    lblVrTotal5: TLabel;
    lblUnidade5: TLabel;
    lblQtd5: TLabel;
    lblItem6: TLabel;
    lblCodigo6: TLabel;
    lblDescricao6: TLabel;
    lblVrUnitario6: TLabel;
    lblVrTotal6: TLabel;
    lblUnidade6: TLabel;
    lblQtd6: TLabel;
    lblItem7: TLabel;
    lblCodigo7: TLabel;
    lblDescricao7: TLabel;
    lblVrUnitario7: TLabel;
    lblVrTotal7: TLabel;
    lblUnidade7: TLabel;
    lblQtd7: TLabel;
    lblItem8: TLabel;
    lblCodigo8: TLabel;
    lblDescricao8: TLabel;
    lblVrUnitario8: TLabel;
    lblVrTotal8: TLabel;
    lblUnidade8: TLabel;
    lblQtd8: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label12: TLabel;
    Shape2: TShape;
    lblItem9: TLabel;
    lblCodigo9: TLabel;
    lblDescricao9: TLabel;
    lblVrUnitario9: TLabel;
    lblVrTotal9: TLabel;
    lblUnidade9: TLabel;
    lblQtd9: TLabel;
    lblItem10: TLabel;
    lblCodigo10: TLabel;
    lblDescricao10: TLabel;
    lblVrUnitario10: TLabel;
    lblVrTotal10: TLabel;
    lblUnidade10: TLabel;
    lblQtd10: TLabel;
    AdvGlowButton6: TAdvGlowButton;
    L1: TListBox;
    ADOConnection1: TADOConnection;
    ds1: TDataSource;
    a1: TADOQuery;
    Memo1: TMemo;
    fdMemTbItens: TFDMemTable;
    fdMemTbItensItem: TIntegerField;
    fdMemTbItensEan: TStringField;
    fdMemTbItensDescricao: TStringField;
    fdMemTbItensUnidade: TStringField;
    DataSource1: TDataSource;
    fdMemTbItensQuantidade: TStringField;
    fdMemTbItensPreco: TStringField;
    fdMemTbItensTotal: TStringField;
    cxGrid6: TcxGrid;
    cxGridDBTableCima: TcxGridDBTableView;
    cxGridDBTableCimaItem: TcxGridDBColumn;
    cxGridDBTableCimaEan: TcxGridDBColumn;
    cxGridDBTableCimaDescricao: TcxGridDBColumn;
    cxGrid3DBTablebaixo: TcxGridDBTableView;
    cxGrid3DBTablebaixoUnidade: TcxGridDBColumn;
    cxGrid3DBTablebaixoQuantidade: TcxGridDBColumn;
    cxGrid3DBTablebaixoPreco: TcxGridDBColumn;
    cxGrid3DBTablebaixoTotal: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxGrid3Level1: TcxGridLevel;
    DS2: TDataSource;
    A2: TADOQuery;
    FDQuery1: TFDQuery;
    DataSource2: TDataSource;
    dscpedido: TDataSource;
    cpedido: TADOQuery;
    dsitens: TDataSource;
    itens: TADOQuery;
    ds3: TDataSource;
    a3: TADOQuery;
    cxButton1: TcxButton;
    dscabeca: TDataSource;
    cabeca: TADOQuery;
    cabecaus_codigo: TIntegerField;
    cabecaUS_NOME: TStringField;
    cabecapnf_id: TAutoIncField;
    cabecapnf_numero_fiscal: TIntegerField;
    cabecapnf_data_emissao: TDateTimeField;
    cabecapnf_total_nota: TBCDField;
    cabecapnf_status: TSmallintField;
    cabecapnf_nnotamodulo: TIntegerField;
    cabecaDtImportar: TDateTimeField;
    cabecaidVendedor: TIntegerField;
    cabecafp_codigo: TIntegerField;
    cabecaFormaPagPDV: TIntegerField;
    cabecafinalizadoraPDV: TIntegerField;
    itenspr_codigo: TIntegerField;
    itensDescricao: TStringField;
    itenspnfi_id: TAutoIncField;
    itenspnfi_qtd: TBCDField;
    itenspnfi_valor_unit: TFMTBCDField;
    itenspnfi_desconto: TBCDField;
    itenspnfi_total_nota: TBCDField;
    itensEMID: TIntegerField;
    itensTipo: TStringField;
    dsnpedido: TDataSource;
    npedido: TADOQuery;
    npedidoPedido: TAutoIncField;
    npedidoData: TDateTimeField;
    npedidoNPEDIDO: TIntegerField;
    npedidoE_LOJA: TIntegerField;
    cpedidoPedido: TIntegerField;
    cpedidoCliente: TIntegerField;
    cpedidoEmissao: TDateTimeField;
    cpedidoEntrega: TDateTimeField;
    cpedidoVendedor: TIntegerField;
    cpedidoTipo: TIntegerField;
    cpedidoDPComissao: TDateTimeField;
    cpedidoSTcomissao: TStringField;
    cpedidoVPComissao: TBCDField;
    cpedidoFormar: TIntegerField;
    cpedidoNpalm: TStringField;
    cpedidoObservacao: TStringField;
    cpedidoAlterado: TStringField;
    cpedidoUsuario: TStringField;
    cpedidoStatus: TStringField;
    cpedidoTStatus: TStringField;
    cpedidoVistado: TStringField;
    cpedidoVia: TIntegerField;
    cpedidoValorPedido: TBCDField;
    cpedidoPGComissao: TStringField;
    cpedidoPago: TStringField;
    cpedidoObserPG: TStringField;
    cpedidoDTPagamento: TDateTimeField;
    cpedidoTCusto: TBCDField;
    cpedidoTVenda: TBCDField;
    cpedidoVolume: TBCDField;
    cpedidoQItens: TBCDField;
    cpedidoTDesconto: TBCDField;
    cpedidoODespesas: TBCDField;
    cpedidoDdespesas: TBCDField;
    cpedidoE_Loja: TIntegerField;
    cpedidoE_Status: TIntegerField;
    cpedidoE_Usuario: TIntegerField;
    cpedidoDESCONTO: TBCDField;
    cpedidoHora_Separou: TDateTimeField;
    cpedidoHora_Termina: TDateTimeField;
    cpedidoE_UsuarioSep: TIntegerField;
    cpedidoObs01: TStringField;
    cpedidoObs02: TStringField;
    cpedidoObs03: TStringField;
    cpedidoNControle: TAutoIncField;
    cpedidoE_Transportadora: TIntegerField;
    cpedidoQtdEmbalagem: TBCDField;
    cpedidoe_transportador: TIntegerField;
    cpedidoFRETE: TBCDField;
    cpedidoPer_Desconto: TBCDField;
    cpedidoDataCancelamento: TDateTimeField;
    cpedidoE_STATUSNEG: TIntegerField;
    cpedidoCODINEGOCIA: TIntegerField;
    cpedidoDATAABRIU: TDateTimeField;
    cpedidoDATAFECHA: TDateTimeField;
    cpedidoTOTCOMDES: TBCDField;
    cpedidoMESA_CRACHA: TBCDField;
    cpedidoST_ENTREGA: TIntegerField;
    cpedidoE_ENTREGADOR: TIntegerField;
    cpedidoTot_Desconto: TBCDField;
    cpedidoTOTDIGITADO: TBCDField;
    cpedidoTIPOVENDA: TIntegerField;
    cxStyle3: TcxStyle;
    cxGrid3DBTablebaixoEmBranco: TcxGridDBColumn;
    dtDataVenda: TDateTimePicker;
    cxButton2: TcxButton;
    lblAcreDesc: TLabel;
    lblStatusTotal: TLabel;
    pnltOP: TPanel;
    shptOP: TShape;
    imgLogo: TImage;
    lblDataHora: TLabel;
    lblDataHoraHint: TLabel;
    Image3: TImage;
    lblCaixa: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    lblCaixaOperador: TLabel;
    edtcodusuario: TEdit;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    ACBrTEFAPI1: TACBrTEFAPI;
    TimerTEFContador: TTimer;
    fdqryImpressora: TFDQuery;
    ACBrPosPrinter1: TACBrPosPrinter;
    lblTEFAviso: TLabel;
    procedure ACBrTEFAPI1QuandoExibirMensagem(const Mensagem: string; Terminal: TACBrTEFAPITela;
      MilissegundosExibicao: Integer);
    procedure ACBrTEFAPI1QuandoFinalizarOperacao(RespostaTEF: TACBrTEFResp);
    procedure ACBrTEFAPI1QuandoPerguntarMenu(const Titulo: string; Opcoes: TStringList; var ItemSelecionado: Integer);
    procedure TimerTEFContadorTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure cxPageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edItemCodigoCancelKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxGridDBTableView3EditKeyPress(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Char);
    procedure cxGridDBTableView3EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FinalizarVendaClick(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton6Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure ACBrTEFAPI1QuandoPerguntarCampo(DefinicaoCampo: TACBrTEFAPIDefinicaoCampo; var Resposta: string;
      var Validado, Cancelado: Boolean);
    procedure ACBrTEFAPI1QuandoGravarLog(const ALogLine: String; var Tratado: Boolean);
    procedure ACBrTEFAPI1QuandoFinalizarTransacao(RespostaTEF: TACBrTEFResp; AStatus: TACBrTEFStatusTransacao);
    procedure ACBrTEFAPI1QuandoDetectarTransacaoPendente(RespostaTEF: TACBrTEFResp; const MsgErro: String);
    procedure ACBrTEFAPI1QuandoEsperarOperacao(OperacaoAPI: TACBrTEFAPIOperacaoAPI; var Cancelar: Boolean);
    procedure ACBrTEFAPI1QuandoExibirQRCode(const DadosQRCode: String);

  private
    goListResendMode    : Boolean;
    goListCancelMode    : Boolean;
    goListReprintMode   : Boolean;
    goCNPJCPF, goNomeCli: String;

    FMensagemTEF          : String;
    FContadorSegundosTEF  : Integer;
    FContadorInicioTickTEF: Cardinal;
    FProcessandoTEF       : Boolean;
    FCancelarTEF          : Boolean;
    FFrmTEFQRCode         : TFrmPDV_TEF_QRCode;

    procedure doExecCommand;
    procedure doAddItemCancelList(AItem: Integer; AValor: Double);
    procedure doAddFormasList(APags: TObjectList<TNFPag>);
    procedure doSetItemCancel(idx: Integer);
    procedure doSATLoad;
    procedure doGetValorAPagar;
    procedure doSATSendAllPays;
    procedure doStartBalanca;
    procedure PopulaGrid;
    function ValidaMenu(Acode: string): Boolean;
    procedure ValidaPos;
    procedure doTEFLoad;
    procedure ConfigurarTEF;
    procedure AtivarTEF;
    procedure IniciarContadorTEF;
    procedure FinalizarContadorTEF;
    procedure AtualizarContadorTEF;
    procedure doTEFAtualizarAviso(const AMsg: String; AContador: Integer = 0);
    procedure doTEFExibirMensagem(const AMsg: String);
    procedure doTEFConsultar;
    function EfetuarPagamentoTEFComum(const ANumeroFiscal: String; AValor: Currency;
      AModalidade: TACBrTEFModalidadePagamento; ACartoesAceitos: TACBrTEFTiposCartao;
      AFinanciamento: TACBrTEFModalidadeFinanciamento; AParcelas: Byte): Boolean;
  protected
    { Private declarations }
  public
    goFormaPagamento       : Integer;
    goIdxCancel            : Integer;
    goCaixa                : TCaixa;
    goCaixaOperador        : TCaixaOperador;
    goInserted             : Boolean;
    goCurrentProdCod       : String;
    goBuffer               : String;
    goQtdProdBuffer        : Double;
    goTipoCancelaItem      : TTipoCancelaItem;
    goCancelItemMode       : Boolean;
    goQueryPriceMode       : Boolean;
    goCancelMode           : Boolean;
    goPcx_id               : Integer;
    goPterm_id             : String;
    goPnf_id, goPnf_id_last: Integer;
    goPcxo_id              : Integer;
    goPcxo_id_temp         : Integer;
    goTerminal             : TTerminal;
    function DesCriptografar(V_Valor: String; V_Retorna: Word): String;
    procedure doGetTotaisEncerra;
    function doExecFunction(Acode: String): Boolean;
    procedure doAddItensList(AItens: TObjectList<TNFItem>);
    function doGetPesoBalanca(var aPeso: Double): Boolean;
    procedure doClearItem;
    function doFindItemCancel(AItemCodigo: Integer; var AProduto: TProduto): Boolean;
    procedure doClearEncerra;
    procedure ProcessaPedido(npnf: Integer);
    procedure doClear(const AClearLista: Boolean = true);
    function doGetCaixa: Boolean;
    function doGetCaixaOperador: Boolean;
    function Campo_Configuracao(Campo: stRing): string;
    procedure StoreXML(aXMLEnviado: AnsiString; apnf_id: Integer; cnf: Integer);
    procedure StoreXMLCancel(AXMLCancel: AnsiString; apnf_id: Integer);
    procedure doAddFormaList(afp_codigo, aPnfp_id: Integer; afp_descricao: string);
    procedure existNotasContigencia;
    function EfetuarPagamentoTEF(const ANumeroFiscal: String; AValor: Currency; ACartaoDebito: Boolean): Boolean;
    function EfetuarPagamentoTEFPix(const ANumeroFiscal: String; AValor: Currency): Boolean;
    procedure ConfirmarTransacaoTEF;
    procedure DesfazerTransacaoTEF;
    function EstornarTransacaoTEF(const ANSU, ACodigoAutorizacao, ARede, AFinalizacao: String; ADataHora: TDateTime;
      AValor: Double): Boolean;

  var
    vcestoque, vcodusuario, vcPedido: string;
    // Pnfp_id do pagamento TEF (cart�o/Pix) autorizado mas ainda n�o confirmado
    // (aguardando o cupom fiscal). S� � zerado por ConfirmarTransacaoTEF ou
    // DesfazerTransacaoTEF -- ver doConfirmaPagamento em uPDV_NF.pas.
    goTEFPnfp_idPendente: Integer;
  end;

{$I WiBiPDVVersion.inc}

const

  //
  // cSwHCNPJ: String = '16716114000172'; // CNPJ DE HOMOLOGA��O.
  cSwHCNPJ: String = '01032012000160'; // CNPJ PRODU��O

var
  FrmPDV    : TFrmPDV;
  goPDVClass: TPDVClass;
  goCNPJ    : String;
  HNDLibNFCe: Integer;
  HNDLibSAT : Integer;
  HNDLibTEF : Integer;
  vExpira   : string;

implementation

{$R *.dfm}

uses uFrmPDV_DModule, uFrmPDV_Autorizacao, uGlobalLibPDV, uFrmPDV_Bloqueio,
  uFrmConfig_Impressoras, uFrmPDV_FormasPag, uFrmPDV_POS,
  uFrmPDV_POS_Manual, uFrmPDV_PesqProds, uFrmPDV_Splash, uFrmPDV_NFCe,
  uFrmPDV_Funcoes, uFrmConfig_Balanca, uFrmPDV_ImportaComanda,
  uFrmPDV_Desconto, uFrmPDV_Balanca, uFrmConfig_SyncServer, uFrmPDV_Sync,
  uFrmOperacao_Sangria, uFrmPDV_IdentificaCliente,
  uFrmPDV_ImportaPreVenda, uFrmPDV_SAT, uPDV_Print,
  uPDV_SetValores, uPDV_NF, uimpDados, uvendas, ufracionaPedido,
  uFrmPDV_Login_DefineSenha, ACBrDeviceSerial, uFrmPDV_Promocoes, uFrmResumoCaixa, uFrmBaseExterna, System.TypInfo;

{ M�todos do formul�rio }

procedure TFrmPDV.FinalizarVendaClick(Sender: TObject);
begin
  doExecFunction('201')
  // lblCodigo.Caption:='201/';
end;

procedure TFrmPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
  KillProcess(Application.handle);
end;

procedure TFrmPDV.FormCreate(Sender: TObject);
begin
  FrmPDV     := self;
  goPDVClass := TPDVClass.Create;

  try
    if not FileExists(ExtractFilePath(Application.ExeName) + 'I9PDVINI.EMS') THEN
    begin
      SHOWMESSAGE('Arquivo do SERVIDOR nao encontrado nao podera iniciar o servico');
      Application.Terminate;
    end;
    L1.Clear;
    L1.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'I9PDVINI.EMS');
    with FrmPDV_DModule.ADConnection1 do
    begin
      Params.Values['Database']  := splitString(L1.Items[0], '|')[0];
      Params.Values['User_name'] := splitString(L1.Items[0], '|')[1];
      Params.Values['Password']  := splitString(L1.Items[0], '|')[2];
      Params.Values['Server']    := splitString(L1.Items[0], '|')[3];
      Connected                  := true;
    end;

  except
    on e: exception do
    begin
      SHOWMESSAGE('Ocorreu uma Falha na configura��o !' + #13 + 'BD ' + splitString(L1.Items[0], '|')[0] + #13 +
        'USUARIO ' + splitString(L1.Items[0], '|')[1] + #13 + 'PASSOWRD ' + splitString(L1.Items[0], '|')[2] + #13 +
        'SERVIDOR ' + splitString(L1.Items[0], '|')[3] + #13 + e.Message);
      Application.Terminate;
    end;
  end;

  goPDVClass.Load(ServerEmpresa, FrmPDV_DModule.ADConnection1);
  goBuffer                           := '';
  goQtdProdBuffer                    := 0;
  cxPageControl1.Properties.HideTabs := true;
  // lblOperador.Caption                := 'Sem Operador';
end;

procedure TFrmPDV.FormDestroy(Sender: TObject);
begin
  if Assigned(goCaixaOperador) then
    goCaixaOperador.Destroy;

  if Assigned(goCaixa) then
    goCaixa.Destroy;

  if Assigned(goTerminal) then
    goTerminal.Destroy;

  if Assigned(goPDVClass) then
    goPDVClass.Destroy;

  if Assigned(FrmPDV_SAT) then
    FrmPDV_SAT.Destroy;

  if Assigned(FrmPDV_NFCe) then
    FrmPDV_NFCe.Destroy;
end;

procedure TFrmPDV.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  loPnfp_id  : Integer;
  loResult   : Integer;
  loNF       : TNF;
  loCancelCFe: TSendRetorno;
  loFileStr  : TStrings;
begin
  // Enquanto uma opera��o TEF est� em andamento (ativa��o ou pagamento), ESC
  // cancela em vez de navegar entre p�ginas -- ver ACBrTEFAPI1QuandoEsperarOperacao.
  if FProcessandoTEF and (Key = VK_ESCAPE) then
  begin
    FCancelarTEF := true;
    Key          := 0;
    exit;
  end;

  if FrmPDV_DModule_DS.dsTeclas.active and (not(Key in [13, 37, 38, 39, 40])) then
    if FrmPDV_DModule_DS.dsTeclas.Locate('ptc_key', Key, [loCaseInsensitive]) then
    begin
      if FrmPDV_DModule_DS.dsTeclas.FieldByName('func_codigo').AsInteger > 0 then
        doExecFunction(FrmPDV_DModule_DS.dsTeclas.FieldByName('func_codigo').AsString);

      if FrmPDV_DModule_DS.dsTeclas.FieldByName('pr_codigo').AsInteger > 0 then
      begin
        goBuffer := FrmPDV_DModule_DS.dsTeclas.FieldByName('pr_codigo').AsString;
        doSetProduto;
      end;
      if (FrmPDV_DModule_DS.dsTeclas.FieldByName('ptc_ascii').AsInteger > 0) then
        Key := FrmPDV_DModule_DS.dsTeclas.FieldByName('ptc_ascii').AsInteger;
      exit;
    end;

  case Key of
    VK_F1:
      begin
        try
          FrmPDV_Funcoes := TFrmPDV_Funcoes.Create(self);
          FrmPDV_Funcoes.ShowModal;
          if FrmPDV_Funcoes.FFuncao <> '' then
            doExecFunction(FrmPDV_Funcoes.FFuncao);

        finally
          FrmPDV_Funcoes.Destroy;
          FrmPDV_Funcoes := nil;
        end;
      end;
  end;
  loResult := 0;
  if cxPageControl1.ActivePageIndex > 0 then
  begin
    case Key of
      VK_ESCAPE:
        begin
          if cxPageControl1.ActivePageIndex in [4, 5, 6] then
          begin
            goListResendMode               := false;
            goListCancelMode               := false;
            goListReprintMode              := false;
            cxPageControl1.ActivePageIndex := 0;
          end;
          if edValorForma.Focused then
            cxPageControl1.ActivePageIndex := 0;
        end;
      VK_RETURN:
        begin
          if edValorForma.Focused then
          begin
            doConfirmaPagamento;
            Key := 0;
            exit;
          end;
          Perform(WM_NEXTDLGCTL, 1, 1);
        end;
      VK_F2:
        begin
          if cxPageControl1.ActivePageIndex = 5 then
          begin
            doPrintResumoCaixa;
          end;
          if cxPageControl1.ActivePageIndex = 1 then
          begin

            if not doNFFechamento then
              exit;
            doNFSituacaoFechamento;
            // fimportacao.cxButton2.Click; //
          end;

          // pagina de cancelamento de nota
          if cxPageControl1.ActivePageIndex = 4 then
          begin
            // Erimar data maior 30 minuto
            if FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_id').AsInteger = 0 then
              exit;

            { Modo reimpress�o de wendas }
            if goListReprintMode then
            begin
              if (not goTerminal.pterm_nfce) and (not goTerminal.pterm_nfce_offline) and (not goTerminal.pterm_sat) then
              begin
                with FrmPDV_DModule_DS do
                begin
                  dsVendas.close;
                  dsVendas.ParamByName('pnf_id').AsInteger := fdNotas.FieldByName('pnf_id').AsInteger;
                  dsVendas.active                          := true;
                  dsVendasItens.close;
                  dsVendasItens.active := true;
                  dsVendasPags.close;
                  dsVendasPags.active := true;
                  doPrintVenda;

                end;
              end;
              if goTerminal.pterm_nfce or goTerminal.pterm_nfce_offline then
              begin
                if not Assigned(FrmPDV_NFCe) then
                  FrmPDV_NFCe                        := TFrmPDV_NFCe.Create(self);
                FrmPDV_NFCe.ACBrNFe.DANFE.Impressora := goTerminal.Impressora.pimp_impressora;
                FrmPDV_NFCe.ACBrNFe.NotasFiscais.Clear;
                FrmPDV_NFCe.goContigencia := false;
                FrmPDV_NFCe.doSetConfigNFCe;
                FrmPDV_NFCe.ACBrNFe.NotasFiscais.LoadFromString(FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_xml')
                  .AsString);
                doPrintNFCe;
                doPrintTEF(FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_id').AsInteger);

              end;
              if goTerminal.pterm_sat then
              begin
                doSATLoad;
                loFileStr := TStringList.Create;
                try
                  loFileStr.Add(FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_xml').AsString);
                  loFileStr.SaveToFile(Application.ExeName + 'tempreprintsat.xml');
                  FrmPDV_SAT.ACBrSAT1.CFe.Clear;
                  FrmPDV_SAT.ACBrSAT1.CFe.LoadFromFile(Application.ExeName + 'tempreprintsat.xml');
                  FrmPDV_SAT.ACBrSAT1.ImprimirExtrato;
                  DeleteFile(Application.ExeName + 'tempreprintsat.xml');

                finally
                  loFileStr.Destroy;
                  FrmPDV_SAT.ACBrSAT1.CFe.Clear;
                end;
              end;

            end
            else if goListCancelMode then { Modo cancelamento de vendas }
            begin
              // valida se a nota ja passou de 30min de emiss�o.
              if FrmPDV_DModule_DS.fdNotas.FieldByName('tempo').value > 30 then
              begin
                SHOWMESSAGE('Nota com mais de 30 minutos. N�o � possivel cancelar');
                exit;
              end;

              if not(FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_status').AsInteger in [2, 3, 4]) then
                exit;
              FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
              try
                FrmPDV_Autorizacao.lblTitle.Caption := 'Cancelamento da venda';
                FrmPDV_Autorizacao.goParamId        := 287;
                if FrmPDV_Autorizacao.ShowModal <> mrOK then
                  exit;
              finally
                Setfocus;
                FrmPDV_Autorizacao.Destroy;
                FrmPDV_Autorizacao := nil;
              end;

              try
                if goTerminal.pterm_nfce then
                begin

                  if not Assigned(FrmPDV_NFCe) then
                    FrmPDV_NFCe             := TFrmPDV_NFCe.Create(self);
                  FrmPDV_NFCe.goOffline     := goTerminal.pterm_nfce_offline;
                  FrmPDV_NFCe.goPnf_id      := FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_id').AsInteger;
                  FrmPDV_NFCe.goXMLToCancel := FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_xml').AsString;
                  FrmPDV_NFCe.goPathNFe     := ExtractFilePath(Application.ExeName);
                  FrmPDV_NFCe.goImpressora  := goTerminal.Impressora.pimp_port;
                  FrmPDV_NFCe.goTerminal    := goTerminal.pterm_id;
                  FrmPDV_NFCe.goCancelMode  := true;
                  FrmPDV_NFCe.goContigencia := false;
                  if FrmPDV_NFCe.ShowModal = mrOK then
                  begin
                    doCancelaVenda;
                    StoreXMLCancel(loCancelCFe.XMLString, FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_id').AsInteger);
                    // with FDQuery1 do
                    // begin
                    // close;
                    // sql.Clear;
                    // sql.Add('select pr_codigo,pnfi_qtd,pnf_nnotamodulo from pdv.tb_nota_fiscal_itens i ' +
                    // ' JOIN pdv.tb_nota_fiscal C ON C.pnf_id=I.pnf_id ' + ' WHERE pnfi_cancelado=0 AND ' + 'i.pnf_id=' +
                    // FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_id').AsString);
                    // open;
                    // end;
                    { while not FDQuery1.Eof do // erimar feijo 10/07/24
                      begin
                      with A2 do
                      begin
                      close;
                      sql.Clear;
                      sql.Add('EXEC P_AlterarEstoqueF  :vo, :v1, :v2, :v3, :v4, :v5, :v6 ');
                      Parameters[0].value := FDQuery1.FieldByName('pnf_nnotamodulo').AsString;
                      Parameters[1].value := FDQuery1.FieldByName('pr_codigo').AsString;
                      Parameters[2].value := FDQuery1.FieldByName('pnfi_qtd').value;
                      Parameters[3].value := 3;
                      Parameters[4].value := 0;
                      Parameters[5].value := 1;
                      Parameters[6].value := 0;
                      execsql;
                      end;
                      FDQuery1.Next;
                      end; }
                  end;
                end
                else if goTerminal.pterm_sat then
                begin
                  if FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_status').AsInteger <> 6 then
                  begin
                    if not Assigned(FrmPDV_SAT) then
                      FrmPDV_SAT := TFrmPDV_SAT.Create(self);

                    loCancelCFe := FrmPDV_SAT.doSATCancelCFe(FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_xml').AsString);
                    StoreXMLCancel(loCancelCFe.XMLString, FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_id').AsInteger);

                  end;

                end
                else
                begin
                  with FrmPDV_DModule_DS do
                  begin
                    dsVendas.close;
                    dsVendas.ParamByName('pnf_id').AsInteger := fdNotas.FieldByName('pnf_id').AsInteger;
                    dsVendas.active                          := true;
                    dsVendasItens.close;
                    dsVendasItens.active := true;
                    dsVendasPags.close;
                    dsVendasPags.active := true;
                    doCancelaVenda;
                    dsVendas.refresh;
                    doPrintVenda;
                  end;
                end;
              finally
                FrmPDV_DModule_DS.fdNotas.refresh;
              end;
            end
            else if goListResendMode then { Modo reenvio de vendas }
            begin
              // if not(FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_status').AsInteger = 2) then
              // exit;
              if not(FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_offline').AsBoolean) then
                exit;

              try
                if goTerminal.pterm_nfce then
                begin
                  FrmPDV_DModule_DS.fdNotas.first;
                  while not FrmPDV_DModule_DS.fdNotas.Eof do
                  begin
                    if not Assigned(FrmPDV_NFCe) then
                      FrmPDV_NFCe             := TFrmPDV_NFCe.Create(self);
                    FrmPDV_NFCe.goOffline     := false;
                    FrmPDV_NFCe.goPnf_id      := FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_id').AsInteger;
                    FrmPDV_NFCe.goXMLToCancel := FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_xml').AsString;
                    FrmPDV_NFCe.goPathNFe     := ExtractFilePath(Application.ExeName);
                    FrmPDV_NFCe.goImpressora  := goTerminal.Impressora.pimp_impressora;
                    FrmPDV_NFCe.goTerminal    := goTerminal.pterm_id;
                    FrmPDV_NFCe.goContigencia := true;
                    FrmPDV_NFCe.goCancelMode  := false;
                    FrmPDV_NFCe.ShowModal;
                    // updateEstoqueFical(goPnf_id, QuotedStr(loSendCFe.ChaveAcesso), loSendCFe.Sessao, goTerminal.pterm_nfce_offline);
                    FrmPDV_DModule_DS.fdNotas.Next;
                  end;
                end
                else if goTerminal.pterm_sat then
                begin
                  { TODO : Implementar reenvio de SAT, se de fato houver }
                end;
              finally
                FrmPDV_DModule_DS.fdNotas.refresh;
              end;
            end;
          end;

          existNotasContigencia;
          Key := 0;
        end;
      VK_DELETE, VK_MULTIPLY:
        begin
          try
            if cxPageControl1.ActivePageIndex = 1 then
            begin
              edValorForma.value := 0;
              if not lstListFormas.Focused then
              begin
                lstListFormas.Setfocus;
                if lstListFormas.Items.Count > 0 then
                begin
                  lstListFormas.Items.Item[0].Focused  := true;
                  lstListFormas.Items.Item[0].Selected := true;
                end;
              end
              else
              begin
                if lstListFormas.ItemFocused = nil then
                  exit;
                if MessageBox(handle, 'Confirmar exclus�o do pagamento ?', 'I9 PDV',
                  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
                begin
                  edValorForma.Setfocus;
                  exit;
                end;

                loPnfp_id := TListItemPag(lstListFormas.ItemFocused.Data).Pnfp_id;
                with FrmPDV_DModule do
                begin
                  adStoreProc1.Connection     := ADConnection1;
                  adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
                  adStoreProc1.StoredProcName := 'proc_del_pag_nf';
                  adStoreProc1.SchemaName     := 'pdv';
                  adStoreProc1.Prepare;
                  adStoreProc1.Params.ParamByName('@pterm_id').AsString := goPterm_id;
                  adStoreProc1.Params.ParamByName('@pnfp_id').AsInteger := loPnfp_id;
                  adStoreProc1.execProc;

                  if adStoreProc1.FindParam('@max') <> nil then
                    loResult := adStoreProc1.ParamByName('@max').AsInteger;
                  if loResult > 0 then
                  begin
                    if loPnfp_id = goTEFPnfp_idPendente then
                      DesfazerTransacaoTEF;
                    lstListFormas.ItemFocused.Delete;
                  end;
                  edValorForma.Setfocus;

                  loNF := goPDVClass.GetTotaisNF(goPnf_id);
                  try
                    doSetTotaisNF(loNF);
                    doSetTotaisNFEncerra(loNF);
                  finally
                    if Assigned(loNF) then
                      loNF.Destroy;
                  end;
                end;
              end;
            end;
          finally
            if lstListFormas.Items.Count > 0 then
            begin
              lstListFormas.Items.Item[0].Focused  := true;
              lstListFormas.Items.Item[0].Selected := true;
            end;
            Setfocus;
          end;
          Key := 0;
        end;
    end;
  end;
  if cxPageControl1.ActivePageIndex = 0 then
  begin
    case Key of
      VK_ESCAPE:
        begin
          if goCancelItemMode then
            doSetModoCancelaItem(true);
          if goQueryPriceMode then
            doSetModoConsultaPreco(true);
          Key := 0;
        end;
      VK_F2:
        doExecFunction('206');
      VK_F3:
        doExecFunction('210');
      VK_F4:
        doExecFunction('205');
      VK_F5:
        doExecFunction('202');
      VK_F6:
        doExecFunction('201');
    end;
  end;
end;

function TFrmPDV.DesCriptografar(V_Valor: String; V_Retorna: Word): String;
const
  Criptografado1 = '�������������z������/����x�Zf`rec^bnhg#|�����~����w\vdsqpomlk���������y{]_tauij����[}��������';
  Criptografado2 = '�������������y������.����w�Ye_qdb]amgf"{����}����v[ucrponlkj���������xz\^s`thi����Z|~��������';
var
  x, i                                  : Integer;
  str, Criptografado, Retornar, OutValue: String;
begin
  Retornar := ':1234567890-=]"!@#$%�&*()_+}qwertyuiop�[QWERTYUIOP`{asdfghjkl�A�SDFGHJKL�^\zxcvbnm,.;/|ZXCVBNM<>:';
  if V_Retorna = 4568 then
  begin
    for x := 1 to Length(V_Valor) do
      if POS(V_Valor[x], Criptografado1) <> 0 then
        V_Valor[x] := Retornar[POS(V_Valor[x], Criptografado1)];
    result         := V_Valor;
  end;
  if V_Retorna = 4567 then
  begin
    for x := 1 to Length(V_Valor) do
      if POS(V_Valor[x], Criptografado2) <> 0 then
        V_Valor[x] := Retornar[POS(V_Valor[x], Criptografado2)];
    result         := StringReplace(V_Valor, '>', ':', [rfReplaceAll, rfIgnoreCase]);
  end;
END;

function TFrmPDV.Campo_Configuracao(Campo: stRing): string;
var
  Vre: string;
begin
  with a1 do
  begin
    close;
    sql.Clear;
    sql.Add('Select * from configuracao where UPPER(controle) = :v0');
    Parameters[0].value := ANSIUPPERCASE(Campo);
    open;
  end;
  if a1.RecordCount = 0 then
    Vre := ''
  else
    Vre  := DesCriptografar(a1.FieldByName('Valor').AsString, 4568);
  result := Vre;
end;

procedure TFrmPDV.FormKeyPress(Sender: TObject; var Key: Char);
var
  loPeso: Double;
begin

  if FrmPDV_DModule_DS.dsTeclas.active and (not(CharInSet(Key, [chr(13), chr(37), chr(38), chr(39), chr(40)]))) then
    if FrmPDV_DModule_DS.dsTeclas.Locate('ptc_key', chr(ord(Key)), [loCaseInsensitive]) then
    begin
      if FrmPDV_DModule_DS.dsTeclas.FieldByName('ptc_ascii').AsInteger > 0 then
      begin
        Key := chr(FrmPDV_DModule_DS.dsTeclas.FieldByName('ptc_ascii').AsInteger);
        PostMessage(handle, WM_KEYDOWN, FrmPDV_DModule_DS.dsTeclas.FieldByName('ptc_ascii').AsInteger, 0);
        exit;
      end;
    end;

  if not(cxPageControl1.ActivePageIndex in [0, 3]) then
    exit;

  if FrmPDV_DModule_DS.dsTeclas.active and (not(Key in [chr(13), chr(37), chr(38), chr(39), chr(40)])) then
    if FrmPDV_DModule_DS.dsTeclas.Locate('ptc_key', chr(ord(Key)), [loCaseInsensitive]) then
    begin
      if FrmPDV_DModule_DS.dsTeclas.FieldByName('func_codigo').AsInteger > 0 then
        doExecFunction(FrmPDV_DModule_DS.dsTeclas.FieldByName('func_codigo').AsString);

      if FrmPDV_DModule_DS.dsTeclas.FieldByName('pr_codigo').AsInteger > 0 then
      begin
        goBuffer := FrmPDV_DModule_DS.dsTeclas.FieldByName('pr_codigo').AsString;
        doSetProduto;
      end;
      exit;
    end;

  if Key = #13 then
  begin
    if AnsiPos(',', goBuffer) = 0 then
      doExecCommand;
    Key := #0;
  end;
  // VK_NUMPAD0 .. VK_NUMPAD9, VK_DECIMAL, VK_DIVIDE:
  if CharInSet(Key, ['0' .. '9', '.', ',', '/']) then
  begin
    if goInserted then
      doClearItem;
    // VK_DECIMAL
    if (Key = '.') then
    begin
      if (goBuffer <> '') then
        if AnsiPos(',', goBuffer) = 0 then
        begin
          goBuffer          := goBuffer + ',';
          lblCodigo.Caption := goBuffer;
        end;
      exit;
    end;
    if (Key = ',') then
    begin
      if (goBuffer <> '') then
        if AnsiPos(',', goBuffer) = 0 then
        begin
          goBuffer          := goBuffer + Key;
          lblCodigo.Caption := goBuffer;
        end;
      exit;
    end;
    // VK_DIVIDE
    if Key = '/' then
    begin
      if goBuffer <> '' then
      begin
        goBuffer := goBuffer + '/';
        doExecCommand;
        goBuffer := '';
      end;
      exit;
    end;
    goBuffer          := goBuffer + Key;
    lblCodigo.Caption := goBuffer;
    Key               := #0;
  end;
  if Key = '*' then
  begin
    if goBuffer <> '' then
    begin
      goQtdProdBuffer      := StrToFloatDef(goBuffer, 1);
      lblQuantProd.Caption := FormatCurr('#,###0.000', goQtdProdBuffer);
    end
    else
    begin
      if doGetPesoBalanca(loPeso) then
      begin
        goQtdProdBuffer      := loPeso;
        lblQuantProd.Caption := FormatCurr('#,###0.000', loPeso);
      end
    end;
    lblCodigo.Caption      := '0';
    lblUnidadeProd.Caption := '';
    lblVrUnitProd.Caption  := FormatCurr('#,##0.00', 0);
    lblVrTotalProd.Caption := FormatCurr('#,##0.00', 0);
    goBuffer               := '';
    Key                    := #0;
  end;
  if Key = #8 then
  begin
    goBuffer          := Copy(goBuffer, 1, Length(goBuffer) - 1);
    lblCodigo.Caption := goBuffer;
    Key               := #0;
  end;
end;

procedure TFrmPDV.FormShow(Sender: TObject);
begin
  BringToFront;
  Timer1.Enabled    := true;
  TimerShow.Enabled := true;
  Label2.Color      := CordoMes.Color;
  // Label6.Color               := CordoMes.Color;
  // lblServidor.Color          := CordoMes.Color;
  edValorForma.Style.Color := CordoMes.Color;
  // Shape12.Brush.Color        := CordoMes.Color;
  Shape16.Brush.Color        := CordoMes.Color;
  Shape17.Brush.Color        := CordoMes.Color;
  Shape18.Brush.Color        := CordoMes.Color;
  Shape19.Brush.Color        := CordoMes.Color;
  Shape13.Brush.Color        := CordoMes.Color;
  Shape18.Brush.Color        := CordoMes.Color;
  shpValorAPagar.Brush.Color := CordoMes.Color;
  Shape10.Brush.Color        := CordoMes.Color;
  shp1.Brush.Color           := CordoMes.Color;
  shp2.Brush.Color           := CordoMes.Color;
  shp3.Brush.Color           := CordoMes.Color;
  Shape7.Brush.Color         := CordoMes.Color;
  Shape3.Brush.Color         := CordoMes.Color;
  Shape9.Brush.Color         := CordoMes.Color;
  shp8.Brush.Color           := CordoMes.Color;
  shp6.Brush.Color           := CordoMes.Color;
  shp7.Brush.Color           := CordoMes.Color;

  if not FileExists(ExtractFilePath(Application.ExeName) + 'I9PDVERP.EMS') THEN
  begin
    SHOWMESSAGE('Arquivo do SERVIDOR nao encontrado nao podera iniciar o servico I9PDVERP.EMS');
    close;
  end;
  Memo1.Clear;
  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'I9PDVERP.EMS');
  ADOConnection1.Connected        := false;
  ADOConnection1.ConnectionString := Trim(Memo1.Text);
  dtDataVenda.date                := date;
  vExpira                         := Campo_Configuracao('ExpiraEm');
  //
  with a1 do
  begin
    close;
    sql.Clear;
    sql.Add('select top 1 datahora,getdate() as dDia from cpis order by datahora desc');
    open;
  end;
  // if STRTODATE(vExpira) - STRTODATE(Copy(a1.FieldByName('ddia').AsString, 1, 10)) < 0 then
  // begin
  // MessageDlg('Sua Licensa expirou em ' + FrmPDV.Campo_Configuracao('Expiraem') + #13 + 'Contacte o Fabricante.',
  // mtWarning, [mbOK], 0);
  // Application.Terminate;
  // end;
  // Label1.Caption := 'I9 PDV - I9 Mobile - Suporte T�cnico: ' + '(85) 3044.4747 9.9857-9857  9.9854-9854 Dt Expira ' +
  // FrmPDV.Campo_Configuracao('Expiraem');

  with a1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from CONFIGURACAO where CONTROLE=' + QuotedStr('EmitirSEstoque'));
    open;
  end;

  // AJUSTADO ja
  // showmessage(DesCriptografar(a1.FieldByName('valor').AsString, 4568)+' confira');
  vcestoque := 'S';
  if DesCriptografar(a1.FieldByName('valor').AsString, 4568) = 'N' then
    vcestoque := 'N';

end;

function DesCriptografar(V_Valor: String; V_Retorna: Word): String;
const
  Criptografado1 = '�������������z������/����x�Zf`rec^bnhg#|�����~����w\vdsqpomlk���������y{]_tauij����[}��������';
  Criptografado2 = '�������������y������.����w�Ye_qdb]amgf"{����}����v[ucrponlkj���������xz\^s`thi����Z|~��������';
var
  x, i                                  : Integer;
  str, Criptografado, Retornar, OutValue: String;
begin
  Retornar := ':1234567890-=]"!@#$%�&*()_+}qwertyuiop�[QWERTYUIOP`{asdfghjkl�A�SDFGHJKL�^\zxcvbnm,.;/|ZXCVBNM<>:';
  if V_Retorna = 4568 then
  begin
    // showmessage('entrou 1');
    // Criptografado := '������������z������/����x�Zf`rec^bnhg#|�����~����w\vdsqpomlk���������y{]_tauij����[}�������';
    for x := 1 to Length(V_Valor) do
      if POS(V_Valor[x], Criptografado1) <> 0 then
        V_Valor[x] := Retornar[POS(V_Valor[x], Criptografado1)];
    result         := V_Valor; // StringReplace(V_Valor,'�',' ',[rfReplaceAll, rfIgnoreCase]);
  end;
  if V_Retorna = 4567 then
  begin
    // showmessage('entrou 2 ');
    // Criptografado := '������������y������.����w�Ye_qdb]amgf"{����}����v[ucrponlkj���������xz\^s`thi����Z|~��������';
    for x := 1 to Length(V_Valor) do
      if POS(V_Valor[x], Criptografado2) <> 0 then
        V_Valor[x] := Retornar[POS(V_Valor[x], Criptografado2)];
    // Result := V_Valor; // StringReplace(V_Valor,'�',' ',[rfReplaceAll, rfIgnoreCase]);
    result := StringReplace(V_Valor, '>', ':', [rfReplaceAll, rfIgnoreCase]);
  end;
END;

procedure TFrmPDV.Timer1Timer(Sender: TObject);
begin
  Timer1.Interval := 60000;
  fdDataHoraServer.close;
  fdDataHoraServer.active := true;
  ServerDateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy/ hh:nn:ss', fdDataHoraServer.FieldByName('ServerDate')
    .AsDateTime));
  ServerDate := StrToDateTime(FormatDateTime('dd/mm/yyyy', fdDataHoraServer.FieldByName('ServerDate').AsDateTime));
  ServerTime := StrToDateTime(FormatDateTime('hh:mm:ss', fdDataHoraServer.FieldByName('ServerDate').AsDateTime));
  lblDataHora.Caption := FormatDateTime('dd/mm/yyyy hh:nn', ServerDateTime);
  if Timer1.Interval = 60000 then
  begin
    if Assigned(goTerminal) then
      goTerminal.Destroy;
    goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
    // if goTerminal <> nil then
    // begin
    // if lblLastSync.Caption <> goTerminal.pterm_last_sync_str then
    // lblLastSync.font.Color := clBlue;
    doSetTerminal;
    // end;

    existNotasContigencia;
  end;
  Timer1.Interval := 60000;
end;

procedure TFrmPDV.ValidaPos;
begin
  // if = then

end;

procedure TFrmPDV.existNotasContigencia;
var
  sqlContigencia: string;
begin
  sqlContigencia :=
    'SELECT * FROM V_PDV_NOTASEMITIDAS WHERE em_codigo = :em_codigo AND  (isnull(pnf_offline,0) = 1 or pnf_status =2) and pnf_data_emissao = :data_emissao ORDER BY pnf_id DESC;';
  FrmPDV_DModule_DS.fdqryAvisos.close;
  FrmPDV_DModule_DS.fdqryAvisos.sql.Text                           := sqlContigencia;
  FrmPDV_DModule_DS.fdqryAvisos.ParamByName('em_codigo').AsInteger := ServerEmpresa;
  FrmPDV_DModule_DS.fdqryAvisos.ParamByName('data_emissao').AsDate := Trunc(dtDataVenda.date);
  FrmPDV_DModule_DS.fdqryAvisos.open;
  if FrmPDV_DModule_DS.fdqryAvisos.RecordCount > 0 then
  begin
    lblLastSync.Caption    := 'Existem notas em contig�ncia';
    lblLastSync.font.Color := clRed;
  end
  else
  begin
    lblLastSync.Caption    := 'Sem avisos';
    lblLastSync.font.Color := clBlue;
  end;
end;

procedure TFrmPDV.TimerShowTimer(Sender: TObject);
var
  loNF: TNF;
begin
  TimerShow.Enabled := false;
  if Assigned(goTerminal) then
    goTerminal.Destroy;
  goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
  if goTerminal = nil then
  begin
    try
      FrmConfig_Terminais := TFrmConfig_Terminais.Create(self);
      if FrmConfig_Terminais.ShowModal = mrOK then
      begin
        if Assigned(goTerminal) then
          goTerminal.Destroy;
        goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
      end;
    finally
      FrmConfig_Terminais.Destroy;
      FrmConfig_Terminais := nil;
    end;
  end;
  if goTerminal = nil then
  begin
    MessageBox(handle, 'Este terminal n�o est� autorizado para utiliza��o do PDV', 'I9 PDV', MB_ICONEXCLAMATION);
    close;
    exit;
  end;
  doSetTerminal;
  if not doGetCaixa then
  begin
    if doExecFunction('101') then
      if not doGetCaixaOperador then
        doExecFunction('103');
  end
  else if not doGetCaixaOperador then
    doExecFunction('103');
  try
    doSATLoad;
    doSetMsgEstado;
    doStartBalanca;
    { Verficando o TEF }
    doTEFLoad;
  finally
    { Consulta se h� nota fiscal em andamento }
    loNF := goPDVClass.GetNF(goPterm_id, 0);
    try
      if loNF <> nil then
      begin
        goPnf_id := loNF.IDNF;

        doAddItensList(loNF.NFItens);
        doAddFormasList(loNF.NFPags);
        doSetTotaisNF(loNF);
      end;
    finally
      doSetMsgEstado;
      if Assigned(loNF) then
        loNF.Destroy;
    end;
  end;
end;

function TFrmPDV.ValidaMenu(Acode: string): Boolean;
begin
  with FrmPDV_DModule.fdcgeral do
  begin
    close;
    sql.Clear;
    sql.Add('select * from pdv.tb_funcoes where func_ativo = 1 and func_codigo = ' + Acode);
    open;
  end;

  result := FrmPDV_DModule.fdcgeral.RecordCount > 0;

end;

{ M�todos b�sicos }

function TFrmPDV.doExecFunction(Acode: String): Boolean;
var
  loNF                : TNF;
  loCode              : Integer;
  code                : String;
  loResult            : Integer;
  ListaModerna        : TStrings;
  FrmPDV_TEF_Operacoes: TFrmPDV_TEF_Operacoes;
begin

  result := true; // descomentado
  loCode := StrToIntDef(uGlobalLibPDV.OnlyNumbers(Acode), 0);

  case loCode of
    100:
      begin
        if MessageBox(handle, 'Deseja sa�r do sistema ?', 'I9 PDV', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO
        then
          exit;

        close;
      end;
    101:
      begin
        if goPcx_id > 0 then
        begin
          MessageBox(handle, 'Caixa j� aberto', 'I9 PDV', MB_ICONEXCLAMATION);
          result := false;
          exit;
        end;
        FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
        try
          FrmPDV_Autorizacao.lblTitle.Caption := 'Abertura de caixa geral';
          FrmPDV_Autorizacao.goParamId        := 288;
          if FrmPDV_Autorizacao.ShowModal = mrOK then
          begin
            if doAbreFechaCaixaGeral(StrToIntDef(FrmPDV_Autorizacao.edUsuario.Text, 0), false) then
              exit;
          end;
        finally
          FrmPDV_Autorizacao.Destroy;
          FrmPDV_Autorizacao := nil;
        end;
        exit;
      end;
    102: { Encerramento geral do caixa }
      begin
        if goPcx_id = 0 then
        begin
          MessageBox(handle, 'Caixa fechado', 'I9 PDV', MB_ICONEXCLAMATION);
          result := false;
          exit;
        end;
        if goPcxo_id > 0 then
        begin
          // Encerra caixa do operador
          if not doExecFunction('104') then
            exit;
        end;

        FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
        try
          FrmPDV_Autorizacao.lblTitle.Caption := 'Encerramento de caixa geral';
          FrmPDV_Autorizacao.goParamId        := 289;
          if FrmPDV_Autorizacao.ShowModal = mrOK then
            if doAbreFechaCaixaGeral(StrToIntDef(FrmPDV_Autorizacao.edUsuario.Text, 0), true) then
              exit;
        finally
          FrmPDV_Autorizacao.Destroy;
          FrmPDV_Autorizacao := nil;
        end;
        exit;
      end;
    103: { Abertura caixa do operador }
      begin
        if goPcxo_id > 0 then
        begin
          MessageBox(handle, 'Caixa do operador j� aberto', 'I9 PDV', MB_ICONEXCLAMATION);
          result := false;
          exit;
        end;
        FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
        try
          FrmPDV_Autorizacao.lblTitle.Caption := 'Abertura de caixa operador';
          FrmPDV_Autorizacao.goParamId        := 290;
          if FrmPDV_Autorizacao.ShowModal = mrOK then
          begin
            FrmOperacao_AbreCaixaOperador := TFrmOperacao_AbreCaixaOperador.Create(self);
            try
              if FrmOperacao_AbreCaixaOperador.ShowModal = mrOK then
                doAbreFechaCaixaOperador(StrToIntDef(FrmOperacao_AbreCaixaOperador.edOperador.Text, 0), false, true);
            finally
              FrmOperacao_AbreCaixaOperador.Destroy;
              FrmOperacao_AbreCaixaOperador := nil;
            end;
          end;
        finally
          FrmPDV_Autorizacao.Destroy;
          FrmPDV_Autorizacao := nil;
        end;
        exit;
      end;
    104: { Encerra caixa do operador }
      begin
        if goPcx_id = 0 then
        begin
          MessageBox(handle, 'Caixa fechado', 'I9 PDV', MB_ICONEXCLAMATION);
          result := false;
          exit;
        end;
        if goPcxo_id = 0 then
        begin
          MessageBox(handle, 'Caixa do operador fechado', 'I9 PDV', MB_ICONEXCLAMATION);
          result := false;
          exit;
        end;
        if goPnf_id > 0 then
        begin
          MessageBox(handle, 'Venda em andamento', 'I9 PDV', MB_ICONEXCLAMATION);
          result := false;
          exit;
        end;
        FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
        try
          FrmPDV_Autorizacao.lblTitle.Caption := 'Encerramento de caixa operador';
          FrmPDV_Autorizacao.goParamId        := 291;
          if FrmPDV_Autorizacao.ShowModal = mrOK then
          begin
            FrmOperacao_EncerraCaixaOperador := TFrmOperacao_EncerraCaixaOperador.Create(self);
            try
              FrmOperacao_EncerraCaixaOperador.goPcxo_id := goPcxo_id;
              if FrmOperacao_EncerraCaixaOperador.ShowModal = mrOK then
                if doAbreFechaCaixaOperador(StrToIntDef(FrmOperacao_EncerraCaixaOperador.edSupervisor.Text, 0), true,
                  true) then
                begin
                  FrmPDV_DModule_DS.dsResumoCaixa.close;
                  // FrmPDV_DModule_DS.dsResumoCaixa.ParamByName('us_codigo').AsInteger := StrToIntDef(FrmPDV_DModule.User.UserId, 0);
                  FrmPDV_DModule_DS.dsResumoCaixa.active := true;
                  FrmPDV_DModule_DS.dsResumoVenda.close;
                  FrmPDV_DModule_DS.dsResumoVenda.active := true;
                  FrmPDV_DModule_DS.dsResumoFormasPag.close;
                  FrmPDV_DModule_DS.dsResumoFormasPag.active := true;
                  FrmPDV_DModule_DS.dsResumoCaixa.Filter     := 'pcxo_id = ' +
                    FrmOperacao_EncerraCaixaOperador.goPcxo_id.ToString;
                  FrmPDV_DModule_DS.dsResumoCaixa.Filtered := true;
                  doPrintResumoCaixa;
                  exit;
                end;
            finally
              FrmOperacao_EncerraCaixaOperador.Destroy;
              FrmOperacao_EncerraCaixaOperador := nil;
            end;
          end;
        finally
          FrmPDV_Autorizacao.Destroy;
          FrmPDV_Autorizacao := nil;
        end;
        exit;
      end;
    106:
      begin
        try
          FrmConfig_Terminais := TFrmConfig_Terminais.Create(self);
          if FrmConfig_Terminais.ShowModal = mrOK then
          begin
            if Assigned(goTerminal) then
              goTerminal.Destroy;
            goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
          end;
          exit;
        finally
          FrmConfig_Terminais.Destroy;
          FrmConfig_Terminais := nil;
        end;
      end;
    107:
      begin
        try
          FrmConfig_Impressoras := TFrmConfig_Impressoras.Create(self);
          if FrmConfig_Impressoras.ShowModal = mrOK then
          begin
            if Assigned(goTerminal) then
              goTerminal.Destroy;
            goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
            doSATLoad;
          end;
          exit;
        finally
          FrmConfig_Impressoras.Destroy;
          FrmConfig_Impressoras := nil;
        end;
      end;
    108:
      begin
        try
          FrmConfig_Adquirentes := TFrmConfig_Adquirentes.Create(self);
          if FrmConfig_Adquirentes.ShowModal = mrOK then
          begin
            if Assigned(goTerminal) then
              goTerminal.Destroy;
            goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
            doSATLoad;
          end;
          exit;
        finally
          FrmConfig_Adquirentes.Destroy;
          FrmConfig_Adquirentes := nil;
        end;
      end;
    109:
      begin
        try
          FrmConfig_POS := TFrmConfig_POS.Create(self);
          if FrmConfig_POS.ShowModal = mrOK then
          begin
            if Assigned(goTerminal) then
              goTerminal.Destroy;
            goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
            doSATLoad;
          end;
          exit;
        finally
          FrmConfig_POS.Destroy;
          FrmConfig_POS := nil;
        end;
      end;
    // 110:
    // begin
    // doSATSendAllPays;
    // exit;
    // end;
    111:
      begin
        try
          FrmConfig_Balanca := TFrmConfig_Balanca.Create(self);
          FrmConfig_Balanca.ShowModal;
          doStartBalanca;
          exit;
        finally
          FrmConfig_Balanca.Destroy;
          FrmConfig_Balanca := nil;
        end;
      end;
    112:
      begin
        try
          FrmPDV_Bloqueio                     := TFrmPDV_Bloqueio.Create(self);
          FrmPDV_Bloqueio.edUsuario.EditValue := goCaixaOperador.us_codigo;
          FrmPDV_Bloqueio.goTipoUser          := [tuOperador, tuSupervisor];
          FrmPDV_Bloqueio.ShowModal;
          exit;
        finally
          FrmPDV_Bloqueio.Destroy;
          FrmPDV_Bloqueio := nil;
        end;
      end;
    113:
      begin
        try
          FrmConfig_NFCe := TFrmConfig_NFCe.Create(self);
          FrmConfig_NFCe.ShowModal;
          if Assigned(FrmPDV_NFCe) then
          begin
            FrmPDV_NFCe.Destroy;
            FrmPDV_NFCe := nil;
          end;

        finally
          FrmConfig_NFCe.Destroy;
          FrmConfig_NFCe := nil;
        end;
      end;
    114:
      begin
        // abri gaveta
      end;

    115:
      begin
        FrmPDV_Sync := TFrmPDV_Sync.Create(self);
        try
          FrmPDV_Sync.goPterm_id := goPterm_id;
          FrmPDV_Sync.ShowModal;
        finally
          FrmPDV_Sync.Destroy;
          FrmPDV_Sync := nil;
        end;
      end;
    116:
      begin
        if goPcxo_id = 0 then
        begin
          MessageBox(handle, 'Caixa do operador fechado', 'I9 PDV', MB_ICONEXCLAMATION);
          result := false;
          exit;
        end;
        if goPnf_id > 0 then
        begin
          MessageBox(handle, 'Venda em andamento', 'I9 PDV', MB_ICONEXCLAMATION);
          result := false;
          exit;
        end;
        FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
        try
          FrmPDV_Autorizacao.lblTitle.Caption := 'Sangria';
          FrmPDV_Autorizacao.goParamId        := 295;
          if FrmPDV_Autorizacao.ShowModal = mrOK then
          begin
            FrmOperacao_Sangria                        := TFrmOperacao_Sangria.Create(self);
            FrmOperacao_Sangria.goPcxo_id              := goPcxo_id;
            FrmOperacao_Sangria.gous_codigo_supervisor := StrToIntDef(FrmPDV_Autorizacao.edUsuario.Text, 0);
            try
              if FrmOperacao_Sangria.ShowModal = mrOK then
              begin
                doPrintSangria(goPcxo_id, FrmOperacao_Sangria.goTransID, false);
                doPrintSangria(goPcxo_id, FrmOperacao_Sangria.goTransID, true);
              end;
            finally
              FrmOperacao_Sangria.Destroy;
              FrmOperacao_Sangria := nil;
            end;
          end;
        finally
          FrmPDV_Autorizacao.Destroy;
          FrmPDV_Autorizacao := nil;
        end;
        exit;
      end;
    117:
      begin
        // IniciarOperacao;
        // StatusVenda := stsOperacaoTEF;
        try
          ACBrTEFAPI1.EfetuarAdministrativa(tefopAdministrativo);
        finally
          // StatusVenda := stsFinalizada;
        end;
        exit;
      end;
    201: { Encerramento da nota }
      begin
        if goCancelItemMode then
          exit;
        if goCancelMode then
          exit;

        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda não iniciada', 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        cxPageControl1.ActivePageIndex := 1;
        exit;
      end;
    202: { cancelamento da nota }
      begin
        if goCancelItemMode then
          exit;
        if goCancelMode then
          exit;
        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda não iniciada', 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        doSetModoCancela;
        exit;
      end;
    203: { Cancelamento de vendas do dia }
      begin
        if goCancelItemMode then
          exit;
        if goCancelMode then
          exit;
        if goPnf_id > 0 then
        begin
          MessageBox(handle, 'Venda em andamento', 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        goListCancelMode            := true;
        lblCancelReprint.Caption    := 'Cancelamento de vendas';
        lblCancelReprintMsg.Caption :=
          'Pressione [F2] para confirmar o cancelamento da venda. Pressione [ESC] para voltar';
        cxPageControl1.ActivePageIndex := 4;
        exit;
      end;
    204: { Cancelamento do item por c�digo }
      begin
        if goCancelItemMode then
          exit;
        if goCancelMode then
          exit;

        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda n�o iniciada', 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        goTipoCancelaItem := tciPorCodigo;
        doSetModoCancelaItem;
        exit;
      end;
    205: { Cancelamento do item por sequencial }
      begin
        if goCancelItemMode then
          exit;
        if goCancelMode then
          exit;

        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda n�o iniciada', 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        goTipoCancelaItem := tciPorSeq;
        doSetModoCancelaItem;
        exit;
      end;
    206: { Consulta de pre�o }
      begin
        if goQueryPriceMode then
          exit;

        doSetModoConsultaPreco;
        exit;
      end;
    207: { Resumo do caixa }
      begin
        frmResumo.ShowModal;
        {
          FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
          try
          FrmPDV_Autorizacao.lblTitle.Caption := 'Impress�o do resumo de caixa';
          FrmPDV_Autorizacao.goTipoUser       := [tuOperador, tuSupervisor];
          FrmPDV_Autorizacao.goParamId        := 285;
          if FrmPDV_Autorizacao.ShowModal <> mrOK then
          exit;

          FrmPDV_DModule_DS.dsResumoCaixa.close;
          // FrmPDV_DModule_DS.dsResumoCaixa.ParamByName('us_codigo').AsInteger := StrToIntDef(FrmPDV_DModule.User.UserId, 0);
          FrmPDV_DModule_DS.dsResumoCaixa.active := true;
          FrmPDV_DModule_DS.dsResumoVenda.close;
          FrmPDV_DModule_DS.dsResumoVenda.active := true;
          FrmPDV_DModule_DS.dsResumoFormasPag.close;
          FrmPDV_DModule_DS.dsResumoFormasPag.active := true;
          cxPageControl1.ActivePageIndex             := 5;
          FrmPDV_DModule_DS.dsResumoCaixa.first;
          cxGridDBTableView3.ViewData.Expand(true);
          cxGrid4.Setfocus;
          finally
          Setfocus;
          FrmPDV_Autorizacao.Destroy;
          FrmPDV_Autorizacao := nil;
          end;
        }
      end;
    210:
      begin

        if not ValidaMenu(loCode.ToString) then
        begin
          SHOWMESSAGE('Consultas n�o permitida');
          exit;
        end
        else
        begin
          FrmPDV_PesqProds := TFrmPDV_PesqProds.Create(self);
          try
            if FrmPDV_PesqProds.ShowModal = mrOK then
            begin
              goBuffer := FrmPDV_PesqProds.fdProdutos.FieldByName('pr_codigo').AsString;
              doSetProduto;
              exit;
            end;
          finally
            FrmPDV_PesqProds.Destroy;
            FrmPDV_PesqProds := nil;
          end;
        end;
      end;
    211:
      begin
        FrmPDV_ImportaComanda := TFrmPDV_ImportaComanda.Create(self);
        try
          if goPnf_id = 0 then
            doNovaNF;
          if goPnf_id > 0 then
          begin
            FrmPDV_ImportaComanda.goPnf_id := goPnf_id;
            if FrmPDV_ImportaComanda.ShowModal = mrOK then
            begin
              { Consulta se h� nota fiscal em andamento }
              loNF := goPDVClass.GetNF(goPterm_id, 0);
              try
                if loNF <> nil then
                  doAddItensList(loNF.NFItens);
              finally
                if Assigned(loNF) then
                  loNF.Destroy;
              end;
              loNF := goPDVClass.GetTotaisNF(goPnf_id);
              try
                doSetTotaisNF(loNF);
                goBuffer        := '';
                goQtdProdBuffer := 0;
                goInserted      := true;
              finally
                if Assigned(loNF) then
                  loNF.Destroy;
              end;
            end;
          end;
        finally
          FrmPDV_ImportaComanda.Destroy;
          FrmPDV_ImportaComanda := nil;
        end;
        exit;
      end;
    212: { Reimpress�o da venda atual }
      begin
        if (goPnf_id <> goPnf_id_last) then
        begin
          if (not goTerminal.pterm_nfce) and (not goTerminal.pterm_nfce_offline) and (not goTerminal.pterm_sat) then
            doPrintVenda;
          if goTerminal.pterm_nfce or goTerminal.pterm_nfce_offline then
          begin
            doPrintNFCe;
            doPrintTEF(FrmPDV_NFCe.ACBrNFe.NotasFiscais.Items[0].NFe.Ide.cnf);
          end;
        end;
      end;
    213: { Reimpress�o de vendas do dia }
      begin
        if not goCancelItemMode then
          if not goCancelMode then
            if goPnf_id > 0 then
            begin
              MessageBox(handle, 'Venda em andamento', 'I9 PDV', MB_ICONEXCLAMATION);
            end
            else
            begin
              goListReprintMode           := true;
              lblCancelReprint.Caption    := 'Reimpress�o de vendas';
              lblCancelReprintMsg.Caption :=
                'Pressione [F2] para reimprimir a venda selecionada acima. Pressione [ESC] para voltar';
              cxPageControl1.ActivePageIndex := 4;
            end;
      end;
    214:
      begin
        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda n�o iniciada', 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;

        try
          loNF := goPDVClass.GetNF(goPterm_id, 0);
          try
            if loNF <> nil then
              goPnf_id := loNF.IDNF;
          finally
            if Assigned(loNF) then
              loNF.Destroy;
          end;
          try
            FrmPDV_IdentificaCliente := TFrmPDV_IdentificaCliente.Create(self);
            if Length(goCNPJCPF) > 11 then
              FrmPDV_IdentificaCliente.rgen_pessoa.EditValue := 1;
            FrmPDV_IdentificaCliente.EDEN_CNPJCPF.Text       := goCNPJCPF;
            FrmPDV_IdentificaCliente.edNome.Text             := goNomeCli;
            if FrmPDV_IdentificaCliente.ShowModal <> mrOK then
              exit;
            with FrmPDV_DModule do
            begin
              adStoreProc1.Connection     := ADConnection1;
              adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
              adStoreProc1.StoredProcName := 'proc_calcula_nf';
              adStoreProc1.SchemaName     := 'pdv';
              adStoreProc1.Prepare;
              adStoreProc1.Params.ParamByName('@pterm_id').AsString    := goPterm_id;
              adStoreProc1.Params.ParamByName('@pnf_id').AsInteger     := goPnf_id;
              adStoreProc1.Params.ParamByName('@pnf_cnpjcpf').AsString := FrmPDV_IdentificaCliente.EDEN_CNPJCPF.Text;
              adStoreProc1.Params.ParamByName('@pnf_nome_cliente').AsString := FrmPDV_IdentificaCliente.edNome.Text;
              adStoreProc1.execProc;

              if adStoreProc1.FindParam('@max') <> nil then
                loResult := adStoreProc1.ParamByName('@max').AsInteger;
            end;
            goCNPJCPF := '';
            goNomeCli := '';
          except
            on e: exception do
            begin
              loResult := -1;
              FrmPDV_DModule.cdsEmpresa.GetSysMessages(true, self);
            end;
          end;
        finally
          FrmPDV_IdentificaCliente.Destroy;
          FrmPDV_IdentificaCliente := nil;
        end;
      end;
    215:
      begin
        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda n�o iniciada', 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        doAplicarDesconto;
        exit;
      end;
    216:
      begin
        if goCancelItemMode then
          exit;
        if goCancelMode then
          exit;
        if goPnf_id > 0 then
        begin
          MessageBox(handle, 'Venda em andamento', 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        goListResendMode            := true;
        lblCancelReprint.Caption    := 'Reenvio de NFCe de conting�ncia';
        lblCancelReprintMsg.Caption :=
          'Pressione [F2] para confirmar o reenvio da NFCe selecionada acima. Pressione [ESC] para voltar';
        cxPageControl1.ActivePageIndex := 4;
        exit;
      end;
    // frmFracionaPedido
    333:
      begin
        loNF := goPDVClass.GetNF(goPterm_id, 0);
        if loNF <> nil then
          if loNF.NFItens <> nil then
            if loNF.NFItens.Count > 0 then
            begin
              SHOWMESSAGE('Existe Itens na tela para gera��o de Pedido');
              exit;
            end;
        frmFracionaPedido := TfrmFracionaPedido.Create(self);
        try
          if goPnf_id = 0 then
            doNovaNF(false);
          if goPnf_id > 0 then
          begin
            frmFracionaPedido.goPnf_id   := goPnf_id;
            frmFracionaPedido.goPterm_id := goPterm_id;
            if frmFracionaPedido.ShowModal = mrOK then
            begin
              { Consulta se h� nota fiscal em andamento }
              loNF := goPDVClass.GetNF(goPterm_id, 0);
              /// / erimar
              try
                if loNF <> nil then
                  doAddItensList(loNF.NFItens);
              finally
                if Assigned(loNF) then
                  loNF.Destroy;
              end;
              loNF := goPDVClass.GetTotaisNF(goPnf_id);
              try
                doSetTotaisNF(loNF);
                goBuffer        := '';
                goQtdProdBuffer := 0;
                goInserted      := true;
              finally
                if Assigned(loNF) then
                  loNF.Destroy;
              end;
            end;
          end;
        finally
          frmFracionaPedido.Destroy;
          frmFracionaPedido := nil;
        end;
        exit;
      end;
    217:
      begin
        FrmPDV_ImportaPreVenda := TFrmPDV_ImportaPreVenda.Create(self);
        try
          if goPnf_id = 0 then
            doNovaNF(false);
          if goPnf_id > 0 then
          begin
            FrmPDV_ImportaPreVenda.goPnf_id   := goPnf_id;
            FrmPDV_ImportaPreVenda.goPterm_id := goPterm_id;
            if FrmPDV_ImportaPreVenda.ShowModal = mrOK then
            begin
              { Consulta se h� nota fiscal em andamento }
              loNF := goPDVClass.GetNF(goPterm_id, 0);
              /// / erimar
              try
                if loNF <> nil then
                  doAddItensList(loNF.NFItens);
              finally
                if Assigned(loNF) then
                  loNF.Destroy;
              end;
              loNF := goPDVClass.GetTotaisNF(goPnf_id);
              try
                doSetTotaisNF(loNF);
                goBuffer        := '';
                goQtdProdBuffer := 0;
                goInserted      := true;
              finally
                if Assigned(loNF) then
                  loNF.Destroy;
              end;
            end;
          end;
        finally
          FrmPDV_ImportaPreVenda.Destroy;
          FrmPDV_ImportaPreVenda := nil;
        end;
        exit;
      end;
    220:
      begin
        frmbaseexterna := Tfrmbaseexterna.Create(self);
        try
          if goPnf_id = 0 then
            doNovaNF(false);
          if goPnf_id > 0 then
          begin
            frmbaseexterna.goPnf_id   := goPnf_id;
            frmbaseexterna.goPterm_id := goPterm_id;
            if frmbaseexterna.ShowModal = mrOK then
            begin
              { Consulta se h� nota fiscal em andamento }
              loNF := goPDVClass.GetNF(goPterm_id, 0);
              /// / erimar
              try
                if loNF <> nil then
                  doAddItensList(loNF.NFItens);
              finally
                if Assigned(loNF) then
                  loNF.Destroy;
              end;
              loNF := goPDVClass.GetTotaisNF(goPnf_id);
              try
                doSetTotaisNF(loNF);
                goBuffer        := '';
                goQtdProdBuffer := 0;
                goInserted      := true;
              finally
                if Assigned(loNF) then
                  loNF.Destroy;
              end;
            end;
          end;
        finally
          frmbaseexterna.Destroy;
          frmbaseexterna := nil;
        end;
        exit;
      end;
    997:
      begin
        FrmPDV_Login_DefineSenha := TFrmPDV_Login_DefineSenha.Create(self);
        // try
        FrmPDV_Login_DefineSenha.ShowModal;
        // if FrmPDV_ImportaPreVenda.ShowModal = mrOK then
        // finally
        FrmPDV_Login_DefineSenha.Destroy;
        FrmPDV_Login_DefineSenha := nil;
      end;
    // exit;
    // end;
    998:
      begin
        fvendas.ShowModal;
        exit;
      end;
    999:
      begin
        fimportacao.ShowModal;
        exit;
      end;

    // ShowMessage('AUTORIZA ALTERA��O NA DATA DO PLANO');
    // exit;
    // end;
    // 901:
    // begin
    // ShowMessage('AUTORIZA CANC. IMP. COMP. VINCULADO');
    // exit;
    // end;
    // 906:
    // begin
    // ShowMessage('AUTORIZA CLIENTE N�O CADASTRADO');
    // exit;
    // end;
    // 900:
    // begin
    // ShowMessage('AUTORIZA CLIENTE/LIMITE CR�DITO');
    // exit;
    // end;
    // 903:
    // begin
    // ShowMessage('AUTORIZA DESCONTO CONTAS A RECEBER');
    // exit;
    // end;
    // 912:
    // begin
    // ShowMessage('AUTORIZA DIGITA��O DO CART�O PRIVATE LABEL');
    // exit;
    // end;
    // 913:
    // begin
    // ShowMessage('AUTORIZA FECHAMENTO DA FICHA');
    // exit;
    // end;
    // 905:
    // begin
    // ShowMessage('AUTORIZA FECHAMENTO DE CUPOM FOR�ADO');
    // exit;
    // end;
    // 909:
    // begin
    // ShowMessage('AUTORIZA LEITURA Z COM REGISTROS � TRANSMITIR');
    // exit;
    // end;
    // 910:
    // begin
    // ShowMessage('AUTORIZA LIMITE CR�DITO CLIENTE COM RETAGUARDA OFF-LINE');
    // exit;
    // end;
    // 911:
    // begin
    // ShowMessage('AUTORIZA PLANO DE PAGAMENTO');
    // exit;
    // end;
    // 908:
    // begin
    // ShowMessage('AUTORIZA QUANTIDADE MAIOR QUE O PERMITIDO');
    // exit;
    // end;
    // 914:
    // begin
    // ShowMessage('AUTORIZA REABERTURA DA FICHA');
    // exit;
    // end;
    // 916:
    // begin
    // ShowMessage('AUTORIZA SOMAR MAIS UM AO NUMERO DA NFC-e');
    // exit;
    // end;
    // 904:
    // begin
    // ShowMessage('AUTORIZA VALOR A MAIOR NO REC. CART�O PR�PRIO (141)');
    // exit;
    // end;
    // 907:
    // begin
    // ShowMessage('AUTORIZA VALOR A MAIOR QUE O M�XIMO PERMITIDO NA FINALIZADOR');
    // exit;
    // end;
    // 917:
    // begin
    // ShowMessage('AUTORIZA VENDA POR QUANTIDADE PARA PRODUTOS VENDA UNIT�RIA');
    // exit;
    // end;
    // 915:
    // begin
    // ShowMessage('AUTORIZA VENDAS COM PONTO DE SANGRIA ATINGIDO');
    // exit;
    // end;
    // 400:
    // begin
    // ShowMessage('CADASTRO CLIENTE');
    // exit;
    // end;
    // 390:
    // begin
    // ShowMessage('CALCULADORA');
    // exit;
    // end;
    // 125:
    // begin
    // ShowMessage('CANCELA CUPOM');
    // exit;
    // end;
    // 126:
    // begin
    // ShowMessage('CANCELA CUPOM ABERTO');
    // exit;
    // end;
    // 124:
    // begin
    // ShowMessage('CANCELA PR�-VENDA');
    // exit;
    // end;
    // 741:
    // begin
    // ShowMessage('CANCELAMENTO CART�O PR�PRIO');
    // exit;
    // end;
    // 116:
    // begin
    // ShowMessage('CANCELAMENTO DE ITEM (C�DIGO)');
    // exit;
    // end;
    // 115:
    // begin
    // ShowMessage('CANCELAMENTO DE ITEM (REGISTRO)');
    // exit;
    // end;
    // 625:
    // begin
    // ShowMessage('CANCELAMENTO TEF (SOFTWARE EXPRESS)');
    // exit;
    // end;
    // 176:
    // begin
    // ShowMessage('CART�O FIDELIDADE');
    // exit;
    // end;
    // 177:
    // begin
    // ShowMessage('CART�O FIDELIDADE PRIVATE LABEL PRIMEIRA COMPRA');
    // exit;
    // end;
    // 622:
    // begin
    // ShowMessage('COMUNICA��O PINPAD (SOFTWARE EXPRESS)');
    // exit;
    // end;
    // 510:
    // begin
    // ShowMessage('CONFIGURA BALAN�A');
    // exit;
    // end;
    // 540:
    // begin
    // ShowMessage('CONFIGURA COMPROVANTE N�O FISCAL');
    // exit;
    // end;
    // 535:
    // begin
    // ShowMessage('CONFIGURA CONTING�NCIA NFC-e');
    // exit;
    // end;
    // 700:
    // begin
    // ShowMessage('CONFIGURA CR�DITO DIGITAL(PHOEBUS)');
    // exit;
    // end;
    // 515:
    // begin
    // ShowMessage('CONFIGURA GAVETA');
    // exit;
    // end;
    // 500:
    // begin
    // ShowMessage('CONFIGURA IMPRESSORA');
    // exit;
    // end;
    // 507:
    // begin
    // ShowMessage('CONFIGURA IMPRESSORA DE CHEQUE');
    // exit;
    // end;
    // 506:
    // begin
    // ShowMessage('CONFIGURA LEITOR DOCUMENTOS E CMC-7');
    // exit;
    // end;
    // 538:
    // begin
    // ShowMessage('CONFIGURA PAR�METRO');
    // exit;
    // end;
    // 505:
    // begin
    // ShowMessage('CONFIGURA SCANNER');
    // exit;
    // end;
    // 590:
    // begin
    // ShowMessage('CONFIGURA SYSPDV-SERVER');
    // exit;
    // end;
    // 530:
    // begin
    // ShowMessage('CONFIGURA TECLADO');
    // exit;
    // end;
    // 315:
    // begin
    // ShowMessage('CONSULTA CLIENTE');
    // exit;
    // end;
    // 347:
    // begin
    // ShowMessage('CONSULTA CONVENIO');
    // exit;
    // end;
    // 324:
    // begin
    // ShowMessage('CONSULTA ENVELOPE');
    // exit;
    // end;
    // 310:
    // begin
    // ShowMessage('CONSULTA FINALIZADORA');
    // exit;
    // end;
    // 342:
    // begin
    // ShowMessage('CONSULTA LIMITE DE CR�DITO');
    // exit;
    // end;
    // 335:
    // begin
    // ShowMessage('CONSULTA PAGAMENTO');
    // exit;
    // end;
    // 330:
    // begin
    // ShowMessage('CONSULTA PLANO DE PAGAMENTO');
    // exit;
    // end;
    // 365:
    // begin
    // ShowMessage('CONSULTA PR�-VENDA');
    // exit;
    // end;
    // 307:
    // begin
    // ShowMessage('CONSULTA PREVIS�O DE ESTOQUE NAS LOJAS');
    // exit;
    // end;
    // 306:
    // begin
    // ShowMessage('CONSULTA PRODUTO AVULSA');
    // exit;
    // end;
    // 3061:
    // begin
    // ShowMessage('CONSULTA PRODUTO AVULSA TABELA 1');
    // exit;
    // end;
    // 3062:
    // begin
    // ShowMessage('CONSULTA PRODUTO AVULSA TABELA 2');
    // exit;
    // end;
    // 3063:
    // begin
    // ShowMessage('CONSULTA PRODUTO AVULSA TABELA 3');
    // exit;
    // end;
    // 300:
    // begin
    // ShowMessage('CONSULTA PRODUTO POR C�DIGO');
    // exit;
    // end;
    // 3001:
    // begin
    // ShowMessage('CONSULTA PRODUTO POR C�DIGO TABELA 1');
    // exit;
    // end;
    // 3002:
    // begin
    // ShowMessage('CONSULTA PRODUTO POR C�DIGO TABELA 2');
    // exit;
    // end;
    // 3003:
    // begin
    // ShowMessage('CONSULTA PRODUTO POR C�DIGO TABELA 3');
    // exit;
    // end;
    // 305:
    // begin
    // ShowMessage('CONSULTA PRODUTO POR DESCRI��O');
    // exit;
    // end;
    // 3051:
    // begin
    // ShowMessage('CONSULTA PRODUTO POR DESCRI��O TABELA 1');
    // exit;
    // end;
    // 3052:
    // begin
    // ShowMessage('CONSULTA PRODUTO POR DESCRI��O TABELA 2');
    // exit;
    // end;
    // 3053:
    // begin
    // ShowMessage('CONSULTA PRODUTO POR DESCRI��O TABELA 3');
    // exit;
    // end;
    // 345:
    // begin
    // ShowMessage('CONSULTA PRODUTOS FRENTE DE LOJA');
    // exit;
    // end;
    // 349:
    // begin
    // ShowMessage('CONSULTA RECEBIMENTO');
    // exit;
    // end;
    // 647:
    // begin
    // ShowMessage('CONSULTA SALDO GIFTCARD');
    // exit;
    // end;
    // 610:
    // begin
    // ShowMessage('CONSULTA SERASA (SOFTWARE EXPRESS)');
    // exit;
    // end;
    // 628:
    // begin
    // ShowMessage('CONSULTA S�CIO TORCEDOR');
    // exit;
    // end;
    // 340:
    // begin
    // ShowMessage('CONSULTA SYSERRO.ERR');
    // exit;
    // end;
    // 320:
    // begin
    // ShowMessage('CONSULTA VENDEDOR');
    // exit;
    // end;
    // 640:
    // begin
    // ShowMessage('CORRESPONDENTE BANC�RIO (SOFTWARE EXPRESS)');
    // exit;
    // end;
    // 155:
    // begin
    // ShowMessage('DESCONTO PERCENTUAL');
    // exit;
    // end;
    // 158:
    // begin
    // ShowMessage('DESCONTO PROMO��O ASSISTIDA');
    // exit;
    // end;
    // 156:
    // begin
    // ShowMessage('DESCONTO VALOR');
    // exit;
    // end;
    // 146:
    // begin
    // ShowMessage('EMPR�STIMO');
    // exit;
    // end;
    // 175:
    // begin
    // ShowMessage('ENTREGA DOMIC�LIO');
    // exit;
    // end;
    // 501:
    // begin
    // ShowMessage('ENVIAR COMANDO PARA IMPRESSORA FISCAL');
    // exit;
    // end;
    // 189:
    // begin
    // ShowMessage('ESTORNO DE ANTECIPA��O DE ENCOMENDA');
    // exit;
    // end;
    // 503:
    // begin
    // ShowMessage('EXPORTA CONFIGURA��O');
    // exit;
    // end;
    // 195:
    // begin
    // ShowMessage('FECHAMENTO DE CAIXA COM REDU��O(Z)');
    // exit;
    // end;
    // 197:
    // begin
    // ShowMessage('FECHAMENTO DE CAIXA SEM REDU��O(Z)');
    // exit;
    // end;
    // 810:
    // begin
    // ShowMessage('FOR�A ENVIO DAS TRANSA��ES PARA O SERVIDOR');
    // exit;
    // end;
    // 185:
    // begin
    // ShowMessage('IDENTIFICA��O DO CONSUMIDOR');
    // exit;
    // end;
    // 504:
    // begin
    // ShowMessage('IMPORTA CONFIGURA��O');
    // exit;
    // end;
    // 262:
    // begin
    // ShowMessage('IMPRESS�O CONFER�NCIA FICHA/MESA');
    // exit;
    // end;
    // 560:
    // begin
    // ShowMessage('IMPRESS�O DE CHEQUE AVULSO');
    // exit;
    // end;
    // 268:
    // begin
    // ShowMessage('IMPRESS�O DE DAV');
    // exit;
    // end;
    // 235:
    // begin
    // ShowMessage('INICIALIZA VENDA BRUTA');
    // exit;
    // end;
    // 166:
    // begin
    // ShowMessage('JUN��O FICHA/MESA');
    // exit;
    // end;
    // 153:
    // begin
    // ShowMessage('LAN�AMENTO CONSUMO FICHA/MESA');
    // exit;
    // end;
    // 396:
    // begin
    // ShowMessage('LEITURA DO CODIGO DE BARRAS');
    // exit;
    // end;
    // 200:
    // begin
    // ShowMessage('LEITURA X (LX)');
    // exit;
    // end;
    // 395:
    // begin
    // ShowMessage('LIMPA TELA');
    // exit;
    // end;
    // 142:
    // begin
    // ShowMessage('LIQUIDA��O CONTA A RECEBER');
    // exit;
    // end;
    // // 205:
    // // begin
    // // showmessage('MENU FISCAL <F12>');
    // // exit;
    // // end;
    // 207:
    // begin
    // ShowMessage('MENU SAT');
    // exit;
    // end;
    // 999:
    // begin
    // ShowMessage('MODO T�CNICO');
    // exit;
    // end;
    // 145:
    // begin
    // ShowMessage('PAGAMENTO');
    // exit;
    // end;
    // 147:
    // begin
    // ShowMessage('PAGAMENTO DEVOLU��O DE MERCADORIA');
    // exit;
    // end;
    // 181:
    // begin
    // ShowMessage('PRE�O TABELA 1');
    // exit;
    // end;
    // 182:
    // begin
    // ShowMessage('PRE�O TABELA 2');
    // exit;
    // end;
    // 183:
    // begin
    // ShowMessage('PRE�O TABELA 3');
    // exit;
    // end;
    // 545:
    // begin
    // ShowMessage('PROGRAMA AL�QUOTA TRIBUT�RIA');
    // exit;
    // end;
    // 555:
    // begin
    // ShowMessage('PROGRAMA FINALIZADORA');
    // exit;
    // end;
    // 525:
    // begin
    // ShowMessage('PROGRAMA HOR�RIO DE VER�O');
    // exit;
    // end;
    // 550:
    // begin
    // ShowMessage('PROGRAMA TRUNCAMENTO/ARREDONDAMENTO');
    // exit;
    // end;
    // 800:
    // begin
    // ShowMessage('PUXA �LTIMA CARGA DO SYSPDV-SERVIDOR');
    // exit;
    // end;
    // 630:
    // begin
    // ShowMessage('RECARGA DE PR�-PAGO(SOFTWARE EXPRESS)');
    // exit;
    // end;
    // 645:
    // begin
    // ShowMessage('RECARGA GIFTCARD');
    // exit;
    // end;
    // 140:
    // begin
    // ShowMessage('RECEBIMENTO');
    // exit;
    // end;
    // 141:
    // begin
    // ShowMessage('RECEBIMENTO CART�O PR�PRIO');
    // exit;
    // end;
    // 144:
    // begin
    // ShowMessage('RECEBIMENTO COBRAN�A');
    // exit;
    // end;
    // 143:
    // begin
    // ShowMessage('RECEBIMENTO CR�DIARIO');
    // exit;
    // end;
    // 148:
    // begin
    // ShowMessage('RECEBIMENTO DE VENDA ASSISTIDA');
    // exit;
    // end;
    // 173:
    // begin
    // ShowMessage('RECEBIMENTO VALOR FIXO VINCULADO A VENDA');
    // exit;
    // end;
    // 820:
    // begin
    // ShowMessage('REENVIO DAS TRANSA��ES PARA O SERVIDOR');
    // exit;
    // end;
    // 111:
    // begin
    // ShowMessage('REFOR�O FUNDO DE CAIXA');
    // exit;
    // end;
    // 621:
    // begin
    // ShowMessage('REIMPRESS�O (SOFTWARE EXPRESS)');
    // exit;
    // end;
    // 127:
    // begin
    // ShowMessage('REIMPRESS�O CUPOM CANCELADO PELO SISTEMA');
    // exit;
    // end;
    // 129:
    // begin
    // ShowMessage('REIMPRESS�O CUPOM SALVO');
    // exit;
    // end;
    // 122:
    // begin
    // ShowMessage('REIMPRESS�O DANFE');
    // exit;
    // end;
    // 230:
    // begin
    // ShowMessage('RELATORIO GERENCIAL VENDA GAR�OM');
    // exit;
    // end;
    // 150:
    // begin
    // ShowMessage('SA�DA DE OPERADOR');
    // exit;
    // end;
    // 100:
    // begin
    // ShowMessage('SAIR DO SISTEMA PARA O WINDOWS');
    // exit;
    // end;
    // 128:
    // begin
    // ShowMessage('SALVA CUPOM PARA REIMPRESS�O');
    // exit;
    // end;
    // 136:
    // begin
    // ShowMessage('SANGRIA AUTOM�TICA');
    // exit;
    // end;
    // 138:
    // begin
    // ShowMessage('SANGRIA AUTOM�TICA DE CORRESPONDENTE BANC�RIO');
    // exit;
    // end;
    // 137:
    // begin
    // ShowMessage('SANGRIA AUTOM�TICA DE RECEBIMENTO');
    // exit;
    // end;
    // 135:
    // begin
    // ShowMessage('SANGRIA MANUAL');
    // exit;
    // end;
    // 119:
    // begin
    // ShowMessage('SUB-TOTAL');
    // exit;
    // end;
    // 620:
    // begin
    // ShowMessage('TESTE DE COMUNICA��O (SOFTWARE EXPRESS)');
    // exit;
    // end;
    // 149:
    // begin
    // ShowMessage('TRAVA OPERA��O');
    // exit;
    // end;
    // 134:
    // begin
    // ShowMessage('TROCA DE BOBINA');
    // exit;
    // end;
    // 133:
    // begin
    // ShowMessage('TROCA DE FINALIZADORA (AVULSA)');
    // exit;
    // end;
    // 132:
    // begin
    // ShowMessage('TROCA DE FINALIZADORA (CUPOM)');
    // exit;
    // end;
    // 131:
    // begin
    // ShowMessage('TROCA DE PRODUTO');
    // exit;
    // end;
    // 130:
    // begin
    // ShowMessage('TROCA DE VENDEDOR NOS PROXIMOS ITENS VENDIDOS');
    // exit;
    // end;
    // 635:
    // begin
    // ShowMessage('VALEG�S(SOFTWARE EXPRESS)');
    // exit;
    // end;
    // 163:
    // begin
    // ShowMessage('VENDA ASSISTIDA');
    // exit;
    // end;
    // 172:
    // begin
    // ShowMessage('VENDA COMBUST�VEL MANUAL POR LITRO');
    // exit;
    // end;
    // 171:
    // begin
    // ShowMessage('VENDA COMBUST�VEL MANUAL POR VALOR');
    // exit;
    // end;
    // 730:
    // begin
    // ShowMessage('VENDA CR�DITO DIGITAL(PHOEBUS)');
    // exit;
    // end;
    // 187:
    // begin
    // ShowMessage('VENDA DE ENCOMENDA');
    // exit;
    // end;
    // 178:
    // begin
    // ShowMessage('VENDA DE PRODUTO POR PRE�O');
    // exit;
    // end;
    // 179:
    // begin
    // ShowMessage('VENDA DO �LTIMO PRODUTO');
    // exit;
    // end;
    // 162:
    // begin
    // ShowMessage('VENDA FICHA/MESA');
    // exit;
    // end;
    // 168:
    // begin
    // ShowMessage('VENDA POR DAV');
    // exit;
    // end;
    // 169:
    // begin
    // ShowMessage('VENDA POR DAV COM CONFER�NCIA DE ITENS');
    // exit;
    // end;
    // 165:
    // begin
    // ShowMessage('VENDA POR PR�-VENDA');
    // exit;
    // end;
    // 174:
    // begin
    // ShowMessage('VENDA TROCO PREMIADO');
    // exit;
    // end;
  end;
  result := false;
end;

procedure TFrmPDV.doExecCommand;
begin
  if goBuffer = '' then
    exit;
  if goBuffer.CountChar('/') > 0 then
  begin
    if not doExecFunction(goBuffer) then
    begin
      goBuffer          := '';
      lblCodigo.Caption := '';
    end;
    exit;
  end;
  if goPcx_id = 0 then
  begin
    MessageBox(handle, 'Caixa fechado, venda n�o permitida.', 'I9 PDV', MB_ICONEXCLAMATION);
    doClearItem;
    exit;
  end;
  if goPcxo_id = 0 then
  begin
    MessageBox(handle, 'Caixa do operador fechado, venda n�o permitida', 'I9 PDV', MB_ICONEXCLAMATION);
    doClearItem;
    exit;
  end;
  // if (not goCancelItemMode) and (not goQueryPriceMode) then
  // if Length(goBuffer) < 6 then
  // if MessageBox(handle, 'Confirmar inser��o do produto?', 'WiBi PDV', MB_ICONQUESTION + MB_YESNO) = idNO then
  // begin
  // goBuffer          := '';
  // lblCodigo.Caption := '';
  // exit;
  // end;

  doSetProduto;

  goBuffer := '';
end;

procedure TFrmPDV.doStartBalanca;
begin
  try
    if (not ACBrBAL1.Ativo) and (goTerminal.balanca <> nil) then
    begin
      ACBrBAL1.Modelo           := TACBrBALModelo(goTerminal.balanca.pbal_modelo);
      ACBrBAL1.Device.HandShake := TACBrHandShake(goTerminal.balanca.pbal_handshake);
      ACBrBAL1.Device.Parity    := TACBrSerialParity(goTerminal.balanca.pbal_parity);
      ACBrBAL1.Device.Stop      := TACBrSerialStop(goTerminal.balanca.pbal_stop);
      ACBrBAL1.Device.Data      := goTerminal.balanca.pbal_data;
      ACBrBAL1.Device.Baud      := goTerminal.balanca.pbal_baud;
      ACBrBAL1.Device.Porta     := goTerminal.balanca.pbal_port;
      ACBrBAL1.Ativar;
      // imgBalancaFail.Visible := not ACBrBAL1.Ativo;
      imgBalancaOK.Visible := ACBrBAL1.Ativo;
    end;
  except
    // imgBalancaFail.Visible := true;
    imgBalancaOK.Visible := false;
  end;
end;

{ M�todos Get }

function TFrmPDV.doGetCaixaOperador: Boolean;
begin
  goCaixaOperador := goPDVClass.GetCaixaOperador(goPcx_id);
  if goCaixaOperador <> nil then
    doSetCaixaOperador;
  result := (goCaixaOperador <> nil);
end;

function TFrmPDV.doGetCaixa: Boolean;
begin
  goCaixa := goPDVClass.GetCaixa(goPterm_id);
  if goCaixa <> nil then
    doSetCaixa;
  result := (goCaixa <> nil);
end;

procedure TFrmPDV.doGetTotaisEncerra;
var
  loNF: TNF;
begin
  loNF := goPDVClass.GetTotaisNF(FrmPDV.goPnf_id);
  try
    doSetTotaisNFEncerra(loNF);
  finally
    if Assigned(loNF) then
      loNF.Destroy;
  end;
end;

procedure TFrmPDV.doGetValorAPagar;
var
  loNF: TNF;
begin
  loNF := goPDVClass.GetTotaisNF(goPnf_id);
  try
    if loNF <> nil then

      edValorForma.value := loNF.TotalAPagar;
    edValorForma.SelectAll;
  finally
    if Assigned(loNF) then
      loNF.Destroy;
  end;
end;

function TFrmPDV.doGetPesoBalanca(var aPeso: Double): Boolean;
var
  aOldMsg: String;
begin
  aPeso := 0;
  if not ACBrBAL1.Ativo then
    ACBrBAL1.Ativar;
  if ACBrBAL1.Ativo then
  begin
    try
      aOldMsg             := lblMensagem.Caption;
      lblMensagem.Caption := 'Aguardando balan�a...';
      lblMensagem.Repaint;
      aPeso := ACBrBAL1.LePeso;
    finally
      lblMensagem.Caption := aOldMsg;
      lblMensagem.Repaint;
    end;
  end;
  result := aPeso > 0;
end;

{ Eventos de componentes }

procedure TFrmPDV.AdvGlowButton1Click(Sender: TObject);
begin
  doExecFunction('206')
end;

procedure TFrmPDV.AdvGlowButton2Click(Sender: TObject);
begin
  doExecFunction('205')
end;

procedure TFrmPDV.AdvGlowButton4Click(Sender: TObject);
begin
  doExecFunction('202');
end;

procedure TFrmPDV.AdvGlowButton6Click(Sender: TObject);
begin
  doExecFunction('210')
end;

procedure TFrmPDV.ProcessaPedido(npnf: Integer);
begin
  with cabeca do
  begin
    close;
    sql.Clear;
    sql.Add('exec i9pdv..P_VERPEDIDOSFEITOS_PNF ' + IntToStr(npnf));
    open;
  end;
  with itens do
  begin
    close;
    sql.Clear;
    sql.Add('exec i9pdv..P_VERITENSPEDIDOSFEITOS ' + IntToStr(npnf));
    open;
  end;
  WITH a1 DO
  BEGIN
    close;
    sql.Clear;
    sql.Add('INSERT INTO NUMEROPED (DATA,E_LOJA) values (:v0, :v1) ');
    Parameters[0].value := date;
    Parameters[1].value := 1;
    ExecSQL;
  END;
  with a1 do
  begin
    close;
    sql.Clear;
    sql.Add('update NUMEROPED set npedido=pedido where npedido is null');
    ExecSQL;
  end;
  with a1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT top 1 * FROM numeroped WHERE E_LOJA = 1 order by NPEDIDO desc');
    open;
  end;
  with npedido do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT top 1 * FROM numeroped WHERE E_LOJA = 1 order by NPEDIDO desc');
    open;
  end;
  with A2 do
  begin
    close;
    sql.Clear;
    sql.Add('insert into cnotasai (emissao,e_status,e_usuario,e_loja,Pedido) values (:emi,:e_st,:e_us,:loj,:ped)');
    Parameters[0].value := cabecapnf_data_emissao.value;
    Parameters[1].value := 7;
    Parameters[2].value := 1;
    Parameters[3].value := 1;
    Parameters[4].value := npedidoNPEDIDO.AsString;
    ExecSQL;
  end;
  with cpedido do
  begin
    close;
    sql.Clear;
    sql.Add('select * from cnotasai where pedido = ' + npedidoNPEDIDO.AsString);
    open;
  end;
  try
    begin
      ADOConnection1.BeginTrans;

      cpedido.edit;
      cpedidoCliente.AsString       := '1';
      cpedidoEmissao.value          := cabecapnf_data_emissao.value;
      cpedidoEntrega.value          := cabecapnf_data_emissao.value;
      cpedidoVendedor.AsString      := cabecaidVendedor.AsString;
      cpedidoFormar.AsString        := cabecafinalizadoraPDV.AsString;
      cpedidoTipo.AsString          := cabecaFormaPagPDV.AsString;
      cpedidoPer_Desconto.value     := 0;
      cpedidoTIPOVENDA.value        := 2;
      cpedidoNpalm.AsString         := cabecapnf_nnotamodulo.AsString;
      cpedidoE_Transportadora.value := npnf;
      cpedidoTOTCOMDES.value        := cabecapnf_total_nota.value;
      cpedidoTot_Desconto.value     := cabecapnf_total_nota.value;
      cpedidoVia.value              := 1;
      cpedido.Post;
      cpedido.edit;
      while not itens.Eof do
      begin
        if itenspnfi_qtd.value <> 0 then
        begin
          with a3 do
          begin
            close;
            sql.Clear;
            sql.Add('exec  P_IncluirItensPedido :Pedido,:CodProduto,:Qtd,:TipoKar,0,:Loja,:Preco,:Desconto,0,0,' +
              ':CEstoque,:Bonificacao, :Pdesconto, :ptotal ');
            Parameters[0].value  := cpedidoPedido.AsString;
            Parameters[1].value  := itenspr_codigo.AsString;
            Parameters[2].value  := RoundABNT(itenspnfi_qtd.value, 4);
            Parameters[3].value  := 2;
            Parameters[4].value  := 1;
            Parameters[5].value  := RoundABNT(itenspnfi_valor_unit.AsFloat, 2);
            Parameters[6].value  := RoundABNT(itenspnfi_desconto.value, 2);
            Parameters[7].value  := Trim(Campo_Configuracao('PermiteVendaSemEstoque'));
            Parameters[8].value  := 0;
            Parameters[9].value  := RoundABNT(itenspnfi_desconto.value, 2);
            Parameters[10].value := RoundABNT(itenspnfi_total_nota.value, 2);
            // verro                := SQL.text + #13 + itensDescricao.AsString;
            ExecSQL;
          end;
        end;
        itens.Next;
      end;
      // verro := 'select GETDATE()';
      with a3 do
      begin
        close;
        sql.Clear;
        sql.Add('select GETDATE() AS DATAD, sum(precoreal) as Total,sum(custo*qtd) as TCusto,' +
          'sum(Qtd) as Volume,count(Produto)  as Qitens ' + 'from inotasai where pedido=' + cpedidoPedido.AsString +
          ' AND E_LOJA = 1');
        open;
      end;

      cpedidoTCusto.value  := a3.FieldByName('Tcusto').value;
      cpedidoTVenda.value  := a3.FieldByName('Total').value;
      cpedidoQItens.value  := a3.FieldByName('Qitens').value;
      cpedidoVolume.value  := a3.FieldByName('Volume').value;
      cpedidoEmissao.value := cabecapnf_data_emissao.value;
      cpedido.Post;

      with a3 do
      begin
        close;
        sql.Clear;
        sql.Add('EXEC I9PDV..P_BAIXAESTFISICO ' + IntToStr(npnf));
        ExecSQL;
      end;

      ADOConnection1.CommitTrans;
    end;
  except
    ADOConnection1.RollbackTrans;
    SHOWMESSAGE('Houve um problema inexperado na gravacao dos intens na retarguarda.Tente Novamente');

  end;
end;

procedure TFrmPDV.cxButton2Click(Sender: TObject);
begin

  if goListResendMode then
    cxgrdReimpressao.Height := 340
  else
    cxgrdReimpressao.Height := 746;

  FrmPDV_DModule_DS.fdNotas.close;
  FrmPDV_DModule_DS.fdNotas.ParamByName('em_codigo').AsInteger := ServerEmpresa;
  // FrmPDV_DModule_DS.fdNotas.ParamByName('pnf_offline').AsBoolean := goListResendMode;
  FrmPDV_DModule_DS.fdNotas.ParamByName('data_emissao').AsDate := Trunc(dtDataVenda.date);
  FrmPDV_DModule_DS.fdNotas.active                             := true;

end;

procedure TFrmPDV.cxGrid1DBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if ARecord = nil then
    exit;

  try
    if ARecord.Values[cxgrdReimpressaoDBTableView1pnf_status.index] = 6 then
      AStyle := Cancelado;
    if (ARecord.Values[cxgrdReimpressaoDBTableView1pnf_status.index] = 3) or
      (ARecord.Values[cxgrdReimpressaoDBTableView1pnf_status.index] = 4) then
      AStyle := Enviado;
    if (ARecord.Values[cxgrdReimpressaoDBTableView1pnf_status.index] = 1) or
      (ARecord.Values[cxgrdReimpressaoDBTableView1pnf_status.index] = 2) then
      AStyle := NaoEnviado;
  except

  end;

end;

procedure TFrmPDV.cxGridDBTableView3EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (not(Key in [13, 37, 38, 39, 40])) then
    AItem.EditValue := Key;
end;

procedure TFrmPDV.cxGridDBTableView3EditKeyPress(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
  if (not(Key in [chr(13), chr(37), chr(38), chr(39), chr(40)])) then
    AItem.EditValue := Key;
end;

procedure TFrmPDV.cxPageControl1Change(Sender: TObject);
var
  sqlVendasDia  : string;
  sqlContigencia: string;
  sqlCmd        : String;
begin
  sqlVendasDia :=
    'SELECT * FROM V_PDV_NOTASEMITIDAS WHERE em_codigo = :em_codigo AND isnull(pnf_offline,0) = 0 and pnf_data_emissao = :data_emissao and pnf_status <> 2 ORDER BY pnf_id DESC;';
  sqlContigencia :=
    'SELECT * FROM V_PDV_NOTASEMITIDAS WHERE em_codigo = :em_codigo AND  (isnull(pnf_offline,0) = 1 or pnf_status =2) and pnf_data_emissao = :data_emissao ORDER BY pnf_id DESC;';
  if cxPageControl1.ActivePageIndex = 1 then
  begin
    doGetValorAPagar;
    edValorForma.Setfocus;
  end;
  if cxPageControl1.ActivePageIndex = 4 then
  begin
    dtDataVenda.date              := date;
    edpnf_motivo_rejeicao.Visible := goListResendMode;
    if goListResendMode then
    begin
      sqlCmd                  := sqlContigencia;
      cxgrdReimpressao.Height := 340;
    end
    else
    begin
      sqlCmd                  := sqlVendasDia;
      cxgrdReimpressao.Height := 476;
    end;

    FrmPDV_DModule_DS.fdNotas.close;
    FrmPDV_DModule_DS.fdNotas.sql.Clear;
    FrmPDV_DModule_DS.fdNotas.sql.Text                           := sqlCmd;
    FrmPDV_DModule_DS.fdNotas.ParamByName('em_codigo').AsInteger := ServerEmpresa;
    // FrmPDV_DModule_DS.fdNotas.ParamByName('pnf_offline').AsBoolean := goListResendMode;
    FrmPDV_DModule_DS.fdNotas.ParamByName('data_emissao').AsDate := Trunc(dtDataVenda.date);
    FrmPDV_DModule_DS.fdNotas.active                             := true;
    cxgrdReimpressao.Setfocus;
  end;
end;

procedure TFrmPDV.cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage <> nil then
    if NewPage.PageIndex = 1 then
      doGetTotaisEncerra;

end;

procedure TFrmPDV.cxTabSheet2Show(Sender: TObject);
var
  loNF      : TNF;
  loListItem: TListItem;
  FormPromo : TFrmPDV_Promocoes;
begin
  PopulaGrid;
  if FDQuery1.RecordCount > 0 then
  begin
    FormPromo := TFrmPDV_Promocoes.Create(nil);
    try
      if FormPromo.ShowModal = mrOK then
      begin
        with FrmPDV_DModule do
        begin
          adStoreProc1.Connection     := ADConnection1;
          adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
          adStoreProc1.StoredProcName := 'proc_aplica_desconto_nf';
          adStoreProc1.SchemaName     := 'pdv';
          adStoreProc1.Prepare;
          // adStoreProc1.Params.ParamByName('@pterm_id').AsString := goPterm_id;
          adStoreProc1.Params.ParamByName('@pnf_id').AsInteger           := goPnf_id;
          adStoreProc1.Params.ParamByName('@pnf_desconto_perc').AsFMTBCD :=
            FormPromo.lstDescontoFormas.ItemFocused.SubItems[2].ToDouble();
          adStoreProc1.Params.ParamByName('@pnf_desconto').AsFMTBCD := 0;
          adStoreProc1.execProc;

          // Atualizando valores na tela
          goFormaPagamento := Integer(FormPromo.lstDescontoFormas.ItemFocused.Data);
          loNF             := goPDVClass.GetTotaisNF(goPnf_id);
          try
            doSetTotaisNF(loNF);
            doSetTotaisNFEncerra(loNF);
            edValorForma.value := loNF.TotalAPagar;
          finally
            if Assigned(loNF) then
              loNF.Destroy;
          end;
        end;
      end;
    finally
      FormPromo.DisposeOf;
    end;
  end;
end;

procedure TFrmPDV.doSetItemCancel(idx: Integer);
var
  i: Integer;
begin
  case idx of
    21:
      begin
        lblVrUnitProd21.Caption := FormatCurr('#,##0.00', FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_unit')
          .AsCurrency);
        lblVrTotalProd21.Caption := FormatCurr('#,##0.00',
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_total').AsCurrency);
        lblProdutoDescr21.Caption := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_qtd').AsString + ' x ' +
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_produto_descr').AsString;
      end;
    22:
      begin
        lblVrUnitProd22.Caption := FormatCurr('#,##0.00', FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_unit')
          .AsCurrency);
        lblVrTotalProd22.Caption := FormatCurr('#,##0.00',
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_total').AsCurrency);
        lblProdutoDescr22.Caption := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_qtd').AsString + ' x ' +
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_produto_descr').AsString;
      end;
    23:
      begin
        lblVrUnitProd23.Caption := FormatCurr('#,##0.00', FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_unit')
          .AsCurrency);
        lblVrTotalProd23.Caption := FormatCurr('#,##0.00',
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_total').AsCurrency);
        lblProdutoDescr23.Caption := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_qtd').AsString + ' x ' +
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_produto_descr').AsString;
      end;
    24:
      begin
        lblVrUnitProd24.Caption := FormatCurr('#,##0.00', FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_unit')
          .AsCurrency);
        lblVrTotalProd24.Caption := FormatCurr('#,##0.00',
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_total').AsCurrency);
        lblProdutoDescr24.Caption := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_qtd').AsString + ' x ' +
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_produto_descr').AsString;
      end;
    25:
      begin
        lblVrUnitProd25.Caption := FormatCurr('#,##0.00', FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_unit')
          .AsCurrency);
        lblVrTotalProd25.Caption := FormatCurr('#,##0.00',
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_total').AsCurrency);
        lblProdutoDescr25.Caption := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_qtd').AsString + ' x ' +
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_produto_descr').AsString;
      end;
    26:
      begin
        lblVrUnitProd26.Caption := FormatCurr('#,##0.00', FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_unit')
          .AsCurrency);
        lblVrTotalProd26.Caption := FormatCurr('#,##0.00',
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_total').AsCurrency);
        lblProdutoDescr26.Caption := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_qtd').AsString + ' x ' +
          FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_produto_descr').AsString;
      end;
  end;
  for i := 0 to self.ComponentCount - 1 do
    if Components[i].Tag = idx then
      TControl(Components[i]).Parent := cxtabPrincipal;
  VisibleComponentes(self, idx);
end;

function TFrmPDV.doFindItemCancel(AItemCodigo: Integer; var AProduto: TProduto): Boolean;
var
  loResult     : Integer;
  loNF         : TNF;
  loFieldLocate: string;
begin
  loResult := 0;
  result   := false;
  if AItemCodigo = 0 then
    exit;
  if goIdxCancel > 26 then
  begin
    MessageBox(handle, 'Somente 5 (cinco) itens por vez podem ser cancelados!', 'I9 PDV', MB_ICONEXCLAMATION);
    exit;
  end;

  case goTipoCancelaItem of
    tciPorCodigo:
      begin
        if Length(IntToStr(AItemCodigo)) >= 6 then
          loFieldLocate := 'pnfi_ean'
        else
          loFieldLocate := 'pr_codigo';
      end;
    tciPorSeq:
      loFieldLocate := 'item';
  end;

  if not FrmPDV_DModule_DS.dsItensDelete.Locate(loFieldLocate + ';pnfi_cancelado', VarArrayOf([AItemCodigo, 0]),
    [loCaseInsensitive]) then
  begin
    case goTipoCancelaItem of
      tciPorCodigo:
        MessageBox(handle, 'Produto n�o encontrado!', 'I9 PDV', MB_ICONEXCLAMATION);
      tciPorSeq:
        MessageBox(handle, 'Item n�o encontrado!', 'I9 PDV', MB_ICONEXCLAMATION);
    end;

  end
  else
  begin
    if AProduto = nil then
      AProduto          := TProduto.Create;
    AProduto.EAN        := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_ean').AsString;
    AProduto.Codigo     := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pr_codigo').AsString;
    AProduto.Descricao  := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_produto_descr').AsString;
    AProduto.Unidade    := FrmPDV_DModule_DS.dsItensDelete.FieldByName('un_sigla').AsString;
    AProduto.Valor      := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_valor_unit').AsCurrency;
    AProduto.Quantidade := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_qtd').AsCurrency;
    with FrmPDV_DModule do
    begin
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_cancela_item_nf';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      adStoreProc1.Params.ParamByName('@pterm_id').AsString := goPterm_id;
      adStoreProc1.Params.ParamByName('@pnfi_id').AsInteger := FrmPDV_DModule_DS.dsItensDelete.FieldByName('pnfi_id')
        .AsInteger;
      adStoreProc1.execProc;

      if adStoreProc1.FindParam('@max') <> nil then
        loResult := adStoreProc1.ParamByName('@max').AsInteger;
      if loResult > 0 then
      begin
        FrmPDV_DModule_DS.dsItensDelete.refresh;

        doSetItemCancel(goIdxCancel);
        inc(goIdxCancel);
        loNF := goPDVClass.GetTotaisNF(goPnf_id);
        try
          doSetTotaisNF(loNF);
        finally
          if Assigned(loNF) then
            loNF.Destroy;
        end;
        if goTipoCancelaItem = tciPorSeq then
          doSetModoCancelaItem(true, MB_YESNO);
        result := true;
      end;
    end;
  end;
end;

procedure TFrmPDV.edItemCodigoCancelKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // case Key of
  // VK_RETURN:
  // doFindItemCancel;
  // end;
end;

procedure TFrmPDV.StoreXML(aXMLEnviado: AnsiString; apnf_id: Integer; cnf: Integer);
begin
  try
    with FrmPDV_DModule do
    begin
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_update_nota_xml';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      adStoreProc1.Params.ParamByName('@pterm_id').AsString         := goTerminal.pterm_id;
      adStoreProc1.Params.ParamByName('@pnf_id').AsInteger          := apnf_id;
      adStoreProc1.Params.ParamByName('@pnf_xml').AsMemo            := aXMLEnviado;
      adStoreProc1.Params.ParamByName('@pnf_nnotamodulo').AsInteger := cnf;
      adStoreProc1.execProc;
    end;
  except
    raise;
  end;
end;

procedure TFrmPDV.StoreXMLCancel(AXMLCancel: AnsiString; apnf_id: Integer);
begin
  FrmPDV_DModule.ADConnection1.ExecSQL
    ('update pdv.tb_nota_fiscal set pnf_data_cancel = getdate(),pnf_status = 6,pnf_xml_cancel = ' +
    QuotedStr(AXMLCancel) + ' where pnf_id = ' + IntToStr(apnf_id));
end;

{ M�todos de limpeza }

procedure TFrmPDV.doClearItem;
begin
  lblCodigo.Caption := '0';
  // lblQuantProd.Caption := FormatCurr('#,###0.000', 0);
  goBuffer := '';
  // goQtdProdBuffer      := 0;
  goInserted := false;
end;

procedure TFrmPDV.doClear(const AClearLista: Boolean = true);

begin
  doSetRotuloPrincipal('');
  VisibleComponentes(self, 99, true);
  lblVolumes.Caption       := FormatCurr('000', 0);
  lblSubTotal.Caption      := FormatCurr('#,##0.00', 0);
  lblStatusTotal.Caption   := FormatCurr('#,##0.00', 0);
  lblLabelSubTotal.Caption := 'SubTotal';
  lblAcreDesc.Visible      := false;
  shp7.Brush.Color         := $005B5909;
  if AClearLista then
  begin
    VisibleComponentes(self, 1, true);
    VisibleComponentes(self, 2, true);
    VisibleComponentes(self, 3, true);
    VisibleComponentes(self, 4, true);
    VisibleComponentes(self, 5, true);
    VisibleComponentes(self, 6, true);
    VisibleComponentes(self, 7, true);
    VisibleComponentes(self, 8, true);
    VisibleComponentes(self, 9, true);
    VisibleComponentes(self, 10, true);
  end;
  cxGridDBTableCima.DataController.DataSource   := nil;
  cxGrid3DBTablebaixo.DataController.DataSource := nil;
end;

procedure TFrmPDV.doClearEncerra;
var
  i: Integer;
begin
  for i := lstListFormas.Items.Count - 1 downto 0 do
    lstListFormas.Items.Delete(i);
  edValorForma.Clear;
  lblVolumesEncerra.Caption     := FormatCurr('000', 0);
  lblTotalCompraEncerra.Caption := FormatCurr('R$ #,##0.00', 0);
  lblTotalPagoEncerra.Caption   := FormatCurr('R$ #,##0.00', 0);
  lblValorAPagarEncerra.Caption := FormatCurr('R$ #,##0.00', 0);
  lblValoraPagarTitle.Caption   := 'Restante a Pagar';
  // fimportacao.cxButton2.Click;
  if fdMemTbItens.active then
    fdMemTbItens.EmptyDataSet;

  cxGridDBTableCima.DataController.DataSource   := nil;
  cxGrid3DBTablebaixo.DataController.DataSource := nil;
end;

{ Opera��es de tela da wenda }
procedure TFrmPDV.doAddFormaList(afp_codigo, aPnfp_id: Integer; afp_descricao: string);
var
  loListItem   : TListItem;
  loListItemPag: TListItemPag;
begin
  loListItemPag.Pnfp_id := aPnfp_id;
  loListItem            := lstListFormas.Items.Add;
  loListItem.Data       := Pointer(loListItemPag);
  loListItem.Caption    := StrZero(IntToStr(afp_codigo), 3);
  loListItem.SubItems.Add(afp_descricao);
  loListItem.SubItems.Add(FormatCurr('#,##0.00', edValorForma.value));
  doGetValorAPagar;
  // edValorForma.Setfocus;
end;

procedure TFrmPDV.PopulaGrid;
var
  CMD : string;
  loNF: TNF;
begin
  loNF := goPDVClass.GetTotaisNF(FrmPDV.goPnf_id);
  try
    CMD := 'Select recebimento,desconto, :pValor -(:pValor *(desconto/100)) as total from Basei9..recebimento where Formapagpdv is not null';
    FDQuery1.close;
    FDQuery1.sql.Text                         := CMD;
    FDQuery1.ParamByName('pValor').AsCurrency := loNF.TotalProd;
    FDQuery1.open;
  finally
    if Assigned(loNF) then
      loNF.Destroy;
  end;
end;

procedure TFrmPDV.doAddFormasList(APags: TObjectList<TNFPag>);
var
  loListItem   : TListItem;
  loListItemPag: TListItemPag;
  i            : Integer;
begin
  for i := lstListFormas.Items.Count - 1 downto 0 do
    lstListFormas.Items.Delete(i);

  if APags = nil then
    exit;

  for i := 0 to APags.Count - 1 do
  begin
    loListItemPag.Pnfp_id := APags.Items[i].Pnfp_id;
    loListItem            := lstListFormas.Items.Add;
    loListItem.Data       := Pointer(loListItemPag);
    loListItem.Caption    := APags.Items[i].cMP;
    loListItem.SubItems.Add(APags.Items[i].cMPDescr);
    loListItem.SubItems.Add(FormatCurr('#,##0.00', APags.Items[i].vMP));
  end;
  doGetValorAPagar;
end;

procedure TFrmPDV.doAddItensList(AItens: TObjectList<TNFItem>);
var
  i, x: Integer;
begin

  VisibleComponentes(self, 1, true);
  VisibleComponentes(self, 2, true);
  VisibleComponentes(self, 3, true);
  VisibleComponentes(self, 4, true);
  VisibleComponentes(self, 5, true);
  VisibleComponentes(self, 6, true);
  VisibleComponentes(self, 7, true);
  VisibleComponentes(self, 8, true);
  VisibleComponentes(self, 9, true);
  VisibleComponentes(self, 10, true);

  cxGridDBTableCima.DataController.DataSource   := nil;
  cxGrid3DBTablebaixo.DataController.DataSource := nil;

  if AItens = nil then
    exit;
  x := 1;
  if not fdMemTbItens.active then
  begin
    fdMemTbItens.CreateDataSet;
    fdMemTbItens.active := true;
  end
  else
  begin
    fdMemTbItens.active := false;
    fdMemTbItens.active := true;
  end;
  for i := 0 to AItens.Count - 1 do
  begin
    fdMemTbItens.Append;
    fdMemTbItensItem.AsString       := StrZero(IntToStr(AItens.Items[i].ItemSeq), 3);
    fdMemTbItensEan.AsString        := AItens.Items[i].EAN;
    fdMemTbItensDescricao.AsString  := AItens.Items[i].NomeProd;
    fdMemTbItensQuantidade.AsString := AItens.Items[i].QtdStr;
    fdMemTbItensUnidade.AsString    := AItens.Items[i].Unidade;
    fdMemTbItensPreco.AsString      := AItens.Items[i].VlrUnitStr;
    fdMemTbItensTotal.AsString      := AItens.Items[i].VlrTotalStr;
    fdMemTbItens.Post;

    inc(x);
  end;
  cxGridDBTableCima.DataController.DataSource   := DataSource1;
  cxGrid3DBTablebaixo.DataController.DataSource := DataSource1;
  cxGridDBTableCima.ViewData.Expand(true);
end;

procedure TFrmPDV.doAddItemCancelList(AItem: Integer; AValor: Double);
begin
  // lstItensNF.Lines.Add(StrZero(IntToStr(AItem), 3) + '    ' + AlignRight('-' + FormatFloat('#,##0.00', AValor), 15));
  // lstItensNF.ItemIndex := lstItensNF.Count - 1;
end;

procedure TFrmPDV.doTEFLoad;
begin
  if not goTerminal.pterm_tef then
    exit;

  doTEFConsultar;
end;

procedure TFrmPDV.ConfigurarTEF;
var
  vModelo  : Integer;
  vAmbiente: Integer;
  vQrCode  : String;
begin
  vModelo            := GetEnumValue(TypeInfo(TACBrTEFAPITipo), goTerminal.pterm_tef_prestador);
  vAmbiente          := GetEnumValue(TypeInfo(TACBrTEFAPIAmbiente), goTerminal.pterm_tef_ambiente);
  vQrCode            := goTerminal.pterm_tef_qrcode;
  ACBrTEFAPI1.Modelo := TACBrTEFAPITipo(vModelo);
  ACBrTEFAPI1.TratamentoTransacaoPendente := tefpenConfirmar;
  ACBrTEFAPI1.TratamentoTransacaoInicializacao         := tefopiProcessarPendentes;
  ACBrTEFAPI1.DadosAutomacao.AutoAtendimento           := false;
  ACBrTEFAPI1.DadosAutomacao.ImprimeViaClienteReduzida := false;
  // Confirma��o (CNF) � disparada manualmente por ConfirmarTransacaoTEF, s�
  // depois que o cupom fiscal for autorizado -- ver doNFFechamento/
  // doConfirmaPagamento em uPDV_NF.pas.
  ACBrTEFAPI1.ConfirmarTransacaoAutomaticamente := false;

  ACBrTEFAPI1.DadosAutomacao.SuportaDesconto   := true;
  ACBrTEFAPI1.DadosAutomacao.SuportaSaque      := false;
  ACBrTEFAPI1.DadosAutomacao.NomeSoftwareHouse := goTerminal.sh_nome_soft_house;
  ACBrTEFAPI1.DadosAutomacao.CNPJSoftwareHouse := goTerminal.sh_cnpj;
  ACBrTEFAPI1.DadosAutomacao.NomeAplicacao     := goTerminal.sh_nome_aplicacao;
  ACBrTEFAPI1.DadosAutomacao.VersaoAplicacao   := goTerminal.sh_versao_aplicacao;
  ACBrTEFAPI1.DadosAutomacao.MensagemPinPad    := goTerminal.pterm_tef_mensagem_pinpad;
  ACBrTEFAPI1.DadosAutomacao.Idioma            := idPortugues;
  ACBrTEFAPI1.DadosAutomacao.MoedaISO4217      := CMODEDA_BRL;
  ACBrTEFAPI1.DadosAutomacao.ParamAplicacao    := '';
  ACBrTEFAPI1.DadosEstabelecimento.RazaoSocial := goTerminal.sh_cliente_nome;
  ACBrTEFAPI1.DadosEstabelecimento.CNPJ        := goTerminal.sh_cliente_cnpj;

  ACBrTEFAPI1.DadosTerminal.CodTerminal      := '';
  ACBrTEFAPI1.DadosTerminal.CodEmpresa       := '';
  ACBrTEFAPI1.DadosTerminal.CodFilial        := '';
  ACBrTEFAPI1.DadosTerminal.PortaPinPad      := '';
  ACBrTEFAPI1.DadosTerminal.EnderecoServidor := goTerminal.pterm_tef_servidor;
  ACBrTEFAPI1.DadosTerminal.Ambiente         := TACBrTEFAPIAmbiente(vAmbiente);
  ACBrTEFAPI1.DadosTerminal.ParamComunicacao := '';
  ACBrTEFAPI1.DadosTerminal.GravarLogTEF     := true;

  if vQrCode.Equals('N�o Suportado') then
    ACBrTEFAPI1.ExibicaoQRCode := qrapiNaoSuportado
  else if vQrCode.Equals('Exibir no PinPad') then
    ACBrTEFAPI1.ExibicaoQRCode := qrapiExibirPinPad
  else if vQrCode.Equals('Exibir na Tela') or vQrCode.Equals('Imprimir') then
    ACBrTEFAPI1.ExibicaoQRCode := qrapiExibirAplicacao
  else
    ACBrTEFAPI1.ExibicaoQRCode := qrapiAuto;
end;

procedure TFrmPDV.AtivarTEF;
begin
  doTEFExibirMensagem('Ativando TEF...');
  ConfigurarTEF;
  ACBrTEFAPI1.Inicializar;
 // doTEFExibirMensagem('TEF Ativo...');
end;

procedure TFrmPDV.IniciarContadorTEF;
begin
  FContadorSegundosTEF     := 40;
  FContadorInicioTickTEF   := GetTickCount;
  TimerTEFContador.Enabled := true;
end;

procedure TFrmPDV.FinalizarContadorTEF;
begin
  if TThread.CurrentThread.ThreadID <> MainThreadID then
  begin
    TThread.Synchronize(nil, FinalizarContadorTEF);
    exit;
  end;

  TimerTEFContador.Enabled := false;

  // Reenvia a mensagem atual com contador = 0, para que o sufixo "[N]" que
  // possa ter sido exibido junto com a mensagem final n�o fique "grudado"
  // na tela depois que o processo j� terminou.
  doTEFAtualizarAviso(FMensagemTEF, 0);
end;

// Baseado no tempo real decorrido (GetTickCount) em vez de contar "ticks" do
// TimerTEFContador, pois enquanto AtivarTEF/EfetuarAdministrativa est�o em
// execu��o (chamada s�ncrona/bloqueante dentro da thread de trabalho) a fila
// de mensagens do Windows pode n�o ser processada a tempo. Por isso essa
// rotina tamb�m � chamada a partir de doTEFExibirMensagem, acionada ao vivo
// pelos callbacks do ACBrTEFAPI1 durante o processamento.
procedure TFrmPDV.AtualizarContadorTEF;
var
  vRestante: Integer;
begin
  if not TimerTEFContador.Enabled then
    exit;

  vRestante := 40 - Integer((GetTickCount - FContadorInicioTickTEF) div 1000);
  if vRestante <= 0 then
    FinalizarContadorTEF
  else
    FContadorSegundosTEF := vRestante;
end;

// Escreve a mensagem (com o sufixo "[N]" do contador, quando AContador <> 0)
// diretamente no lblTEFAviso da tela principal do PDV. S� deve ser chamada
// j� na main thread (ver doTEFExibirMensagem/FinalizarContadorTEF).
procedure TFrmPDV.doTEFAtualizarAviso(const AMsg: String; AContador: Integer);
begin
  if AContador = 0 then
    lblTEFAviso.Caption := AMsg
  else
    lblTEFAviso.Caption := AMsg + ' [' + AContador.ToString + ']';
  lblTEFAviso.Repaint;
end;

// Atualiza o lblTEFAviso com a mensagem e o valor atual do contador (o
// sufixo "[N]" some quando o valor for 0). Toda a regra de consulta (texto +
// quando/quanto contar) vive aqui. Auto-sincroniza com a main thread, pois �
// chamada diretamente de dentro da thread de trabalho (AtivarTEF, callbacks
// do ACBrTEFAPI1, tratamento de erro).
procedure TFrmPDV.doTEFExibirMensagem(const AMsg: String);
begin
  if TThread.CurrentThread.ThreadID <> MainThreadID then
  begin
    TThread.Synchronize(nil,
      procedure
      begin
        doTEFExibirMensagem(AMsg);
      end);
    exit;
  end;

  FMensagemTEF := AMsg;
  AtualizarContadorTEF;

  if TimerTEFContador.Enabled then
    doTEFAtualizarAviso(FMensagemTEF, FContadorSegundosTEF)
  else
    doTEFAtualizarAviso(FMensagemTEF, 0);
end;

procedure TFrmPDV.TimerTEFContadorTimer(Sender: TObject);
begin
  AtualizarContadorTEF;
  doTEFExibirMensagem(FMensagemTEF);
end;

procedure TFrmPDV.ACBrTEFAPI1QuandoExibirMensagem(const Mensagem: string; Terminal: TACBrTEFAPITela;
MilissegundosExibicao: Integer);
begin
  if (Mensagem = '') then
    exit;

  doTEFExibirMensagem(Mensagem);
end;

procedure TFrmPDV.ACBrTEFAPI1QuandoFinalizarOperacao(RespostaTEF: TACBrTEFResp);
var
  MsgFinal: String;
begin
  if TThread.CurrentThread.ThreadID <> MainThreadID then
  begin
    TThread.Synchronize(nil,
      procedure
      begin
        ACBrTEFAPI1QuandoFinalizarOperacao(RespostaTEF);
      end);
    exit;
  end;

  MsgFinal := RespostaTEF.TextoEspecialOperador;

  // Garante que a tela do QR Code do Pix n�o fique presa na tela, caso o TEF
  // n�o tenha enviado um QuandoExibirQRCode('') ao concluir a opera��o.
  FreeAndNil(FFrmTEFQRCode);
end;

// Pergunta ao operador um campo pedido pelo pr�prio TEF durante a transa��o
// (ex.: quantidade de parcelas, ap�s ACBrTEFAPI1QuandoPerguntarMenu perguntar
// se � � vista/parcelado). Validado := False deixa o pr�prio ACBrTEFAPI
// validar o conte�do (DefinicaoCampo.ValidacaoDado), como no demo oficial.
// Mesma thread de trabalho de QuandoPerguntarMenu -- precisa sincronizar
// com a main thread antes de mexer em VCL.
procedure TFrmPDV.ACBrTEFAPI1QuandoPerguntarCampo(DefinicaoCampo: TACBrTEFAPIDefinicaoCampo; var Resposta: string;
var Validado, Cancelado: Boolean);
var
  vResposta  : string;
  vCancelado : Boolean;
  DoPerguntar: TThreadProcedure;
begin
  vResposta  := Resposta;
  vCancelado := Cancelado;

  // Par�metros var/out (Resposta, Validado, Cancelado) n�o podem ser
  // capturados por um m�todo an�nimo (E2555) -- por isso o trabalho � feito
  // sobre as vari�veis locais vResposta/vCancelado, copiadas de volta no final.
  DoPerguntar := procedure
    var
      FormCampo: TFrmPDV_TEF_Campo;
    begin
      FormCampo := TFrmPDV_TEF_Campo.Create(self);
      try
        FormCampo.Titulo        := DefinicaoCampo.TituloPergunta;
        FormCampo.TamanhoMinimo := DefinicaoCampo.TamanhoMinimo;
        FormCampo.TamanhoMaximo := DefinicaoCampo.TamanhoMaximo;
        FormCampo.Ocultar       := DefinicaoCampo.OcultarDadosDigitados;
        FormCampo.TipoDeEntrada := DefinicaoCampo.TipoDeEntrada;
        FormCampo.Resposta      := DefinicaoCampo.ValorInicial;

        vCancelado := (FormCampo.ShowModal <> mrOK);
        if not vCancelado then
          vResposta := FormCampo.Resposta;
      finally
        FormCampo.Free;
      end;
    end;

  if TThread.CurrentThread.ThreadID <> MainThreadID then
    TThread.Synchronize(nil, DoPerguntar)
  else
    DoPerguntar();

  Resposta  := vResposta;
  Validado  := false;
  Cancelado := vCancelado;
end;

// Chamada a partir da thread de trabalho criada em doTEFConsultar/
// EfetuarPagamentoTEF (mesma thread que roda EfetuarPagamento/
// EfetuarAdministrativa) -- precisa sincronizar com a main thread antes de
// criar/exibir a tela, pois VCL n�o � thread-safe. Agora dispara em toda
// venda no cr�dito (ver EfetuarPagamentoTEF, que envia Financiamento
// indefinido para deixar o TEF perguntar � vista/parcelado/etc), n�o s�
// nos casos raros de antes.
procedure TFrmPDV.ACBrTEFAPI1QuandoPerguntarMenu(const Titulo: string; Opcoes: TStringList;
var ItemSelecionado: Integer);
var
  vItemSelecionado: Integer;
  DoPerguntar     : TThreadProcedure;
begin
  if (Opcoes.Count < 1) then
  begin
    ItemSelecionado := -1;
    exit;
  end;
  // if (Opcoes.Count = 2) then
  // begin
  // ItemSelecionado := 0;
  // exit;
  // end;

  vItemSelecionado := ItemSelecionado;

  // ItemSelecionado � par�metro var e n�o pode ser capturado por um m�todo
  // an�nimo (E2555) -- por isso o trabalho � feito sobre a vari�vel local
  // vItemSelecionado, copiada de volta no final.
  DoPerguntar := procedure
    var
      MR         : TModalResult;
      FormMenuTEF: TFrmPDV_TEF_Operacoes;
    begin
      FormMenuTEF := TFrmPDV_TEF_Operacoes.Create(self);
      try
        FormMenuTEF.Titulo            := Titulo;
        FormMenuTEF.Opcoes            := Opcoes;
        FormMenuTEF.UsaTeclasDeAtalho := (Copy(Opcoes[0], 1, 4) = '1 - ');
        FormMenuTEF.ItemSelecionado   := vItemSelecionado;

        MR := FormMenuTEF.ShowModal;

        case MR of
          mrOK:
            vItemSelecionado := FormMenuTEF.ItemSelecionado;
          mrRetry:
            vItemSelecionado := -2; // Voltar
        else
          vItemSelecionado := -1; // Cancelar
        end;
      finally
        FormMenuTEF.Free;
      end;
    end;

  if TThread.CurrentThread.ThreadID <> MainThreadID then
    TThread.Synchronize(nil, DoPerguntar)
  else
    DoPerguntar();

  ItemSelecionado := vItemSelecionado;
end;

// Recebe cada linha de log interno do TEF (comunica��o com o pinpad,
// protocolo, etc) e grava num arquivo pr�prio, �til para diagn�stico junto
// com o suporte da adquirente/ACBr. Tratado := true evita que o componente
// tamb�m tente gravar em ArqLOG (que n�o usamos).
procedure TFrmPDV.ACBrTEFAPI1QuandoGravarLog(const ALogLine: String; var Tratado: Boolean);
begin
  WriteLog(ApplicationPath + 'TEF_' + FormatDateTime('yyyymmdd', date) + '.log',
    FormatDateTime('dd/mm/yy hh:nn:ss:zzz', Now) + ' - ' + ALogLine);
  Tratado := true;
end;

// Disparado a cada transa��o individual finalizada dentro de uma opera��o do
// TEF (uma opera��o pode envolver mais de uma transa��o). A confirma��o do
// pagamento em si j� � tratada pelo retorno de EfetuarPagamentoTEF; aqui s�
// deixamos registro para diagn�stico.
procedure TFrmPDV.ACBrTEFAPI1QuandoFinalizarTransacao(RespostaTEF: TACBrTEFResp; AStatus: TACBrTEFStatusTransacao);
begin
  WriteLog(ApplicationPath + 'TEF_' + FormatDateTime('yyyymmdd', date) + '.log',
    FormatDateTime('dd/mm/yy hh:nn:ss:zzz', Now) + ' - Transa��o finalizada (' +
    GetEnumName(TypeInfo(TACBrTEFStatusTransacao), Integer(AStatus)) + '): NSU ' + RespostaTEF.NSU + ', Rede ' +
    RespostaTEF.Rede);
end;

// S� dispara quando ACBrTEFAPI1.TratamentoTransacaoPendente <> tefpenConfirmar
// (hoje configurado como tefpenConfirmar em ConfigurarTEF, ou seja, o ACBr j�
// confirma pend�ncias sozinho e esse evento n�o roda). Fica implementado como
// rede de seguran�a, reaproveitando a mesma tela de menu usada em
// ACBrTEFAPI1QuandoPerguntarMenu.
procedure TFrmPDV.ACBrTEFAPI1QuandoDetectarTransacaoPendente(RespostaTEF: TACBrTEFResp; const MsgErro: String);
var
  MR         : TModalResult;
  FormMenuTEF: TFrmPDV_TEF_Operacoes;
  AStatus    : TACBrTEFStatusTransacao;
  vOpcoes    : TStringList;
begin
  if TThread.CurrentThread.ThreadID <> MainThreadID then
  begin
    TThread.Synchronize(nil,
      procedure
      begin
        ACBrTEFAPI1QuandoDetectarTransacaoPendente(RespostaTEF, MsgErro);
      end);
    exit;
  end;

  FormMenuTEF := TFrmPDV_TEF_Operacoes.Create(self);
  vOpcoes     := TStringList.Create;
  try
    vOpcoes.Add('1 - Confirma��o Manual');
    vOpcoes.Add('2 - Estorno Manual');
    vOpcoes.Add('3 - Estorno, Falta de Energia');
    vOpcoes.Add('4 - Estorno, Erro na Impress�o');
    vOpcoes.Add('5 - Estorno, Erro no Dispensador');

    FormMenuTEF.Titulo            := 'Transa��o Pendente';
    FormMenuTEF.Opcoes            := vOpcoes;
    FormMenuTEF.UsaTeclasDeAtalho := true;
    FormMenuTEF.ItemSelecionado   := 0;

    MR := FormMenuTEF.ShowModal;
    if (MR = mrOK) then
    begin
      case FormMenuTEF.ItemSelecionado of
        0:
          AStatus := tefstsSucessoManual;
        1:
          AStatus := tefstsErroDiverso;
        2:
          AStatus := tefstsErroEnergia;
        3:
          AStatus := tefstsErroImpressao;
        4:
          AStatus := tefstsErroDispesador;
      else
        AStatus := tefstsSucessoManual;
      end;

      ACBrTEFAPI1.ResolverTransacaoPendente(AStatus);
    end;
  finally
    vOpcoes.Free;
    FormMenuTEF.Free;
  end;
end;

// Chamado periodicamente pelo TEF enquanto aguarda uma a��o (cart�o no
// pinpad, digita��o, etc), sempre na mesma thread de quem chamou
// EfetuarPagamento/EfetuarAdministrativa (a thread de trabalho criada em
// doTEFConsultar/EfetuarPagamentoTEF). S� consulta o flag setado pelo ESC do
// operador (ver FormKeyDown) -- n�o mexe em VCL, ent�o n�o precisa
// sincronizar com a main thread.
procedure TFrmPDV.ACBrTEFAPI1QuandoEsperarOperacao(OperacaoAPI: TACBrTEFAPIOperacaoAPI; var Cancelar: Boolean);
begin
  Cancelar := FCancelarTEF;
end;

// Exibe/atualiza o QR Code (Pix) numa tela pr�pria, criada dinamicamente.
// O TEF reenvia os mesmos dados enquanto aguarda o pagamento, e avisa que
// deve sumir mandando DadosQRCode = '' assim que o Pix for aprovado (ou
// cancelado) -- por isso a tela s� � criada uma vez e fechada nesse aviso.
procedure TFrmPDV.ACBrTEFAPI1QuandoExibirQRCode(const DadosQRCode: String);
begin
  if TThread.CurrentThread.ThreadID <> MainThreadID then
  begin
    TThread.Synchronize(nil,
      procedure
      begin
        ACBrTEFAPI1QuandoExibirQRCode(DadosQRCode);
      end);
    exit;
  end;

  if (DadosQRCode = '') then
  begin
    FreeAndNil(FFrmTEFQRCode);
    exit;
  end;

  if not Assigned(FFrmTEFQRCode) then
  begin
    FFrmTEFQRCode := TFrmPDV_TEF_QRCode.Create(self);
    FFrmTEFQRCode.Show;
  end;

  FFrmTEFQRCode.ExibirQRCode(DadosQRCode);
end;

procedure TFrmPDV.doTEFConsultar;
var
  vThread: TThread;
begin
  IniciarContadorTEF;
  FProcessandoTEF := true;
  FCancelarTEF    := false;

  // AtivarTEF/EfetuarAdministrativa s�o chamadas s�ncronas/bloqueantes; rodando
  // numa thread separada a main thread (e sua fila de mensagens) fica livre.
  // doTEFExibirMensagem se auto-sincroniza com a main thread. Enquanto essa
  // thread roda, o operador pode cancelar com ESC (ver FormKeyDown), lido
  // por ACBrTEFAPI1QuandoEsperarOperacao.
  vThread := TThread.CreateAnonymousThread(
    procedure
    begin
      try
        try
          AtivarTEF;
          // ACBrTEFAPI1.EfetuarAdministrativa(tefopTesteComunicacao);
          // if FCancelarTEF then
          // doTEFExibirMensagem('Ativa��o do TEF cancelada pelo operador.')
          // else if ACBrTEFAPI1.UltimaRespostaTEF.Sucesso then
          // doTEFExibirMensagem('TEF iniciado com sucesso.')
          // else
          // begin
          // if (ACBrTEFAPI1.UltimaRespostaTEF.TextoEspecialOperador <> '') then
          // doTEFExibirMensagem('Erro ao iniciar TEF');
          // end;
        except
          on e: exception do
            doTEFExibirMensagem('Falha ao ativar TEF' + sLineBreak + e.Message);
        end;
      finally
        FProcessandoTEF := false;
      end;

      FinalizarContadorTEF;
    end);
  vThread.FreeOnTerminate := true;
  vThread.Start;
end;

// Efetua a cobran�a em cart�o no PinPad via ACBrTEFAPI1.EfetuarPagamento,
// mostrando o andamento em lblTEFAviso. D�bito vai sempre � vista (n�o
// parcela); no cr�dito, o Financiamento � enviado como "N�o Definido" e as
// Parcelas como 0, para que o pr�prio TEF pergunte ao operador -- via
// ACBrTEFAPI1QuandoPerguntarMenu (� vista/parcelado/etc) e depois
// ACBrTEFAPI1QuandoPerguntarCampo (quantidade de parcelas) -- exatamente como
// no demo oficial do ACBr. Bloqueia a thread chamadora (a main thread,
// chamada a partir de doConfirmaPagamento) com um la�o de
// Application.ProcessMessages, que continua bombeando as mensagens
// necess�rias pro TThread.Synchronize da thread de trabalho funcionar.
function TFrmPDV.EfetuarPagamentoTEFComum(const ANumeroFiscal: String; AValor: Currency;
AModalidade: TACBrTEFModalidadePagamento; ACartoesAceitos: TACBrTEFTiposCartao;
AFinanciamento: TACBrTEFModalidadeFinanciamento; AParcelas: Byte): Boolean;
var
  vThread        : TThread;
  vConcluido, vOk: Boolean;
begin
  result := false;
  if FProcessandoTEF then
    exit;

  FProcessandoTEF      := true;
  FCancelarTEF         := false;
  vConcluido           := false;
  vOk                  := false;
  edValorForma.Enabled := false;
  try
    doTEFExibirMensagem('Processando pagamento...');

    vThread := TThread.CreateAnonymousThread(
      procedure
      begin
        try
          vOk := ACBrTEFAPI1.EfetuarPagamento(ANumeroFiscal, AValor, AModalidade, ACartoesAceitos, AFinanciamento,
            AParcelas);
          vOk := vOk and ACBrTEFAPI1.UltimaRespostaTEF.Sucesso and ACBrTEFAPI1.UltimaRespostaTEF.TransacaoAprovada;
        except
          on e: exception do
          begin
            vOk := false;
            doTEFExibirMensagem('Falha na transa��o TEF' + sLineBreak + e.Message);
          end;
        end;
        vConcluido := true;
      end);
    vThread.FreeOnTerminate := true;
    vThread.Start;

    while not vConcluido do
      Application.ProcessMessages;

    result := vOk;
    if vOk then
      doTEFExibirMensagem('Pagamento aprovado.')
    else if FCancelarTEF then
      doTEFExibirMensagem('Pagamento cancelado pelo operador.')
    else
      doTEFExibirMensagem('Pagamento n�o aprovado.');
  finally
    FreeAndNil(FFrmTEFQRCode);
    edValorForma.Enabled := true;
    FProcessandoTEF      := false;
  end;
end;

function TFrmPDV.EfetuarPagamentoTEF(const ANumeroFiscal: String; AValor: Currency; ACartaoDebito: Boolean): Boolean;
var
  vCartoesAceitos: TACBrTEFTiposCartao;
  vFinanciamento : TACBrTEFModalidadeFinanciamento;
  vParcelas      : Byte;
begin
  if ACartaoDebito then
  begin
    vCartoesAceitos := [teftcDebito];
    vFinanciamento  := tefmfAVista;
    vParcelas       := 1;
  end
  else
  begin
    vCartoesAceitos := [teftcCredito];
    vFinanciamento  := tefmfNaoDefinido;
    vParcelas       := 0;
  end;

  result := EfetuarPagamentoTEFComum(ANumeroFiscal, AValor, tefmpCartao, vCartoesAceitos, vFinanciamento, vParcelas);
end;

// Recebimento via Pix no TEF (QR Code). Modalidade tefmpCarteiraVirtual n�o usa
// CartoesAceitos; a exibi��o/atualiza��o do QR Code chega pelo callback
// ACBrTEFAPI1QuandoExibirQRCode, j� tratado por EfetuarPagamentoTEFComum (que
// fecha FFrmTEFQRCode ao final, como no d�bito/cr�dito).
function TFrmPDV.EfetuarPagamentoTEFPix(const ANumeroFiscal: String; AValor: Currency): Boolean;
begin
  result := EfetuarPagamentoTEFComum(ANumeroFiscal, AValor, tefmpCarteiraVirtual, [], tefmfAVista, 0);
end;

// Confirma (CNF) a �ltima transa��o TEF autorizada, ap�s o cupom fiscal ter
// sido emitido com sucesso. Chamada pelo hook AAntesImprimir de
// doNFFechamento, antes da impress�o do DANFE/comprovante -- ver
// doConfirmaPagamento em uPDV_NF.pas.
procedure TFrmPDV.ConfirmarTransacaoTEF;
begin
  ACBrTEFAPI1.FinalizarTransacao(tefstsSucessoAutomatico);
  goTEFPnfp_idPendente := 0;
end;

// Desfaz (NCN) a transa��o TEF autorizada e ainda n�o confirmada
// (goTEFPnfp_idPendente). N�o � mais chamada automaticamente s� porque o
// cupom fiscal falhou em fechar -- a autoriza��o fica pendente at� o
// pagamento ser exclu�do da lstListFormas ou a venda ser cancelada (fun��o
// 202), que s�o os �nicos pontos que efetivamente chamam este m�todo -- ver
// doConfirmaPagamento em uPDV_NF.pas, o handler VK_DELETE em uFrmPDV.pas e
// doSetModoCancela em uPDV_SetModos.pas. Mais leve que EstornarTransacaoTEF
// (que faz um estorno completo junto � adquirente): como a transa��o nunca
// chegou a ser confirmada, n�o h� o que estornar.
procedure TFrmPDV.DesfazerTransacaoTEF;
begin
  ACBrTEFAPI1.FinalizarTransacao(tefstsErroDiverso);
  goTEFPnfp_idPendente := 0;
end;

// Estorna uma transa��o TEF j� aprovada, usado quando o pagamento no cart�o
// foi aceito mas a venda n�o pôde ser gravada/finalizada localmente (ver
// doConfirmaPagamento em uPDV_NF.pas) -- evita cobrar o cliente sem
// contrapartida fiscal. Chamada s�ncrona na main thread, sem tela pr�pria,
// mesmo padr�o usado pelo demo oficial do ACBr em btCancelarUltimaClick.
function TFrmPDV.EstornarTransacaoTEF(const ANSU, ACodigoAutorizacao, ARede, AFinalizacao: String; ADataHora: TDateTime;
AValor: Double): Boolean;
begin
  result := false;
  doTEFExibirMensagem('Estornando transa��o TEF (venda n�o finalizada)...');
  try
    result := ACBrTEFAPI1.CancelarTransacao(ANSU, ACodigoAutorizacao, ADataHora, AValor, AFinalizacao, ARede) and
      ACBrTEFAPI1.UltimaRespostaTEF.Sucesso;
  except
    result := false;
  end;

  if result then
    doTEFExibirMensagem('Estorno TEF realizado com sucesso.')
  else
    MessageBox(handle, PChar('ATEN��O: falha ao estornar automaticamente a transa��o TEF (NSU ' + ANSU +
      '). Verifique manualmente com a adquirente.'), 'I9 PDV', MB_ICONERROR);
end;

procedure TFrmPDV.doSATLoad;
var
  loEmitRegTrib: Integer;
begin
  if not goTerminal.pterm_sat then
    exit;

  FrmPDV_DModule.cdsEmpresa.open
    ('SELECT a.* FROM v_empresa a, t_users_empresas b WHERE a.em_codigo =b.em_codigo AND b.us_codigo = ' +
    FrmPDV_DModule.User.UserId);
  if FrmPDV_DModule.cdsEmpresa.FieldByName('em_simples_nacional').AsInteger = 1 then
    loEmitRegTrib := 0
  else
    loEmitRegTrib := 1;

  if not Assigned(FrmPDV_SAT) then
    FrmPDV_SAT := TFrmPDV_SAT.Create(self);

  FrmPDV_SAT.goTEFResp := ACBrTEFAPI1.RespostasTEF;
  FrmPDV_SAT.doSATStart(handle, goTerminal.pterm_sat_codigo_ativacao,   //
    goTerminal.pterm_sat_assinatura,                                    //
    goTerminal.pterm_numero,                                            //
    0,                                                                  // 0-taProducao;1-taHomologacao
  cSwHCNPJ,                                                             //
    FrmPDV_DModule.cdsEmpresa.FieldByName('em_cnpj').AsString,          //
    FrmPDV_DModule.cdsEmpresa.FieldByName('em_ie').AsString,            //
    FrmPDV_DModule.cdsEmpresa.FieldByName('em_inscmunicipal').AsString, //
    loEmitRegTrib,                                                      //
    6,                                                                  //
    1,                                                                  //
    goTerminal.pterm_sat_versao_cfe,                                    //
    true,                                                               //
    true,                                                               //
    true,                                                               //
    true,                                                               //
    true,                                                               //
    goTerminal.pterm_sat_input,                                         //
    goTerminal.pterm_sat_output,                                        //
    goTerminal.pterm_sat_timeout,                                       //
    goTerminal.Impressora.pimp_modelo,                                  //
    goTerminal.Impressora.pimp_port,                                    //
    goTerminal.Impressora.pimp_baud,                                    //
    goTerminal.Impressora.pimp_data,                                    //
    goTerminal.Impressora.pimp_parity,                                  //
    goTerminal.Impressora.pimp_stop,                                    //
    goTerminal.Impressora.pimp_handshake,                               //
    goTerminal.Impressora.pimp_hardflow,                                //
    goTerminal.Impressora.pimp_softflow, goTerminal.Impressora.pimp_colunas, goTerminal.Impressora.pimp_linhas,
    goTerminal.Impressora.pimp_espacos);
end;

procedure TFrmPDV.doSATSendAllPays;
var
  loSATSendPayCFe        : TWiBiRespostaValidador;
  loSendFiscalResponseCFe: TRetornoRespostaFiscal;
begin
  try
    with FrmPDV_DModule_DS do
    begin
      fdPagamentosAll.close;
      fdPagamentosAll.active := true;
      while not fdPagamentosAll.Eof do
      begin
        if not Assigned(FrmPDV_SAT) then
          FrmPDV_SAT := TFrmPDV_SAT.Create(self);

        loSATSendPayCFe := FrmPDV_SAT.doSendPayCFe(fdPagamentosAll.FieldByName('pnf_numero_fiscal').AsInteger,
          goTerminal.pterm_pos_chave_validador, //
          fdPagamentosAll.FieldByName('pnfp_chave_requisicao').AsString,
        // goTerminal.pterm_pos_chave_requisicao, // );
        fdPagamentosAll.FieldByName('pnfp_merchant_id').AsString,    //
          fdPagamentosAll.FieldByName('pnfp_serial_pos').AsString,   //
          FrmPDV_DModule.cdsEmpresa.FieldByName('em_cnpj').AsString, //
          fdPagamentosAll.FieldByName('pnfp_pos_valor').AsCurrency,  //
          fdPagamentosAll.FieldByName('pnfp_pos_valor').AsCurrency,  //
          true,                                                      //
          false);

        if loSATSendPayCFe <> nil then
        begin
          if loSATSendPayCFe.IDPagamento > 0 then
          begin
            FrmPDV_DModule.ADConnection1.ExecSQL
              ('update pdv.tb_nota_fiscal_pag set pnfp_pos_id_local=0,pnfp_pos_id_pagamento = ' +
              QuotedStr(IntToStr(loSATSendPayCFe.IDPagamento)) + ' where pnfp_id = ' +
              fdPagamentosAll.FieldByName('pnfp_id').AsString);

            if not Assigned(FrmPDV_SAT) then
              FrmPDV_SAT := TFrmPDV_SAT.Create(self);

            loSendFiscalResponseCFe := FrmPDV_SAT.doSendFiscalResponseCFe( //
              goTerminal.pterm_pos_chave_validador,                        //
              fdPagamentosAll.FieldByName('pnf_chave').AsString,           //
              FrmPDV_DModule.cdsEmpresa.FieldByName('em_cnpj').AsString,   //
              fdPagamentosAll.FieldByName('pnfp_pos_id_fila').AsString,    //
              fdPagamentosAll.FieldByName('pnfp_pos_codigo_aut').AsString, //
              fdPagamentosAll.FieldByName('pnfp_pos_tipo').AsString,       //
              fdPagamentosAll.FieldByName('pnfp_pos_inst_financeira').AsString,
            //
              '',                                                        //
              fdPagamentosAll.FieldByName('pnf_numero_fiscal').AsString, //
              fdPagamentosAll.FieldByName('pnfp_pos_id_fila').AsInteger);

            FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal_pag set pnfp_id_resposta_fiscal = ' +
              QuotedStr(loSendFiscalResponseCFe.IdRespostaFiscal) + ' where pnfp_id = ' +
              fdPagamentosAll.FieldByName('pnfp_id').AsString);
          end;
        end;

        fdPagamentosAll.Next;
      end;
    end;
  finally
  end;
end;

initialization

ReportMemoryLeaksOnShutdown := false;

end.
