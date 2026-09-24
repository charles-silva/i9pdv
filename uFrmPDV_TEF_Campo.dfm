object FrmPDV_TEF_Campo: TFrmPDV_TEF_Campo
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmPDV_TEF_Campo'
  ClientHeight = 134
  ClientWidth = 336
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    336
    134)
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 24
    Width = 336
    Height = 110
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 23
    ExplicitWidth = 287
    ExplicitHeight = 108
  end
  object Shape2: TShape
    Left = 0
    Top = 0
    Width = 336
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitWidth = 522
  end
  object lblTitle: TLabel
    Left = 8
    Top = 2
    Width = 320
    Height = 19
    AutoSize = False
    Caption = 'TEF'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblMsgRapida: TLabel
    Left = 16
    Top = 113
    Width = 188
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [Enter] para confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    StyleElements = []
    ExplicitTop = 111
  end
  object edResposta: TEdit
    Left = 16
    Top = 57
    Width = 300
    Height = 29
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edRespostaKeyPress
  end
end
