unit uFrmValidaUsuario;

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
  DB,
  DBClient,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  Menus,
  uSCDSource,
  StdCtrls,
  cxButtons,
  cxMaskEdit,
  cxDropDownEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxTextEdit,
  ExtCtrls,
  md5_2010, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uWiFDQuery, dxSkinCaramel, dxSkinsCore, dxSkinBlue, dxSkinOffice2010Silver,
  dxSkinWhiteprint, WibiSkins, dxGDIPlusClasses, uWiEventsForm;

type
  TFrmValidaUsuario = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    us_senha: TcxTextEdit;
    Label2: TLabel;
    BConfirma: TcxButton;
    BitBtn1: TcxButton;
    Timer1: TTimer;
    Timer2: TTimer;
    cdsPesquisa: TWiFDQuery;
    Shape16: TShape;
    lblTitle: TLabel;
    Shape27: TShape;
    us_nome: TcxTextEdit;
    Image1: TImage;
    lblParam: TLabel;
    Bevel1: TBevel;
    WiEventsForm1: TWiEventsForm;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BConfirmaClick(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure us_senhaPropertiesChange(Sender: TObject);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
  private
    function ValidateLogin(Login, Password: string): Boolean;
  public
    Fpm_id                               : string;
    Fpm_descricao                        : String;
    gous_codigo, gogu_codigo, gofu_codigo: Integer;
  end;

var
  FrmValidaUsuario: TFrmValidaUsuario;

implementation

uses
  uFrmDModule,
  uGlobalLibWiBi, uFrmValidaUsuarioSolicita;
{$R *.dfm}

function TFrmValidaUsuario.ValidateLogin(Login, Password: string): Boolean;
var
  adQuery: TFDQuery;
begin
  Result  := false;
  adQuery := TFDQuery.Create(nil);
  try
    adQuery.Connection := FrmDModule.ADConnection1;
    adQuery.Open('select us_senha from t_users where us_apelido=' + quotedstr(trim(Login)));
    if not adQuery.IsEmpty then
      Result := (MD5String(Password) = adQuery.FieldByName('us_senha').AsString);
  finally
    adQuery.Close;
    adQuery.Destroy;
  end;

end;

procedure TFrmValidaUsuario.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if us_nome.Focused then
    Close;
end;

procedure TFrmValidaUsuario.BConfirmaClick(Sender: TObject);
begin
  if us_nome.text = '' then
    exit;

  { Senha }
  if (not ValidateLogin(us_nome.text, us_senha.text)) then
  begin
    MessageBox(Handle, 'Senha Inválida!', 'WiBi', MB_ICONEXCLAMATION);
    us_senha.Clear;
    us_senha.SetFocus;
    exit;
  end;
  cdsPesquisa.Open('select us_codigo,gu_codigo,fu_codigo from t_users where us_apelido = ' + quotedstr(us_nome.text));
  gous_codigo := cdsPesquisa.FieldByName('us_codigo').AsInteger;
  gogu_codigo := cdsPesquisa.FieldByName('gu_codigo').AsInteger;
  gofu_codigo := cdsPesquisa.FieldByName('fu_codigo').AsInteger;

  if (trim(Fpm_id) <> '') then
  begin
    cdsPesquisa.Open('select isnull(dbo.GetParamUser(' + quotedstr(Fpm_id) + ',' + quotedstr(IntToStr(gous_codigo)) + '),0) as Allow');
    if (cdsPesquisa.FieldByName('Allow').AsInteger <> 1) and (gogu_codigo <> 10) and (gogu_codigo <> 1000) then
    begin
      MessageBox(Handle, 'Operação não autorizada.', 'i9 Mobile', MB_ICONEXCLAMATION);
      us_nome.SetFocus;
      exit;
    end;
  end;
  FrmDModule.ADConnection1.ExecSQL('update t_log_tmp set us_codigo_autorizador = ' + quotedstr(IntToStr(gous_codigo)) + ' where log_spid = @@spid');
  ModalResult := mrOk;
end;

procedure TFrmValidaUsuario.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmValidaUsuario.FormShow(Sender: TObject);
begin
  cdsPesquisa.Open('select pm_descricao from t_parametrizacao where pm_id = ' + quotedstr(Fpm_id));
  Fpm_descricao    := Fpm_id + ' - ' + cdsPesquisa.FieldByName('pm_descricao').AsString;
  lblParam.Caption := Fpm_descricao;

  WiEventsForm1.Open(Handle);
  us_nome.text := FrmDModule.User.NickName;
  us_senha.SetFocus;
end;

procedure TFrmValidaUsuario.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(Handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure TFrmValidaUsuario.us_senhaPropertiesChange(Sender: TObject);
begin
  BConfirma.Default := (us_senha.text <> '');
end;

end.
