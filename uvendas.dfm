object fvendas: Tfvendas
  Left = 0
  Top = 0
  Caption = 'Vendas Diarias e Mensais'
  ClientHeight = 411
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 514
    object dtPesquisa: TDateTimePicker
      Left = 32
      Top = 16
      Width = 105
      Height = 21
      Date = 43818.000000000000000000
      Time = 0.363536435186688300
      TabOrder = 0
    end
    object cxButton1: TcxButton
      Left = 442
      Top = 1
      Width = 75
      Height = 55
      Align = alRight
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = cxButton1Click
      ExplicitLeft = 438
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 57
    Width = 250
    Height = 354
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 353
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DataSource2
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0,.00'
          Kind = skSum
          Column = cxGrid1DBTableView1Total
        end
        item
          Kind = skCount
          Column = cxGrid1DBTableView1Mes
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1Mes: TcxGridDBColumn
        DataBinding.FieldName = 'Mes'
        Width = 43
      end
      object cxGrid1DBTableView1Ano: TcxGridDBColumn
        DataBinding.FieldName = 'Ano'
        Width = 52
      end
      object cxGrid1DBTableView1Total: TcxGridDBColumn
        DataBinding.FieldName = 'Total'
        Width = 96
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGrid2: TcxGrid
    Left = 268
    Top = 57
    Width = 250
    Height = 354
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 264
    ExplicitHeight = 353
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0,.00'
          Kind = skSum
          Column = cxGridDBTableView1Total
        end
        item
          Kind = skCount
          Column = cxGridDBTableView1Data
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGridDBTableView1Data: TcxGridDBColumn
        DataBinding.FieldName = 'Data'
        Width = 108
      end
      object cxGridDBTableView1Total: TcxGridDBColumn
        DataBinding.FieldName = 'Total'
        Width = 87
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object fdVendasMes: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      
        'SELECT DATEPART(MM,pnf_data_emissao) AS Mes,DATEPART(YYYY,pnf_da' +
        'ta_emissao) AS Ano ,SUM(pnf_total_prods) AS Total from [pdv].[vw' +
        '_nota_fiscal] WHERE pnf_status=4'
      
        'GROUP BY DATEPART(MM,pnf_data_emissao), DATEPART(YYYY,pnf_data_e' +
        'missao)')
    Left = 176
    Top = 136
    object fdVendasMesMes: TIntegerField
      FieldName = 'Mes'
      Origin = 'Mes'
    end
    object fdVendasMesAno: TIntegerField
      FieldName = 'Ano'
      Origin = 'Ano'
    end
    object fdVendasMesTotal: TFMTBCDField
      FieldName = 'Total'
      Origin = 'Total'
      DisplayFormat = '0,.00'
      Precision = 38
      Size = 2
    end
  end
  object DataSource2: TDataSource
    DataSet = fdVendasMes
    Left = 248
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = fdVendasDia
    Left = 248
    Top = 232
  end
  object fdVendasDia: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      
        'SELECT SUM(pnf_total_prods) AS Total,pnf_data_emissao AS Data fr' +
        'om [pdv].[vw_nota_fiscal] WHERE pnf_status=4 AND '
      
        'DATEPART(mm,pnf_data_emissao)=10 AND DATEPART(yyyy,pnf_data_emis' +
        'sao)=2019'
      'GROUP BY pnf_data_emissao')
    Left = 176
    Top = 232
    object fdVendasDiaTotal: TFMTBCDField
      FieldName = 'Total'
      Origin = 'Total'
      Precision = 38
      Size = 2
    end
    object fdVendasDiaData: TSQLTimeStampField
      FieldName = 'Data'
      Origin = 'Data'
    end
  end
end
