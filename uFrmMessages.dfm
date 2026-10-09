object FrmMessages: TFrmMessages
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmMessages'
  ClientHeight = 198
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnKeyDown = FormKeyDown
  DesignSize = (
    470
    198)
  TextHeight = 15
  object Shape1: TShape
    Left = 0
    Top = 24
    Width = 470
    Height = 174
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 22
    ExplicitWidth = 447
    ExplicitHeight = 159
  end
  object Shape2: TShape
    Left = 0
    Top = 0
    Width = 470
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = -99
    ExplicitWidth = 423
  end
  object lblTitle: TLabel
    Left = 7
    Top = 3
    Width = 60
    Height = 19
    Caption = 'Aviso'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblStatus: TLabel
    Left = 21
    Top = 28
    Width = 421
    Height = 125
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aguarde...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object lblMensagemRodape: TLabel
    Left = 138
    Top = 136
    Width = 170
    Height = 14
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [Enter] para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    StyleElements = []
  end
end
