unit uFrmConfig_POS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uWiEventsForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter, cxClasses, dxLayoutContainer, dxLayoutControl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, cxContainer, cxEdit, cxDBEdit,
  cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls, Vcl.Menus, cxButtons, cxCheckBox, uGlobalLibPDV, uFrmPDV_DModule, Vcl.ExtCtrls, cxMemo,
  JvBrowseFolder, JvBaseDlg, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSpinEdit,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxDateRanges,
  dxScrollbarAnnotations;

type
  TFrmConfig_POS = class(TForm)
    WiEventsForm1: TWiEventsForm;
    dsEquipamentosPOS: TWiFDQuery;
    doEquipamentosPOS: TDataSource;
    Shape16: TShape;
    Shape27: TShape;
    Label38: TLabel;
    Shape1: TShape;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Label3: TLabel;
    cxGrid1DBTableView1pos_id: TcxGridDBColumn;
    cxGrid1DBTableView1pos_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1pos_ativo: TcxGridDBColumn;
    Label1: TLabel;
    edpos_descricao: TcxDBTextEdit;
    Label4: TLabel;
    ckpos_ativo: TcxDBCheckBox;
    cbadq_id: TcxDBLookupComboBox;
    lblMsgRapida: TLabel;
    Label2: TLabel;
    edpos_serial: TcxDBTextEdit;
    Label5: TLabel;
    ckpos_manual: TcxDBCheckBox;
    lbl1: TLabel;
    edtCurParcelas: TcxDBCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsEquipamentosPOSAfterInsert(DataSet: TDataSet);
  private
    function Validate: Integer;
    function doPost: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_POS: TFrmConfig_POS;

implementation

{$R *.dfm}

uses uFrmPDV;

function TFrmConfig_POS.Validate: Integer;
begin
  result := 0;
  if (cbadq_id.Text = '') then
    result := Integer(cbadq_id);
  if (edpos_serial.Text = '') then
    result := Integer(edpos_serial);
  if (edpos_descricao.Text = '') then
    result := Integer(edpos_descricao);
end;

procedure TFrmConfig_POS.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if edpos_descricao.Focused then
    close;
end;

function TFrmConfig_POS.doPost: Boolean;
var
  FocusField: Integer;
begin
  result     := false;
  FocusField := Validate;
  if FocusField > 0 then
  begin
    MessageBox(handle, pChar(GetCaptionFromControl(self, TControl(FocusField)) + ' não preenchido.'), 'I9 PDV', MB_ICONEXCLAMATION);
    if TWinControl(FocusField).Enabled then
      TWinControl(FocusField).SetFocus;
    exit;
  end;
  if dsEquipamentosPOS.State in [dsEdit, dsInsert] then
    dsEquipamentosPOS.Post;
  result := true;
end;

procedure TFrmConfig_POS.dsEquipamentosPOSAfterInsert(DataSet: TDataSet);
begin
  edpos_descricao.SetFocus;
end;

procedure TFrmConfig_POS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  if MessageBox(handle, 'Deseja gravar alterações?', 'I9 PDV', MB_ICONQUESTION + MB_DEFBUTTON1 + MB_YESNO) = IDNO then
    if MessageBox(handle, 'Tem certeza que deseja sair sem gravar as alterações?', 'I9 PDV', MB_ICONQUESTION + MB_DEFBUTTON2 + MB_YESNO) = IDYES then
    begin
      CanClose := true;
      exit;
    end;
  if not doPost then
    exit;
  CanClose    := true;
  ModalResult := mrOk;
end;

procedure TFrmConfig_POS.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F3:
      if not(dsEquipamentosPOS.State in [dsInsert]) then
        dsEquipamentosPOS.Append;
    VK_F2:
      ModalResult := mrOk;
  end;
end;

procedure TFrmConfig_POS.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);

  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbadq_id, 'SELECT  x.adq_id , x.adq_nome FROM    pdv.tb_adquirentes x', 'adq_nome', 'adq_id');

  dsEquipamentosPOS.Active := true;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmConfig_POS.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

end.
