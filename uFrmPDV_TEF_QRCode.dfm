object FrmPDV_TEF_QRCode: TFrmPDV_TEF_QRCode
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'FrmPDV_TEF_QRCode'
  ClientHeight = 420
  ClientWidth = 340
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 24
    Width = 340
    Height = 396
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 344
    ExplicitWidth = 313
    ExplicitHeight = 76
  end
  object Shape2: TShape
    Left = 0
    Top = 0
    Width = 340
    Height = 24
    Align = alTop
    Brush.Color = 5986569
    ExplicitWidth = 335
  end
  object lblTitle: TLabel
    Left = 4
    Top = 3
    Width = 332
    Height = 19
    Caption = 'Pagamento via Pix'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblInstrucao: TLabel
    Left = 20
    Top = 360
    Width = 300
    Height = 39
    Alignment = taCenter
    AutoSize = False
    Caption = 'Escaneie o QR Code no aplicativo do seu banco para pagar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object imgQRCode: TImage
    Left = 20
    Top = 40
    Width = 300
    Height = 300
    Center = True
    Proportional = True
  end
end
