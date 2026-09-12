object FrmAnaliserTXT: TFrmAnaliserTXT
  Left = -4
  Top = -4
  Caption = 'Analiser TXT'
  ClientHeight = 719
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1024
    Height = 719
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Mov'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object HeaderGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 691
        Align = alClient
        ColCount = 21
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Itens'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ItensGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 691
        Align = alClient
        ColCount = 21
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 272
    Top = 64
  end
  object cdsConfigTXT: TWiFDQuery
    ConnectionName = 'SimERPConn'
    SQL.Strings = (
      'select * from t_config_txt')
    CommandText = 'select * from t_config_txt'
    CustomDelete = False
    MsgBeforeDelete = 'Confirmar exclus'#227'o do registro?'
    MsgTitleBeforeDelete = 'Confirma'#231#227'o'
    ShowMsgBeforeDelete = True
    ReadOnly = False
    Left = 552
    Top = 280
  end
end
