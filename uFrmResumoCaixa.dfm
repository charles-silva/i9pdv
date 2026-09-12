object frmResumo: TfrmResumo
  Left = 0
  Top = 0
  Caption = 'Resumo de Caixa'
  ClientHeight = 532
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object FlowPanel1: TFlowPanel
    Left = 0
    Top = 0
    Width = 814
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 810
    object Imprimir: TcxButton
      Left = 1
      Top = 1
      Width = 104
      Height = 40
      Align = alRight
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = ImprimirClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 385
    Height = 491
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 490
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsresumo
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1Id: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        Width = 45
      end
      object cxGrid1DBTableView1Abertura: TcxGridDBColumn
        DataBinding.FieldName = 'Abertura'
        Width = 122
      end
      object cxGrid1DBTableView1Fechamento: TcxGridDBColumn
        DataBinding.FieldName = 'Fechamento'
        Width = 118
      end
      object cxGrid1DBTableView1usuario: TcxGridDBColumn
        Caption = 'Usuario'
        DataBinding.FieldName = 'usuario'
        Width = 88
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGrid2: TcxGrid
    Left = 385
    Top = 41
    Width = 408
    Height = 491
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 490
    object cxGrid2DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsAnalitico
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0,.00'
          Kind = skSum
          Column = cxGrid2DBTableView1Calculado
        end
        item
          Format = '0,.00'
          Kind = skSum
          Column = cxGrid2DBTableView1Declarado
        end
        item
          Format = '0,.00'
          Kind = skSum
          Column = cxGrid2DBTableView1Diferenca
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid2DBTableView1fp_descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'fp_descricao'
        Width = 135
      end
      object cxGrid2DBTableView1Calculado: TcxGridDBColumn
        DataBinding.FieldName = 'Calculado'
        Width = 76
      end
      object cxGrid2DBTableView1Declarado: TcxGridDBColumn
        DataBinding.FieldName = 'Declarado'
        Width = 70
      end
      object cxGrid2DBTableView1Diferenca: TcxGridDBColumn
        DataBinding.FieldName = 'Diferenca'
        Width = 79
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object resumo: TADOQuery
    Connection = FrmPDV.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT top 10 pcx_id as Id,pcxo_data_abertura as Abertura,pcxo_d' +
        'ata_fechamento as Fechamento ,'
      '        ( SELECT    us_apelido'
      '          FROM      dbo.t_users x'
      '          WHERE     x.us_codigo = a.us_codigo ) as usuario'
      'FROM    pdv.tb_caixa_operador a'
      'ORDER BY pcxo_id DESC')
    Left = 224
    Top = 176
  end
  object dsresumo: TDataSource
    DataSet = fdResumo
    Left = 336
    Top = 312
  end
  object fdResumo: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      
        'SELECT top 10 pcx_id as Id,pcxo_data_abertura as Abertura,pcxo_d' +
        'ata_fechamento as Fechamento ,'
      '        ( SELECT    us_apelido'
      '          FROM      dbo.t_users x'
      '          WHERE     x.us_codigo = a.us_codigo ) as usuario'
      'FROM    pdv.tb_caixa_operador a'
      'ORDER BY pcxo_id DESC')
    Left = 264
    Top = 312
    object fdResumoId: TIntegerField
      FieldName = 'Id'
      Origin = 'Id'
    end
    object fdResumoAbertura: TSQLTimeStampField
      FieldName = 'Abertura'
      Origin = 'Abertura'
    end
    object fdResumoFechamento: TSQLTimeStampField
      FieldName = 'Fechamento'
      Origin = 'Fechamento'
    end
    object fdResumousuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
    end
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 344
    Top = 376
  end
  object FDQuery2: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      
        'select i.pnfi_id, i.pnf_id,i.pr_codigo,i.pnfi_qtd,c.pnf_numero_f' +
        'iscal from pdv.tb_nota_fiscal_itens i'
      'JOIN  pdv.tb_nota_fiscal c ON c.pnf_id=i.pnf_id '
      
        'where dtcontrole is null AND c.pnf_status IN (4,2) AND i.pnfi_ca' +
        'ncelado=0 and c.pnf_data_autorizacao is not null'
      ''
      ''
      '')
    Left = 272
    Top = 376
  end
  object fdAnalitico: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      'EXEC pdv.proc_output_resumo_caixa_formaspag 1060,    1 ')
    Left = 408
    Top = 360
    object fdAnaliticofp_descricao: TStringField
      FieldName = 'fp_descricao'
      Origin = 'fp_descricao'
      Size = 60
    end
    object fdAnaliticoCalculado: TFMTBCDField
      FieldName = 'Calculado'
      Origin = 'Calculado'
      DisplayFormat = '0,.00'
      Precision = 38
      Size = 2
    end
    object fdAnaliticoDeclarado: TFMTBCDField
      FieldName = 'Declarado'
      Origin = 'Declarado'
      Required = True
      DisplayFormat = '0,.00'
      Precision = 38
      Size = 2
    end
    object fdAnaliticoDiferenca: TFMTBCDField
      FieldName = 'Diferenca'
      Origin = 'Diferenca'
      DisplayFormat = '0,.00'
      Precision = 38
      Size = 2
    end
  end
  object dsAnalitico: TDataSource
    DataSet = fdAnalitico
    Left = 480
    Top = 360
  end
  object ppResumoCaixa: TppReport
    AutoStop = False
    DataPipeline = ppDBResumoVenda
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ORCAMENTO'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = True
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 135000
    PrinterSetup.mmPaperWidth = 73500
    PrinterSetup.PaperSize = 256
    PrinterSetup.DevMode = {00000000}
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Printer'
    DefaultFileDeviceType = 'ReportTextFile'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.ConnectionSettings.MailService = 'SMTP'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectURI = 'http://localhost'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectURI = 'http://localhost'
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.EnableMultiPlugin = False
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    ThumbnailSettings.ThumbnailSize = tsSmall
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
    PDFSettings.DigitalSignatureSettings.SignPDF = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.AppName = 'ReportBuilder'
    RTFSettings.Author = 'ReportBuilder'
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    RTFSettings.Title = 'Report'
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    CloudDriveSettings.DropBoxSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    CloudDriveSettings.DropBoxSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.DropBoxSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.DropBoxSettings.DirectorySupport = True
    CloudDriveSettings.GoogleDriveSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.GoogleDriveSettings.DirectorySupport = False
    CloudDriveSettings.OneDriveSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken]
    CloudDriveSettings.OneDriveSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.OneDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.OneDriveSettings.DirectorySupport = True
    Left = 576
    Top = 170
    Version = '22.02'
    mmColumnWidth = 68500
    DataPipelineName = 'ppDBResumoVenda'
    object ppHeaderResumoVenda: TppHeaderBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 47625
      mmPrintPosition = 0
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line8'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 466
        mmLeft = 0
        mmTop = 14928
        mmWidth = 73500
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText11'
        Anchors = [atTop, atRight]
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        DataField = 'em_fantasia'
        DataPipeline = FrmPDV_DModule_DS.ppDBEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBEmpresa'
        mmHeight = 4498
        mmLeft = 14023
        mmTop = 1058
        mmWidth = 53711
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line16'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 40171
        mmWidth = 73500
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label49'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'RESUMO DE CAIXA DO OPERADOR 5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3705
        mmLeft = 17198
        mmTop = 15610
        mmWidth = 39952
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label102'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'RESUMO DAS OPERA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 6138
        mmTop = 40217
        mmWidth = 36512
        BandType = 0
        LayerName = BandLayer4
      end
      object ppImage2: TppImage
        DesignLayer = ppDesignLayer4
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = True
        Stretch = True
        Border.mmPadding = 0
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000076
          0000004A08060000006E1FA0C70000000467414D410000B18E7CFB5193000000
          206348524D0000870F00008C0F0000FD520000814000007D790000E98B00003C
          E5000019CC733C857700000A2F694343504943432050726F66696C65000048C7
          9D96775454D71687CFBD777AA1CD30D2197A932E3080F42E201D045118660618
          CA00C30C4D6C88A840441111014590A08001A3A148AC88622128A8600F481050
          62308AA8A86446D64A7C7979EFE5E5F7C7BDDFDA67EF73F7D97B9FB52E00244F
          1F2E2F059602209927E0077A38D3578547D0B1FD0006788001A6003059E9A9BE
          41EEC140242F37177ABAC809FC8BDE0C0148FCBE65E8E94FA783FF4FD2AC54BE
          0000C85FC4E66C4E3A4BC4F9224ECA14A48AED3322A6C6248A194689992F4A50
          C472628E5BE4A59F7D16D951CCEC641E5BC4E29C53D9C96C31F788787B869023
          62C447C405195C4EA6886F8B58334998CC15F15B716C3287990E008A24B60B38
          AC78119B8898C40F0E7411F1720070A4B82F38E60B1670B204E243B9A4A466F3
          B971F102BA2E4B8F6E6A6DCDA07B723293380281A13F9395C8E4B3E92E29C9A9
          4C5E36008B67FE2C19716DE9A2225B9A5A5B5A1A9A19997E51A8FFBAF83725EE
          ED22BD0AF8DC3388D6F787EDAFFC52EA0060CC8A6AB3EB0F5BCC7E003AB60220
          77FF0F9BE6210024457D6BBFF1C57968E279891708526D8C8D3333338DB81C96
          91B8A0BFEB7F3AFC0D7DF13D23F176BF9787EECA89650A93047471DD58294929
          423E3D3D95C9E2D00DFF3CC4FF38F0AFF3581AC889E5F0393C5144A868CAB8BC
          3851BB796CAE809BC2A37379FFA989FF30EC4F5A9C6B9128F59F0035CA0848DD
          A002E4E73E80A21001127950DCF5DFFBE6830F05E29B17A63AB138F79F05FDFB
          AE7089F891CE8DFB1CE712184C6709F9198B6BE26B09D08000240115C80315A0
          01748121300356C016380237B002F88160100ED602168807C9800F32412ED80C
          0A4011D805F6824A5003EA41236801274007380D2E80CBE03AB809EE80076004
          8C83E76006BC01F310046121324481E42155480B3280CC2006640FB9413E5020
          140E454371100F1242B9D016A8082A852AA15AA811FA163A055D80AE4203D03D
          68149A827E85DEC3084C82A9B032AC0D1BC30CD809F68683E135701C9C06E7C0
          F9F04EB802AE838FC1EDF005F83A7C071E819FC3B3084088080D51430C1106E2
          82F82111482CC24736208548395287B4205D482F720B1941A69177280C8A82A2
          A30C51B6284F54088A854A436D4015A32A514751EDA81ED42DD4286A06F5094D
          462BA10DD036682FF42A741C3A135D802E4737A0DBD097D077D0E3E837180C86
          86D1C158613C31E19804CC3A4C31E600A615731E338019C3CC62B15879AC01D6
          0EEB87656205D802EC7EEC31EC39EC20761CFB1647C4A9E2CC70EEB8081C0F97
          872BC735E1CEE2067113B879BC145E0B6F83F7C3B3F1D9F8127C3DBE0B7F033F
          8E9F274813740876846042026133A182D042B844784878452412D589D6C40022
          97B88958413C4EBC421C25BE23C990F4492EA4489290B4937484749E748FF48A
          4C266B931DC91164017927B9917C91FC98FC5682226124E125C196D8285125D1
          2E3128F142122FA925E924B9563247B25CF2A4E40DC96929BC94B6948B14536A
          835495D429A961A959698AB4A9B49F74B274B17493F455E94919AC8CB68C9B0C
          5B265FE6B0CC4599310A42D1A0B85058942D947ACA25CA381543D5A17A5113A8
          45D46FA8FDD4195919D965B2A1B259B255B267644768084D9BE6454BA295D04E
          D08668EF97282F715AC259B26349CB92C12573728A728E721CB942B956B93B72
          EFE5E9F26EF289F2BBE53BE41F29A014F415021432150E2A5C529856A42ADA2A
          B2140B154F28DE578295F4950295D6291D56EA539A555651F6504E55DEAF7C51
          795A85A6E2A892A052A67256654A95A26AAFCA552D533DA7FA8C2E4B77A227D1
          2BE83DF4193525354F35A15AAD5ABFDABCBA8E7A887A9E7AABFA230D82064323
          56A34CA35B63465355D3573357B359F3BE165E8BA115AFB54FAB576B4E5B473B
          4C7B9B7687F6A48E9C8E974E8E4EB3CE435DB2AE836E9A6E9DEE6D3D8C1E432F
          51EF80DE4D7D58DF423F5EBF4AFF86016C6069C035386030B014BDD47A296F69
          DDD2614392A193618661B3E1A811CDC8C728CFA8C3E885B1A67184F16EE35EE3
          4F2616264926F5260F4C654C5798E6997699FE6AA66FC632AB32BB6D4E367737
          DF68DE69FE7299C132CEB283CBEE5A502C7C2DB659745B7CB4B4B2E45BB6584E
          59695A455B555B0D33A80C7F4631E38A35DADAD97AA3F569EB77369636029B13
          36BFD81ADA26DA36D94E2ED759CE595EBF7CCC4EDD8E69576B37624FB78FB63F
          643FE2A0E6C074A87378E2A8E1C8766C709C70D2734A703AE6F4C2D9C499EFDC
          E63CE762E3B2DEE5BC2BE2EAE15AE8DAEF26E316E256E9F6D85DDD3DCEBDD97D
          C6C3C2639DC7794FB4A7B7E76ECF612F652F9657A3D7CC0AAB15EB57F47893BC
          83BC2BBD9FF8E8FBF07DBA7C61DF15BE7B7C1FAED45AC95BD9E107FCBCFCF6F8
          3DF2D7F14FF3FF3E0013E01F5015F034D0343037B03788121415D414F426D839
          B824F841886E8830A43B54323432B431742ECC35AC346C6495F1AAF5ABAE872B
          8473C33B23B011A1110D11B3ABDD56EF5D3D1E6911591039B446674DD69AAB6B
          15D626AD3D132519C58C3A198D8E0E8B6E8AFEC0F463D6316763BC62AA636658
          2EAC7DACE76C4776197B8A63C729E54CC4DAC596C64EC6D9C5ED899B8A77882F
          8F9FE6BA702BB92F133C136A12E612FD128F242E248525B526E392A3934FF164
          7889BC9E149594AC94815483D482D491349BB4BD69337C6F7E433A94BE26BD53
          4015FD4CF50975855B85A319F61955196F3343334F664967F1B2FAB2F5B37764
          4FE4B8E77CBD0EB58EB5AE3B572D7773EEE87AA7F5B51BA00D311BBA376A6CCC
          DF38BEC963D3D1CD84CD899B7FC833C92BCD7BBD256C4B57BE72FEA6FCB1AD1E
          5B9B0B240AF805C3DB6CB7D56C476DE76EEFDF61BE63FF8E4F85ECC26B452645
          E5451F8A59C5D7BE32FDAAE2AB859DB13BFB4B2C4B0EEEC2ECE2ED1ADAEDB0FB
          68A974694EE9D81EDF3DED65F4B2C2B2D77BA3F65E2D5F565EB38FB04FB86FA4
          C2A7A273BFE6FE5DFB3F54C657DEA972AE6AAD56AADE513D77807D60F0A0E3C1
          961AE59AA29AF787B887EED67AD4B6D769D7951FC61CCE38FCB43EB4BEF76BC6
          D78D0D0A0D450D1F8FF08E8C1C0D3CDAD368D5D8D8A4D454D20C370B9BA78E45
          1EBBF98DEB379D2D862DB5ADB4D6A2E3E0B8F0F8B36FA3BF1D3AE17DA2FB24E3
          64CB775ADF55B751DA0ADBA1F6ECF6998EF88E91CEF0CE81532B4E7577D976B5
          7D6FF4FD91D36AA7ABCEC89E29394B389B7F76E15CCEB9D9F3A9E7A72FC45D18
          EB8EEA7E7071D5C5DB3D013DFD97BC2F5DB9EC7EF962AF53EFB92B76574E5FB5
          B97AEA1AE35AC775CBEBED7D167D6D3F58FCD0D66FD9DF7EC3EA46E74DEB9B5D
          03CB07CE0E3A0C5EB8E57AEBF26DAFDBD7EFACBC333014327477387278E42EFB
          EEE4BDA47B2FEF67DC9F7FB0E921FA61E123A947E58F951ED7FDA8F763EB88E5
          C89951D7D1BE27414F1E8CB1C69EFF94FED387F1FCA7E4A7E513AA138D936693
          A7A7DCA76E3E5BFD6CFC79EAF3F9E9829FA57FAE7EA1FBE2BB5F1C7FE99B5935
          33FE92FF72E1D7E257F2AF8EBC5EF6BA7BD67FF6F19BE437F373856FE5DF1E7D
          C778D7FB3EECFDC47CE607EC878A8F7A1FBB3E797F7AB890BCB0F01BF784F3FB
          3704291E000000097048597300002E2300002E230178A53F7600000021744558
          744372656174696F6E2054696D6500323031383A30323A32322031373A32363A
          323384CA336D000013F449444154785EED9D0B7C54D599C0BF73EFCCE4314980
          24108B141450149BD74C3289DB960AD8D657AD5B5051EB162DA0545717B7ADE2
          AA54ADAE6857EB1BB1EA527CA2557C2C2ABED6E2D6C94C669210D06215C55780
          BC20E435AF7BF6FBEE3DF34A263377329387247F7EC3FDBE7367EECC3DDF3DE7
          7CDF77CEBD619C731807C02D551A8F2A632701630B81B362AC9519C0208F0104
          80C301D43FC6B73915E67B7DB2CBD5A07D6AF432E60DDB5C5C75846C62AB00F8
          C5581D85A2382E58631F00E777B7771DD8307BD72E8F281E558C59C33E2749F2
          FCF2CA550CD81A5473B4D2A4F90478E057F96EE756A18F1AC6A461F795974F31
          B28C67B0AB3D4914A502C77F7FB8B7DE71CD1A455144D98833E60CFB7549D5B7
          338DF0069EFA1C519426F8A6C63AE7053F5014BF281851C69461BF2C2ECECF36
          99DF43F178AD24BD60556E2870DB970A754491C4F6B04792248646DD80E29018
          95600C7ED166A9BA4CA823CA9869B158E14BB1E61F13EA50D2E353E084A23AFB
          A7421F11C6448BFD72C68C2C34EA6D421D6AB28C121FAEEF1A903161D8EC82A2
          5FE2A648D38603B6B8A5BCFA58A18C0863648C95C8B0C3098EE830A24ED4613F
          C6EEB3588E3232D3488C771FE6BBEC73859C36DA2C953FE2202F4747CD867E78
          36C6D0786EECC5831D81FB8EFED87950BCEDF0376C9BD5F62FD880C81B1E6EB8
          4FF11C515457B75FE829F14171B1A9C8685E4F9EB728EACBD768CBB30ADC354E
          52C64057CCD2DE6A74C264C994B6D0EA0893F99E384625A632C65EDD7B42C50C
          52C6C2187BA4D80E3B8CB369424C89D6D20A2B6E56685A5C0A4C19865B4938FC
          0DCBD96013FC69809B85901AB28CC309304D49008345AD73E7E61EFE8665D02B
          A46107BBC6B44CE931602542D4430618B38F3DEC0D8BAE618B10871D05946621
          A60603839074C1246638EC0DCBB8B24B88C30EF7F1B47C375E9CC91C27D0EB95
          3F3EFC5B6C40795F88C30B87FD453B5CBB85961278713E23C484E045F0E6D49D
          F6D66131ECBEF272332D4169B55AA7361D5F5948AB17C4AE21E79D46773D6EF6
          6ADA30C2E0354551D29224C8773BDE408BFD8F50E3D1CB15653509694D50D082
          B0E925F2899204F350B5E2D1318E63DF46395B7D43185A6980813BC72B9A6D47
          F57DE0FEB7F2DDEEAFB4DDE9A5CD5275077A32BF16EAF0108093F3EBED6F092D
          65F6582C137399E96514BFA795F4A31B8DFFF37CB7FD055252362CCD733697DA
          E6E3912E442FF02C2C9AA8ED491AFA212EBCC69FF433DFE347B85CE9713C106D
          D504A3558626AD64C8A92BAC7358D3D56283A82B29CBE5955855CBD174DFA132
          FC82830CF8CB8AC26E2EACB37FA4BE1119B4616F448B5E56665B2C31B816D552
          AD346DF402E78F7A7CCADA6F353A3F176529D16AADBE1303C155421D5A78E0C7
          43BDC0AD695A6536E442F691BB5CADB12EA04119B6D962FBAECCA407504C26BE
          1A0C5E7CFDD1A7786E2AAAABEBD28A060705ED2C2B17C75B3653140D151BF35D
          764A288C284919B6B9B838473666DF85E3154D83E9CB84A487CF812BCB542722
          05B0D556E08F7E17C5BE637E5AC0AADCA9F8BAAA273736768AA21143B757BCBF
          B4A24436999D68D465A80EA75189E91875BFD66AADBAF95D494A2A588FA4C065
          AF55143817C5A158E4FD99C7CF4F1D0D462574B5D8368BED8758B1CFA3388279
          D7102F75B7342D99B6674F8FD093A6ADAC7A21C8F02C8A93B49294A903EEFDC9
          5079F58321A1615B2CD567A383F4388AC3E551EA611B74B69F91BF6B5787D093
          86A6B74C1986FFC6BE279545E301ACBFFB3B0F345F3D63F7EE11CB49C722AE61
          9BCBAA4E9165F6128A46AD6454F1765B67FB69A9DC3B43A11A0E31E732265DC7
          189C208AF54095F6B21208DC5858EF746B45A38B010D4B7380CC602047233D53
          4F43027FA6B0CE795EAAF1A26AE012DBF799C41761952C4423D35D027DC7F26E
          7CD5A249B706FC81A7276F777EA2158F4E621A56CB72185DB87BA84383747025
          8617F708392DD032940283F94849F2E5298A1C30327FFBBDF5F54DA3E9DE9C44
          C4346C9BB5EA69DC45DEE337010F0E74D593DD3594131E47D0CFB02D56DB6912
          487A12CE49C1B2B38177536F160DCBCA0243690948474E0526CBA0B4B681BF71
          0728FBF5AF01C333A8B9AFCEF14FDFA41635D4441976CFCC9999B993A6EC4071
          9656923AA6850B20EB8ACB54C3799E7B1EBA6FBB432D97264E80CC4B5740C619
          A7036466A86591F86BDDD0F3E043E06FD82E4AE2A370BEA2D05DF3B050C73C51
          098A9C49532EC24DDA8C9AB1E89FC1BCF616D5A884E1F8E3B4EDB1C740DED38F
          43C6E29FC5342A61A8B040EE9FD641D60ACA8724863176C3C773E6C43ED81824
          D462C5CC01CD0E1CA516A4883469124C78E505B46EB8AE7BEEB813BCEFFE15F2
          363E060CF707F1D7378077CB6BA03435A99F339EBC008CF3BE2FF602F4AE7F04
          7AD6FF49680383E7724981BB66BD50C734A1163BBD54C2E6931EA312F2DCE3A3
          8CEA7DF575F06C7A0ECCD75F1B65D49E3BEF8643CB2E05CFF39BC1F77E0D78D0
          C09D57FD16BAAEBD012D1E50DF93B9FC623094259E40C256BB8A4217A18E6942
          866512A36E386D502BF4BDF126F8FFF63E745FFF3BE8C297FC9D13C0506513EF
          407776C346E87D121DF01878B7BE812D55B4520C2CB3719CD6C1717B8B6DD542
          1ED3A85DB1B8D37B1FEA834EB0EB21FBAA2B21E3FC25AACC0F1C8483679C05BC
          77E04C1CCBCC84095B5E049697A7EA1DE79C0F81DD9FAAF240E0C0725781CB7E
          9550C72CAA615BCA6D4BB00B7B4A940D1AA9B000B22E5B09064BB93A66F63C14
          EDA4E63DBA1EE4926255F6BEF02274DD92F836D29CB5B78271E17C55EEB9F701
          E8C5561E170E1FE5BBED099F2F515561FB237604F1D75E71E8C0D7EE80C4B738
          9DCE26511AA2BAD2F67BDC4CD0B45860E572D689B5BCDBA7284E579CE74359AD
          D6B946495E89DFE7C7D70E475DED6318BDE90ADF2A2B2BB3F14456E2453D9D61
          DFDBD1D579AD6AD8366BF583B8FF52ED6D83C3B4603E645FBF1A586EAEAA7B37
          BF045DBFFF4F550E3271CB4BC0A64C56650A7B28FC49045D28991769F3D6BEB7
          DE81CEAB69C1467C94DEC0D4C29DFD0D11497545A507BB787D131B9C7B3983FB
          B096AF4103FB442919F64BDC24730BC927A0C0DD5DDE9E871A1B1B69114188AA
          8A8A5318935E152A866FF0AF8E5AC77D428D0BFE8E75B8B944D37088F3FB8A82
          636C85D8260D331A20FBD7ABC07CFBAD21A3FADEDD168A57A38870A6F8A14342
          4A80379CE39766D0BAB8C4309394F87C186BC5FFDB3545C587577C4BF0853AED
          D35A0C5E00D812AEC256F102F66C1121226FC3FFE83841FC51C7E07000CB500C
          310BBD9A7BCC99598EAAD2D2A8742D7A7C74C184C625FC92E5428CCBDCB973A9
          D223576C741A0C06857E27799183BA234D3AA208721F5E07194BCE112578662E
          377461ABE2FEFE4FC5E13DE1295496A36F6A974D08F77452A1D6DA1322259EA9
          B13B1D53BD01BF45A8087FA7C6E9981C7CE1FEFCF68E8393A8E5E04E913263A7
          575AADA19BA8ED4E6709B60EF5EE36C18EA863D43A2635EDDF67F673651E1E9F
          5A55F02A2D65C68C6D168B251485D86B6BDFEAF17AA68A8B812C5D526DB1243C
          8F9CEC1C5A4098A569E070B86A2762AFD222ED3BA1926EE14F7AA98809E3CCBC
          27FEAC7ABA217C3EE8C6EE37965109E5ABF03CB421F273713050D82460795A8F
          90086C5D470B312576EDDAD541DD211A37344CE1B1937A2ACC9E3D7B7A6A6B6B
          B7E145B012027E2B1A8E564BD281A69A24C353913D40434303F5129B340D2F05
          59D63CCD3860B33C4F88D47D3F8AC3B21A234A60F227F56C06966306F375ABC1
          7CE7EDD89A346F3588E7E94D10F882869DD8500814C474F2029026C55FA92A1F
          7D74C8D952C13AA07C7242384C11525AA875D73E819B60F2BAA418A308212785
          DDEDDE19607CA1E8EAC9B8D536AB35641802F787BC43BC88CE133D6A4CD069A2
          673F9EAC69E0F1F83CA18B420245D2D50C98C90499179C071336FF054C679D09
          7EBB434D2C40404B22D098D9FB68FC1BC7C953264751252B0BCC37AD51C7E858
          B0AC4C30AFF90FA145A0C7B08CEB6BDA3A11DEE9DF350D7F9A214BCB910E02EC
          263F670A5C2F54AC0F76B99054D073FE3FDC0463BA591565159542EE07D6C4D9
          B8092E827845B47815BC1E58C2D8D574CA8F20EFF94D90B5EA0A505A5AA0EBB7
          ABE1D0E557823C1D9D1951D19EA79E0125814314D8F339785FD92234EC664FAC
          86DC871E0043B1BAF63904659968ECA66E9E77F6591B86DD7D6258FA577CF0F0
          D220C6BD7A7EC48034B5ECA316A09D1883AAF2F2F2500F83D710C548B4144905
          3BA9A8161D0D8BE8AAC39F212485B128B7BB2F343B63B45AC0F3CCB370E8C28B
          A063C9CFC1FBF6FFAAFB8CF3C3CB853C9BE9EE8368A4FC7C98F0EC539071C669
          A204BD903FDC05817F68C30C415D6DEE630FC3C437B640DED31B61E29BAFAAC9
          7FF9380C453D1EE88E8C7571EC0EE6B6E3811513F79C9205BBDE1C3480B6861A
          431FC568FC429507098DBBB8D9A669E4C44B74C77A08E6F7471AE99CC8713848
          5549098508C1DB3D5ABB7A7BC32D069114CE424F1A8985F7ADB7D54442EFC627
          C0FF61B037C22FC7D0C568D3A20AE5CBAFFACD9F4A79799073FFDDC00AF231FC
          F9AB28C57AE9EA82CE959783DFE912251A943F9667CF0636511B77794B2B745E
          FE6F5117016F8F8C4EE2C099E659A6097346D60DB8D11C4CC6DEC5EEB4FFC472
          92E0F519BA1D833379BA1055EC7575B88FD7A80A3A5956ABF507AA1C4946062D
          84500D8E17F2A6BE71B1E4F375C50DE407C2408F45107169DF0AA7199A9CF5F7
          837CCC6CE8BE752D76D1D1DDA972E0201C42E3765D7B3DF81D4E8CDE44148043
          59E0E34FA0F7FE757070F1B9E0ABAB07492434089A84D7051BCCDD752CB3ACAC
          6C5AF055515131C366B19D5455617B1C8FF71BF126EC2ED2F3D435F488420D4A
          62BC5FEC873D53C8899238EBD71DE3E743652CE2BD41A4698D8D545B495FE1C6
          8AC81030DC3D1AE61C0BB98F3CA4B63EEFF39BC1FBE6DB624F7FBC5BDF8443BF
          BA02DABF77121C98B7100E9C384FEDEA7B1EDB8063AB7647873C331CC72B3846
          EB014F74300BCDE6651A4D5F045F06267D26C9F00E637081D84F66BD09C39681
          4F280938E3E16C8DD27F38C42192EE8955C772FC0D8B7038088DF1556565384E
          31CD00183E39DC6EBB2A4710ECBB1BC55637EAB49C404227CA585E06592B7E09
          B91B1E51753FB6B6EE3BEE14EF480C2D9BE1C2C38EC480C70DE2FFE81F424A80
          C2923E9F047C8A9DC9F9F65AC7EF849E32D8E2C2693489D3044C149464C04D30
          C5989F9D91F1632103339822E3DBC7C9E1127208CDB01CFA593C11F29C709E9D
          C6C59C871F844C5AED6030A82DABEBDFAF06DEC7836566B3BA7AC2585DD5CF13
          8E05331AC1786295D0D0B0D46D2726003DEDBADED8870FB02296875E0A2C4363
          9EED5302650E57ED2C87CB91F22449241C58787A3110D829A43E843D5DC6C2DD
          310F272538C6BD51DE70106D76C75A752A86FE515E553C6801DAC46DB17B24DE
          D60687962E87C0D75F8B9230A6052781F9766D6280C652EA76E391F193D3217B
          CD75AA4CAB2B3ACE5C94D82BE6DC99EFAE094FFAC681527A26D9206246BE15BB
          D950ABD00B862AE60C8331E844D4DB9D8E72210F088EDFD5D8D5071FA1D08417
          CE34112B473173E6CCCC29F9854DD8BC27E295D0E509F88A0C06C31C1998EA79
          624DFCADC6E9F8AEFAE63EA82DB6B7652FC52FFA6F261AA07255A35E7A794CA3
          12B4FA30F85979F62C753C1E08BA7832975D2C348C7C36FD25B1510906AF0869
          544299249949910ED8C658462576EFDEDD8B674CF718D179994DB2BC40E6ECA7
          AA8E3005069CC3540DABDEE0C4816EE5D0054D8EF7F584297CE9B86069DC8970
          A5B945CD5805C9BE6EB5BA2CB52F526E0EE4FCD7DAD02238E5EB2675598D1E78
          00743F8863B821A3565A2AEEC2F13518BE1CECF17AE23A220C947057CBD8A958
          104C0A78BABC3DA114625F82CE1335A44784A80BEFCBDAD26365EF5EE8BEE146
          357C519A133F5DA0E7FE07D54403211F7F9CBA5A31F3FC73C158690563950DB2
          2E5E0A79CF3E05069BC8A479BD6A58C43DBA6ED1D956505F33628FFF890776BF
          2536ABF535F470AF144508BFACA1A1A19FE314097ABC94C8F88C6406EC74DCA8
          5D3DDA6B0BC6AE03C67FEA181BA4CD5A4D4E87EEB9598A5715BD498308324E3B
          05B26FC0B1D3103FEF4BE9C4AEDF5C03BE3EC98C81E00A3FB3A0AEA67F0A6C00
          86608CA5077CDC8DDB60F862C2DAFD165A846EB88EF416B1EBE5ABF0FB74DD9A
          22566AF4499CF39FE1E7D50789C422D46209B4F12D42D4C5608C4AD04AC443CB
          2E81C0F601A212ECEA69E94CC7E225BA8D8A344C6E700EFBF88ACE0C193118A7
          65A311717C8135E2B51A5BE8D248A3A2A177E015385FAF5109EEF3F61D4BDBDA
          3B3AE23ABB512D96C6809632DB36FC41313DADA1409A32459D9B65F993D46E97
          C653FFCE9DC07B92BBDD34A0C02993EBECAF0B5517E968B184583F4573B6E1A4
          8306FD5DBC43589F7B50B673AE6C76BADD5B077296E281AD96528CC2DBE7EBF0
          B7AED4E4D844199668B65A4B6530D6A238A42B16D3099EC273056E3B4D618D23
          88EA8A09FA4B8B68EAB542FD26D00CCC17E1908C43F4332CB1A34E4D9D05A795
          46335C01FE8B02972B76E03C86896958FAFB6C1C7C948FA4B16114C3D714BA6A
          424B36C709D36F8C8DA4B5AC6A0E93E13D7C9BAEBFAB3AAC70FE40BEBB6654FC
          B9B1D148CC161B8482FD00871FA21837881E01D6DD5BEFA465A1E30C40DC161B
          A4B9A472966C94299448DBBDB383847EEECDE801D31FF31D270E715B6C107A42
          4A97BFA712EB75C04CC730D08E31E1A271A3EA43578B0D42098CE6D28A154C52
          672706FBF8DAA4C15FB8D5CFBD9714B9DD6ACE749CC42465D820FB4B4B8B6439
          F336C6D885A8EA58E83B683E55385C53E8B60F388B314E6C0665D8202D56EB31
          0C8CAB19C0F9A8F64DA7A5C2DF4151EEF8AC816FB428E1BBDBC6D14F4A860D42
          CFF9CFC8624B80B1C57848CA33279F8EE4F015307A8C9DFFC929DBDDEF29697E
          3AF758232D868DE4D3D995137272A413658955E0D18FC3AFA0455B93F15B72B1
          6553B74D13AB348F487F646F37676CBB04BEF70BEBEA3E1C3766BA00F87F9606
          84609621D9920000000049454E44AE426082}
        mmHeight = 12822
        mmLeft = 265
        mmTop = 1058
        mmWidth = 12619
        BandType = 0
        LayerName = BandLayer4
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer4
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 14023
        mmTop = 6085
        mmWidth = 20707
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label15'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'N'#186'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3705
        mmLeft = 6078
        mmTop = 21960
        mmWidth = 4498
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label16'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'Data de Abertura:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 6078
        mmTop = 25929
        mmWidth = 25136
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label18'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'Data de Encerramento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3705
        mmLeft = 6078
        mmTop = 29633
        mmWidth = 32809
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line14'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 20477
        mmWidth = 73500
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label19'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'Operador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 6078
        mmTop = 33867
        mmWidth = 14552
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLine15: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line15'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 43507
        mmWidth = 73500
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line5'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 47096
        mmWidth = 73500
        BandType = 0
        LayerName = BandLayer4
      end
      object ppId: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Id'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'N'#186'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 14023
        mmTop = 21960
        mmWidth = 16919
        BandType = 0
        LayerName = BandLayer4
      end
      object ppAbertura: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Id1'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'N'#186'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 39952
        mmTop = 25929
        mmWidth = 30732
        BandType = 0
        LayerName = BandLayer4
      end
      object ppEncerramento: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Encerramento'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'N'#186'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 29633
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer4
      end
      object ppUsuario: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Usuario'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'N'#186'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 33073
        mmWidth = 47218
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label1'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3439
        mmLeft = 4763
        mmTop = 43392
        mmWidth = 8202
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label2'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'Calculado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 32630
        mmTop = 43656
        mmWidth = 8202
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label3'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'Declarado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 46831
        mmTop = 43656
        mmWidth = 8732
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label4'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Caption = 'Divergente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3440
        mmLeft = 60351
        mmTop = 43656
        mmWidth = 9790
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText1'
        Anchors = [atTop, atRight]
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        DataField = 'em_fantasia'
        DataPipeline = FrmPDV_DModule_DS.ppDBEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBEmpresa'
        mmHeight = 4498
        mmLeft = 16933
        mmTop = 9260
        mmWidth = 53711
        BandType = 0
        LayerName = BandLayer4
      end
    end
    object ppDetailBandResumoVenda: TppDetailBand
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 529
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText3'
        Border.mmPadding = 0
        DataField = 'fp_descricao'
        DataPipeline = ppDBResumoVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBResumoVenda'
        mmHeight = 3440
        mmLeft = 3175
        mmTop = 312
        mmWidth = 24077
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'Calculado'
        DataPipeline = ppDBResumoVenda
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResumoVenda'
        mmHeight = 3440
        mmLeft = 27781
        mmTop = 312
        mmWidth = 12965
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'Declarado'
        DataPipeline = ppDBResumoVenda
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResumoVenda'
        mmHeight = 3440
        mmLeft = 41804
        mmTop = 312
        mmWidth = 12965
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText7'
        Border.mmPadding = 0
        DataField = 'Diferenca'
        DataPipeline = ppDBResumoVenda
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResumoVenda'
        mmHeight = 3440
        mmLeft = 58208
        mmTop = 312
        mmWidth = 12700
        BandType = 4
        LayerName = BandLayer4
      end
    end
    object ppFooterBandResumoVendas: TppFooterBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line12'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 345
        mmLeft = 0
        mmTop = 0
        mmWidth = 73500
        BandType = 8
        LayerName = BandLayer4
      end
      object ppDBText29: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText29'
        AutoSize = True
        Border.mmPadding = 0
        DataField = 'us_apelido'
        DataPipeline = FrmPDV_DModule_DS.ppDBResumoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBResumoCaixa'
        mmHeight = 2910
        mmLeft = 4763
        mmTop = 4763
        mmWidth = 7937
        BandType = 8
        LayerName = BandLayer4
      end
      object ppLine17: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line17'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 4693
        mmWidth = 25538
        BandType = 8
        LayerName = BandLayer4
      end
    end
    object ppSummaryBandResumoVenda: TppSummaryBand
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line1'
        Border.Weight = 1.000000000000000000
        Border.mmPadding = 0
        Pen.Style = psDot
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 73500
        BandType = 7
        LayerName = BandLayer4
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer4
        UserName = 'DBCalc1'
        Border.mmPadding = 0
        DataField = 'Calculado'
        DataPipeline = ppDBResumoVenda
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResumoVenda'
        mmHeight = 3440
        mmLeft = 23548
        mmTop = 0
        mmWidth = 17198
        BandType = 7
        LayerName = BandLayer4
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer4
        UserName = 'DBCalc2'
        Border.mmPadding = 0
        DataField = 'Declarado'
        DataPipeline = ppDBResumoVenda
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResumoVenda'
        mmHeight = 3440
        mmLeft = 41540
        mmTop = 0
        mmWidth = 13229
        BandType = 7
        LayerName = BandLayer4
      end
      object ppDBCalc3: TppDBCalc
        DesignLayer = ppDesignLayer4
        UserName = 'DBCalc3'
        Border.mmPadding = 0
        DataField = 'Diferenca'
        DataPipeline = ppDBResumoVenda
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tw Cen MT Condensed'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResumoVenda'
        mmHeight = 3440
        mmLeft = 56356
        mmTop = -529
        mmWidth = 13758
        BandType = 7
        LayerName = BandLayer4
      end
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'BandLayer4'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBResumoVenda: TppDBPipeline
    DataSource = dsAnalitico
    UserName = 'ResumoVenda'
    Left = 572
    Top = 236
  end
end
