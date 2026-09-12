unit uFrmConfig_SyncServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlue, dxSkinCaramel,
  dxSkinOffice2010Silver, dxSkinWhiteprint, Vcl.StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, cxDBEdit,
  cxCurrencyEdit, uWiEventsForm, WibiSkins, Vcl.ExtCtrls, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle;

type
  TFrmConfig_SyncServer = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dsConfigSync: TWiFDQuery;
    doConfigSync: TDataSource;
    edpsync_servidor: TcxDBTextEdit;
    edpsync_database: TcxDBTextEdit;
    edpsync_user: TcxDBTextEdit;
    edpsync_port: TcxDBCurrencyEdit;
    WiEventsForm1: TWiEventsForm;
    Label38: TLabel;
    Shape16: TShape;
    Shape27: TShape;
    lblMsgRapida: TLabel;
    edpsync_password: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsConfigSyncBeforePost(DataSet: TDataSet);
    procedure dsConfigSyncAfterScroll(DataSet: TDataSet);
  private
    goCanClose: Boolean;
    function Validate: Integer;
    function doPost: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_SyncServer: TFrmConfig_SyncServer;

implementation

{$R *.dfm}

uses uGlobalLibWiBi,  uFrmPDV_DModule, uFrmPDV;

function TFrmConfig_SyncServer.Validate: Integer;
begin
  Result := 0;
  if (edpsync_password.Text = '') then
    Result := Integer(edpsync_password);
  if (edpsync_user.Text = '') then
    Result := Integer(edpsync_user);
  if (edpsync_database.Text = '') then
    Result := Integer(edpsync_database);
  if (edpsync_port.Value = 0) then
    Result := Integer(edpsync_port);
  if (edpsync_servidor.Text = '') then
    Result := Integer(edpsync_servidor);

end;

function TFrmConfig_SyncServer.doPost: Boolean;
var
  FocusField: Integer;
begin
  Result     := false;
  FocusField := Validate;
  if FocusField > 0 then
  begin
    MessageBox(handle, pChar(GetCaptionFromControl(self, TControl(FocusField)) + ' não preenchido.'), 'I9 PDV', MB_ICONEXCLAMATION);
    if TWinControl(FocusField).Enabled then
      TWinControl(FocusField).SetFocus;
    exit;
  end;
  if not(dsConfigSync.State in [dsEdit, dsInsert]) then
    dsConfigSync.Edit;
  if dsConfigSync.State in [dsEdit, dsInsert] then
    dsConfigSync.Post;
  Result := true;
end;

procedure TFrmConfig_SyncServer.dsConfigSyncAfterScroll(DataSet: TDataSet);
begin
  edpsync_password.Text := uGlobalLibWiBi.Decrypt(dsConfigSync.FieldByName('psync_password').AsString);
end;

procedure TFrmConfig_SyncServer.dsConfigSyncBeforePost(DataSet: TDataSet);
begin
  dsConfigSync.FieldByName('psync_password').AsString := uGlobalLibWiBi.Encrypt(edpsync_password.Text);
end;

procedure TFrmConfig_SyncServer.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := goCanClose;
end;

procedure TFrmConfig_SyncServer.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of

    VK_ESCAPE:
      begin
        goCanClose := true;
        close;
      end;
    VK_F2:
      begin
        goCanClose := false;
        if MessageBox(handle, 'Deseja gravar alterações?', 'I9 PDV', MB_ICONQUESTION + MB_DEFBUTTON1 + MB_YESNO) = IDYES then
          if not doPost then
            exit;
        goCanClose  := true;
        ModalResult := mrOk;
      end;
  end;
end;

procedure TFrmConfig_SyncServer.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  dsConfigSync.Active := true;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

end.
