unit uFrmPDV_TEF_Parcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins, cxTextEdit,
  cxCurrencyEdit, uWiEventsForm, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle;

type
  TFrmPDV_TEF_Parcelas = class(TForm)
    lblTitle: TLabel;
    Shape16: TShape;
    Shape27: TShape;
    edParcelas: TcxCurrencyEdit;
    Label1: TLabel;
    lblMsgRapida: TLabel;
    WiEventsForm1: TWiEventsForm;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPDV_TEF_Parcelas: TFrmPDV_TEF_Parcelas;

implementation

{$R *.dfm}

uses uFrmPDV;

procedure TFrmPDV_TEF_Parcelas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      if edParcelas.Focused then
        if edParcelas.value > 0 then
          ModalResult := mrOk;
  end;
end;

procedure TFrmPDV_TEF_Parcelas.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_TEF_Parcelas.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
