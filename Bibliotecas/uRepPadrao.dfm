object RepPadrao: TRepPadrao
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
  OnCreate = FormCreate
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
    Top = 41
    Width = 1016
    Height = 69
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    TabStop = True
    object Label3: TLabel
      Left = 463
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Intervalo'
    end
    object Label1: TLabel
      Left = 614
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 700
      Top = 12
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object bvTop: TBevel
      Left = 0
      Top = 0
      Width = 1016
      Height = 2
      Align = alTop
      Shape = bsBottomLine
      ExplicitTop = 91
    end
    object ToolBar1: TToolBar
      Left = 765
      Top = 16
      Width = 65
      Height = 28
      Margins.Left = 10
      Margins.Right = 10
      Align = alNone
      AutoSize = True
      ButtonHeight = 24
      ButtonWidth = 57
      Caption = 'Filtrar'
      Color = 15461355
      DrawingStyle = dsGradient
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      GradientStartColor = clWhite
      Images = FrmDModule.SmallImagesNew
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
        Hint = 'Filtrar'
        AutoSize = True
        Caption = 'Filtrar'
        ImageIndex = 58
        ParentShowHint = False
        ShowHint = True
        OnClick = btnMostrarClick
      end
    end
    object WiDateSelect1: TWiDateSelect
      Left = 463
      Top = 24
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
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Blue'
      Style.ButtonStyle = btsUltraFlat
      Style.ButtonTransparency = ebtAlways
      StyleDisabled.Color = 13041606
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleDisabled.TextColor = clBlack
      StyleFocused.BorderStyle = ebsThick
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.BorderStyle = ebsOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 1
      Text = 'Sem Per'#237'odo'
      DataFim = edDataFinal
      DataIni = edDataInicial
      ItemPadrao = 'Sem Per'#237'odo'
      Width = 145
    end
    object edDataInicial: TcxDateEdit
      Left = 614
      Top = 24
      Enabled = False
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = 'Blue'
      Style.ButtonStyle = btsUltraFlat
      Style.ButtonTransparency = ebtAlways
      StyleDisabled.Color = 13041606
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleDisabled.TextColor = clBlack
      StyleFocused.BorderStyle = ebsThick
      StyleFocused.LookAndFeel.SkinName = 'Blue'
      StyleHot.BorderStyle = ebsOffice11
      StyleHot.LookAndFeel.SkinName = 'Blue'
      TabOrder = 2
      Width = 80
    end
    object edDataFinal: TcxDateEdit
      Left = 700
      Top = 24
      Enabled = False
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.SkinName = 'Blue'
      Style.ButtonStyle = btsUltraFlat
      Style.ButtonTransparency = ebtAlways
      StyleDisabled.Color = 13041606
      StyleDisabled.LookAndFeel.SkinName = 'Blue'
      StyleDisabled.TextColor = clBlack
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
    Width = 105
    Height = 105
    OnExecutePrint = WiServerPrint1ExecutePrint
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 0
    Top = 156
    Width = 1016
    Height = 189
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    TabOrder = 1
    TabStop = False
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    Properties.Images = FrmDModule.SmallImagesNew
    LookAndFeel.Kind = lfOffice11
    OnPageChanging = cxPageControl1PageChanging
    ClientRectBottom = 189
    ClientRectRight = 1016
    ClientRectTop = 0
    object cxTabSheet1: TcxTabSheet
      Caption = 'Lista'
      ImageIndex = 103
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 189
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        TabStop = False
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'iMaginary'
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Filter.OnChanged = cxGrid1DBTableView1DataControllerFilterChanged
          DataController.Filter.OnFormatFilterTextValue = cxGrid1DBTableView1DataControllerFilterFormatFilterTextValue
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
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 1016
        Height = 152
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
        Top = 152
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
  object Panel3: TPanel
    Left = 0
    Top = 22
    Width = 1016
    Height = 19
    Margins.Bottom = 0
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    TabStop = True
    Visible = False
    object imgVideo: TImage
      AlignWithMargins = True
      Left = 56
      Top = 0
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Video de Demonstra'#231#227'o'
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alLeft
      AutoSize = True
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
        0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
        1974455874536F6674776172650041646F626520496D616765526561647971C9
        653C0000024349444154384F9593CB4F135114C6D9B8736562176E6DD2B8AAB4
        924E5FF661ED7BA6534CE34611A820E8CE16482521554A8BE84A0C56898D0D75
        578845FF001F2D0831A90B8304134577EA4EAD0B35F93C676ADA621A8927F992
        FBCD39E737F7DE33D3C12149B2180C4AF0FB83D540404C8A6248A724760900F5
        452472726979F91179606BEB0D5C2E0F86872F606C2CF182C04982B60536007E
        7F0099CC3452E90C3C1E2F8A8B4B0AECEDBB6DC87237E2F151CC5CBB8EA1A1F3
        0A30140AEBB9AF0150ABD5FD9D9DBA794130BE369BADE8E9EDC3E4E414CC262B
        72B97BF8F1F3173636373138780E131349DCCADE0141F81D7500C55ED201D221
        925EA55279B55A6D5A104C15027E3943408BE52852A9343E7EFA8CEDF71FE0F5
        FAD75B017FC71ED27E929A7498A4D76834033ADD911B46A3E9953F1084D1688C
        2900DACA03BA7DF87C019E0293E1767B77788FC7473EA878166F9FA0FB140017
        73F0140A85FBA8D5BED77D69A72F951E6261A1A0AC194A80FA25DAED4EE5E1D3
        6765088219A74EF7E0EBB71ACA9515DA66D373BEABCB806AF5258DD9DD04381C
        4EACADADE349B982C4A571D86C0E242F5F4165F53912E34D5F5E59457C6414C5
        E222018EB7028E217737071F9F2D7C02E1EE0842347B89CE29B7785192110886
        90CFE7E174BA9A00BBDD81ECED79F4F645D11F1D40F4EC605B718E6BB8967B1A
        009BCD86D99B73B8181B418CBEB87F896BB8967B1A008BC58AD9B92CA63257EB
        9A9E69AF3F79AEE59E06C060101ECB7218922841DC455CC3B5DCD300501C24F1
        CFF13FE21E02A0E3378B24D184D6A3D7C50000000049454E44AE426082}
      ExplicitLeft = 65
      ExplicitTop = 3
      ExplicitHeight = 19
    end
    object imgAjuda: TImage
      AlignWithMargins = True
      Left = 2
      Top = 0
      Width = 16
      Height = 16
      Cursor = crHandPoint
      Hint = 'Documenta'#231#227'o de Ajuda'
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alLeft
      AutoSize = True
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
        0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
        1974455874536F6674776172650041646F626520496D616765526561647971C9
        653C0000025749444154384F5D8FCB4F136114C5E72F40A4AD0926E2C69D2C7C
        C595D60D014489B1F8282D348D21A06260010B22BE829A280918C5A260958744
        409D69BB42170A8434696A8B20AD7D68B1214864812B136575FCCED769516E72
        F3CD3DE7774E32CAE631D6785C5BABB5DFF956155BC4F2E54D5D47720340FF12
        63AAF5966E77F8E0EC09C13DB504EFEC2A3CE155F9F2A64E9F9C1ED928A0587C
        69028333CBE87A9B467977183B5BA7606A9A942F6FEAF4C9654B720585A259FB
        F0030D4331EC6A9BC175CF17E16D0C6FEAF4C991674E58997F6E7F1145F35802
        076E06507CCD2F43D38935EC689DC6647C4DDEBBAFFAA54F8E3C73425694029B
        FAA7F7FD320EDF0DC12CF6E0ADA00C543E98C39E1B0154F5CECB7B5F4740FAE4
        C83327644531D834B4791651DA3D8BB27B1F51D215C6914EBDEC761091EFBF64
        C1A13B21C970C933270B8C760D174693A8747DCAEDB19E799488B277B19F32DC
        309240D9FD391C7F98F1C933270B4C760F6C03319CEE8FE0545F662D8F23382A
        4A3897BD2954886FCBA305E99123CF9C2CD866D7D6ADEE286A0613B03D8BC9B5
        3E8DC1D21745856B012744D959F7E79C478E3C73B2C058F564DCDCE147FDE857
        9C7B9E84733801C7501C674488C3973775FAE4C833270BC414F17F1C037134BE
        FE86F3E329D409A87638290BF8F2A64E9F1C79E6B2054ABEB9A5B1D0E943DD48
        122DBE25346B695C7CB588FAB1947C7953A74F8E3C73B9023179140D3615E59D
        4134A9695C79B382F68915F9F2A64E5F0FE731F46F0187E27EC3C9FE97469BBA
        5E50AD22BBBCA9D3D739399B0BB2532476AF58C2D9E54DFDBF01A0FC05B27535
        D0B513B8700000000049454E44AE426082}
      ExplicitLeft = 872
      ExplicitTop = -19
      ExplicitHeight = 120
    end
    object lblAjuda: TLabel
      AlignWithMargins = True
      Left = 19
      Top = 3
      Width = 28
      Height = 13
      Cursor = crHandPoint
      Hint = 'Documenta'#231#227'o de Ajuda'
      Margins.Left = 0
      Margins.Right = 8
      Align = alLeft
      Caption = 'Ajuda'
      Layout = tlCenter
      ExplicitLeft = 915
    end
    object lblVideo: TLabel
      AlignWithMargins = True
      Left = 73
      Top = 3
      Width = 26
      Height = 13
      Cursor = crHandPoint
      Hint = 'Video de Demonstra'#231#227'o'
      Margins.Left = 0
      Align = alLeft
      Caption = 'Video'
      Layout = tlCenter
      ExplicitLeft = 969
    end
  end
  object dkPanelPerfisReport: TAdvDockPanel
    Left = 0
    Top = 110
    Width = 1016
    Height = 45
    MinimumSize = 3
    LockHeight = False
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    UseRunTimeHeight = False
    Version = '6.3.3.2'
    Visible = False
    object ToolBarPerfilReport: TAdvToolBar
      Left = 3
      Top = 1
      Width = 151
      Height = 30
      AllowFloating = False
      Caption = ''
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      CompactImageIndex = -1
      ShowRightHandle = False
      ShowClose = False
      ShowOptionIndicator = False
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ParentStyler = False
      Images = FrmDModule.SmallImagesNew
      ParentOptionPicture = True
      ToolBarIndex = -1
      object btnMenuPerfisReport: TAdvToolBarButton
        Left = 9
        Top = 2
        Width = 138
        Height = 26
        Cursor = crHandPoint
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -11
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        DropDownButton = True
        DropDownMenu = popMenuPerfisReport
        Caption = 'Perfis do Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 162
        ParentFont = False
        Position = daTop
        ShowCaption = True
        Version = '6.3.3.2'
        OnClick = btnMenuPerfisReportClick
      end
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    Left = 276
    Top = 4
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppReportDB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'EX003'
    PrinterSetup.Duplex = dpNone
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
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
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
    XLSSettings.WorksheetName = 'Report'
    Left = 68
    Top = 238
    Version = '18.0'
    mmColumnWidth = 0
    DataPipelineName = 'ppReportDB'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel36: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object lblTituloModulo: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object lblTituloReport: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object ppDBText24: TppDBText
        DesignLayer = ppDesignLayer1
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
        mmHeight = 3175
        mmLeft = 172589
        mmTop = 794
        mmWidth = 23548
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line8'
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Style = lsDouble
        Weight = 0.400000005960464400
        mmHeight = 794
        mmLeft = 0
        mmTop = 11906
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground
      end
      object lblDataReportPE: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object lblFiltro: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
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
      mmHeight = 18256
      mmPrintPosition = 0
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.Weight = 1.000000000000000000
        ParentWidth = True
        Style = lsDouble
        Weight = 0.400000005960464400
        mmHeight = 2381
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel54: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object ppLabel55: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object lblMensagemPE: TppLabel
        DesignLayer = ppDesignLayer1
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
        mmTop = 1323
        mmWidth = 20955
        BandType = 8
        LayerName = Foreground
      end
      object lblReportID: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object ppLabelMenuAddress: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblMensagem1'
        AutoSize = False
        Border.Weight = 1.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 4763
        mmWidth = 166423
        BandType = 8
        LayerName = Foreground
      end
      object ppFilterGrid: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        CharWrap = True
        AutoSize = False
        Border.Weight = 1.000000000000000000
        Caption = '.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 0
        mmTop = 10319
        mmWidth = 197380
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
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
    Top = 44
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
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage.ScaleMode = smFit
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43115.961395439810000000
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
    Left = 96
    Top = 44
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
  object AdMemTableChart: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvCheckReadOnly]
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    Left = 312
    Top = 244
  end
  object popMenuPerfisReport: TAdvPopupMenu
    Version = '2.6.1.1'
    Left = 208
    Top = 112
    object ModelosSimatech2: TMenuItem
      Caption = 'Modelos Simatech'
      ImageIndex = 135
    end
    object Pessoais2: TMenuItem
      Caption = 'Pessoais'
      ImageIndex = 136
    end
  end
end
