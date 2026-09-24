unit uFrmPDV_TEF_QRCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmPDV_TEF_QRCode = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    lblTitle: TLabel;
    lblInstrucao: TLabel;
    imgQRCode: TImage;
  public
    procedure ExibirQRCode(const ADadosQRCode: String);
  end;

var
  FrmPDV_TEF_QRCode: TFrmPDV_TEF_QRCode;

implementation

{$R *.dfm}

uses
  ACBrDelphiZXingQRCode;

// Gera o QR Code (biblioteca ZXing) e exibe em imgQRCode. Quem decide quando
// essa tela deve fechar � TFrmPDV.ACBrTEFAPI1QuandoExibirQRCode, ao receber
// DadosQRCode = '' (Pix aprovado/cancelado) -- ver coment�rio l�.
procedure TFrmPDV_TEF_QRCode.ExibirQRCode(const ADadosQRCode: String);
var
  QRCode      : TDelphiZXingQRCode;
  QRCodeBitmap: TBitmap;
  Row, Column : Integer;
begin
  QRCode       := TDelphiZXingQRCode.Create;
  QRCodeBitmap := TBitmap.Create;
  try
    QRCode.Encoding  := qrUTF8BOM;
    QRCode.QuietZone := 2;
    QRCode.Data      := ADadosQRCode;

    QRCodeBitmap.Width  := QRCode.Columns;
    QRCodeBitmap.Height := QRCode.Rows;

    for Row := 0 to QRCode.Rows - 1 do
      for Column := 0 to QRCode.Columns - 1 do
        if QRCode.IsBlack[Row, Column] then
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack
        else
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;

    imgQRCode.Picture.Bitmap.Assign(QRCodeBitmap);
  finally
    QRCode.Free;
    QRCodeBitmap.Free;
  end;
end;

end.
