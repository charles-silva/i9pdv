unit uRepPadraoPivot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, StdCtrls,
  jpeg, ExtCtrls, cxStyles, cxCustomData, cxFilter, cxLookAndFeels,
  cxLookAndFeelPainters, ppParameter, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  cxPropertiesStore, cxGridCustomPopupMenu,
  cxGridPopupMenu, uWiServerPrint, cxCalendar, uWiDateSelect, ComCtrls,
  ToolWin, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins, cxClasses, cxCustomPivotGrid, cxDBPivotGrid,
  Menus, cxButtons, dxSkinWhiteprint, dxSkiniMaginary,
   dxSkinOffice2010Silver, dxSkinCaramel,
  dxSkinDevExpressStyle, dxCore, cxDateUtils, uWiStructure, ppDesignLayer;

type
  TRepPadraoPivot = class(TForm)
    cxGridPopupMenu1: TcxGridPopupMenu;
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
    ppConfig: TppBDEPipeline;
    ppReportDB: TppBDEPipeline;
    lblReportID: TppLabel;
    lblFiltro: TppLabel;
    cxDBPivotGrid1: TcxDBPivotGrid;
    pnTopTitle: TPanel;
    Label4: TLabel;
    lblTitleTop: TLabel;
    btnMostrar: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure WiServerPrint1ExecutePrint(Preview: Boolean);
    function GetFilterExpression: string;
    function GetFilterCaption: string;
    procedure FormActivate(Sender: TObject);
    procedure doSendPDFExcelComm;
  private

    {Private declarations}
  protected
    procedure DoPrint(Preview: Boolean);
  end;

var
  RepPadraoPivot: TRepPadraoPivot;

implementation

uses uFrmDModule, uGlobalLibWiBi;
{$R *.dfm}

procedure TRepPadraoPivot.doSendPDFExcelComm;
var
  lParam: Integer;
  LTitle: string;
begin
  LTitle := StringReplace(StringReplace(self.Caption, ' ', '_', [rfReplaceAll]), '/', '', [rfReplaceAll]);
  lParam := Integer(SetExportPDF(WiServerPrint1.handle, pWideChar(LTitle + '_' + FormatDateTime('dd_mm_yyyy', ServerDateTime))));
  SendMessage(MainHandle, SIM_DEFINEGRID, Integer(cxDBPivotGrid1), lParam);
end;

procedure TRepPadraoPivot.FormActivate(Sender: TObject);
begin
  doSendPDFExcelComm;
  {Passamos ao menu principal qual o datasource ativo}
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);
  WiServerPrint1.SendCommModePrint(MainHandle, false, false);
end;

procedure TRepPadraoPivot.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

        Perform(WM_NEXTDLGCTL, 1, 1);
      end;
    VK_DOWN:
      ;

  end;
end;

procedure TRepPadraoPivot.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TRepPadraoPivot.FormShow(Sender: TObject);
begin
  {Passamos ao menu principal qual o datasource ativo}
  SendMessage(MainHandle, SIM_MENU, MSG_ALL, 0);
  WiServerPrint1.SendCommModePrint(MainHandle, false, false);

  // BevelPrintRetrato.Top := 0;
  // BevelPrintRetrato.Height := Panel1.Height;
  //
  // BevelPrintPaisagem.Top := 0;
  // BevelPrintPaisagem.Height := Panel1.Height;
end;

procedure TRepPadraoPivot.WiServerPrint1ExecutePrint(Preview: Boolean);
begin
  DoPrint(Preview);
end;

function TRepPadraoPivot.GetFilterExpression: string;
begin
  // GetFilterExpression := cxGrid1DBTableView1.DataController.Filter.FilterText;
end;

function TRepPadraoPivot.GetFilterCaption: string;
begin
  // GetFilterCaption := cxGrid1DBTableView1.DataController.Filter.FilterCaption;
end;

procedure TRepPadraoPivot.DoPrint(Preview: Boolean);
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
  ppReport.Print;
end;

end.
