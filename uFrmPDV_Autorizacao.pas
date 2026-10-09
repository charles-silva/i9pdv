unit uFrmPDV_Autorizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uWiEventsForm, Vcl.ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, Vcl.StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxCurrencyEdit, uPDVLib, uFrmPDV, uGlobalLibPDV, md5_2010,
  cxGridDBTableView,Clipbrd,
  cxDBLookupComboBox, cxGrid, cxGridTableView, cxDropDownEdit, WibiSkins, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxGDIPlusClasses, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle;

type

  TFrmPDV_Autorizacao = class(TForm)
    lblUser: TLabel;
    Label2: TLabel;
    edUsuario: TcxCurrencyEdit;
    edNomeUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    Shape16: TShape;
    lblTitle: TLabel;
    Shape27: TShape;
    WiEventsForm1: TWiEventsForm;
    dsParam: TFDQuery;
    Image1: TImage;
    lblParam: TLabel;
    Label1: TLabel;
    procedure edUsuarioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    goUser: TUser;
    function doValidUser: Boolean;
  public
    goTipoUser: TTipoUser;
    goParamId : Integer;
  end;

var
  FrmPDV_Autorizacao: TFrmPDV_Autorizacao;

implementation

{$R *.dfm}

uses uFrmPDV_DModule;

procedure TFrmPDV_Autorizacao.edUsuarioExit(Sender: TObject);
begin
  goUser := goPDVClass.GetUser(StrToIntDef(edUsuario.Text, 0));
  if goUser = nil then
  begin
    MessageBox(handle, 'Usu�rio n�o encontrado', 'I9 PDV', MB_ICONEXCLAMATION);
    edUsuario.SetFocus;
    edUsuario.Clear;
    exit;
  end;
  edNomeUsuario.Text := goUser.us_apelido;
end;

procedure TFrmPDV_Autorizacao.FormCreate(Sender: TObject);
begin
  goParamId := 0;
  WiEventsForm1.Open(handle);
end;

procedure TFrmPDV_Autorizacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
            if goParamId = 0 then
              ModalResult := mrOk
            else
            begin
              dsParam.Open('select dbo.GetParamUser(' + goParamId.toString + ',' +
              goUser.us_codigo.toString + ') as autorizado');
              Clipboard.AsText:='select dbo.GetParamUser(' + goParamId.toString + ',' +
                                 goUser.us_codigo.toString + ') as autorizado';
              if dsParam.FieldByname('Autorizado').asInteger = 1 then
                ModalResult := mrOk
              else
              begin
                MessageBox(handle, 'N�o Autorizado', 'I9 PDV', MB_ICONEXCLAMATION);
                edUsuario.SetFocus;
               // ModalResult := mrOk
              end;
            end;
          end;
        end;
      end;
  end;

end;

procedure TFrmPDV_Autorizacao.FormShow(Sender: TObject);
var
  lopm_descricao: String;
begin
  dsParam.Open('select pm_descricao from t_parametrizacao where pm_id = ' + goParamId.toString);
  if dsParam.IsEmpty then
    lopm_descricao := goParamId.toString + ' - Autoriza��o'
  else
    lopm_descricao := goParamId.toString + ' - ' + dsParam.FieldByname('pm_descricao').AsString;
  lblParam.Caption := lopm_descricao;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_Autorizacao.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

procedure TFrmPDV_Autorizacao.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if edUsuario.Focused then
    close;
end;

function TFrmPDV_Autorizacao.doValidUser: Boolean;
begin
  result := false;
  if (goUser.us_senha = '') then
    exit;
  result := (goUser.us_senha = md5_2010.MD5String(edSenha.Text));
end;

end.
