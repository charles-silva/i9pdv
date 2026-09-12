object FrmPDV_POS_Manual: TFrmPDV_POS_Manual
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro do terminal'
  ClientHeight = 356
  ClientWidth = 427
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    427
    356)
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 427
    Height = 332
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 23
    ExplicitWidth = 432
    ExplicitHeight = 336
  end
  object Label14: TLabel
    Left = 10
    Top = 37
    Width = 19
    Height = 16
    Caption = 'Bin'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label36: TLabel
    Left = 10
    Top = 89
    Width = 206
    Height = 16
    Caption = 'Nome do propriet'#225'rio no cart'#227'o'
    FocusControl = edpnfp_pos_dono_cartao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 427
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    OnMouseDown = Shape16MouseDown
    ExplicitLeft = 13
    ExplicitWidth = 443
  end
  object Label38: TLabel
    Left = 4
    Top = 4
    Width = 408
    Height = 19
    Caption = 'Informa'#231#245'es de transa'#231#227'o do cart'#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Label2: TLabel
    Left = 10
    Top = 336
    Width = 95
    Height = 12
    Anchors = [akLeft, akBottom]
    Caption = '[Enter] - Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 10
    Top = 139
    Width = 78
    Height = 16
    Caption = 'Bandeira *'
    FocusControl = edpnfp_pos_dono_cartao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 160
    Top = 37
    Width = 85
    Height = 16
    Caption = #218'lt. 4 Digitos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 269
    Top = 37
    Width = 103
    Height = 16
    Caption = 'Validade Cart'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 216
    Top = 139
    Width = 93
    Height = 16
    Caption = 'Adquirente *'
    FocusControl = edpnfp_pos_dono_cartao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 281
    Width = 51
    Height = 16
    Caption = 'Valor *'
    FocusControl = edpnfp_pos_dono_cartao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 10
    Top = 187
    Width = 42
    Height = 16
    Caption = 'NSU *'
    FocusControl = edpnfp_pos_dono_cartao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 10
    Top = 233
    Width = 153
    Height = 16
    Caption = 'C'#243'digo autoriza'#231#227'o *'
    FocusControl = edpnfp_pos_dono_cartao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 142
    Top = 281
    Width = 75
    Height = 16
    Caption = 'Parcelas *'
    FocusControl = edpnfp_pos_dono_cartao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edpnfp_pos_dono_cartao: TcxTextEdit
    Left = 10
    Top = 105
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 3
    Width = 406
  end
  object edpnfp_pos_bin: TcxCurrencyEdit
    Left = 10
    Top = 53
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Width = 140
  end
  object edpnfp_pos_valor: TcxCurrencyEdit
    Left = 10
    Top = 296
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
    Properties.Nullable = False
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 8
    Width = 120
  end
  object edpnfp_pos_ult_quatro_dig: TcxCurrencyEdit
    Left = 160
    Top = 53
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    Width = 101
  end
  object edpnfp_pos_data_expiracao: TcxDateEdit
    Left = 269
    Top = 53
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 2
    Width = 98
  end
  object edpnfp_pos_id_fila: TcxCurrencyEdit
    Left = 10
    Top = 203
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 6
    Width = 85
  end
  object edpnfp_pos_codigo_aut: TcxCurrencyEdit
    Left = 10
    Top = 250
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 7
    Width = 85
  end
  object edpnfp_pos_parcelas: TcxCurrencyEdit
    Left = 142
    Top = 296
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 9
    Width = 68
  end
  object edpnfp_pos_tipo: TcxComboBox
    Left = 10
    Top = 156
    ParentFont = False
    Properties.DropDownListStyle = lsEditFixedList
    Properties.DropDownRows = 20
    Properties.ImmediatePost = True
    Properties.Items.Strings = (
      'AGICARD'
      'AMERICAN EXPRESS'
      'AURA'
      'AVISTA'
      'CABAL'
      'CREDSYSTEM'
      'DINERS'
      'ELO'
      'GOOD CARD'
      'GREEN CARD'
      'HIPER'
      'JCB'
      'MASTER'
      'POLICARD'
      'SODEXO'
      'SOROCARD'
      'VALECARD'
      'VEROCHEQUE'
      'VISA')
    Properties.Sorted = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 4
    Width = 200
  end
  object edpnfp_pos_inst_financeira: TcxLookupComboBox
    Left = 216
    Top = 156
    Enabled = False
    ParentFont = False
    Properties.ListColumns = <>
    Properties.ListOptions.ShowHeader = False
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 5
    Width = 200
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edpnfp_pos_tipo
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 310
    Top = 209
  end
end
