unit uFrmPDV_TEF_Campo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  ACBrTEFAPI, dxSkinsCore, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, cxButtons;

type
  TTipoCampo = (tcoString, tcoNumeric, tcoCurrency, tcoAlfa, tcoAlfaNum, tcoDecimal);

  TFrmPDV_TEF_Campo = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    lblTitle: TLabel;
    lblMsgRapida: TLabel;
    edtResposta: TEdit;
    cxbtnVoltar: TcxButton;
    cxbtnCancelar: TcxButton;
    cxbtnConfirmar: TcxButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtRespostaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtRespostaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FTamanhoMinimo            : Integer;
    FTamanhoMaximo            : Integer;
    fTipoCampo                : TTipoCampo;
    fMascara                  : String;
    fNaoRemoverMascaraResposta: Boolean;
    function GetOcultar: Boolean;
    function GetResposta: String;
    function GetTitulo: String;
    procedure SetOcultar(const Value: Boolean);
    procedure SetResposta(const Value: String);
    procedure SetTitulo(const Value: String);
    procedure SetMascara(const Value: String);
  public
    property Mascara      : String read fMascara write SetMascara;
    property TipoCampo    : TTipoCampo read fTipoCampo write fTipoCampo;
    property Titulo       : String read GetTitulo write SetTitulo;
    property Resposta     : String read GetResposta write SetResposta;
    property Ocultar      : Boolean read GetOcultar write SetOcultar;
    property TamanhoMinimo: Integer read FTamanhoMinimo write FTamanhoMinimo;
    property TamanhoMaximo: Integer read FTamanhoMaximo write FTamanhoMaximo;
  end;

var
  FrmPDV_TEF_Campo: TFrmPDV_TEF_Campo;

implementation

{$R *.dfm}

uses
  uFrmPDV, System.SysUtils, ACBrUtil, ACBrValidador, ACBrConsts;

procedure TFrmPDV_TEF_Campo.FormShow(Sender: TObject);
var
  TamMascara: Integer;
  TextVal   : String;
begin
  if (fTipoCampo in [tcoCurrency, tcoDecimal]) then
  begin
    edtResposta.AutoSelect := False;
    TextVal                := '0,00';
    if (fTipoCampo = tcoCurrency) then
      TextVal := 'R$ ' + TextVal;

    edtResposta.Text     := TextVal;
    edtResposta.SelStart := Length(edtResposta.Text);
    if TamanhoMaximo > 0 then
      TamanhoMaximo := TamanhoMaximo + 1; // (Ponto Decimal)
  end
  else
  begin
    if (fMascara <> '') then
    begin
      TamMascara := CountStr(fMascara, '*');
      if TamanhoMaximo = 0 then
        TamanhoMaximo := TamMascara;

      if TamanhoMinimo = 0 then
        TamanhoMinimo := TamMascara;
    end;

    edtResposta.SetFocus;
  end;
end;

// S� restringe o que pode ser digitado de acordo com DefinicaoCampo.TipoDeEntrada
// (ver ACBrTEFAPI1QuandoPerguntarCampo em uFrmPDV.pas); a valida��o de
// conte�do (CPF, dupla digita��o, etc.) fica por conta do pr�prio ACBrTEFAPI,
// que recebe Validado := False e valida sozinho.
procedure TFrmPDV_TEF_Campo.edtRespostaChange(Sender: TObject);
var
  AValor : Int64;
  TextVal: String;
begin
  if (fTipoCampo in [tcoCurrency, tcoDecimal]) then
  begin
    AValor  := StrToIntDef(OnlyNumber(edtResposta.Text), 0);
    TextVal := FormatFloatBr(AValor / 100, FloatMask(2, (fTipoCampo = tcoCurrency)));
    if (fTipoCampo = tcoCurrency) then
      TextVal := 'R$ ' + TextVal;

    edtResposta.Text     := TextVal;
    edtResposta.SelStart := Length(edtResposta.Text);
  end
  else if (fMascara <> '') then
  begin
    edtResposta.Text     := FormatarMascaraDinamica(RemoverMascara(edtResposta.Text, fMascara), fMascara);
    edtResposta.SelStart := Length(edtResposta.Text);
  end;
end;

procedure TFrmPDV_TEF_Campo.edtRespostaKeyPress(Sender: TObject; var Key: Char);
var
  Ok: Boolean;
begin
  if (Key in [#8, #13, #27]) then { BackSpace, Enter, Esc }
    Exit;

  case fTipoCampo of
    tcoNumeric, tcoCurrency, tcoDecimal:
      Ok := CharIsNum(Key);

    tcoAlfa:
      begin
        Key := upcase(Key);
        Ok  := CharIsAlpha(Key);
      end;

    tcoAlfaNum:
      begin
        Ok := CharIsNum(Key);
        if not Ok then
        begin
          Key := upcase(Key);
          Ok  := CharIsAlpha(Key);
        end;
      end;

  else
    Ok := True;
  end;

  if (not Ok) then
  begin
    Key := #0;
    Exit;
  end;

  if (TamanhoMaximo > 0) and (Length(Resposta) >= TamanhoMaximo) then
    Key := #0;
end;

procedure TFrmPDV_TEF_Campo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOK) then
  begin
    if (TamanhoMinimo > 0) and (Length(Resposta) < TamanhoMinimo) then
    begin
      ShowMessage('O Tamanho Mínimo para este campo e: ' + IntToStr(TamanhoMinimo));
      CanClose := False;
      edtResposta.SetFocus;
    end
    else if (TamanhoMaximo > 0) and (Length(Resposta) > TamanhoMaximo) then
    begin
      ShowMessage('O Tamanho Maximo para este campo e: ' + IntToStr(TamanhoMaximo));
      CanClose := False;
      edtResposta.SetFocus;
    end
  end;
end;

procedure TFrmPDV_TEF_Campo.FormCreate(Sender: TObject);
begin
  FTamanhoMinimo := 0;
  FTamanhoMaximo := 0;
  fTipoCampo     := tcoString;
  fMascara       := '';
end;

procedure TFrmPDV_TEF_Campo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      ModalResult := mrCancel;
    VK_RETURN:
      if (TamanhoMinimo <= 0) or (Length(edtResposta.Text) >= TamanhoMinimo) then
        ModalResult := mrOK;
  end;
end;

function TFrmPDV_TEF_Campo.GetOcultar: Boolean;
begin
  Result := (edtResposta.PasswordChar <> #0);
end;

procedure TFrmPDV_TEF_Campo.SetMascara(const Value: String);
begin
  if fMascara = Value then
    Exit;

  fMascara := StringReplace(Value, '@', '*', [rfReplaceAll]);
end;

procedure TFrmPDV_TEF_Campo.SetOcultar(const Value: Boolean);
begin
  if Value then
    edtResposta.PasswordChar := '*'
  else
    edtResposta.PasswordChar := #0;
end;

function TFrmPDV_TEF_Campo.GetResposta: String;
var
  AValor: Int64;
begin
  if (TipoCampo in [tcoCurrency, tcoDecimal]) then
  begin
    AValor := StrToIntDef(OnlyNumber(edtResposta.Text), 0);
    Result := FloatToString(AValor / 100, '.', '0.00');
  end
  else if (fMascara <> '') and (not fNaoRemoverMascaraResposta) then
    Result := ACBrValidador.RemoverMascara(edtResposta.Text, fMascara)
  else
    Result := edtResposta.Text;
end;

procedure TFrmPDV_TEF_Campo.SetResposta(const Value: String);
begin
  edtResposta.Text := Value;
end;

function TFrmPDV_TEF_Campo.GetTitulo: String;
begin
  Result := lblTitle.Caption;
end;

procedure TFrmPDV_TEF_Campo.SetTitulo(const Value: String);
var
  NumLin, AltLin: Integer;
begin
  lblTitle.Caption := Value;

  // Se houver quebra de linhas na msg, aumente o formulário...
  NumLin := CountStr(Value, CR);
  if (NumLin > 0) then
  begin
    AltLin := lblTitle.Canvas.TextHeight('H');
    Height := Height + (NumLin * AltLin);
  end;
end;

end.
