unit uRepPadraoNoChart;

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
  cxGraphics,
  cxControls,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  StdCtrls,
  jpeg,
  ExtCtrls,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  DB,
  cxDBData,
  cxGridCustomPopupMenu,
  cxGridPopupMenu,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  uWiProfileGrid,
  cxPropertiesStore,
  ComCtrls,
  ToolWin,
  uWiServerPrint,
  uSimThread,
  uWiDevExprRB,
  ppBands,
  ppClass,
  ppReport,
  ppStrtch,
  ppSubRpt,
  ppCtrls,
  ppVar,
  ppPrnabl,
  ppCache,
  ppComm,
  ppRelatv,
  ppProd,
  ppDB,
  ppDBPipe,
  ppDBBDE,
  ppMemo,
  cxCalendar,
  uWiDateSelect,
  cxPC,
  cxGridChartView,
  cxGridDBChartView,
  DBClient,
  cxCurrencyEdit,
  uSCDSource,
  dxPSGlbl,
  dxPSUtl,
  dxPSEngn,
  dxPrnPg,
  dxBkgnd,
  dxWrap,
  dxPrnDev,
  dxPSCompsProvider,
  dxPSFillPatterns,
  dxPSEdgePatterns,
  dxPSCore,
  dxPScxCommon,
  dxPgsDlg,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxPSPDFExportCore,
  dxPSPDFExport,
  cxDrawTextUtils,
  dxPSPrVwStd,
  dxPSPrVwAdv,
  dxPSPrVwRibbon,
  dxPScxEditorProducers,
  dxPScxExtEditorProducers,
  dxPScxPageControlProducer,
  ppParameter,
  cxPCdxBarPopupMenu, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxCore, cxDateUtils, dxBarBuiltInMenu, cxNavigator,
  dxSkinsCore, dxSkinBlue, dxSkiniMaginary, dxSkinMoneyTwins,
   dxSkinOffice2010Silver, dxSkinscxPCPainter,
  dxSkinWhiteprint, dxSkinCaramel, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, dxPSdxDBOCLnk, dxSkinOffice2013White,
  dxSkinDevExpressStyle, ppDesignLayer, WibiSkins;

type
  TRepPadraoNoChart = class(TForm)
    cxGridPopupMenu1: TcxGridPopupMenu;
    WiProfileGrid1: TWiProfileGrid;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    btnMostrar: TToolButton;
    WiServerPrint1: TWiServerPrint;
    ppReport: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel36: TppLabel;
    lblTituloModulo: TppLabel;
    lblTituloReport: TppLabel;
    ppDBText24: TppDBText;
    ppSystemVariable3: TppSystemVariable;
    ppLine11: TppLine;
    lblDataReportPE: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine12: TppLine;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    lblMensagemPE: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppReportDB: TppBDEPipeline;
    lblReportID: TppLabel;
    Label3: TLabel;
    WiDateSelect1: TWiDateSelect;
    edDataInicial: TcxDateEdit;
    Label1: TLabel;
    edDataFinal: TcxDateEdit;
    Label2: TLabel;
    lblFiltro: TppLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cdsChart: TClientDataSet;
    doChart: TDataSource;
    cpChart: TdxComponentPrinter;
    cpChartPrinterContasReceber: TdxGridReportLink;
    psmChart: TdxPrintStyleManager;
    psmChartStyle1: TdxPSPrintStyle;
    pnTopTitle: TPanel;
    Label35: TLabel;
    lblTitleTop: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure WiServerPrint1ExecutePrint(Preview: Boolean);
    function GetFilterExpression: string;
    function GetFilterCaption: string;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    {Private declarations}
  protected
    procedure DoPrint(Preview: Boolean);
  end;

var
  RepPadraoNoChart: TRepPadraoNoChart;

implementation

uses
  uFrmDModule,
  uGlobalLibWiBi;
{$R *.dfm}

procedure TRepPadraoNoChart.FormActivate(Sender: TObject);
begin
  {Passamos ao menu principal qual o datasource ativo}
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);
  WiServerPrint1.SendCommModePrint(MainHandle, false, false);

end;

procedure TRepPadraoNoChart.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := ',';
  FormatSettings.ThousandSeparator := '.';
end;

procedure TRepPadraoNoChart.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  LFocusComp: TComponent;
begin
  LFocusComp := GetFocusedComponent(self);

  case Key of
    VK_ESCAPE:
      begin
        if ActiveControl <> nil then
          ActiveControl.SetFocus;

      end;
    VK_F2:
      ;
    VK_F3:
      ;
    VK_INSERT:
      ;
    VK_DELETE:
      ;
    VK_BACK:
      ;
    VK_F5:
      ;
    83:
      ; {S}
    69:
      ; {E}
    VK_RETURN:
      begin
        if (ActiveControl is TButtonControl) then
          Key := 0;

        if (LFocusComp is TcxCustomLookupComboBox) then
          if TcxCustomLookupComboBox(LFocusComp).DroppedDown then
            exit;

        Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_UP:
      begin
        if (LFocusComp is TcxCustomLookupComboBox) then
          if TcxCustomLookupComboBox(LFocusComp).DroppedDown then
            exit
          else
            Key := 0;

        // Perform(WM_NEXTDLGCTL, 1, 1);
      end;
    VK_DOWN:
      ;

  end;
end;

procedure TRepPadraoNoChart.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TRepPadraoNoChart.FormShow(Sender: TObject);
begin
  {Passamos ao menu principal qual o datasource ativo}
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);
  WiServerPrint1.SendCommModePrint(MainHandle, false, false);
  WiProfileGrid1.LoadProfile(StrToInt(FrmDModule.User.UserId));

  // BevelPrintRetrato.Top := 0;
  // BevelPrintRetrato.Height := Panel1.Height;
  //
  // BevelPrintPaisagem.Top := 0;
  // BevelPrintPaisagem.Height := Panel1.Height;
end;

procedure TRepPadraoNoChart.WiServerPrint1ExecutePrint(Preview: Boolean);
begin
  DoPrint(Preview);
end;

function TRepPadraoNoChart.GetFilterExpression: string;
begin
  GetFilterExpression := cxGrid1DBTableView1.DataController.Filter.FilterText;
end;

function TRepPadraoNoChart.GetFilterCaption: string;
begin
  GetFilterCaption := cxGrid1DBTableView1.DataController.Filter.FilterCaption;
end;

procedure TRepPadraoNoChart.DoPrint(Preview: Boolean);
begin
  lblDataReportPE.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', ServerDateTime);
  lblMensagemPE.Caption := ' | IMPRESSO POR:' + FrmDModule.User.UserId + ' - ' + FrmDModule.User.Name +
    ' | COLIGADA: ' + ServerColigadaDescr + ' | EMPRESA: ' + ServerEmpresaDescr + ' |';
  lblFiltro.Width := ppReport.Printer.PrintableWidth;
  // ppHeaderBand2.Height := 96 + lblFiltro.Height;
  if Preview then
    ppReport.DeviceType := 'Screen'
  else
    ppReport.DeviceType := 'Printer';
  ppReport.ModalPreview := True;
  ppReport.Print;
end;

end.
