object FrmPDV_PesqProds: TFrmPDV_PesqProds
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 508
  ClientWidth = 953
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    953
    508)
  TextHeight = 13
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 953
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
    Left = 537
    Top = 3
    Width = 408
    Height = 19
    Caption = 'Pesquisando Produtos Por Descri'#231#227'o'
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
    Width = 953
    Height = 484
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
  object cxGrid1: TcxGrid
    Left = 3
    Top = 60
    Width = 942
    Height = 444
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Wibi_Blue'
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyDown = cxGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = True
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = doProdutos
      DataController.Options = [dcoAssignGroupingValues, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
        end
        item
          Format = 'R$ ,0.00;-R$ ,0.00'
          Kind = skSum
          FieldName = 'pcxov_valor'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.ColumnHeaderHints = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1pr_codigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'pr_codigo'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        Width = 68
      end
      object cxGrid1DBTableView1pr_codigo_barras: TcxGridDBColumn
        Caption = 'C'#243'digo de barras'
        DataBinding.FieldName = 'pu_ean'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        Width = 161
      end
      object cxGrid1DBTableView1pr_descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o do produto'
        DataBinding.FieldName = 'pr_descricao'
        DataBinding.IsNullValueType = True
        VisibleForCustomization = False
        Width = 515
      end
      object cxGrid1DBTableView1Secao: TcxGridDBColumn
        Caption = 'Se'#231#227'o'
        DataBinding.FieldName = 'Secao'
        DataBinding.IsNullValueType = True
        Visible = False
        Options.AutoWidthSizable = False
        Width = 143
      end
      object cxGrid1DBTableView1Grupo: TcxGridDBColumn
        DataBinding.FieldName = 'Grupo'
        DataBinding.IsNullValueType = True
        Visible = False
        Options.AutoWidthSizable = False
        Width = 143
      end
      object cxGrid1DBTableView1pr_venda: TcxGridDBColumn
        Caption = 'Pre'#231'o (R$)'
        DataBinding.FieldName = 'pr_venda'
        DataBinding.IsNullValueType = True
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taRightJustify
        Options.AutoWidthSizable = False
        Width = 96
      end
      object cxGrid1DBTableView1_estoque: TcxGridDBColumn
        Caption = 'Estoque'
        DataBinding.FieldName = '_estoque'
        DataBinding.IsNullValueType = True
        Visible = False
        HeaderAlignmentHorz = taRightJustify
        Options.AutoWidthSizable = False
        Width = 94
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object edPesquisa: TSearchBox
    AlignWithMargins = True
    Left = 5
    Top = 28
    Width = 942
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    StyleElements = []
    OnInvokeSearch = edPesquisaInvokeSearch
  end
  object fdProdutos: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      'select * from v_pesquisa_produtos')
    Left = 452
    Top = 144
  end
  object doProdutos: TDataSource
    AutoEdit = False
    DataSet = fdProdutos
    Left = 540
    Top = 124
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edPesquisa
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 448
    Top = 216
  end
end
