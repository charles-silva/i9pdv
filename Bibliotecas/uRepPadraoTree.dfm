object RepPadraoTree: TRepPadraoTree
  Tag = 1
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 373
  ClientWidth = 1016
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WiProfileGrid1: TWiProfileGrid
    Left = 0
    Top = 348
    Width = 1016
    Height = 25
    OnChangePerfil = WiProfileGrid1ChangePerfil
    Connection = FrmDModule.ADConnection1
  end
  object Panel1: TPanel
    Left = 0
    Top = 22
    Width = 1016
    Height = 69
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 159
      Top = 15
      Width = 44
      Height = 13
      Caption = 'Intervalo'
    end
    object Label1: TLabel
      Left = 310
      Top = 15
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 396
      Top = 15
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object ToolBar1: TToolBar
      Left = 760
      Top = 15
      Width = 48
      Height = 23
      Margins.Left = 10
      Margins.Right = 10
      Align = alNone
      AutoSize = True
      ButtonHeight = 19
      ButtonWidth = 40
      Caption = 'Filtrar'
      Color = 15461355
      DrawingStyle = dsGradient
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      GradientStartColor = clWhite
      List = True
      ParentColor = False
      ShowCaptions = True
      TabOrder = 0
      Transparent = True
      Wrapable = False
      object btnMostrar: TToolButton
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Hint = 'Mostrar'
        AutoSize = True
        Caption = 'Filtrar'
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = True
        OnClick = btnMostrarClick
      end
    end
    object WiDateSelect1: TWiDateSelect
      Left = 159
      Top = 29
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 20
      Properties.Items.Strings = (
        'Sem Per'#237'odo'
        'Per'#237'odo Personalizado'
        'Data Atual'
        'Semana Atual'
        'Semana Anterior'
        'M'#234's Atual'
        'M'#234's Anterior'
        'Ano Atual'
        'Ano Anterior')
      Properties.MaxLength = 0
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = 'Blue'
      Style.ButtonStyle = btsUltraFlat
      Style.ButtonTransparency = ebtAlways
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleFocused.BorderStyle = ebsThick
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.BorderStyle = ebsOffice11
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 1
      Text = 'Sem Per'#237'odo'
      DataFim = edDataFinal
      DataIni = edDataInicial
      ItemPadrao = 'Data Atual'
      Width = 145
    end
    object edDataInicial: TcxDateEdit
      Left = 310
      Top = 29
      Enabled = False
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = 'Blue'
      Style.ButtonStyle = btsUltraFlat
      Style.ButtonTransparency = ebtAlways
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleFocused.BorderStyle = ebsThick
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.BorderStyle = ebsOffice11
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 2
      Width = 80
    end
    object edDataFinal: TcxDateEdit
      Left = 396
      Top = 29
      Enabled = False
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = 'Blue'
      Style.ButtonStyle = btsUltraFlat
      Style.ButtonTransparency = ebtAlways
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleFocused.BorderStyle = ebsThick
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.BorderStyle = ebsOffice11
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 3
      Width = 80
    end
  end
  object WiServerPrint1: TWiServerPrint
    Left = 399
    Top = 168
    Width = 32
    Height = 32
    OnExecutePrint = WiServerPrint1ExecutePrint
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 91
    Width = 1016
    Height = 257
    Align = alClient
    TabOrder = 3
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    Properties.ShowFrame = True
    LookAndFeel.Kind = lfOffice11
    ClientRectBottom = 256
    ClientRectLeft = 1
    ClientRectRight = 1015
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      Caption = 'Lista'
      Color = clBtnFace
      ImageIndex = 103
      ParentColor = False
      object cxDBTreeList1: TcxDBTreeList
        Left = 0
        Top = 0
        Width = 1014
        Height = 255
        BorderStyle = cxcbsNone
        Align = alClient
        Bands = <>
        DataController.DataSource = doPlanoContas
        DataController.ParentField = 'pl_parentid'
        DataController.KeyField = 'pl_id'
        LookAndFeel.Kind = lfOffice11
        Navigator.Buttons.CustomButtons = <>
        OptionsView.Bands = True
        OptionsView.Footer = True
        OptionsView.GridLines = tlglBoth
        OptionsView.Indicator = True
        RootValue = -1
        TabOrder = 0
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Gr'#225'fico'
      Color = clBtnFace
      ImageIndex = 64
      ParentColor = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 1014
        Height = 255
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object cxGrid2DBChartView1: TcxGridDBChartView
          DataController.DataSource = doChart
          DiagramColumn.Active = True
          DiagramColumn.AxisCategory.TickMarkKind = tmkCross
          DiagramColumn.AxisValue.MinMaxValues = mmvAuto
          DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
          OptionsCustomize.DataGroupHiding = True
          ToolBox.DiagramSelector = True
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBChartView1
        end
      end
    end
  end
  object pnTopTitle: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 4
    object Label35: TLabel
      Left = 105
      Top = 84
      Width = 66
      Height = 23
      Caption = 'Clientes'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 15461355
      Font.Height = -19
      Font.Name = 'Impact'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblTitleTop: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 30
      Height = 16
      Align = alLeft
      Caption = 'T'#237'tulo'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 15461355
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <>
    Left = 328
    Top = 8
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppReportDB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'EX003'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = []
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 68
    Top = 238
    Version = '15.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppReportDB'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel36: TppLabel
        UserName = 'Label1'
        Border.Weight = 1.000000000000000000
        Caption = 'WiBiERP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3528
        mmLeft = 0
        mmTop = 265
        mmWidth = 10795
        BandType = 0
      end
      object lblTituloModulo: TppLabel
        UserName = 'Label14'
        Border.Weight = 1.000000000000000000
        Caption = 'MODULO EXPEDI'#199#195'O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3528
        mmLeft = 0
        mmTop = 3969
        mmWidth = 29845
        BandType = 0
      end
      object lblTituloReport: TppLabel
        UserName = 'Label16'
        Border.Weight = 1.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3514
        mmLeft = 0
        mmTop = 7673
        mmWidth = 24765
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText11'
        Anchors = [atTop, atRight]
        AutoSize = True
        Border.Weight = 1.000000000000000000
        DataField = 'c_fantasia'
        DataPipeline = ppConfig
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConfig'
        mmHeight = 2879
        mmLeft = 173277
        mmTop = 794
        mmWidth = 22860
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        Anchors = [atTop, atRight]
        Border.Weight = 1.000000000000000000
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 181066
        mmTop = 8202
        mmWidth = 15071
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line8'
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Style = lsDouble
        Weight = 0.400000005960464500
        mmHeight = 794
        mmLeft = 0
        mmTop = 11906
        mmWidth = 197380
        BandType = 0
      end
      object lblDataReportPE: TppLabel
        UserName = 'lblDataReport'
        Anchors = [atTop, atRight]
        AutoSize = False
        Border.Weight = 1.000000000000000000
        Caption = '00/00/0000 00:00:00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167297
        mmTop = 4498
        mmWidth = 28840
        BandType = 0
      end
      object lblFiltro: TppLabel
        UserName = 'Label3'
        CharWrap = True
        Border.Weight = 1.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2921
        mmLeft = 0
        mmTop = 14817
        mmWidth = 7408
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'Line1'
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Style = lsDouble
        Weight = 0.400000005960464500
        mmHeight = 2381
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel54: TppLabel
        UserName = 'Label6'
        Anchors = [atTop, atRight]
        Border.Weight = 1.000000000000000000
        Caption = 'www.wibitecnologia.com.br'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 159544
        mmTop = 1323
        mmWidth = 36513
        BandType = 8
      end
      object ppLabel55: TppLabel
        UserName = 'Label7'
        Anchors = [atTop, atRight]
        Border.Weight = 1.000000000000000000
        Caption = '+55 85 3268.2638'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 171001
        mmTop = 5027
        mmWidth = 23707
        BandType = 8
      end
      object lblMensagemPE: TppLabel
        UserName = 'lblMensagem'
        Border.Weight = 1.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2469
        mmLeft = 13229
        mmTop = 1058
        mmWidth = 20955
        BandType = 8
      end
      object lblReportID: TppLabel
        UserName = 'Label2'
        Border.Weight = 1.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2879
        mmLeft = 0
        mmTop = 1058
        mmWidth = 9356
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppConfig: TppBDEPipeline
    UserName = 'Config'
    Left = 149
    Top = 246
    object ppConfigppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'c_id'
      FieldName = 'c_id'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppConfigppField2: TppField
      FieldAlias = 'c_razaosocial'
      FieldName = 'c_razaosocial'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppConfigppField3: TppField
      FieldAlias = 'c_fantasia'
      FieldName = 'c_fantasia'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppConfigppField4: TppField
      FieldAlias = 'c_cnpj'
      FieldName = 'c_cnpj'
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
    object ppConfigppField5: TppField
      FieldAlias = 'c_endereco'
      FieldName = 'c_endereco'
      FieldLength = 70
      DisplayWidth = 70
      Position = 4
    end
    object ppConfigppField6: TppField
      FieldAlias = 'c_bairro'
      FieldName = 'c_bairro'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppConfigppField7: TppField
      FieldAlias = 'c_cidade'
      FieldName = 'c_cidade'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
    object ppConfigppField8: TppField
      FieldAlias = 'c_uf'
      FieldName = 'c_uf'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppConfigppField9: TppField
      FieldAlias = 'c_fone'
      FieldName = 'c_fone'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object ppConfigppField10: TppField
      FieldAlias = 'c_homepage'
      FieldName = 'c_homepage'
      FieldLength = 200
      DisplayWidth = 200
      Position = 9
    end
    object ppConfigppField11: TppField
      FieldAlias = 'c_email'
      FieldName = 'c_email'
      FieldLength = 200
      DisplayWidth = 200
      Position = 10
    end
    object ppConfigppField12: TppField
      FieldAlias = 'c_outrositens'
      FieldName = 'c_outrositens'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object ppConfigppField13: TppField
      FieldAlias = 'c_backupdir'
      FieldName = 'c_backupdir'
      FieldLength = 255
      DisplayWidth = 255
      Position = 12
    end
    object ppConfigppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'c_startdayweek'
      FieldName = 'c_startdayweek'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object ppConfigppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'c_periodoprmedio'
      FieldName = 'c_periodoprmedio'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppConfigppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'c_fp_codigo_cheque'
      FieldName = 'c_fp_codigo_cheque'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
    object ppConfigppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'c_percvalorprestconta'
      FieldName = 'c_percvalorprestconta'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 16
    end
    object ppConfigppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'c_refvalorprestconta'
      FieldName = 'c_refvalorprestconta'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object ppConfigppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'c_categtransporte'
      FieldName = 'c_categtransporte'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppConfigppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'em_codigo'
      FieldName = 'em_codigo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 19
    end
    object ppConfigppField21: TppField
      FieldAlias = 'c_directexped'
      FieldName = 'c_directexped'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
  end
  object ppReportDB: TppBDEPipeline
    UserName = 'ReportDB'
    Left = 45
    Top = 250
  end
  object cdsChart: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 396
    Top = 272
  end
  object doChart: TDataSource
    DataSet = cdsChart
    Left = 452
    Top = 264
  end
  object doPlanoContas: TDataSource
    AutoEdit = False
    DataSet = cdsPlanoContas
    Left = 424
    Top = 175
  end
  object cdsPlanoContas: TWiFDQuery
    ConnectionName = 'SimERPConn'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      
        'select pl_saldo,pl_orcada,pl_grupo, (pl_codigo + '#39' - '#39' +pl_nome)' +
        ' as pl_codigo_descr,pl_codigo_abrev,tp_categoria,pl_codigo,pl_no' +
        'me,pl_descricao,ppl_codigo,pl_analitica,pl_id,pl_parentid, pl_im' +
        'ageid, em_codigo, pl_status from financ_plano_contas order by pl' +
        '_codigo')
    CommandText = 
      'select pl_saldo,pl_orcada,pl_grupo, (pl_codigo + '#39' - '#39' +pl_nome)' +
      ' as pl_codigo_descr,pl_codigo_abrev,tp_categoria,pl_codigo,pl_no' +
      'me,pl_descricao,ppl_codigo,pl_analitica,pl_id,pl_parentid, pl_im' +
      'ageid, em_codigo, pl_status from financ_plano_contas order by pl' +
      '_codigo'
    CustomDelete = False
    MsgBeforeDelete = 'Confirmar exclus'#227'o da conta?'
    MsgTitleBeforeDelete = 'WiBiERP - Parâmetros'
    ShowMsgBeforeDelete = True
    ReadOnly = False
    Left = 352
    Top = 179
  end
end
