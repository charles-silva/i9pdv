unit uFrmPDV_TEF_Campo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  ACBrTEFAPI;

type
  TFrmPDV_TEF_Campo = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    lblTitle: TLabel;
    lblMsgRapida: TLabel;
    edResposta: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edRespostaKeyPress(Sender: TObject; var Key: Char);
  private
    FTamanhoMinimo: Integer;
    FTamanhoMaximo: Integer;
    FTipoDeEntrada: TACBrTEFAPITiposEntrada;
    function GetOcultar: Boolean;
    function GetResposta: String;
    function GetTitulo: String;
    procedure SetOcultar(const Value: Boolean);
    procedure SetResposta(const Value: String);
    procedure SetTitulo(const Value: String);
  public
    property Titulo: String read GetTitulo write SetTitulo;
    property Resposta: String read GetResposta write SetResposta;
    property Ocultar: Boolean read GetOcultar write SetOcultar;
    property TamanhoMinimo: Integer read FTamanhoMinimo write FTamanhoMinimo;
    property TamanhoMaximo: Integer read FTamanhoMaximo write FTamanhoMaximo;
    property TipoDeEntrada: TACBrTEFAPITiposEntrada read FTipoDeEntrada write FTipoDeEntrada;
  end;

var
  FrmPDV_TEF_Campo: TFrmPDV_TEF_Campo;

implementation

{$R *.dfm}

uses
  uFrmPDV;

procedure TFrmPDV_TEF_Campo.FormShow(Sender: TObject);
begin
  Shape2.Brush.Color := FrmPDV.CordoMes.Color;

  if (TamanhoMaximo > 0) then
    edResposta.MaxLength := TamanhoMaximo;

  edResposta.SetFocus;
  edResposta.SelStart := Length(edResposta.Text);
end;

// S� restringe o que pode ser digitado de acordo com DefinicaoCampo.TipoDeEntrada
// (ver ACBrTEFAPI1QuandoPerguntarCampo em uFrmPDV.pas); a valida��o de
// conte�do (CPF, dupla digita��o, etc.) fica por conta do pr�prio ACBrTEFAPI,
// que recebe Validado := False e valida sozinho.
procedure TFrmPDV_TEF_Campo.edRespostaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [#8, #13, #27] then
    exit;

  case FTipoDeEntrada of
    tedApenasLeitura:
      Key := #0;
    tedNumerico:
      if not CharInSet(Key, ['0' .. '9']) then
        Key := #0;
    tedAlfabetico:
      if not CharInSet(Key, ['A' .. 'Z', 'a' .. 'z', ' ']) then
        Key := #0;
    tedAlfaNum:
      if not CharInSet(Key, ['0' .. '9', 'A' .. 'Z', 'a' .. 'z']) then
        Key := #0;
  end;
end;

procedure TFrmPDV_TEF_Campo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      ModalResult := mrCancel;
    VK_RETURN:
      if (TamanhoMinimo <= 0) or (Length(edResposta.Text) >= TamanhoMinimo) then
        ModalResult := mrOk;
  end;
end;

function TFrmPDV_TEF_Campo.GetOcultar: Boolean;
begin
  Result := (edResposta.PasswordChar <> #0);
end;

procedure TFrmPDV_TEF_Campo.SetOcultar(const Value: Boolean);
begin
  if Value then
    edResposta.PasswordChar := '*'
  else
    edResposta.PasswordChar := #0;
end;

function TFrmPDV_TEF_Campo.GetResposta: String;
begin
  Result := edResposta.Text;
end;

procedure TFrmPDV_TEF_Campo.SetResposta(const Value: String);
begin
  edResposta.Text := Value;
end;

function TFrmPDV_TEF_Campo.GetTitulo: String;
begin
  Result := lblTitle.Caption;
end;

procedure TFrmPDV_TEF_Campo.SetTitulo(const Value: String);
begin
  lblTitle.Caption := Value;
end;

end.
