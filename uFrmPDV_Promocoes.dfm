object FrmPDV_Promocoes: TFrmPDV_Promocoes
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmPDV_Promocoes'
  ClientHeight = 444
  ClientWidth = 643
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 643
    Height = 407
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -5
    ExplicitWidth = 435
    ExplicitHeight = 218
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 643
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = -5
    ExplicitTop = 3
    ExplicitWidth = 556
  end
  object Label38: TLabel
    Left = 223
    Top = 2
    Width = 108
    Height = 19
    Caption = 'PROMO'#199#213'ES'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblMsgRapida: TLabel
    Left = 0
    Top = 431
    Width = 643
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = 'Pressione [Enter] para confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
    ExplicitWidth = 217
  end
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 50
    Height = 16
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 84
    Top = 32
    Width = 71
    Height = 16
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object edCodigo: TcxCurrencyEdit
    Left = 8
    Top = 49
    TabStop = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -20
    Style.Font.Name = 'Courier New'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Visible = False
    Width = 65
  end
  object edDescricao: TcxTextEdit
    Left = 79
    Top = 49
    TabStop = False
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -20
    Style.Font.Name = 'Courier New'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    Visible = False
    Width = 458
  end
  object lstDescontoFormas: TcxListView
    Left = 10
    Top = 34
    Width = 625
    Height = 355
    Align = alCustom
    Columns = <
      item
        Caption = 'Descri'#231#227'o'
        Width = 250
      end
      item
        Caption = 'Desconto'
        Width = 240
      end
      item
        Caption = 'Total'
        Width = 120
      end
      item
        Caption = 'taxa'
        Width = 0
      end>
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    RowSelect = True
    ShowHint = True
    Style.BorderStyle = cbsNone
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -20
    Style.Font.Name = 'Courier New'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    StyleFocused.BorderStyle = cbsNone
    StyleHot.BorderStyle = cbsNone
    TabOrder = 2
    ViewStyle = vsReport
  end
  object fdPromocoes: TWiFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'SELECT fp_codigo, '
      'SUBSTRING(CONVERT(VARCHAR(4),fp_indice_pdv+1000),3,2)  '
      'AS fp_indice_pdv,fp_descricao,fp_cartao,'
      'fp_debito FROM dbo.t_formaspag '
      'WHERE fp_pdv=1 AND fp_status=1 and '
      '(fp_dinheiro = 1 or :dinheiro = 0)')
    CustomDelete = False
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 314
    Top = 152
    ParamData = <
      item
        Name = 'DINHEIRO'
        ParamType = ptInput
        Value = Null
      end>
  end
  object foFormas: TDataSource
    AutoEdit = False
    DataSet = fdPromocoes
    Left = 262
    Top = 204
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    Left = 200
    Top = 156
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edCodigo
    Left = 68
    Top = 152
  end
end
