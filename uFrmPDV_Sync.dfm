object FrmPDV_Sync: TFrmPDV_Sync
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 132
  ClientWidth = 431
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 431
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = -7
    ExplicitWidth = 534
  end
  object Label38: TLabel
    Left = 159
    Top = 2
    Width = 264
    Height = 19
    Caption = 'Sincronizando os dados'
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
    Width = 431
    Height = 108
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -5
    ExplicitTop = 23
    ExplicitWidth = 385
  end
  object lblStatus: TLabel
    Left = 22
    Top = 56
    Width = 384
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sincronizando ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxProgressBar1: TcxProgressBar
    Left = 8
    Top = 100
    TabOrder = 0
    Width = 413
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 296
    Top = 36
  end
  object dsTableServer: TFDQuery
    Connection = FrmPDV_DModule.cnConnectionServer
    Left = 64
    Top = 84
  end
  object dsTableLocal: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    Left = 160
    Top = 84
  end
  object dsSyncTables: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    Left = 60
    Top = 28
  end
  object dsConfigSyncServer: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      'select * from pdv.tb_config_syncserver')
    Left = 192
    Top = 28
  end
  object FDScript1: TFDScript
    SQLScripts = <>
    Connection = FrmPDV_DModule.ADConnection1
    Params = <>
    Macros = <>
    Left = 260
    Top = 32
  end
  object FDScript2: TFDScript
    SQLScripts = <
      item
        Name = 'teste'
        SQL.Strings = (
          'update t_produtos set pr_descricao='#39'teste'#39)
      end>
    Connection = FrmPDV_DModule.ADConnection1
    Params = <>
    Macros = <>
    Left = 360
    Top = 44
  end
end
