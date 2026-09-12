object FrmPDV_ImportaPreVenda: TFrmPDV_ImportaPreVenda
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 446
  ClientWidth = 628
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
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 628
    Height = 70
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -5
    ExplicitTop = 25
    ExplicitWidth = 465
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 628
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = -5
    ExplicitWidth = 540
  end
  object Label38: TLabel
    Left = 244
    Top = 3
    Width = 108
    Height = 19
    Caption = 'Pr'#233'-Venda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblUser: TLabel
    Left = 12
    Top = 38
    Width = 68
    Height = 16
    Caption = 'N'#186' Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 94
    Width = 628
    Height = 298
    Align = alBottom
    TabOrder = 5
    object cxGrid2DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCustomDrawCell = cxGrid2DBTableView1CustomDrawCell
      DataController.DataSource = ds1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0,.00'
          Kind = skSum
          Column = cxGrid2DBTableView1Total
        end
        item
          Kind = skSum
          Column = cxGrid2DBTableView1qtd
        end
        item
          Kind = skCount
          Column = cxGrid2DBTableView1Descricao
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid2DBTableView1Controle: TcxGridDBColumn
        DataBinding.FieldName = 'Controle'
        Visible = False
      end
      object cxGrid2DBTableView1CodProduto: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CodProduto'
      end
      object cxGrid2DBTableView1qtd: TcxGridDBColumn
        DataBinding.FieldName = 'qtd'
        Width = 47
      end
      object cxGrid2DBTableView1Unidade: TcxGridDBColumn
        Caption = 'UN'
        DataBinding.FieldName = 'Unidade'
        Width = 27
      end
      object cxGrid2DBTableView1Descricao: TcxGridDBColumn
        DataBinding.FieldName = 'Descricao'
        Width = 214
      end
      object cxGrid2DBTableView1Preco: TcxGridDBColumn
        DataBinding.FieldName = 'Preco'
        Width = 56
      end
      object cxGrid2DBTableView1Total: TcxGridDBColumn
        DataBinding.FieldName = 'Total'
        Width = 62
      end
      object cxGrid2DBTableView1estoquef: TcxGridDBColumn
        Caption = 'Estoque'
        DataBinding.FieldName = 'estoquef'
        Width = 51
      end
      object cxGrid2DBTableView1Ncm: TcxGridDBColumn
        DataBinding.FieldName = 'Ncm'
        Width = 100
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object edFichaMesa: TcxCurrencyEdit
    Left = 8
    Top = 60
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    OnExit = edFichaMesaExit
    Width = 85
  end
  object Memo1: TMemo
    Left = 8
    Top = 190
    Width = 305
    Height = 153
    Lines.Strings = (
      'EXEC pdv.proc_add_item_nf @max = 0, -- int'
      '    @pnf_id = @pnf_id_in, -- int'
      '    @pr_codigo = @pr_codigo_in, -- int'
      '    @un_sigla = @un_sigla_in, -- varchar(3)'
      '    @pnfi_qtd = @pnfi_qtd_in, -- numeric'
      '    @pnfi_valor_unit = @pnfi_valor_unit_in, -- numeric'
      '    @pnfi_desconto = @pnfi_desconto_in, -- numeric'
      '    @nop_id = 1, -- int'
      '    @pnfi_id_comanda = @pnfi_id_comanda_in;')
    TabOrder = 1
    Visible = False
    WordWrap = False
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 317
    Width = 336
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
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
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = doVendas
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
      object cxGrid1DBTableView1vd_codigo: TcxGridDBColumn
        Caption = 'N'#186' Venda'
        DataBinding.FieldName = 'vd_codigo'
        DataBinding.IsNullValueType = True
        Width = 66
      end
      object cxGrid1DBTableView1vd_data_venda: TcxGridDBColumn
        Caption = 'Data Venda'
        DataBinding.FieldName = 'vd_data_venda'
        DataBinding.IsNullValueType = True
        Width = 82
      end
      object cxGrid1DBTableView1vd_valortotal: TcxGridDBColumn
        Caption = 'Valor Total'
        DataBinding.FieldName = 'vd_valortotal'
        DataBinding.IsNullValueType = True
        Width = 157
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Memo2: TMemo
    Left = 16
    Top = 145
    Width = 185
    Height = 41
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 628
    Height = 54
    Align = alBottom
    TabOrder = 4
    object cxButton1: TcxButton
      Left = 1
      Top = 1
      Width = 239
      Height = 52
      Align = alLeft
      Caption = 'Gravar Pedido'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 401
      Top = 1
      Width = 226
      Height = 52
      Align = alRight
      Caption = 'Retornar'
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Memo3: TMemo
    Left = 288
    Top = 186
    Width = 185
    Height = 23
    Lines.Strings = (
      'Memo3')
    TabOrder = 6
    Visible = False
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edFichaMesa
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 356
    Top = 40
  end
  object FDServerSyncDB: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amNonBlocking
    LoginPrompt = False
    Left = 136
    Top = 104
  end
  object FDScript1: TFDScript
    SQLScripts = <
      item
        Name = 'TRANSACAO'
      end>
    Connection = FrmPDV_DModule.ADConnection1
    Params = <>
    Macros = <>
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amNonBlocking
    Left = 32
    Top = 104
  end
  object fdtensSource: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amNonBlocking
    SQL.Strings = (
      
        'select * FROM pdv.vw_import_prevenda where vd_codigo = :vd_codig' +
        'o')
    Left = 252
    Top = 36
    ParamData = <
      item
        Name = 'VD_CODIGO'
        ParamType = ptInput
      end>
  end
  object dsConfigSyncServer: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      'select * from pdv.tb_config_syncserver')
    Left = 248
    Top = 104
  end
  object fdVendas: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amNonBlocking
    SQL.Strings = (
      'SELECT  1000 AS vd_codigo ,'
      '        '#39'01/01/2018'#39' AS vd_data_venda ,'
      '        28 AS vd_valortotal')
    Left = 136
    Top = 36
  end
  object doVendas: TDataSource
    AutoEdit = False
    DataSet = fdVendas
    Left = 356
    Top = 104
  end
  object ds1: TDataSource
    DataSet = a1
    Left = 304
    Top = 256
  end
  object a1: TADOQuery
    Connection = FrmPDV.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'EXEC P_IMPORTAR_PRE_VENDA 10471')
    Left = 356
    Top = 256
    object a1Controle: TAutoIncField
      FieldName = 'Controle'
      ReadOnly = True
    end
    object a1Preco: TFMTBCDField
      FieldName = 'Preco'
      ReadOnly = True
      DisplayFormat = '0,.00'
      Precision = 38
      Size = 20
    end
    object a1CodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object a1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
    object a1Unidade: TStringField
      FieldName = 'Unidade'
      Size = 10
    end
    object a1qtd: TBCDField
      FieldName = 'qtd'
      Precision = 18
      Size = 2
    end
    object a1Total: TBCDField
      FieldName = 'Total'
      DisplayFormat = '0,.00'
      Precision = 18
      Size = 2
    end
    object a1estoquef: TBCDField
      FieldName = 'estoquef'
      Precision = 18
      Size = 3
    end
    object a1Ncm: TStringField
      FieldName = 'Ncm'
    end
  end
end
