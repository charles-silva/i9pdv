unit uRepPadraoTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, StdCtrls,
  jpeg, ExtCtrls, cxStyles, cxCustomData, cxLookAndFeels, cxLookAndFeelPainters,
  cxTL, cxCurrencyEdit, cxTLdxBarBuiltInMenu, DB, cxDBData, ppParameter,
  uSCDSource, DBClient, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppVar,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  cxPropertiesStore,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridChartView, cxGridDBChartView, cxGrid,
  cxInplaceContainer, cxDBTL, cxTLData, cxPC, uWiServerPrint, cxCalendar,
  uWiDateSelect, ComCtrls, ToolWin, uWiProfileGrid, cxGridTableView,
  cxPCdxBarPopupMenu, dxCore, cxDateUtils, dxBarBuiltInMenu, dxSkinsCore,
  dxSkinBlue, dxSkiniMaginary, dxSkinMoneyTwins, 
  dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uWiFDQuery;

type
  TRepPadraoTree = class(TForm)
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
    cxGrid2: TcxGrid;
    cxGrid2DBChartView1: TcxGridDBChartView;
    cxGrid2Level1: TcxGridLevel;
    cdsChart: TClientDataSet;
    doChart: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    doPlanoContas: TDataSource;
    pnTopTitle: TPanel;
    Label35: TLabel;
    lblTitleTop: TLabel;
    cdsPlanoContas: TWiFDQuery;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure WiServerPrint1ExecutePrint(Preview: Boolean);
    function GetFilterExpression: string;
    function GetFilterCaption: string;
    procedure btnMostrarClick(Sender: TObject);
    procedure WiProfileGrid1ChangePerfil(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerGroupingChanged(Sender: TObject);
    procedure cxGrid1DBTableView1ColumnPosChanged(Sender: TcxGridTableView; AColumn: TcxGridColumn);
    procedure cxGrid1DBTableView1DataControllerFilterChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure LoadChartSeries;
    procedure LoadChartGroups;

    {Private declarations}
  protected
    procedure DoPrint(Preview: Boolean);
  end;

var
  RepPadraoTree: TRepPadraoTree;

implementation

uses uFrmDModule, uGlobalLibWiBi;
{$R *.dfm}

procedure TRepPadraoTree.FormActivate(Sender: TObject);
begin
  {Passamos ao menu principal qual o datasource ativo}
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);
  WiServerPrint1.SendCommModePrint(MainHandle, false, false);
end;

procedure TRepPadraoTree.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TRepPadraoTree.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TRepPadraoTree.FormShow(Sender: TObject);
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

procedure TRepPadraoTree.WiProfileGrid1ChangePerfil(Sender: TObject);
begin
  LoadChartSeries;
  LoadChartGroups;
end;

procedure TRepPadraoTree.WiServerPrint1ExecutePrint(Preview: Boolean);
begin
  DoPrint(Preview);
end;

function TRepPadraoTree.GetFilterExpression: string;
begin
  // GetFilterExpression := cxGrid1DBTableView1.DataController.Filter.FilterText;
end;

function TRepPadraoTree.GetFilterCaption: string;
begin
  // GetFilterCaption := cxGrid1DBTableView1.DataController.Filter.FilterCaption;
end;

procedure TRepPadraoTree.btnMostrarClick(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TRepPadraoTree.cxGrid1DBTableView1ColumnPosChanged(Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  LoadChartSeries;
end;

procedure TRepPadraoTree.cxGrid1DBTableView1DataControllerFilterChanged(Sender: TObject);
begin
  // cdsChart.Filter := cxDBTreeList1.DataController.Filter.FilterText;
  // cdsChart.Filtered := true;

end;

procedure TRepPadraoTree.cxGrid1DBTableView1DataControllerGroupingChanged(Sender: TObject);
begin
  LoadChartGroups;
end;

procedure TRepPadraoTree.DoPrint(Preview: Boolean);
begin
  lblDataReportPE.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', ServerDateTime);
  lblMensagemPE.Caption := ' | IMPRESSO POR:' + FrmDModule.User.UserId + ' - ' + FrmDModule.User.Name + ' | COLIGADA: ' + ServerColigadaDescr +
    ' | EMPRESA: ' + ServerEmpresaDescr + ' |';
  lblFiltro.Width := ppReport.Printer.PrintableWidth;
  // ppHeaderBand2.Height := 96 + lblFiltro.Height;
  if Preview then
    ppReport.DeviceType := 'Screen'
  else
    ppReport.DeviceType := 'Printer';
  ppReport.ModalPreview := True;
  ppReport.Print;
end;

procedure TRepPadraoTree.LoadChartGroups;
begin
end;

procedure TRepPadraoTree.LoadChartSeries;
begin
end;

end.
