object FrmPDV_Desconto: TFrmPDV_Desconto
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 342
  ClientWidth = 347
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    347
    342)
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 24
    Width = 347
    Height = 318
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = 32
    ExplicitTop = 2
    ExplicitHeight = 376
  end
  object R: TShape
    Left = 0
    Top = 24
    Width = 347
    Height = 318
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Pen.Color = clSilver
    ExplicitWidth = 402
    ExplicitHeight = 377
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 347
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = -5
    ExplicitWidth = 403
  end
  object Label38: TLabel
    Left = 47
    Top = 3
    Width = 252
    Height = 19
    Caption = 'Desconto ou acrescimo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblMsgRapida: TLabel
    Left = 12
    Top = 318
    Width = 214
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [Enter] para confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    StyleElements = []
    ExplicitTop = 116
  end
  object Label3: TLabel
    Left = 89
    Top = 238
    Width = 73
    Height = 18
    Caption = 'Subtotal'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 102
    Top = 273
    Width = 60
    Height = 18
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Caption = 'TOTAL'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object cxgrpbxDesconto: TcxGroupBox
    Left = 20
    Top = 84
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Lucida Console'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 134
    Width = 301
    object Label6: TLabel
      Left = 73
      Top = 89
      Width = 73
      Height = 18
      Caption = 'por (%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 69
      Top = 32
      Width = 77
      Height = 18
      Caption = 'por (R$)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 206
      Top = 59
      Width = 18
      Height = 16
      Caption = 'ou'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDescPerc: TcxCurrencyEdit
      Left = 152
      Top = 82
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.OnChange = edDescPercPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Verdana'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Blue'
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 1
      Width = 130
    end
    object edDescValor: TcxCurrencyEdit
      Left = 152
      Top = 27
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.OnChange = edDescValorPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Verdana'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Blue'
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 0
      Width = 130
    end
  end
  object cxRdTipo: TcxRadioGroup
    Left = 12
    Top = 36
    Align = alCustom
    Alignment = alLeftCenter
    ParentFont = False
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'DESCONTO'
        Value = '0'
      end
      item
        Caption = 'ACRESCIMO'
        Value = '1'
      end>
    Properties.OnChange = cxRadioGroup1PropertiesChange
    ItemIndex = 1
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 42
    Width = 309
  end
  object edtSubTotal: TcxCurrencyEdit
    Left = 172
    Top = 233
    EditValue = 0.000000000000000000
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 2
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.OnChange = edDescValorPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.Color = clRed
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clWhite
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 2
    Width = 130
  end
  object edtTotal: TcxCurrencyEdit
    Left = 172
    Top = 267
    EditValue = 0.000000000000000000
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 2
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.OnChange = edDescValorPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.Color = clTeal
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clWhite
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 3
    Width = 130
  end
  object WiEventsForm1: TWiEventsForm
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 296
    Top = 332
  end
  object dsParam: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    Left = 63
    Top = 80
  end
end
