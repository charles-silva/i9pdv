unit uFrmPDV_Login_DefineSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, ComCtrls, ToolWin,
  StdCtrls, ExtCtrls, DB, DBClient, md5_2010, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkiniMaginary, dxSkinMoneyTwins,
  dxSkinOffice2010Silver, dxSkinWhiteprint, uWiEventsForm, WibiSkins, clipbrd;

type
  TFrmPDV_Login_DefineSenha = class(TForm)
    lblPass1: TLabel;
    lblPass2: TLabel;
    cxPass1: TcxTextEdit;
    cxPass2: TcxTextEdit;
    Shape27: TShape;
    Label38: TLabel;
    Shape16: TShape;
    btnConfirmar: TcxButton;
    btnVoltar: TcxButton;
    WiEventsForm1: TWiEventsForm;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure cxPass1PropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    Fus_apelido: string;
  end;

var
  FrmPDV_Login_DefineSenha: TFrmPDV_Login_DefineSenha;

implementation

uses uFrmPDV_DModule, uFrmPDV;
{$R *.dfm}

procedure TFrmPDV_Login_DefineSenha.btnConfirmarClick(Sender: TObject);
begin
  if cxPass1.Text <> cxPass2.Text then
  begin
    MessageBox(handle, 'Senha Divergente na confirmação.', 'I9 PDV', MB_ICONEXCLAMATION);
    cxPass2.SetFocus;
    exit;
  end;
  try
    Clipboard.AsText:='update t_users set us_senha = ' + QuotedStr(MD5String(cxPass1.Text)) + ' where us_codigo = ' + FrmPDV.vcestoque; // QuotedStr(Fus_apelido);
    FrmPDV_DModule.ADConnection1.ExecSQL('update t_users set us_senha = ' + QuotedStr(MD5String(cxPass1.Text)) +
    ' where us_codigo = ' + IntToStr(FrmPDV_DModule.Tag)); // QuotedStr(Fus_apelido));
    ModalResult := mrOk;
  except
    on E: exception do
      Application.MessageBox(pChar(E.message), 'Erro ao gravar senha', MB_ICONSTOP);
  end;

end;

procedure TFrmPDV_Login_DefineSenha.btnVoltarClick(Sender: TObject);
begin
  close
end;

procedure TFrmPDV_Login_DefineSenha.cxPass1PropertiesChange(Sender: TObject);
begin
  btnConfirmar.Enabled := (AnsiCompareStr(cxPass1.Text, cxPass2.Text) = 0)
end;

procedure TFrmPDV_Login_DefineSenha.FormCreate(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
end;

procedure TFrmPDV_Login_DefineSenha.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    27:
      if cxPass1.Focused then
        close
  end;
end;

procedure TFrmPDV_Login_DefineSenha.FormShow(Sender: TObject);
begin
  cxPass1.SetFocus;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_Login_DefineSenha.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(Handle, WM_SYSCOMMAND, $F012, 0);

end;

end.
