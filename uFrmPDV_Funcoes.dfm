object FrmPDV_Funcoes: TFrmPDV_Funcoes
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 588
  ClientWidth = 891
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
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 891
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = clSkyBlue
    ExplicitLeft = 13
    ExplicitWidth = 443
  end
  object Label38: TLabel
    Left = 426
    Top = 2
    Width = 456
    Height = 19
    Caption = 'C'#243'digos de Teclas de Atalhos e Fun'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 891
    Height = 564
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -68
    ExplicitWidth = 515
    ExplicitHeight = 405
  end
  object cxGrid1: TcxGrid
    Left = 5
    Top = 27
    Width = 437
    Height = 555
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Whiteprint'
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyDown = cxGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnEditKeyPress = cxGrid1DBTableView1EditKeyPress
      DataController.DataSource = doFuncoesSistema
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      object cxGrid1DBTableView1func_codigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'func_codigo'
        DataBinding.IsNullValueType = True
        Width = 38
      end
      object cxGrid1DBTableView1func_descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o da fun'#231#227'o'
        DataBinding.FieldName = 'func_descricao'
        DataBinding.IsNullValueType = True
        Width = 362
      end
      object cxGrid1DBTableView1func_grupo: TcxGridDBColumn
        Caption = 'Fun'#231#245'es de sistema'
        DataBinding.FieldName = 'func_grupo'
        DataBinding.IsNullValueType = True
        Visible = False
        GroupIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGrid2: TcxGrid
    Left = 448
    Top = 28
    Width = 437
    Height = 555
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Whiteprint'
    object cxGridDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridDBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = doFuncoesVenda
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'func_codigo'
        DataBinding.IsNullValueType = True
        Width = 38
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = 'Descri'#231#227'o da fun'#231#227'o'
        DataBinding.FieldName = 'func_descricao'
        DataBinding.IsNullValueType = True
        Width = 362
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = 'Fun'#231#245'es de opera'#231#227'o'
        DataBinding.FieldName = 'func_grupo'
        DataBinding.IsNullValueType = True
        Visible = False
        GroupIndex = 0
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object fdFuncoesSistema: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      ''
      'SELECT  * ,'
      
        '        ( CASE WHEN LEFT(func_codigo, 1) = '#39'1'#39' THEN '#39'Fun'#231#245'es de ' +
        'sistema'#39
      '               ELSE '#39'Fun'#231#245'es de venda'#39
      '          END ) AS func_grupo'
      'FROM    pdv.tb_funcoes'
      'WHERE   func_ativo = 1 and LEFT(func_codigo, 1) = '#39'1'#39' ')
    Left = 160
    Top = 248
  end
  object doFuncoesSistema: TDataSource
    AutoEdit = False
    DataSet = fdFuncoesSistema
    Left = 280
    Top = 248
  end
  object fdFuncoesVenda: TFDQuery
    Connection = FrmPDV_DModule.ADConnection1
    SQL.Strings = (
      ''
      'SELECT  * ,'
      
        '        ( CASE WHEN LEFT(func_codigo, 1) = '#39'1'#39' THEN '#39'Fun'#231#245'es de ' +
        'sistema'#39
      '               ELSE '#39'Fun'#231#245'es de opera'#231#227'o'#39
      '          END ) AS func_grupo'
      'FROM    pdv.tb_funcoes'
      'WHERE   func_ativo = 1 and LEFT(func_codigo, 1) = '#39'2'#39' ')
    Left = 620
    Top = 248
  end
  object doFuncoesVenda: TDataSource
    AutoEdit = False
    DataSet = fdFuncoesVenda
    Left = 692
    Top = 240
  end
  object frxReport1: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 41866.616174467600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '       if <Parametros."Imagem"> = '#39#39' then                       ' +
        '                                               '
      '       begin                              '
      
        '               ReportTitle1.Visible := false;                   ' +
        '                                    '
      '       end;'
      
        '       // esconde informa'#231#227'o do protocolo quando em contingencia' +
        '                                                                ' +
        '                                                                ' +
        '                      '
      '       if <Parametros."Contingencia_Valor"> = '#39#39' then'
      '       begin'
      
        '               Memo5.Visible := false;                          ' +
        '                                        '
      
        '       end;                                                     ' +
        '                                    '
      'end;'
      ''
      'procedure DadosProdutosOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  DadosDesconto.Visible  := <DadosProdutos."vDesc"> > 0;'
      '  DadosAcrescimo.Visible := <DadosProdutos."vOutro"> > 0;      '
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Observacoes.Visible := Trim(<InformacoesAdicionais."OBS">) <> ' +
        #39#39'                '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 432
    Top = 280
    Datasets = <
      item
        DataSetName = 'CalculoImposto'
      end
      item
        DataSetName = 'DadosProdutos'
      end
      item
        DataSetName = 'Destinatario'
      end
      item
        DataSetName = 'Duplicatas'
      end
      item
        DataSetName = 'Emitente'
      end
      item
        DataSetName = 'Eventos'
      end
      item
        DataSetName = 'Fatura'
      end
      item
        DataSetName = 'Identificacao'
      end
      item
        DataSetName = 'InformacoesAdicionais'
      end
      item
        DataSetName = 'ISSQN'
      end
      item
        DataSetName = 'LocalEntrega'
      end
      item
        DataSetName = 'LocalRetirada'
      end
      item
        DataSetName = 'Pagamento'
      end
      item
        DataSetName = 'Parametros'
      end
      item
        DataSetName = 'Transportador'
      end
      item
        DataSetName = 'Veiculo'
      end
      item
        DataSetName = 'Volumes'
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
      LargeDesignHeight = True
      MirrorMode = []
      PrintIfEmpty = False
      OnBeforePrint = 'Page1OnBeforePrint'
      object ValorTributos: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 32.015752910000000000
        Top = 631.181510000000000000
        Width = 272.126160000000000000
        RowCount = 1
        object Memo17: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000000000
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
          Top = 3.779530000000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
          Top = 77.472480000000000000
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
          Top = 18.559060000000000000
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
          Top = 91.267762910000000000
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
          Top = 1.220470000000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574768980000000000
        Top = 865.512370000000000000
        Width = 272.126160000000000000
        RowCount = 1
        Stretched = True
        object Memo58: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 0.779530000000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
          Top = 158.181200000000000000
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
          Top = 3.779530000000000000
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
          Top = 141.401670000000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
          WordWrap = False
        end
        object memqCom: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Top = 13.496065430000000000
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
          ShiftMode = smDontShift
          Left = 79.370078740000000000
          Top = 13.496065430000000000
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
          Top = 13.496065430000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 27.590560940000000000
        Top = 275.905690000000000000
        Width = 272.126160000000000000
        Condition = 'DadosProdutos."ChaveNFe"'
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692913390000000000
          Top = 14.472448270000000000
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
          Top = 14.472448270000000000
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
          Top = 1.354328270000000000
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
          Top = 1.354328270000000000
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
          Top = 14.472448270000000000
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
          Top = 14.472448270000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 98.401630940000000000
        Top = 472.441250000000000000
        Width = 272.126160000000000000
        Condition = 'DadosProdutos."ChaveNFe"'
        ReprintOnNewPage = True
        object memTitDadosPagamento: TfrxMemoView
          AllowVectorExport = True
          Top = 6.338590000000000000
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
          Top = 6.338590000000000000
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
            
              '[<CalculoImposto."VProd"> - <CalculoImposto."VDesc"> + <CalculoI' +
              'mposto."VOutro"> #n%2.2f]'
            ''
            'VALOR')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 272.126160000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object DadosPagamento: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
          Top = 2.110233780000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 272.126160000000000000
        Child = frxReport1.Cabecalho
        PrintChildIfInvisible = True
        object ImgLogo: TfrxPictureView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = -0.220470000000000000
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
      object Cabecalho: TfrxChild
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 105.826840000000000000
        Top = 109.606370000000000000
        Width = 272.126160000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo9: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 64.708720000000000000
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
          Top = 89.149660000000000000
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
          Top = 3.779530000000000000
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
      object DadosDesconto: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 374.173470000000000000
        Width = 272.126160000000000000
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
          Top = 11.338590000000000000
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
            '[<DadosProdutos."vProd"> - <DadosProdutos."vDesc">]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 11.338590000000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 423.307360000000000000
        Width = 272.126160000000000000
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
          Top = 11.338590000000000000
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
            '[<DadosProdutos."vProd"> + <DadosProdutos."VOutro">]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 11.338590000000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 687.874460000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
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
    end
  end
end
