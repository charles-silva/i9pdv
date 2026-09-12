object FrmPDV_Balanca: TFrmPDV_Balanca
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmPDV_Balanca'
  ClientHeight = 170
  ClientWidth = 419
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 419
    Height = 146
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 19
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 419
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = 13
    ExplicitWidth = 443
  end
  object Label38: TLabel
    Left = 231
    Top = 2
    Width = 180
    Height = 19
    Caption = 'Lendo a balan'#231'a'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblStatus: TLabel
    Left = 39
    Top = 82
    Width = 337
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aguardando leitura da balan'#231'a...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ACBrBAL1: TACBrBAL
    Porta = 'COM1'
    OnLePeso = ACBrBAL1LePeso
    Left = 52
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 196
    Top = 72
  end
end
