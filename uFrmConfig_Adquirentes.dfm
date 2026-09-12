object FrmConfig_Adquirentes: TFrmConfig_Adquirentes
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro do terminal'
  ClientHeight = 427
  ClientWidth = 487
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
    487
    427)
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 487
    Height = 403
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -1
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 487
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
    Left = 9
    Top = 2
    Width = 276
    Height = 19
    Caption = 'Cadastro de Adquerentes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Shape1: TShape
    Left = 15
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
    Left = 15
    Top = 261
    Width = 42
    Height = 16
    Caption = 'Nome'
    FocusControl = edadq_nome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 13
    Top = 220
    Width = 36
    Height = 16
    Caption = 'CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 13
    Top = 390
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
    ExplicitTop = 346
  end
  object lblMsgRapida: TLabel
    Left = 13
    Top = 407
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
    ExplicitTop = 363
  end
  object Label2: TLabel
    Left = 15
    Top = 307
    Width = 88
    Height = 16
    Caption = 'Merchant ID'
    FocusControl = edadq_merchant_id
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 182
    Top = 307
    Width = 249
    Height = 16
    Caption = 'Chave de requisi'#231#227'o (Autom'#225'tico)'
    FocusControl = edadq_chave_requisicao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 13
    Top = 48
    Width = 457
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
      DataController.DataSource = doAdquirentes
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
      object cxGrid1DBTableView1adq_id: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'adq_id'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        Width = 40
      end
      object cxGrid1DBTableView1adq_cnpj: TcxGridDBColumn
        Caption = 'CNPJ'
        DataBinding.FieldName = 'adq_cnpj'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        Width = 120
      end
      object cxGrid1DBTableView1adq_nome: TcxGridDBColumn
        Caption = 'Nome do adquirente'
        DataBinding.FieldName = 'adq_nome'
        DataBinding.IsNullValueType = True
        Width = 137
      end
      object cxGrid1DBTableView1adq_merchant_id: TcxGridDBColumn
        Caption = 'Merchant ID'
        DataBinding.FieldName = 'adq_merchant_id'
        DataBinding.IsNullValueType = True
        Options.AutoWidthSizable = False
        Width = 107
      end
      object cxGrid1DBTableView1adq_ativo: TcxGridDBColumn
        Caption = 'Ativo'
        DataBinding.FieldName = 'adq_ativo'
        DataBinding.IsNullValueType = True
        HeaderAlignmentHorz = taCenter
        Options.AutoWidthSizable = False
        Width = 39
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object edadq_nome: TcxDBTextEdit
    Left = 15
    Top = 277
    DataBinding.DataField = 'adq_nome'
    DataBinding.DataSource = doAdquirentes
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
    TabOrder = 2
    Width = 455
  end
  object ckadq_ativo: TcxDBCheckBox
    Left = 11
    Top = 355
    Caption = 'Ativo'
    DataBinding.DataField = 'adq_ativo'
    DataBinding.DataSource = doAdquirentes
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
    TabOrder = 5
  end
  object edadq_cnpj: TcxDBMaskEdit
    Left = 13
    Top = 236
    DataBinding.DataField = 'adq_cnpj'
    DataBinding.DataSource = doAdquirentes
    ParentFont = False
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.IgnoreMaskBlank = True
    Properties.EditMask = '99.999.999/9999-99;0;_'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    OnExit = edadq_cnpjExit
    Width = 156
  end
  object edadq_merchant_id: TcxDBTextEdit
    Left = 15
    Top = 323
    DataBinding.DataField = 'adq_merchant_id'
    DataBinding.DataSource = doAdquirentes
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
    Width = 162
  end
  object edadq_chave_requisicao: TcxDBTextEdit
    Left = 182
    Top = 323
    TabStop = False
    DataBinding.DataField = 'adq_chave_requisicao'
    DataBinding.DataSource = doAdquirentes
    ParentFont = False
    Properties.ReadOnly = True
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
    Width = 288
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edadq_cnpj
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 353
    Top = 98
  end
  object dsAdquirentes: TWiFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'SELECT * FROM pdv.tb_adquirentes')
    CustomDelete = False
    ProcedureName = 'pdv.proc_input_tb_adquirentes'
    TableNameDelete = 'pdv.tb_adquirentes'
    KeyFieldRefresh = 'adq_id'
    KeyFieldDelete = 'adq_id'
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 220
    Top = 96
  end
  object doAdquirentes: TDataSource
    DataSet = dsAdquirentes
    Left = 292
    Top = 101
  end
end
