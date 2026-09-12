object frmOpcoesTEF: TfrmOpcoesTEF
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmOpcoesTEF'
  ClientHeight = 350
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    530
    350)
  TextHeight = 15
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 530
    Height = 326
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitHeight = 327
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 530
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = -4
    ExplicitWidth = 522
  end
  object Label38: TLabel
    Left = 16
    Top = 3
    Width = 108
    Height = 19
    Caption = 'Opera'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblMsgRapida: TLabel
    Left = 8
    Top = 320
    Width = 217
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [Enter] para confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lstOpcoes: TcxListView
    Left = 4
    Top = 30
    Width = 524
    Height = 277
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Columns = <>
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
    ExplicitWidth = 512
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
