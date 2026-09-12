object FrmConfig_Connection_Manual: TFrmConfig_Connection_Manual
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 251
  ClientWidth = 405
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    405
    251)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 405
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    OnMouseDown = Shape16MouseDown
    ExplicitTop = 1
  end
  object Label38: TLabel
    Left = 229
    Top = 2
    Width = 168
    Height = 19
    Caption = 'Conex'#227'o manual'
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
    Width = 405
    Height = 227
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -1
    ExplicitHeight = 267
  end
  object Label11: TLabel
    Left = 14
    Top = 37
    Width = 61
    Height = 16
    Caption = 'Servidor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 14
    Top = 77
    Width = 116
    Height = 16
    Caption = 'Banco de Dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 14
    Top = 118
    Width = 55
    Height = 16
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 14
    Top = 158
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
  object Label4: TLabel
    Left = 170
    Top = 37
    Width = 39
    Height = 16
    Caption = 'Porta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edServidor: TcxTextEdit
    Left = 14
    Top = 53
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Width = 150
  end
  object edBancoDados: TcxTextEdit
    Left = 14
    Top = 93
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 2
    Width = 150
  end
  object edUsuario: TcxTextEdit
    Left = 14
    Top = 133
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 3
    Width = 150
  end
  object edSenha: TcxTextEdit
    Left = 14
    Top = 173
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 4
    Width = 150
  end
  object btnVoltar: TcxButton
    Left = 219
    Top = 200
    Width = 100
    Height = 43
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = '&Retornar'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 81
    OptionsImage.Images = FrmPDV_DModule.SmallImagesNew
    TabOrder = 7
    OnClick = btnVoltarClick
  end
  object btnConfirma: TcxButton
    Left = 117
    Top = 200
    Width = 100
    Height = 43
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = '&Ok'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 203
    OptionsImage.Images = FrmPDV_DModule.SmallImagesNew
    TabOrder = 6
    OnClick = btnConfirmaClick
  end
  object edPorta: TcxCurrencyEdit
    Left = 170
    Top = 53
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    Width = 61
  end
  object cxButton1: TcxButton
    Left = 14
    Top = 200
    Width = 100
    Height = 43
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = '&Analisar'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 243
    OptionsImage.Images = FrmPDV_DModule.SmallImagesNew
    TabOrder = 5
    OnClick = cxButton1Click
  end
  object cnTest: TFDConnection
    Params.Strings = (
      'Server=138.118.143.0\SQLEXPRESS,1597 '
      'User_Name=sa'
      'Database=ERPWibi'
      'Password=WiBiERP!@#_2013*'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 308
    Top = 20
  end
  object WiEventsForm1: TWiEventsForm
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 190
    Top = 119
  end
end
