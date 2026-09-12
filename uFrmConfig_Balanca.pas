unit uFrmConfig_Balanca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uWiEventsForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter, cxClasses, dxLayoutContainer, dxLayoutControl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, cxContainer, cxEdit, cxDBEdit,
  cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls, Vcl.Menus, cxButtons, cxCheckBox, uGlobalLibPDV, uFrmPDV_DModule, Vcl.ExtCtrls, cxMemo,
  JvBrowseFolder, JvBaseDlg, WibiSkins, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSpinEdit,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFrmConfig_Balanca = class(TForm)
    WiEventsForm1: TWiEventsForm;
    dsBalancas: TWiFDQuery;
    doBalancas: TDataSource;
    Shape16: TShape;
    Shape27: TShape;
    Label38: TLabel;
    Shape1: TShape;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Label3: TLabel;
    cxGrid1DBTableView1pbal_id: TcxGridDBColumn;
    cxGrid1DBTableView1pbal_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1pbal_modelo_descr: TcxGridDBColumn;
    cxGrid1DBTableView1pbal_port: TcxGridDBColumn;
    cxGrid1DBTableView1pbal_ativo: TcxGridDBColumn;
    Label1: TLabel;
    edpbal_descricao: TcxDBTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ckpbal_ativo: TcxDBCheckBox;
    cbpbal_port: TcxDBLookupComboBox;
    cbpbal_baud: TcxDBLookupComboBox;
    cbpbal_data: TcxDBLookupComboBox;
    cbpbal_parity: TcxDBLookupComboBox;
    cbpbal_stop: TcxDBLookupComboBox;
    cbpbal_handshake: TcxDBLookupComboBox;
    cbpbal_modelo: TcxDBLookupComboBox;
    lblMsgRapida: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    function Validate: Integer;
    function doPost: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_Balanca: TFrmConfig_Balanca;

implementation

{$R *.dfm}

uses uFrmPDV;

function TFrmConfig_Balanca.Validate: Integer;
begin
  result := 0;
  // if (edpterm_descricao.Text = '') then
  // result := Integer(edpterm_descricao);
  // if (edpterm_serie_fiscal.Value <= 0) then
  // result := Integer(edpterm_serie_fiscal);
  // if (edpterm_numero.Value <= 0) then
  // result := Integer(edpterm_numero);
end;

procedure TFrmConfig_Balanca.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if edpbal_descricao.Focused then
    close;
end;

function TFrmConfig_Balanca.doPost: Boolean;
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
  if dsBalancas.State in [dsEdit, dsInsert] then
    dsBalancas.Post;
  result := true;
end;

procedure TFrmConfig_Balanca.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFrmConfig_Balanca.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2:
      ModalResult := mrOk;
  end;
end;

procedure TFrmConfig_Balanca.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);

  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpbal_modelo, 'SELECT * FROM pdv.GetListBalancaModels()', 'descricao', 'idx');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpbal_port, 'SELECT * FROM pdv.GetListPorts()', 'descricao', 'descricao');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpbal_baud, 'SELECT * FROM pdv.GetListBaudRate()', 'descricao', 'descricao');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpbal_data, 'SELECT * FROM pdv.GetListDataBit()', 'descricao', 'descricao');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpbal_parity, 'SELECT * FROM pdv.GetListSerialParity()', 'descricao', 'idx');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpbal_stop, 'SELECT * FROM pdv.GetListSerialStop()', 'descricao', 'idx');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpbal_handshake, 'SELECT * FROM pdv.GetListHandShake()', 'descricao', 'idx');

  dsBalancas.Active := true;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmConfig_Balanca.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

end.
