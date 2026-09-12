unit uFrmPDV_Bloqueio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uWiEventsForm, Vcl.ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, Vcl.StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxCurrencyEdit, uPDVLib, uFrmPDV, uGlobalLibPDV, md5_2010,
  cxGridDBTableView,
  cxDBLookupComboBox, cxGrid, cxGridTableView, cxDropDownEdit, WibiSkins, dxGDIPlusClasses;

type

  TFrmPDV_Bloqueio = class(TForm)
    lblUser: TLabel;
    Label2: TLabel;
    edUsuario: TcxCurrencyEdit;
    edNomeUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    Shape16: TShape;
    lblTitle: TLabel;
    Shape27: TShape;
    WiEventsForm1: TWiEventsForm;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    goUser    : TUser;
    goCanClose: Boolean;
    function doValidUser: Boolean;
  public
    goTipoUser: TTipoUser;
  end;

var
  FrmPDV_Bloqueio: TFrmPDV_Bloqueio;

implementation

{$R *.dfm}

procedure TFrmPDV_Bloqueio.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := goCanClose;
end;

procedure TFrmPDV_Bloqueio.FormCreate(Sender: TObject);
begin
  goCanClose := false;
  WiEventsForm1.Open(handle);
end;

procedure TFrmPDV_Bloqueio.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        if edSenha.Focused then
        begin
          if not doValidUser then
          begin
            MessageBox(handle, 'Senha incorreta', 'I9 PDV', MB_ICONEXCLAMATION);
            edSenha.Clear;
            edSenha.SetFocus;
            Key := 0;
            exit;
          end
          else
          begin
            goCanClose  := true;
            ModalResult := mrOk;
          end;
        end;
      end;
  end;

end;

procedure TFrmPDV_Bloqueio.FormShow(Sender: TObject);
begin
  goUser := goPDVClass.GetUser(StrToIntDef(edUsuario.Text, 0));
  if goUser = nil then
  begin
    MessageBox(handle, 'Usuário não encontrado', 'I9 PDV', MB_ICONEXCLAMATION);
    goCanClose := true;
    close;
    exit;
  end;
  edNomeUsuario.Text := goUser.us_apelido;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_Bloqueio.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

function TFrmPDV_Bloqueio.doValidUser: Boolean;
begin
  result := false;
  if (goUser.us_senha = '') then
    exit;
  result := (goUser.us_senha = md5_2010.MD5String(edSenha.Text));
end;

end.
