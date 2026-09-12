unit uRepPadrao2;

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
  cxContainer, cxEdit, dxSkinsCore, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, dxPgsDlg, dxPSCore, dxPScxCommon, DBClient, ppDB,
  ppDBPipe, ppDBBDE, ppParameter, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, cxPropertiesStore,
  cxGridCustomPopupMenu, cxGridPopupMenu,
  cxGridChartView, cxGridDBChartView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  uWiServerPrint, cxDropDownEdit, cxCalendar, uWiDateSelect, ComCtrls,
  ToolWin, uWiProfileGrid, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, jpeg, ExtCtrls, uSCDSource,
  cxCurrencyEdit, AdvPanel, ShellAPI, dxPScxPivotGridLnk, Menus, cxButtons, uWiDateSelect2,
  dxLayoutContainer, dxLayoutControlAdapters, dxLayoutControl, dxBarBuiltInMenu,
  cxNavigator, uWiFDQuery, dxSkinBlue, dxSkiniMaginary, dxSkinMoneyTwins,
   dxSkinOffice2010Silver, dxSkinWhiteprint;

type
  TRepPadrao2 = class(TForm)
    cxGridPopupMenu1: TcxGridPopupMenu;
    WiProfileGrid1: TWiProfileGrid;
    Panel1: TPanel;
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
    btnFiltrar: TcxButton;
    WiDateSelect21: TWiDateSelect2;
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
  private
    procedure LoadChartSeries;
    procedure LoadChartGroups;
    procedure SeriesValueClick(Sender: TcxGridChartView; ASeries: TcxGridChartSeries; AValueIndex: Integer; var AHandled: Boolean);
    procedure SortSeries;
    function FormatFilterDate(aFilterText: string): string;

    {Private declarations}
  protected
    FWhereSQL: String;
  public
    function DoFiltrar(aWhereSQL: String): Integer;
    procedure DoPrint(Preview: Boolean; const APDF: Boolean = false);
    procedure DoImprimir(aPreview: Boolean);
  end;

var
  RepPadrao2: TRepPadrao2;

implementation

uses
  uFrmDModule,
  uGlobalLibWiBi;
{$R *.dfm}

procedure TRepPadrao2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

        if LFocusComp = WiDateSelect21 then
          btnFiltrar.Click;

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

procedure TRepPadrao2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TRepPadrao2.FormShow(Sender: TObject);
begin
  {Passamos ao menu principal qual o datasource ativo}
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);
  WiServerPrint1.SendCommModePrint(MainHandle, false, false);

  WiProfileGrid1.LoadProfile(StrToInt(FrmDModule.User.UserId));

  LoadChartSeries;
  LoadChartGroups;
  // BevelPrintRetrato.Top := 0;
  // BevelPrintRetrato.Height := Panel1.Height;
  //
  // BevelPrintPaisagem.Top := 0;
  // BevelPrintPaisagem.Height := Panel1.Height;

end;

procedure TRepPadrao2.WiProfileGrid1ChangePerfil(Sender: TObject);
begin
  LoadChartSeries;
  LoadChartGroups;
end;

procedure TRepPadrao2.WiServerPrint1ExecutePrint(Preview: Boolean);
begin
  DoPrint(Preview);
end;

procedure TRepPadrao2.FormActivate(Sender: TObject);
var
  lParam: Integer;
  LTitle: String;
begin
  inherited;
  LTitle := StringReplace(StringReplace(self.Caption, ' ', '_', [rfReplaceAll]), '/', '', [rfReplaceAll]);
  lParam := Integer(SetExportPDF(WiServerPrint1.handle, pWideChar(LTitle + '_' + FormatDateTime('dd_mm_yyyy', ServerDateTime))));
  SendMessage(MainHandle, SIM_DEFINEGRID, Integer(cxGrid1), lParam);

  {Passamos ao menu principal qual o datasource ativo}
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);
  WiServerPrint1.SendCommModePrint(MainHandle, false, false);
end;

function TRepPadrao2.FormatFilterDate(aFilterText: string): string;
var
  I: Integer;
  LStart: Integer;
  LEnd: Integer;
begin

  LStart := 0;
  LEnd := 0;
  I := 0;
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
      LEnd := 0;
    end;

  end;

  Result := aFilterText;
end;

function TRepPadrao2.GetFilterExpression: string;
var
  I: Integer;
  LcxDBGridColumn: TcxGridDBColumn;
  LFilterText: String;
begin
  LFilterText := cxGrid1DBTableView1.DataController.Filter.FilterText;
  for I := 0 to cxGrid1DBTableView1.VisibleColumnCount - 1 do
  begin
    if cxGrid1DBTableView1.VisibleColumns[I] is TcxGridDBColumn then
    begin
      LcxDBGridColumn := TcxGridDBColumn(cxGrid1DBTableView1.VisibleColumns[I]);
      LFilterText := StringReplace(LFilterText, LcxDBGridColumn.DataBinding.FieldName, '[' + LcxDBGridColumn.DataBinding.FieldName + ']',
        [rfReplaceAll]);
    end;
  end;

  Result := FormatFilterDate(LFilterText);
end;

function TRepPadrao2.GetFilterCaption: string;
begin
  GetFilterCaption := cxGrid1DBTableView1.DataController.Filter.FilterCaption;
end;

procedure TRepPadrao2.btnMostrarClick(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TRepPadrao2.cxGrid1DBTableView1ColumnPosChanged(Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  LoadChartSeries;
end;

procedure TRepPadrao2.cxGrid1DBTableView1DataControllerFilterChanged(Sender: TObject);
begin
  cdsChart.Filter := cxGrid1DBTableView1.DataController.Filter.FilterText;
  cdsChart.Filtered := True;

  lblFilterCaption.Caption := GetFilterCaption;
  pnFilterCaption.Visible := (lblFilterCaption.Caption <> '');
end;

procedure TRepPadrao2.cxGrid1DBTableView1DataControllerGroupingChanged(Sender: TObject);
begin
  LoadChartGroups;
end;

procedure TRepPadrao2.SeriesValueClick(Sender: TcxGridChartView; ASeries: TcxGridChartSeries; AValueIndex: Integer;

  var AHandled: Boolean);
begin
  inherited;
end;

procedure TRepPadrao2.cxGrid1DBTableView1DataControllerSortingChanged(Sender: TObject);
begin
  SortSeries;
end;

procedure TRepPadrao2.cxGrid1DBTableView1DataControllerSummaryAfterSummary(ASender: TcxDataSummary);
begin
  LoadChartSeries;
end;

procedure TRepPadrao2.cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet;

  var AllowChange: Boolean);
var
  I: Integer;
  Lcount: Integer;
begin
  if NewPage.PageIndex = 1 then
  begin
    Lcount := 0;
    for I := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
      if (cxGrid1DBTableView1.Columns[I].GroupIndex = -1) and (cxGrid1DBTableView1.Columns[I].Visible) then
        inc(Lcount);

    if Lcount > 4 then
      AllowChange := (MessageBox(handle,
          'Existem mais de 4 colunas à serem exibidas no gráfico, isso pode levar algum tempo de processamento. Confirmar operação?',
          'WiBi - Comercial', MB_ICONQUESTION + MB_YESNO) = IDYES);

    Lcount := 0;
    for I := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
      if (cxGrid1DBTableView1.Columns[I].GroupIndex = -1) and (cxGrid1DBTableView1.Columns[I].Visible) then
        if (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Smallint')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Integer')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Word')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Float')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'Currency')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'LargeInt')) and
          (not(cxGrid1DBTableView1.Columns[I].DataBinding.ValueType = 'FMTBcd')) then
          inc(Lcount);

    if Lcount > 0 then
    begin
      MessageBox(handle,
        'Somente campos númericos podem ser utilizados no gráfico para demonstração de resultados, os demais apenas podem ser utilizados no agrupamento.'
          , 'WiBi - Comercial', MB_ICONEXCLAMATION);
      AllowChange := false;
      exit;
    end;
    SortSeries;
    cdsChart.Data := (cxGrid1DBTableView1.DataController.DataSource.DataSet as TWiFDQuery).Data;
  end;
end;

function TRepPadrao2.DoFiltrar(aWhereSQL: String): Integer;
begin
  FWhereSQL := aWhereSQL;
  btnFiltrar.Click;
end;

procedure TRepPadrao2.DoImprimir(aPreview: Boolean);
begin
  if Assigned(WiServerPrint1.OnExecutePrint) then
    WiServerPrint1.OnExecutePrint(aPreview);
end;

procedure TRepPadrao2.DoPrint(Preview: Boolean; const APDF: Boolean = false);
var
  LTitulo: string;
begin
  case cxPageControl1.ActivePageIndex of
    0:
      begin
        lblDataReportPE.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', ServerDateTime);
        lblMensagemPE.Caption := ' | IMPRESSO POR:' + FrmDModule.User.UserId + ' - ' + FrmDModule.User.Name + ' | EMPRESA: ' + ServerEmpresaDescr +
          ' |';
        lblFiltro.Width := ppReport.Printer.PrintableWidth;
        if APDF then
        begin
          ppReport.AllowPrintToArchive := True;
          ppReport.AllowPrintToFile := True;
          ppReport.ShowPrintDialog := false;
          ppReport.TextFileName := StringReplace(StringReplace(self.Caption, ' ', '_', [rfReplaceAll]), '/', '', [rfReplaceAll]) + '.pdf';
          ppReport.DeviceType := 'PDF';
          ppReport.Print;
          ShellExecute(0, 'open', pChar(ppReport.TextFileName), nil, nil, 1);
        end
        else
        begin
          // ppHeaderBand2.Height := 96 + lblFiltro.Height;
          if Preview then
            ppReport.DeviceType := 'Screen'
          else
            ppReport.DeviceType := 'Printer';
          ppReport.ShowPrintDialog := True;
          ppReport.ModalPreview := True;
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

procedure TRepPadrao2.SortSeries;
var
  LcxGridDBChartSeries: TcxGridDBChartSeries;
  I: Integer;
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

procedure TRepPadrao2.LoadChartGroups;
var
  I: Integer;
  LcxGridDBChartDataGroup: TcxGridDBChartDataGroup;
begin
  if cdsChart.Active then
    cdsChart.EmptyDataSet;
  for I := cxGrid2DBChartView1.DataGroupCount - 1 downto 0 do
    cxGrid2DBChartView1.DataGroups[I].Destroy;
  for I := 0 to cxGrid1DBTableView1.GroupedColumnCount - 1 do
  begin
    LcxGridDBChartDataGroup := cxGrid2DBChartView1.CreateDataGroup;
    LcxGridDBChartDataGroup.DataBinding.FieldName := cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.GroupedColumns[I].Index].DataBinding.FieldName;
    LcxGridDBChartDataGroup.DisplayText := cxGrid1DBTableView1.Columns[cxGrid1DBTableView1.GroupedColumns[I].Index].Caption;
    LcxGridDBChartDataGroup.Visible := True;
  end;
end;

procedure TRepPadrao2.LoadChartSeries;
var
  LcxGridDBChartSeries: TcxGridDBChartSeries;
  I: Integer;
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
    LcxGridDBChartSeries := cxGrid2DBChartView1.CreateSeries;
    LcxGridDBChartSeries.DataBinding.FieldName := cxGrid1DBTableView1.Columns[I].DataBinding.FieldName;
    LcxGridDBChartSeries.DisplayText := cxGrid1DBTableView1.Columns[I].Caption;
    if cxGrid1DBTableView1.Columns[I].Properties is TcxCurrencyEditProperties then
      LcxGridDBChartSeries.ValueCaptionFormat := TcxCurrencyEditProperties(cxGrid1DBTableView1.Columns[I].Properties).DisplayFormat;
    if cxGrid1DBTableView1.Columns[I].Summary.FooterKind = skNone then
      LcxGridDBChartSeries.GroupSummaryKind := skSum
    else
      LcxGridDBChartSeries.GroupSummaryKind := cxGrid1DBTableView1.Columns[I].Summary.FooterKind;
    LcxGridDBChartSeries.Visible := True;
    LcxGridDBChartSeries.OnValueClick := SeriesValueClick;
  end;
end;

end.
