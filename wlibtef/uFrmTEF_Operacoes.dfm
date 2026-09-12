object FrmTEF_Operacoes: TFrmTEF_Operacoes
  Left = 0
  Top = 0
  ActiveControl = lstOpcoes
  BorderStyle = bsNone
  Caption = 'FrmTEF_Operacoes'
  ClientHeight = 336
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
  OnKeyDown = FormKeyDown
  DesignSize = (
    419
    336)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 419
    Height = 312
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = -124
    ExplicitWidth = 456
    ExplicitHeight = 364
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
    Left = 4
    Top = 4
    Width = 164
    Height = 16
    Caption = 'Formas de pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblMsgRapida: TLabel
    Left = 5
    Top = 315
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
  object lstOpcoes: TcxListView
    Left = 4
    Top = 30
    Width = 409
    Height = 277
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Columns = <
      item
        Caption = 'C'#243'digo'
        Width = 70
      end
      item
        Caption = 'Descri'#231#227'o'
        Width = 310
      end>
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    ShowHint = True
    Style.BorderStyle = cbsNone
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -20
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleFocused.BorderStyle = cbsNone
    StyleHot.BorderStyle = cbsNone
    TabOrder = 0
    ViewStyle = vsReport
  end
  object fdFormas: TWiFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      
        'SELECT fp_codigo,fp_descricao,fp_cartao FROM dbo.t_formaspag WHE' +
        'RE fp_pdv=1 AND fp_status=1 and (fp_dinheiro = 1 or :dinheiro = ' +
        '0)')
    CustomDelete = False
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 202
    Top = 200
    ParamData = <
      item
        Name = 'DINHEIRO'
        ParamType = ptInput
      end>
  end
  object foFormas: TDataSource
    AutoEdit = False
    DataSet = fdFormas
    Left = 262
    Top = 204
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    Left = 200
    Top = 156
  end
end
