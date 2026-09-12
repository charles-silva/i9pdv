unit uRepPadrao;

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
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxPCdxBarPopupMenu,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers,
  dxPgsDlg, dxPSCore, dxPScxCommon, DBClient, ppDB,
  ppParameter, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, cxPropertiesStore,
  cxGridCustomPopupMenu, cxGridPopupMenu,
  cxGridChartView, cxGridDBChartView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  uWiServerPrint, cxDropDownEdit, cxCalendar, uWiDateSelect, ComCtrls,
  ToolWin, uWiProfileGrid, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, jpeg, ExtCtrls, uSCDSource,
  cxCurrencyEdit, AdvPanel, ShellAPI,
  Menus, cxButtons, dxGDIPlusClasses, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, dxCore,
  cxDateUtils, dxBarBuiltInMenu, cxNavigator, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, AdvMenus, AdvToolBar, uGlobalLibWiBi,
  FireDAC.Stan.Async, FireDAC.DApt, uWiFDQuery, dxSkinDevExpressDarkStyle,
  dxSkinBlack, dxSkinDevExpressStyle, dxSkinWhiteprint, ppDesignLayer, WibiSkins, dxPSPrVwAdv, dxPScxPageControlProducer, dxPSPrVwRibbon,
  dxPScxExtEditorProducers, ppDBPipe, ppDBBDE;

type
  TRepPadrao = class(TForm)
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
    cxTabSheet2: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBChartView1: TcxGridDBChartView;
    cxGrid2Level1: TcxGridLevel;
    cdsChart: TClientDataSet;
    doChart: TDataSource;
    pnFilterCaption: TPanel;
    lblFilterCaption: TLabel;
    cpChart: TdxComponentPrinter;
    cpChartPrinterContasReceber: TdxGridReportLink;
    psmChart: TdxPrintStyleManager;
    psmChartStyle1: TdxPSPrintStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStylePadraoRep: TcxStyle;
    pnTopTitle: TPanel;
    Label35: TLabel;
    lblTitleTop: TLabel;
    ppLabelMenuAddress: TppLabel;
    ppFilterGrid: TppLabel;
    Panel3: TPanel;
    imgVideo: TImage;
    imgAjuda: TImage;
    lblAjuda: TLabel;
    lblVideo: TLabel;
    bvTop: TBevel;
    AdMemTableChart: TFDMemTable;
    dkPanelPerfisReport: TAdvDockPanel;
    ToolBarPerfilReport: TAdvToolBar;
    btnMenuPerfisReport: TAdvToolBarButton;
    popMenuPerfisReport: TAdvPopupMenu;
    ModelosSimatech2: TMenuItem;
    Pessoais2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure WiServerPrint1ExecutePrint(Preview: Boolean);
    function GetFilterExpression: string;
    function GetFilterCaption: string;
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure btnMostrarClick(Sender: TObject);
    procedure WiProfileGrid1ChangePerfil(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerSummaryAfterSummary(ASender: TcxDataSummary);
    procedure cxGrid1DBTableView1DataControllerGroupingChanged(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerSortingChanged(Sender: TObject);
    procedure cxGrid1DBTableView1ColumnPosChanged(Sender: TcxGridTableView; AColumn: TcxGridColumn);
    procedure cxGrid1DBTableView1DataControllerFilterChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnMenuPerfisReportClick(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerFilterFormatFilterTextValue(Sender: TcxDBDataFilterCriteria; AItem: TcxFilterCriteriaItem; const AValue: Variant; var ADisplayValue: string);
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadChartSeries;
    procedure LoadChartGroups;
    procedure SeriesValueClick(Sender: TcxGridChartView; ASeries: TcxGridChartSeries; AValueIndex: Integer; var AHandled: Boolean);
    procedure SortSeries;
    function FormatFilterDate(aFilterText: string): string;

    { Private declarations }
  protected
    FWhereSQL: String;
    procedure doSendPDFExcelComm;
  public
    function DoFiltrar(aWhereSQL: String): Integer;
    procedure DoPrint(Preview: Boolean; const APDF: Boolean = false);
    procedure DoImprimir(aPreview: Boolean);

  end;

var
  RepPadrao: TRepPadrao;

implementation

uses
  uFrmDModule;
{$R *.dfm}

procedure TRepPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
      ; { S }
    69:
      ; { E }
    VK_RETURN:
      begin
        if (ActiveControl is TButtonControl) then
          Key := 0;

        if (LFocusComp is TcxCustomLookupComboBox) then
          if TcxCustomLookupComboBox(LFocusComp).DroppedDown then
            exit;

        if LFocusComp = edDataFinal then
          btnMostrar.Click;

        Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_UP:
      begin
        if (LFocusComp is TcxCustomLookupComboBox) then
          if TcxCustomLookupComboBox(LFocusComp).DroppedDown then
            exit
          else
            Key := 0;

        // Perform(WM_NEXTDLGCTL, -1, 0);
      end;
    VK_DOWN:
      ;

  end;
end;

procedure TRepPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TRepPadrao.FormShow(Sender: TObject);
begin
  { Passamos ao menu principal qual o datasource ativo }
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);

  WiProfileGrid1.LoadProfile(StrToInt(FrmDModule.User.UserId));
  WiProfileGrid1.Top := 1000;
  LoadChartSeries;
  LoadChartGroups;
  // BevelPrintRetrato.Top := 0;
  // BevelPrintRetrato.Height := Panel1.Height;
  //
  // BevelPrintPaisagem.Top := 0;
  // BevelPrintPaisagem.Height := Panel1.Height;

end;

procedure TRepPadrao.WiProfileGrid1ChangePerfil(Sender: TObject);
begin
  LoadChartSeries;
  LoadChartGroups;
end;

procedure TRepPadrao.WiServerPrint1ExecutePrint(Preview: Boolean);
begin
  DoPrint(Preview);
end;

procedure TRepPadrao.FormActivate(Sender: TObject);
begin
  inherited;
  doSendPDFExcelComm;

  { Passamos ao menu principal qual o datasource ativo }
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);
  WiServerPrint1.SendCommModePrint(MainHandle, True, True);
end;

function TRepPadrao.FormatFilterDate(aFilterText: string): string;
var
  I     : Integer;
  LStart: Integer;
  LEnd  : Integer;
begin

  LStart := 0;
  LEnd   := 0;
  I      := 0;
  while (I < Length(aFilterText) - 1) do
  begin
    inc(I);
    if (Copy(aFilterText, I, 1) = '/') and (I > 2) and (LStart = 0) then
      if IsNumeric(Copy(aFilterText, I - 2, 2)) then
      begin
        LStart := I - 2;
        continue;
      end;

    if (Copy(aFilterText, I, 1) = '/') and (LStart > 0) then
      if (Length(Trim(Copy(aFilterText, I + 1, 4))) = 4) and IsNumeric(Copy(aFilterText, I + 1, 4)) then
      begin
        LEnd := I + 4;
        inc(I, 4);
      end;

    if (LStart > 0) and (LEnd > 0) then
    begin
      Insert(Chr(39), aFilterText, LStart);
      Insert(Chr(39), aFilterText, LEnd + 2);
      LStart := 0;
      LEnd   := 0;
    end;

  end;

  Result := aFilterText;
end;

procedure TRepPadrao.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to self.ComponentCount - 1 do
  begin
    if (Components[I] is TFDQuery) then
      TFDQuery(Components[I]).Active := false;
  end;
end;

function TRepPadrao.GetFilterExpression: string;
var
  I              : Integer;
  LcxDBGridColumn: TcxGridDBColumn;
  LFilterText    : String;
begin
  LFilterText := cxGrid1DBTableView1.DataController.Filter.FilterText;
  for I       := 0 to cxGrid1DBTableView1.VisibleColumnCount - 1 do
  begin
    if cxGrid1DBTableView1.VisibleColumns[I] is TcxGridDBColumn then
    begin
      LcxDBGridColumn := TcxGridDBColumn(cxGrid1DBTableView1.VisibleColumns[I]);
      LFilterText     := StringReplace(LFilterText, LcxDBGridColumn.DataBinding.FieldName, '[' + LcxDBGridColumn.DataBinding.FieldName + ']', [rfReplaceAll]);
    end;
  end;

  Result := LFilterText;
end;

function TRepPadrao.GetFilterCaption: string;
begin
  Result := cxGrid1DBTableView1.DataController.Filter.FilterCaption;
end;

procedure TRepPadrao.btnMenuPerfisReportClick(Sender: TObject);
begin
  btnMenuPerfisReport.DropdownMenu.Popup(btnMenuPerfisReport.ClientOrigin.X, btnMenuPerfisReport.ClientOrigin.Y + btnMenuPerfisReport.Height);
end;

procedure TRepPadrao.btnMostrarClick(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TRepPadrao.cxGrid1DBTableView1ColumnPosChanged(Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  LoadChartSeries;
end;

procedure TRepPadrao.cxGrid1DBTableView1DataControllerFilterChanged(Sender: TObject);
begin
  cdsChart.Filter   := cxGrid1DBTableView1.DataController.Filter.FilterText;
  cdsChart.Filtered := True;

  lblFilterCaption.Caption := GetFilterCaption;
  pnFilterCaption.Visible  := (lblFilterCaption.Caption <> '');
end;

procedure TRepPadrao.cxGrid1DBTableView1DataControllerFilterFormatFilterTextValue(Sender: TcxDBDataFilterCriteria; AItem: TcxFilterCriteriaItem; const AValue: Variant; var ADisplayValue: string);
var
  LColumn: TcxGridDBColumn;
begin
  LColumn := TcxGridDBColumn(AItem.ItemLink);
  if LColumn.DataBinding.Field = nil then
    exit;
  case LColumn.DataBinding.Field.DataType of
    ftCurrency, ftBCD, ftFloat, ftExtended, ftFMTBcd:
      ADisplayValue := StringReplace(StringReplace(AValue, '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]);
  else
    ADisplayValue := ADisplayValue;
  end;

end;

procedure TRepPadrao.cxGrid1DBTableView1DataControllerGroupingChanged(Sender: TObject);
begin
  LoadChartGroups;
end;

procedure TRepPadrao.SeriesValueClick(Sender: TcxGridChartView; ASeries: TcxGridChartSeries; AValueIndex: Integer;

  var AHandled: Boolean);
begin
  inherited;
end;

procedure TRepPadrao.cxGrid1DBTableView1DataControllerSortingChanged(Sender: TObject);
begin
  SortSeries;
end;

procedure TRepPadrao.cxGrid1DBTableView1DataControllerSummaryAfterSummary(ASender: TcxDataSummary);
begin
  LoadChartSeries;
end;

procedure TRepPadrao.cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;

  var AllowChange: Boolean);
var
  I     : Integer;
  Lcount: Integer;
begin
  if NewPage.PageIndex = 1 then
  begin
    Lcount := 0;
    for I  := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
      if (cxGrid1DBTableView1.Columns[I].GroupIndex = -1) and (cxGrid1DBTableView1.Columns[I].Visible) then
        inc(Lcount);

    if Lcount > 4 then
      AllowChange := (MessageBox(handle, 'Existem mais de 4 colunas à serem exibidas no gráfico, isso pode levar algum tempo de processamento. Confirmar operação?', 'WiBi - Comercial',
        MB_ICONQUESTION + MB_YESNO) = IDYES);

    Lcount := 0;
    for I  := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
      if (cxGrid1DBTableView1.Columns[I].GroupIndex = -1) and (cxGrid1DBTableView1.Columns[I].Visible) then
        if (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Smallint')) and (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Integer')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Word')) and (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Float')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Currency')) and (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'LargeInt')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'FMTBcd')) then
          inc(Lcount);

    if Lcount > 0 then
    begin
      MessageBox(handle, 'Somente campos númericos podem ser utilizados no gráfico para demonstração de resultados, os demais apenas podem ser utilizados no agrupamento.', 'WiBi - Comercial',
        MB_ICONEXCLAMATION);
      AllowChange := false;
      exit;
    end;
    SortSeries;
    // if cxGrid1DBTableView1.DataController.DataSource.DataSet is TWiFDQuery then
    // cdsChart.Data := (cxGrid1DBTableView1.DataController.DataSource.DataSet as TWiFDQuery).Data;

    if cxGrid1DBTableView1.DataController.DataSource.DataSet is TFDRdbmsDataSet then
    begin
      if AdMemTableChart.Active then
        AdMemTableChart.EmptyDataSet;
      AdMemTableChart.Close;
      AdMemTableChart.Data := (cxGrid1DBTableView1.DataController.DataSource.DataSet as TFDRdbmsDataSet).Data;
      doChart.DataSet      := AdMemTableChart;
    end;
  end;
end;

function TRepPadrao.DoFiltrar(aWhereSQL: String): Integer;
begin
  FWhereSQL := aWhereSQL;
  btnMostrar.Click;
end;

procedure TRepPadrao.DoImprimir(aPreview: Boolean);
begin
  if Assigned(WiServerPrint1.OnExecutePrint) then
    WiServerPrint1.OnExecutePrint(aPreview);
end;

procedure TRepPadrao.doSendPDFExcelComm;
var
  lParam: Integer;
  LTitle: string;
begin
  LTitle := StringReplace(StringReplace(self.Caption, ' ', '_', [rfReplaceAll]), '/', '', [rfReplaceAll]);
  lParam := Integer(SetExportPDF(WiServerPrint1.handle, pWideChar(LTitle + '_' + FormatDateTime('dd_mm_yyyy', ServerDateTime))));
  SendMessage(MainHandle, SIM_DEFINEGRID, Integer(cxGrid1), lParam);
end;

procedure TRepPadrao.DoPrint(Preview: Boolean; const APDF: Boolean = false);
var
  LTitulo: string;
begin
  case cxPageControl1.ActivePageIndex of
    0:
      begin
        lblDataReportPE.Caption    := FormatDateTime('dd/mm/yyyy hh:nn:ss', ServerDateTime);
        lblMensagemPE.Caption      := ' | IMPRESSO POR:' + FrmDModule.User.UserId + ' - ' + FrmDModule.User.Name + ' | EMPRESA: ' + ServerEmpresaDescr + ' |';
        lblFiltro.Width            := ppReport.Printer.PrintableWidth;
        ppLabelMenuAddress.Caption := lblTitleTop.Caption;
        ppFilterGrid.Caption       := GetFilterCaption;
        if APDF then
        begin
          ppReport.AllowPrintToArchive := True;
          ppReport.AllowPrintToFile    := True;
          ppReport.ShowPrintDialog     := false;
          ppReport.TextFileName        := StringReplace(StringReplace(self.Caption, ' ', '_', [rfReplaceAll]), '/', '', [rfReplaceAll]) + '.pdf';
          ppReport.DeviceType          := 'PDF';
          ppReport.Print;
          ShellExecute(0, 'open', pChar(ppReport.TextFileName), nil, nil, 1);
        end
        else
        begin
          // ppHeaderBand2.Height := 96 + lblFiltro.Height;
          if Preview then
            ppReport.DeviceType := 'Screen'
          else
            ppReport.DeviceType    := 'Printer';
          ppReport.ShowPrintDialog := True;
          ppReport.ModalPreview    := True;
          ppReport.Print;
        end;
      end;
    1:
      begin
        LTitulo := lblFiltro.Caption;
        LTitulo := UpperCase(LTitulo);
        psmChartStyle1.PrinterPage.PageHeader.LeftTitle.Clear;
        psmChartStyle1.PrinterPage.PageHeader.LeftTitle.Add('WiBi');
        psmChartStyle1.PrinterPage.PageHeader.LeftTitle.Add(lblTituloModulo.Caption);
        psmChartStyle1.PrinterPage.PageHeader.LeftTitle.Add(lblTituloReport.Caption);
        psmChartStyle1.PrinterPage.PageHeader.LeftTitle.Add(LTitulo);
        psmChartStyle1.PrinterPage.PageHeader.LeftTitle.Add('');
        psmChartStyle1.PrinterPage.PageHeader.LeftTitle.Add(cxGrid1DBTableView1.DataController.Filter.FilterCaption);
        psmChartStyle1.PrinterPage.Margins.Top := psmChartStyle1.PrinterPage.PageHeader.LeftTitle.Count * 5000;
        cpChart.Preview;
      end;

  end;
end;

procedure TRepPadrao.SortSeries;
var
  LcxGridDBChartSeries: TcxGridDBChartSeries;
  I                   : Integer;
begin
  for I := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
  begin
    if cxGrid1DBTableView1.Columns[I].GroupIndex > -1 then
      continue;
    LcxGridDBChartSeries := cxGrid2DBChartView1.FindSeriesByFieldName(cxGrid1DBTableView1.Columns[I].DataBinding.FieldName);
    if LcxGridDBChartSeries <> nil then
      LcxGridDBChartSeries.SortOrder := cxGrid1DBTableView1.Columns[I].SortOrder;
  end;
end;

procedure TRepPadrao.LoadChartGroups;
var
  I                      : Integer;
  LcxGridDBChartDataGroup: TcxGridDBChartDataGroup;
begin
  if cdsChart.Active then
    cdsChart.EmptyDataSet;
  for I := cxGrid2DBChartView1.DataGroupCount - 1 downto 0 do
    cxGrid2DBChartView1.DataGroups[I].Destroy;
  for I := 0 to cxGrid1DBTableView1.GroupedColumnCount - 1 do
  begin
    LcxGridDBChartDataGroup                       := cxGrid2DBChartView1.CreateDataGroup;
    LcxGridDBChartDataGroup.DataBinding.FieldName := cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.GroupedColumns[I].Index].DataBinding.FieldName;
    LcxGridDBChartDataGroup.DisplayText           := cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.GroupedColumns[I].Index].Caption;
    LcxGridDBChartDataGroup.Visible               := True;
  end;
end;

procedure TRepPadrao.LoadChartSeries;
var
  LcxGridDBChartSeries: TcxGridDBChartSeries;
  I                   : Integer;
begin
  if cdsChart.Active then
    cdsChart.EmptyDataSet;
  for I := cxGrid2DBChartView1.SeriesCount - 1 downto 0 do
    cxGrid2DBChartView1.Series[I].Destroy;
  for I := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
  begin
    if cxGrid1DBTableView1.Columns[I].GroupIndex > -1 then
      continue;
    if not cxGrid1DBTableView1.Columns[I].Visible then
      continue;
    LcxGridDBChartSeries                       := cxGrid2DBChartView1.CreateSeries;
    LcxGridDBChartSeries.DataBinding.FieldName := cxGrid1DBTableView1.Columns[I].DataBinding.FieldName;
    LcxGridDBChartSeries.DisplayText           := cxGrid1DBTableView1.Columns[I].Caption;
    if cxGrid1DBTableView1.Columns[I].Properties is TcxCurrencyEditProperties then
      LcxGridDBChartSeries.ValueCaptionFormat := TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[I].Properties).DisplayFormat;
    if cxGrid1DBTableView1.Columns[I].Summary.FooterKind = skNone then
      LcxGridDBChartSeries.GroupSummaryKind := skSum
    else
      LcxGridDBChartSeries.GroupSummaryKind := cxGrid1DBTableView1.Columns[I].Summary.FooterKind;
    LcxGridDBChartSeries.Visible            := True;
    LcxGridDBChartSeries.OnValueClick       := SeriesValueClick;
  end;
end;

end.
