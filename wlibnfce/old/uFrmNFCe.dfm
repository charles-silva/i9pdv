object FrmNFCe: TFrmNFCe
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  ClientHeight = 133
  ClientWidth = 407
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 48
    Width = 194
    Height = 24
    Caption = 'Processando NFC-e ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape27: TShape
    Left = 0
    Top = 0
    Width = 407
    Height = 133
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -570
    ExplicitTop = -436
    ExplicitWidth = 971
    ExplicitHeight = 576
  end
  object XMLDocMensagem: TXMLDocument
    Left = 40
    Top = 84
    DOMVendorDesc = 'MSXML'
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 272
    Top = 84
  end
  object frxReport1: TfrxReport
    Version = '6.3.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 42711.691351574070000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  ReportTitle1.Visible := <Parametros."LogoCarregado"> <> '#39#39';'
      'end;'
      ''
      'procedure ValorTributosOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  ValorTributos.Visible :=false;// <CalculoImposto."VTotTrib"> >' +
        ' 0;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 320
    Top = 76
    Datasets = <
      item
        DataSetName = 'Identificacao'
      end
      item
        DataSetName = 'Emitente'
      end
      item
        DataSetName = 'Destinatario'
      end
      item
        DataSetName = 'DadosProdutos'
      end
      item
        DataSetName = 'Parametros'
      end
      item
        DataSetName = 'Duplicatas'
      end
      item
        DataSetName = 'CalculoImposto'
      end
      item
        DataSetName = 'Transportador'
      end
      item
        DataSetName = 'Veiculo'
      end
      item
        DataSetName = 'Volumes'
      end
      item
        DataSetName = 'Eventos'
      end
      item
        DataSetName = 'ISSQN'
      end
      item
        DataSetName = 'Fatura'
      end
      item
        DataSetName = 'LocalRetirada'
      end
      item
        DataSetName = 'LocalEntrega'
      end
      item
        DataSetName = 'InformacoesAdicionais'
      end
      item
        DataSetName = 'Pagamento'
      end
      item
        DataSetName = 'Inutilizacao'
      end>
    Variables = <
      item
        Name = ' User'
        Value = Null
      end
      item
        Name = 'LinhasImpressas'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 72.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      TopMargin = 0.500000000000000000
      Frame.Typ = []
      EndlessHeight = True
      LargeDesignHeight = True
      MirrorMode = []
      PrintIfEmpty = False
      OnBeforePrint = 'Page1OnBeforePrint'
      object ValorTributos: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 32.015752910000000000
        Top = 631.181510000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'ValorTributosOnBeforePrint'
        RowCount = 1
        object Memo17: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000022000
          Width = 177.637934410000000000
          Height = 26.456690470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'Informa'#231#227'o dos Tributos Totais Incidentes '
            '(Lei Federal 12.741/2012): ')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 177.637934410000000000
          Top = 3.779530000000022000
          Width = 94.488225590000000000
          Height = 26.456690470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[CalculoImposto."vTotTrib" #n%2,2f] [CalculoImposto."VTribFonte"' +
              ']')
          ParentFont = False
          WordWrap = False
        end
      end
      object MensagemFiscal: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 111.385882910000000000
        Top = 729.449290000000000000
        Width = 272.126160000000000000
        RowCount = 1
        Stretched = True
        object Memo3: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 48.897650000000000000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Consulte pela chave de acesso em:'
            '[Identificacao."URL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 77.472480000000010000
          Width = 272.126160000000000000
          Height = 11.338590000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CHAVE DE ACESSO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 18.559060000000040000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'N'#250'mero: [Identificacao."NNF"] - S'#233'rie: [Identificacao."Serie" #n' +
              '#000]'
            
              'Emiss'#227'o [Identificacao."DEmi"] - [Parametros."DescricaoViaEstabe' +
              'lec"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 91.267762909999990000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."Chave"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 1.220469999999977000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."MensagemFiscal"]')
          ParentFont = False
          WordBreak = True
        end
      end
      object Consumidor: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574768980000000000
        Top = 865.512370000000000000
        Width = 272.126160000000000000
        RowCount = 1
        Stretched = True
        object Memo58: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 0.779530000000022500
          Width = 272.126160000000000000
          Height = 16.251970940000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CONSUMIDOR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 20.787369840000000000
          Width = 272.126160000000000000
          Height = 17.007839840000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Destinatario."Consumidor"]')
          ParentFont = False
        end
      end
      object Rodape: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 175.637892910000000000
        Top = 929.764380000000000000
        Width = 272.126160000000000000
        RowCount = 1
        object ImgQrCode: TfrxPictureView
          Align = baWidth
          AllowVectorExport = True
          Top = 20.322834650000000000
          Width = 272.126160000000000000
          Height = 117.165322600000000000
          Center = True
          Frame.Color = clFuchsia
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 158.181200000000100000
          Width = 272.126160000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."Contingencia_Valor"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000022000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Consulta via leitor de QR Code')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 141.401670000000100000
          Width = 272.126160000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Protocolo de Autoriza'#231#227'o')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object DadosProdutos: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456702680000000000
        Top = 325.039580000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'DadosProdutosOnBeforePrint'
        DataSetName = 'DadosProdutos'
        RowCount = 0
        Stretched = True
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Width = 75.590560940000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[DadosProdutos."CProd"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo132: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 76.031500940000000000
          Width = 196.535599060000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[DadosProdutos."DescricaoProduto"]')
          ParentFont = False
        end
        object memqCom: TfrxMemoView
          AllowVectorExport = True
          Top = 13.496065429999990000
          Width = 79.370093390000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."QCom"] [DadosProdutos."UCom"]')
          ParentFont = False
          WordWrap = False
        end
        object memvUnCom: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370078740000000000
          Top = 13.496065429999990000
          Width = 94.488188980000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VUnTrib"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo140: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858267720000000000
          Top = 13.496065429999990000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VProd"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object DadosProdutosHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 27.590560940000000000
        Top = 275.905690000000000000
        Width = 272.126160000000000000
        Condition = 'DadosProdutos."ChaveNFe"'
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692913390000000000
          Top = 14.472448269999970000
          Width = 22.677165350000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'UN')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370078740000000000
          Top = 14.472448269999970000
          Width = 94.488188980000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VL.UNIT')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Top = 1.354328269999996000
          Width = 68.031500940000000000
          Height = 13.228346460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'C'#211'DIGO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Left = 68.472440940000000000
          Top = 1.354328269999996000
          Width = 204.094659060000000000
          Height = 13.228346460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          AllowVectorExport = True
          Top = 14.472448269999970000
          Width = 56.692913390000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'QTD')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858267720000000000
          Top = 14.472448269999970000
          Width = 98.267892280000000000
          Height = 11.338572910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'VL.TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object DadosPagamentoHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.401630940000000000
        Top = 472.441250000000000000
        Width = 272.126160000000000000
        Condition = 'DadosProdutos."ChaveNFe"'
        ReprintOnNewPage = True
        object memTitDadosPagamento: TfrxMemoView
          AllowVectorExport = True
          Top = 6.338590000000010000
          Width = 128.504020000000000000
          Height = 91.842570940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            'QTD. TOTAL DE ITENS'
            ''
            'Valor Produtos'
            'Descontos'
            'Acr'#233'scimos'
            'VALOR A PAGAR'
            ''
            'FORMA DE PAGAMENTO  ')
          ParentFont = False
          WordWrap = False
        end
        object memDadosPagamento: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 6.338590000000010000
          Width = 143.622140000000000000
          Height = 91.842570940000000000
          DataSetName = 'Parametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Parametros."QtdeItens"]'
            ''
            '[CalculoImposto."VProd" #n%2.2f]'
            '[CalculoImposto."VDesc" #n%2.2f]'
            '[CalculoImposto."VOutro" #n%2.2f]'
            '[<CalculoImposto."ValorApagar"> #n%2.2f]'
            ''
            'VALOR')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000022000
          Width = 272.126160000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object DadosPagamento: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 14.740159920000000000
        Top = 593.386210000000000000
        Width = 272.126160000000000000
        DataSetName = 'Pagamento'
        RowCount = 0
        Stretched = True
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 128.504020000000000000
          Height = 12.472440940000000000
          DataSetName = 'Pagamento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            '[Pagamento."tPag"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 2.110233780000044000
          Width = 143.622140000000000000
          Height = 12.472440940000000000
          DataSetName = 'Pagamento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Pagamento."vPag"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        PrintChildIfInvisible = True
        Stretched = True
        object ImgLogo: TfrxPictureView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 2.677180000000000000
          Width = 177.637910000000000000
          Height = 64.252010000000000000
          Center = True
          DataField = 'LogoCarregado'
          DataSetName = 'Parametros'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object DadosDesconto: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 374.173470000000000000
        Width = 272.126160000000000000
        Filter = '<DadosProdutos."vDesc"> > 0'
        RowCount = 1
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '- [DadosProdutos."vDesc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[<DadosProdutos."Valorliquido">]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object DadosAcrescimo: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 423.307360000000000000
        Width = 272.126160000000000000
        Filter = '<DadosProdutos."VOutro"> > 0'
        RowCount = 1
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '+ [DadosProdutos."VOutro"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Acr'#233'scimo')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[<DadosProdutos."ValorAcrescimos">]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object Observacoes: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 687.874460000000000000
        Width = 272.126160000000000000
        Filter = '<InformacoesAdicionais."OBS"> <> '#39#39
        RowCount = 1
        Stretched = True
        object Memo21: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            '[InformacoesAdicionais."OBS"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 102.047310000000000000
        Top = 113.385900000000000000
        Width = 272.126160000000000000
        object Memo9: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Top = 60.929189999999990000
          Width = 272.126160000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DANFE NFC-e - Documento Auxiliar '
            'da Nota Fiscal de Consumidor Eletr'#244'nica')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Top = 85.370130000000000000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#227'o permite aproveitamento de cr'#233'dito do ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Width = 272.126160000000000000
          Height = 58.582691810000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            '[Emitente."XNome"]'
            
              'CNPJ: [Emitente."CNPJ"] - IE: [Emitente."IE"] - IM: [Emitente."I' +
              'M"]'
            '[Emitente."XLgr"], [Emitente."nro"] - [Emitente."xBairro"]'
            '[Emitente."XMun"] - [Emitente."UF"]')
          ParentFont = False
        end
      end
    end
  end
  object dsNFCe: TFDQuery
    Left = 240
    Top = 16
  end
  object dsNFCeItens: TFDQuery
    Left = 344
    Top = 24
  end
  object ACBrNFE: TACBrNFe
    MAIL = ACBrMail1
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = DanfeFR
    Left = 109
    Top = 80
  end
  object DanfeFR: TACBrNFeDANFEFR
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrNFe = ACBrNFE
    TipoDANFE = tiSemGeracao
    EspessuraBorda = 1
    ExpandirDadosAdicionaisAuto = False
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    Left = 173
    Top = 88
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 40
    Top = 8
  end
end
