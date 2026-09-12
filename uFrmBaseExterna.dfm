object frmbaseexterna: Tfrmbaseexterna
  Left = 0
  Top = 0
  Caption = 'Importando Base Externa'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object cxGrid2: TcxGrid
    Left = 0
    Top = 73
    Width = 624
    Height = 314
    Align = alClient
    TabOrder = 0
    object cxGrid2DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
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
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 73
    Align = alTop
    TabOrder = 1
    object edFichaMesa: TLabeledEdit
      Left = 24
      Top = 26
      Width = 121
      Height = 23
      EditLabel.Width = 54
      EditLabel.Height = 15
      EditLabel.Caption = 'N'#186' Pedido'
      TabOrder = 0
      Text = ''
      OnExit = edFichaMesaExit
    end
  end
  object Memo3: TMemo
    Left = 272
    Top = 210
    Width = 185
    Height = 23
    Lines.Strings = (
      'Memo3')
    TabOrder = 2
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 387
    Width = 624
    Height = 54
    Align = alBottom
    TabOrder = 3
    object cxButton3: TcxButton
      Left = 1
      Top = 1
      Width = 239
      Height = 52
      Align = alLeft
      Caption = 'Gravar Pedido'
      TabOrder = 0
      OnClick = cxButton3Click
    end
    object cxButton4: TcxButton
      Left = 397
      Top = 1
      Width = 226
      Height = 52
      Align = alRight
      Caption = 'Retornar'
      TabOrder = 1
      OnClick = cxButton4Click
    end
  end
  object Memo1: TMemo
    Left = 40
    Top = 168
    Width = 417
    Height = 161
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
    TabOrder = 4
    Visible = False
  end
  object a1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'EXEC P_IMPORTAR_PRE_VENDA 10471')
    Left = 356
    Top = 272
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
  end
  object ds1: TDataSource
    DataSet = a1
    Left = 304
    Top = 272
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=em150700;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=BASEI9;Data Source=DESKTOP-7NNE20C'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 332
    Top = 232
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
    Left = 16
    Top = 104
  end
  object FDServerSyncDB: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvCmdExecMode]
    ResourceOptions.CmdExecMode = amNonBlocking
    LoginPrompt = False
    Left = 112
    Top = 112
  end
  object dsConfigSyncServer: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      'select * from pdv.tb_config_syncserver')
    Left = 224
    Top = 96
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
    Left = 220
    Top = 36
    ParamData = <
      item
        Name = 'VD_CODIGO'
        ParamType = ptInput
      end>
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
    Left = 404
    Top = 104
  end
end
