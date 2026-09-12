object RepPadraoPivot: TRepPadraoPivot
  Tag = 1
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 373
  ClientWidth = 1016
  Color = clBtnFace
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
  object Panel1: TPanel
    Left = 0
    Top = 22
    Width = 1016
    Height = 47
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnMostrar: TcxButton
      Left = 609
      Top = 16
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
  end
  object WiServerPrint1: TWiServerPrint
    Left = 399
    Top = 168
    Width = 32
    Height = 32
    OnExecutePrint = WiServerPrint1ExecutePrint
  end
  object cxDBPivotGrid1: TcxDBPivotGrid
    Left = 0
    Top = 69
    Width = 1016
    Height = 304
    Align = alClient
    Groups = <>
    TabOrder = 2
    ExplicitTop = 91
    ExplicitHeight = 282
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
    TabOrder = 3
    object Label4: TLabel
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
    Left = 408
    Top = 152
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
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23813
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
        mmHeight = 2879
        mmLeft = 173277
        mmTop = 794
        mmWidth = 22860
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Anchors = [atTop, atRight]
        Border.Weight = 1.000000000000000000
        VarType = vtPageNoDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2879
        mmLeft = 186485
        mmTop = 8202
        mmWidth = 9652
        BandType = 0
        LayerName = Foreground
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer1
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
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer1
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
        mmTop = 1058
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
    UserName = 'ppConfig'
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
    DataSource = FrmDModule.doConfig
    UserName = 'ReportDB'
    Left = 77
    Top = 158
  end
end
