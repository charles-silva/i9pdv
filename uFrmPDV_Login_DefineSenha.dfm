object FrmPDV_Login_DefineSenha: TFrmPDV_Login_DefineSenha
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Editar Senha de Login'
  ClientHeight = 166
  ClientWidth = 262
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    262
    166)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 262
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    OnMouseDown = Shape16MouseDown
    ExplicitTop = -1
  end
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 262
    Height = 142
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 23
    ExplicitHeight = 139
  end
  object lblPass1: TLabel
    Left = 8
    Top = 32
    Width = 45
    Height = 16
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPass2: TLabel
    Left = 8
    Top = 76
    Width = 128
    Height = 16
    Caption = 'Confirme a Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label38: TLabel
    Left = 28
    Top = 0
    Width = 225
    Height = 23
    Caption = 'Redefinindo a Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object cxPass1: TcxTextEdit
    Left = 8
    Top = 48
    ParentFont = False
    Properties.EchoMode = eemPassword
    Properties.OnChange = cxPass1PropertiesChange
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Width = 135
  end
  object cxPass2: TcxTextEdit
    Left = 8
    Top = 92
    ParentFont = False
    Properties.EchoMode = eemPassword
    Properties.OnChange = cxPass1PropertiesChange
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    Width = 135
  end
  object btnConfirmar: TcxButton
    Left = 8
    Top = 133
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = '1 - Ok'
    Enabled = False
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 203
    OptionsImage.Images = FrmPDV_DModule.SmallImagesNew
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object btnVoltar: TcxButton
    Left = 111
    Top = 133
    Width = 98
    Height = 25
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = '2 - Retorna'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 81
    OptionsImage.Images = FrmPDV_DModule.SmallImagesNew
    TabOrder = 3
    OnClick = btnVoltarClick
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = cxPass1
    Left = 168
    Top = 48
  end
end
