object FrmCondFormasPopUpAdd: TFrmCondFormasPopUpAdd
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Condi'#231#245'es e Formas'
  ClientHeight = 356
  ClientWidth = 682
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 316
    Width = 682
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnConfirmar: TcxButton
      Left = 3
      Top = 6
      Width = 86
      Height = 25
      Cursor = crHandPoint
      Caption = 'Confirmar'
      Enabled = False
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.SkinName = 'Office2010Silver'
      OptionsImage.Glyph.Data = {
        46050000424D4605000000000000360000002800000012000000120000000100
        2000000000001005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF0000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
        FF000000FF000000FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007F7F7F000000FF000000FF0000000000FF00FF000000FF000000FF000000
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF007F7F7F000000FF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF000000FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FF000000FF000000FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FF000000FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF007F7F7F000000FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007F7F7F000000
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FF000000FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00}
      TabOrder = 0
      TabStop = False
      OnClick = btnConfirmarClick
    end
    object cxButton1: TcxButton
      Left = 95
      Top = 6
      Width = 86
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.SkinName = 'Office2010Silver'
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0005B70005B7FF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FF0005B7
        0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005
        B70005B7FF00FFFF00FFFF00FF0005B70005B60005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF
        0006D70005BA0005B70005B7FF00FFFF00FFFF00FFFF00FF0005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B6FF
        00FF0005B60005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0005B60006C70006C70006CE0005B4FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006C100
        05C10006DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0005B60006D70006CE0006DA0006E9FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006E50006DA0006D3FF
        00FFFF00FF0006E50006EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F80006DA0006EFFF00FFFF00FFFF00FFFF00FF0006F80006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F8FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F6FF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F6FF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F6
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      TabStop = False
      OnClick = btnCancelarClick
    end
  end
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alLeft
    Caption = 'Condi'#231#245'es de Pagamento'
    Style.LookAndFeel.SkinName = 'Caramel'
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
    TabOrder = 1
    Height = 310
    Width = 369
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 18
      Width = 357
      Height = 280
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = ''
      ExplicitHeight = 279
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnSelectionChanged = cxGrid1DBTableView1SelectionChanged
        DataController.DataSource = doCondicoes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGrid1DBTableView1cp_codigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'cp_codigo'
          SortIndex = 0
          SortOrder = soAscending
          Width = 57
        end
        object cxGrid1DBTableView1cp_descricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o da Condi'#231#227'o'
          DataBinding.FieldName = 'cp_descricao'
          Width = 143
        end
        object cxGrid1DBTableView1cp_prazo: TcxGridDBColumn
          Caption = 'Prazo'
          DataBinding.FieldName = 'cp_prazo'
          Width = 119
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 378
    Top = 3
    Align = alClient
    Caption = 'Formas de Pagamento'
    Style.LookAndFeel.SkinName = 'Caramel'
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
    TabOrder = 2
    Height = 310
    Width = 301
    object cxGrid2: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 18
      Width = 289
      Height = 280
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = ''
      ExplicitHeight = 279
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnSelectionChanged = cxGridDBTableView1SelectionChanged
        DataController.DataSource = doFormas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGridDBTableView1fp_codigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'fp_codigo'
          SortIndex = 0
          SortOrder = soAscending
          Width = 57
        end
        object cxGridDBTableView1fp_descricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o da Forma'
          DataBinding.FieldName = 'fp_descricao'
          Width = 194
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object doCondicoes: TDataSource
    DataSet = cdsCondicoes
    Left = 152
    Top = 94
  end
  object doFormas: TDataSource
    DataSet = cdsFormas
    Left = 323
    Top = 86
  end
  object cdsCondicoes: TWiFDQuery
    ConnectionName = 'SimERPConn'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select a.* from t_condicoespag a, t_condXformapag b where a.cp_c' +
        'odigo = b.cp_codigo and cp_status =1')
    CommandText = 
      'select a.* from t_condicoespag a, t_condXformapag b where a.cp_c' +
      'odigo = b.cp_codigo and cp_status =1'
    CustomDelete = False
    MsgBeforeDelete = 'Confirmar exclus'#227'o do registro?'
    MsgTitleBeforeDelete = 'Confirma'#231#227'o'
    ShowMsgBeforeDelete = True
    ReadOnly = True
    Left = 152
    Top = 38
  end
  object cdsFormas: TWiFDQuery
    AfterScroll = cdsFormasAfterScroll
    ConnectionName = 'SimERPConn'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from t_formaspag where fp_status = 1')
    CommandText = 'select * from t_formaspag where fp_status = 1'
    CustomDelete = False
    MsgBeforeDelete = 'Confirmar exclus'#227'o do registro?'
    MsgTitleBeforeDelete = 'Confirma'#231#227'o'
    ShowMsgBeforeDelete = True
    ReadOnly = True
    Left = 315
    Top = 54
  end
end
