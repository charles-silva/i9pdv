object RepPadrao2: TRepPadrao2
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
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WiProfileGrid1: TWiProfileGrid
    AlignWithMargins = True
    Left = 0
    Top = 348
    Width = 1016
    Height = 25
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    OnChangePerfil = WiProfileGrid1ChangePerfil
    Grid = cxGrid1
    Connection = FrmDModule.ADConnection1
  end
  object Panel1: TPanel
    Left = 0
    Top = 22
    Width = 1016
    Height = 59
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    TabStop = True
    object btnFiltrar: TcxButton
      Left = 450
      Top = 18
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Filtrar'
      Colors.Normal = clAqua
      Colors.NormalText = clBlack
      OptionsImage.Glyph.Data = {
        46050000424D4605000000000000360000002800000012000000120000000100
        2000000000001005000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF005826
        260058262600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0058262600EBD1D100E3BFBF0058262600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0058262600EBD1D100E2BBBB0058262600FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0058262600EBD1D100E4C0C0005826
        2600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0058262600EBD0
        D000E3BEBE0058262600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0058262600EBD1D100E3BEBE0058262600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0058262600F0DCDC00ECD3D300E2BCBC00D8A4A40058262600FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0058262600F2E2E200F1DFDF00ECD4D400E3BFBF00D8A4
        A400CD8B8B0058262600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0058262600F1DEDE00F4E5E500F2E1E100ECD3
        D300E1B9B900D6A0A000CC888800BF6A6A0058262600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0058262600E1B9B900F1DFDF00F3E3
        E300EED7D700E6C6C600DEB2B200D49B9B00CA848400BD656500A74848005826
        2600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0058262600EACECE00EACE
        CE00582626005826260058262600582626005826260058262600582626005826
        2600853939008539390058262600FF00FF00FF00FF00FF00FF00FF00FF005826
        26005826260058262600E1B9B900DEB2B200E2BCBC00E2BCBC00E2BCBC00E2BC
        BC00BD646400AF4B4B00582626005826260058262600FF00FF00FF00FF00FF00
        FF00FF00FF0058262600EACECE00E9CDCD00EACECE00E6C6C600E2BCBC003F3F
        3F003F3F3F00E2BCBC00C67A7A00B5535300AA4949007030300058262600FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF005826260058262600E6C6C600EACE
        CE00E2BCBC003F3F3F003F3F3F00E2BCBC00C16F6F00BB616100582626005826
        2600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF005826260058262600BB6161003F3F3F003F3F3F00BB616100582626005826
        2600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003F3F3F003F3F3F00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00}
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object WiDateSelect21: TWiDateSelect2
      Left = 14
      Top = 8
      Width = 417
      Height = 48
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
    Top = 81
    Width = 1016
    Height = 264
    Align = alClient
    TabOrder = 1
    TabStop = False
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    Properties.Images = FrmDModule.SmallImagesNew
    LookAndFeel.Kind = lfOffice11
    OnPageChanging = cxPageControl1PageChanging
    ClientRectBottom = 260
    ClientRectLeft = 4
    ClientRectRight = 1012
    ClientRectTop = 4
    object cxTabSheet1: TcxTabSheet
      Caption = 'Lista'
      ImageIndex = 103
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 264
        Align = alClient
        BevelKind = bkFlat
        BorderStyle = cxcbsNone
        TabOrder = 0
        TabStop = False
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'iMaginary'
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Filter.OnChanged = cxGrid1DBTableView1DataControllerFilterChanged
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.Summary.OnAfterSummary = cxGrid1DBTableView1DataControllerSummaryAfterSummary
          DataController.OnGroupingChanged = cxGrid1DBTableView1DataControllerGroupingChanged
          DataController.OnSortingChanged = cxGrid1DBTableView1DataControllerSortingChanged
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.Indicator = True
          OnColumnPosChanged = cxGrid1DBTableView1ColumnPosChanged
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Gr'#225'fico'
      Color = clBtnFace
      ImageIndex = 110
      ParentColor = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 227
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object cxGrid2DBChartView1: TcxGridDBChartView
          DataController.DataSource = doChart
          DiagramBar.Styles.ValueCaptions = cxStylePadraoRep
          DiagramColumn.Active = True
          DiagramColumn.AxisCategory.TickMarkKind = tmkCross
          DiagramColumn.AxisValue.MinMaxValues = mmvAuto
          DiagramColumn.Styles.ValueCaptions = cxStylePadraoRep
          DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
          DiagramLine.Styles.ValueCaptions = cxStylePadraoRep
          DiagramPie.Styles.ValueCaptions = cxStylePadraoRep
          DiagramStackedArea.Styles.ValueCaptions = cxStylePadraoRep
          DiagramStackedBar.Styles.ValueCaptions = cxStylePadraoRep
          DiagramStackedColumn.Styles.ValueCaptions = cxStylePadraoRep
          OptionsCustomize.DataGroupHiding = True
          ToolBox.DiagramSelector = True
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBChartView1
        end
      end
      object pnFilterCaption: TPanel
        Left = 0
        Top = 227
        Width = 1016
        Height = 37
        Align = alBottom
        Alignment = taLeftJustify
        BevelEdges = [beTop]
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object lblFilterCaption: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1010
          Height = 29
          Align = alClient
          AutoSize = False
          Color = clWhite
          EllipsisPosition = epEndEllipsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
          WordWrap = True
          ExplicitLeft = 0
          ExplicitWidth = 1008
          ExplicitHeight = 39
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
    Grid = cxGrid1
    PopupMenus = <>
    Left = 296
    Top = 92
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
        mmLeft = 166423
        mmTop = 1323
        mmWidth = 29634
        BandType = 8
      end
      object ppLabel55: TppLabel
        UserName = 'Label7'
        Anchors = [atTop, atRight]
        Border.Weight = 1.000000000000000000
        Caption = '+55 85 3021.2518'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 171848
        mmTop = 5027
        mmWidth = 22860
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
    DataSource = FrmDModule.doConfig
    UserName = 'Config'
    Left = 149
    Top = 246
  end
  object ppReportDB: TppBDEPipeline
    UserName = 'ReportDB'
    Left = 77
    Top = 158
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
  object cpChart: TdxComponentPrinter
    CurrentLink = cpChartPrinterContasReceber
    DateFormat = 1
    PreviewOptions.Caption = 'Visualizador'
    PreviewOptions.VisibleOptions = [pvoPageSetup, pvoPrint]
    PreviewOptions.WindowState = wsMaximized
    Version = 0
    Left = 28
    Top = 124
    object cpChartPrinterContasReceber: TdxGridReportLink
      Active = True
      Component = cxGrid2
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage.ScaleMode = smFit
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 42474.512262071760000000
      ShrinkToPageWidth = True
      StyleManager = psmChart
      OptionsCards.InterCardsSpaceVert = 15
      OptionsExpanding.ExpandCards = True
      OptionsExpanding.ExpandGroupRows = True
      OptionsExpanding.ExpandMasterRows = True
      OptionsLevels.Unwrap = True
      OptionsView.Caption = False
      BuiltInReportLink = True
    end
  end
  object psmChart: TdxPrintStyleManager
    CurrentStyle = psmChartStyle1
    Version = 0
    Left = 128
    Top = 132
    object psmChartStyle1: TdxPSPrintStyle
      AllowChangeMargins = False
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 5000
      PrinterPage.GrayShading = True
      PrinterPage.Header = 2400
      PrinterPage.Margins.Bottom = 5000
      PrinterPage.Margins.Left = 5000
      PrinterPage.Margins.Right = 5000
      PrinterPage.Margins.Top = 5000
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.Font.Charset = ANSI_CHARSET
      PrinterPage.PageFooter.Font.Color = clBlack
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Verdana'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageFooter.LeftTitle.Strings = (
        'Financeiro')
      PrinterPage.PageFooter.RightTitle.Strings = (
        'www.wibitecnologia.com.br'
        '+55 85 3268.2638')
      PrinterPage.PageHeader.Font.Charset = ANSI_CHARSET
      PrinterPage.PageHeader.Font.Color = clBlack
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Verdana'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageHeader.RightTitle.Strings = (
        '[Date & Time Printed]'
        'P'#225'gina [Page # of Pages #]')
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage.ScaleMode = smFit
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInStyle = True
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 288
    Top = 176
    PixelsPerInch = 96
    object cxStylePadraoRep: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlack
    end
  end
end
