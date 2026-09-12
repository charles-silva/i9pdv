object FrmPDV_IdentificaCliente: TFrmPDV_IdentificaCliente
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Identifica'#231#227'o do Cliente'
  ClientHeight = 222
  ClientWidth = 424
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    424
    222)
  TextHeight = 13
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 424
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = clSkyBlue
    ExplicitLeft = -5
  end
  object Label38: TLabel
    Left = 164
    Top = 2
    Width = 252
    Height = 19
    Caption = 'Identificando Cliente'
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
    Width = 424
    Height = 198
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -5
  end
  object lblMsgRapida: TLabel
    Left = 12
    Top = 204
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
  end
  object Label11: TLabel
    Left = 12
    Top = 100
    Width = 68
    Height = 14
    Caption = 'CPF / CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 149
    Width = 169
    Height = 14
    Caption = 'Nome do cliente (Opcional)'
    FocusControl = edNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object EDEN_CNPJCPF: TcxMaskEdit
    Left = 12
    Top = 115
    ParentFont = False
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.IgnoreMaskBlank = True
    Properties.EditMask = '999.999.999-99;0;_'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Text = '           '
    OnExit = EDEN_CNPJCPFExit
    Width = 154
  end
  object edNome: TcxTextEdit
    Left = 12
    Top = 165
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    Width = 377
  end
  object rgen_pessoa: TcxRadioGroup
    Left = 8
    Top = 27
    TabStop = False
    Caption = 'Pessoa'
    ParentFont = False
    Properties.Columns = 2
    Properties.DefaultValue = '1'
    Properties.ImmediatePost = True
    Properties.Items = <
      item
        Caption = '1 - F'#237'sica'
        Value = '0'
      end
      item
        Caption = '2 - Jur'#237'dica'
        Value = '1'
      end>
    Properties.OnChange = rgen_pessoaPropertiesChange
    ItemIndex = 0
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Whiteprint'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Whiteprint'
    TabOrder = 2
    Height = 49
    Width = 197
  end
  object WiEventsForm1: TWiEventsForm
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 296
    Top = 80
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 320
    Top = 46
  end
end
