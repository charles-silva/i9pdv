object FrmConfig_Balanca: TFrmConfig_Balanca
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro do terminal'
  ClientHeight = 576
  ClientWidth = 456
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    456
    576)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 456
    Height = 552
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 25
    ExplicitHeight = 548
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 456
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
    Left = 148
    Top = 2
    Width = 300
    Height = 19
    Caption = 'Cadastramento de balan'#231'as'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Shape1: TShape
    Left = 1
    Top = 209
    Width = 455
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
    FocusControl = edpbal_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 319
    Top = 216
    Width = 52
    Height = 16
    Caption = 'Modelo'
    FocusControl = cbpbal_modelo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 13
    Top = 258
    Width = 39
    Height = 16
    Caption = 'Porta'
    FocusControl = cbpbal_port
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 13
    Top = 302
    Width = 151
    Height = 16
    Caption = 'Taxa de transmiss'#227'o'
    FocusControl = cbpbal_baud
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 13
    Top = 344
    Width = 90
    Height = 16
    Caption = 'Bit de dados'
    FocusControl = cbpbal_data
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 13
    Top = 386
    Width = 64
    Height = 16
    Caption = 'Paridade'
    FocusControl = cbpbal_parity
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 13
    Top = 430
    Width = 105
    Height = 16
    Caption = 'Bits de parada'
    FocusControl = cbpbal_stop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 13
    Top = 474
    Width = 124
    Height = 16
    Caption = 'Controle de fluxo'
    FocusControl = cbpbal_handshake
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMsgRapida: TLabel
    Left = 13
    Top = 550
    Width = 250
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [F2] para gravar altera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    StyleElements = []
    ExplicitTop = 600
  end
  object cxGrid1: TcxGrid
    Left = 13
    Top = 48
    Width = 427
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
      DataController.DataSource = doBalancas
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
      object cxGrid1DBTableView1pbal_id: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'pbal_id'
        Options.AutoWidthSizable = False
        Width = 58
      end
      object cxGrid1DBTableView1pbal_descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'pbal_descricao'
        Width = 163
      end
      object cxGrid1DBTableView1pbal_modelo_descr: TcxGridDBColumn
        Caption = 'Modelo'
        DataBinding.FieldName = 'pbal_modelo_descr'
        Options.AutoWidthSizable = False
        Width = 97
      end
      object cxGrid1DBTableView1pbal_port: TcxGridDBColumn
        Caption = 'Porta'
        DataBinding.FieldName = 'pbal_port'
        Options.AutoWidthSizable = False
        Width = 56
      end
      object cxGrid1DBTableView1pbal_ativo: TcxGridDBColumn
        Caption = 'Ativo'
        DataBinding.FieldName = 'pbal_ativo'
        HeaderAlignmentHorz = taCenter
        Options.AutoWidthSizable = False
        Width = 39
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object edpbal_descricao: TcxDBTextEdit
    Left = 13
    Top = 232
    DataBinding.DataField = 'pbal_descricao'
    DataBinding.DataSource = doBalancas
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
    Width = 300
  end
  object ckpbal_ativo: TcxDBCheckBox
    Left = 10
    Top = 520
    Caption = 'Ativo'
    DataBinding.DataField = 'pbal_ativo'
    DataBinding.DataSource = doBalancas
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
    TabOrder = 9
  end
  object cbpbal_port: TcxDBLookupComboBox
    Left = 13
    Top = 275
    DataBinding.DataField = 'pbal_port'
    DataBinding.DataSource = doBalancas
    ParentFont = False
    Properties.DropDownListStyle = lsEditList
    Properties.ImmediatePost = True
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
    TabOrder = 3
    Width = 151
  end
  object cbpbal_baud: TcxDBLookupComboBox
    Left = 13
    Top = 318
    DataBinding.DataField = 'pbal_baud'
    DataBinding.DataSource = doBalancas
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
    TabOrder = 4
    Width = 151
  end
  object cbpbal_data: TcxDBLookupComboBox
    Left = 13
    Top = 358
    DataBinding.DataField = 'pbal_data'
    DataBinding.DataSource = doBalancas
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
    TabOrder = 5
    Width = 151
  end
  object cbpbal_parity: TcxDBLookupComboBox
    Left = 13
    Top = 402
    DataBinding.DataField = 'pbal_parity'
    DataBinding.DataSource = doBalancas
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
    TabOrder = 6
    Width = 151
  end
  object cbpbal_stop: TcxDBLookupComboBox
    Left = 13
    Top = 446
    DataBinding.DataField = 'pbal_stop'
    DataBinding.DataSource = doBalancas
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
    TabOrder = 7
    Width = 151
  end
  object cbpbal_handshake: TcxDBLookupComboBox
    Left = 13
    Top = 490
    DataBinding.DataField = 'pbal_handshake'
    DataBinding.DataSource = doBalancas
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
    TabOrder = 8
    Width = 151
  end
  object cbpbal_modelo: TcxDBLookupComboBox
    Left = 319
    Top = 232
    DataBinding.DataField = 'pbal_modelo'
    DataBinding.DataSource = doBalancas
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
    Width = 121
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edpbal_descricao
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 353
    Top = 98
  end
  object dsBalancas: TWiFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'SELECT * FROM pdv.vw_balancas')
    CustomDelete = False
    ProcedureName = 'pdv.proc_input_tb_balancas'
    TableNameDelete = 'pdv.tb_balancas'
    KeyFieldRefresh = 'pbal_id'
    KeyFieldDelete = 'pbal_id'
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 220
    Top = 96
  end
  object doBalancas: TDataSource
    DataSet = dsBalancas
    Left = 292
    Top = 101
  end
end
