unit uFrmPDV_Desconto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins,
  cxTextEdit,
  cxCurrencyEdit, uWiEventsForm, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  cxGroupBox, cxRadioGroup;

type
  TFrmPDV_Desconto = class(TForm)
    Label38: TLabel;
    Shape16: TShape;
    lblMsgRapida: TLabel;
    WiEventsForm1: TWiEventsForm;
    dsParam: TFDQuery;
    cxgrpbxDesconto: TcxGroupBox;
    R: TShape;
    edDescPerc: TcxCurrencyEdit;
    edDescValor: TcxCurrencyEdit;
    Label6: TLabel;
    Label1: TLabel;
    cxRdTipo: TcxRadioGroup;
    Label2: TLabel;
    edtSubTotal: TcxCurrencyEdit;
    Label3: TLabel;
    Shape1: TShape;
    edtTotal: TcxCurrencyEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure edDescPercPropertiesChange(Sender: TObject);
    procedure edDescValorPropertiesChange(Sender: TObject);
    procedure cxRadioGroup1PropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CreateFlatRoundRgn;
    { Private declarations }
  public
    goTotal    : Double;
    goDesconto : Double;
    goAcrescimo: Double;
    goUserId   : Integer;
    goTipo     : Integer;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  FrmPDV_Desconto: TFrmPDV_Desconto;

implementation

{$R *.dfm}

uses uFrmPDV, uFrmPDV_Autorizacao;

procedure TFrmPDV_Desconto.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style             := WS_POPUP;
    WindowClass.Style := WindowClass.Style or CS_DROPSHADOW;
  end;

end;

procedure TFrmPDV_Desconto.cxRadioGroup1PropertiesChange(Sender: TObject);
var
  vForm: TFrmPDV_Autorizacao;
begin
  if cxRdTipo.ItemIndex = 1 then
    exit;
  vForm := TFrmPDV_Autorizacao.Create(self);
  try
    vForm.lblTitle.Caption := 'Desconto';
    vForm.goParamId        := 292;
    if vForm.ShowModal <> mrOK then
    begin
      cxRdTipo.ItemIndex := 1;
      exit;
    end;
    goTipo                   := cxRdTipo.ItemIndex;
    FrmPDV_Desconto.goUserId := StrToIntDef(vForm.edUsuario.Text, 0);
  finally
    vForm.Free;
    vForm := nil;
  end;

end;

procedure TFrmPDV_Desconto.edDescPercPropertiesChange(Sender: TObject);
begin
  if (edDescPerc.Value > 0) then
  begin
    edDescValor.Value   := 0;
    edDescValor.Enabled := False;
    if cxRdTipo.ItemIndex = 0 then
      edtTotal.Value := goTotal - (goTotal * (edDescPerc.Value / 100))
    else
      edtTotal.Value := goTotal + (goTotal * (edDescPerc.Value / 100));
  end
  else
  begin
    edDescValor.Enabled := True;
    edtTotal.Value      := goTotal
  end;

end;

procedure TFrmPDV_Desconto.edDescValorPropertiesChange(Sender: TObject);
begin
  if (edDescValor.Value > 0) then
  begin
    edDescPerc.Value   := 0;
    edDescPerc.Enabled := False;
    if cxRdTipo.ItemIndex = 0 then
      edtTotal.Value := goTotal - edDescValor.Value
    else
      edtTotal.Value := goTotal + edDescValor.Value;
  end
  else
  begin
    edDescPerc.Enabled := True;
    if (edDescPerc.Value <= 0) then
      edtTotal.Value := goTotal
  end;
end;

procedure TFrmPDV_Desconto.FormCreate(Sender: TObject);
begin
  BorderStyle := bsNone;
  CreateFlatRoundRgn;
end;

procedure TFrmPDV_Desconto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  loPercCalc, loMaxPerc: Double;
begin
  case Key of
    VK_RETURN:
      begin
        if (edDescPerc.Value >= 0) or (edDescValor.Value >= 0) then
          ModalResult := mrOK
        else
          ModalResult := mrCancel;
      end;
  end;
end;

procedure TFrmPDV_Desconto.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
  edtTotal.Value      := goTotal;
  edtSubTotal.Value   := goTotal;
  goTipo              := cxRdTipo.ItemIndex;
end;

procedure TFrmPDV_Desconto.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  close;
end;

procedure TFrmPDV_Desconto.CreateFlatRoundRgn;
const
  CORNER_SIZE = 6;
var
  Rgn: HRGN;
begin
  with BoundsRect do
  begin
    Rgn := CreateRoundRectRgn(0, 0, Right - Left + 1, Bottom - Top + 1, CORNER_SIZE, CORNER_SIZE);
    // exclude left-bottom corner
    // ExcludeRectRgn(Rgn, 0, Bottom - Top - CORNER_SIZE div 2, CORNER_SIZE div 2, Bottom - Top + 1);
    // exclude right-bottom corner
    // ExcludeRectRgn(Rgn, Right - Left - CORNER_SIZE div 2, Bottom - Top - CORNER_SIZE div 2, Right - Left, Bottom - Top);
  end;
  // the operating system owns the region, delete the Rgn only SetWindowRgn fails
  if SetWindowRgn(handle, Rgn, True) = 0 then
    DeleteObject(Rgn);

end;

end.
