object FrmPDV_TEF_Parcelas: TFrmPDV_TEF_Parcelas
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmPDV_TEF_Parcelas'
  ClientHeight = 134
  ClientWidth = 336
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    336
    134)
  TextHeight = 13
  object Shape16: TShape
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
    ExplicitLeft = -59
    ExplicitWidth = 522
  end
  object lblTitle: TLabel
    Left = 64
    Top = 2
    Width = 228
    Height = 19
    Caption = 'Comprando Parcelado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Shape27: TShape
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
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 84
    Height = 16
    Caption = 'N'#186' Parcelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
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
  object edParcelas: TcxCurrencyEdit
    Left = 16
    Top = 57
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Width = 89
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edParcelas
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 128
    Top = 48
  end
end
