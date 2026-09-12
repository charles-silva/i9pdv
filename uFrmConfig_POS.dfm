object FrmConfig_POS: TFrmConfig_POS
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro do terminal'
  ClientHeight = 429
  ClientWidth = 519
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
    519
    429)
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 519
    Height = 405
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -48
    ExplicitTop = 19
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 519
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
    Left = 16
    Top = 2
    Width = 336
    Height = 19
    Caption = 'Cadastrando Equipamentos POS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Shape1: TShape
    Left = 13
    Top = 209
    Width = 484
    Height = 1
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Brush.Style = bsClear
    Pen.Color = 11383299
  end
  object Label3: TLabel
    Left = 13
    Top = 30
    Width = 35
    Height = 16
    Caption = 'Lista'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 13
    Top = 216
    Width = 71
    Height = 16
    Caption = 'Descri'#231#227'o'
    FocusControl = edpos_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 13
    Top = 264
    Width = 80
    Height = 16
    Caption = 'Adquirente'
    FocusControl = cbadq_id
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMsgRapida: TLabel
    Left = 13
    Top = 406
    Width = 217
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [F2] para gravar altera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object Label2: TLabel
    Left = 13
    Top = 310
    Width = 41
    Height = 16
    Caption = 'Serial'
    FocusControl = edpos_serial
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 13
    Top = 387
    Width = 192
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [F3] para novo registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    StyleElements = []
  end
  object lbl1: TLabel
    Left = 272
    Top = 310
    Width = 62
    Height = 16
    Caption = 'Parcelas'
    FocusControl = cbadq_id
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 13
    Top = 52
    Width = 484
    Height = 147
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Wibi_Blue'
    object cxGrid1DBTableView1: TcxGridDBTableView
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
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = doEquipamentosPOS
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
      OptionsData.Appending = True
      OptionsData.CancelOnExit = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1pos_id: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'pos_id'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        Width = 58
      end
      object cxGrid1DBTableView1pos_descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'pos_descricao'
        DataBinding.IsNullValueType = True
        Width = 318
      end
      object cxGrid1DBTableView1pos_ativo: TcxGridDBColumn
        Caption = 'Ativo'
        DataBinding.FieldName = 'pos_ativo'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Options.AutoWidthSizable = False
        Width = 60
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object edpos_descricao: TcxDBTextEdit
    Left = 13
    Top = 232
    DataBinding.DataField = 'pos_descricao'
    DataBinding.DataSource = doEquipamentosPOS
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
    TabOrder = 1
    Width = 484
  end
  object ckpos_ativo: TcxDBCheckBox
    Left = 11
    Top = 356
    Caption = 'Ativo'
    DataBinding.DataField = 'pos_ativo'
    DataBinding.DataSource = doEquipamentosPOS
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.NullStyle = nssUnchecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Whiteprint'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Whiteprint'
    StyleFocused.LookAndFeel.SkinName = 'Whiteprint'
    StyleHot.LookAndFeel.SkinName = 'Whiteprint'
    TabOrder = 4
  end
  object cbadq_id: TcxDBLookupComboBox
    Left = 13
    Top = 280
    DataBinding.DataField = 'adq_id'
    DataBinding.DataSource = doEquipamentosPOS
    ParentFont = False
    Properties.ListColumns = <>
    Properties.ListOptions.ShowHeader = False
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
    Width = 484
  end
  object edpos_serial: TcxDBTextEdit
    Left = 13
    Top = 326
    DataBinding.DataField = 'pos_serial'
    DataBinding.DataSource = doEquipamentosPOS
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
    TabOrder = 3
    Width = 237
  end
  object ckpos_manual: TcxDBCheckBox
    Left = 91
    Top = 356
    Caption = 'Pagamento manual'
    DataBinding.DataField = 'pos_ativo'
    DataBinding.DataSource = doEquipamentosPOS
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.NullStyle = nssUnchecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Whiteprint'
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Whiteprint'
    StyleFocused.LookAndFeel.SkinName = 'Whiteprint'
    StyleHot.LookAndFeel.SkinName = 'Whiteprint'
    TabOrder = 5
  end
  object edtCurParcelas: TcxDBCurrencyEdit
    Left = 272
    Top = 326
    DataBinding.DataField = 'pos_parcelas'
    DataBinding.DataSource = doEquipamentosPOS
    ParentFont = False
    Properties.DisplayFormat = '0'
    Properties.MaxValue = 24.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 6
    Width = 80
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edpos_descricao
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 353
    Top = 98
  end
  object dsEquipamentosPOS: TWiFDQuery
    AfterInsert = dsEquipamentosPOSAfterInsert
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'SELECT  * ,'
      '        ( SELECT    x.adq_nome'
      '          FROM      pdv.tb_adquirentes x'
      '          WHERE     x.adq_id = y.adq_id ) AS adq_nome'
      'FROM    pdv.tb_pos y;')
    CustomDelete = False
    ProcedureName = 'pdv.proc_input_tb_pos'
    TableNameDelete = 'pdv.tb_pos'
    KeyFieldRefresh = 'pos_id'
    KeyFieldDelete = 'pos_id'
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 96
    Top = 88
  end
  object doEquipamentosPOS: TDataSource
    DataSet = dsEquipamentosPOS
    Left = 180
    Top = 85
  end
end
