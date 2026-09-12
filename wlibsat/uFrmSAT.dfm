object FrmSAT: TFrmSAT
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  ClientHeight = 165
  ClientWidth = 366
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    366
    165)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 366
    Height = 141
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = 4
  end
  object lblStatus: TLabel
    Left = 15
    Top = 82
    Width = 337
    Height = 24
    Alignment = taCenter
    AutoSize = False
    Caption = 'Processando CF-e'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 366
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = -99
    ExplicitWidth = 423
  end
  object lblTitle: TLabel
    Left = 4
    Top = 3
    Width = 170
    Height = 16
    Caption = 'Cupom Fiscal Eletr'#244'nco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblMensagemRodape: TLabel
    Left = 5
    Top = 144
    Width = 353
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Pressione [Enter] ap'#243's o pagamento no POS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    Visible = False
    StyleElements = []
  end
  object XMLDocMensagem: TXMLDocument
    Left = 40
    Top = 84
    DOMVendorDesc = 'MSXML'
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    Left = 40
    Top = 8
  end
  object ACBrSAT1: TACBrSAT
    Extrato = ACBrSATExtratoESCPOS1
    NomeDLL = 'c:\sat\SAT.DLL'
    OnGravarLog = ACBrSAT1GravarLog
    Config.infCFe_versaoDadosEnt = 0.050000000000000000
    Config.ide_numeroCaixa = 0
    Config.ide_tpAmb = taHomologacao
    Config.emit_cRegTrib = RTSimplesNacional
    Config.emit_cRegTribISSQN = RTISSMicroempresaMunicipal
    Config.emit_indRatISSQN = irSim
    Config.EhUTF8 = True
    Config.PaginaDeCodigo = 65001
    ConfigArquivos.PrefixoArqCFe = 'AD'
    ConfigArquivos.PrefixoArqCFeCanc = 'ADC'
    Rede.tipoInter = infETHE
    Rede.seg = segNONE
    Rede.tipoLan = lanDHCP
    Rede.proxy = 0
    Rede.proxy_porta = 0
    OnGetcodigoDeAtivacao = ACBrSAT1GetcodigoDeAtivacao
    OnGetsignAC = ACBrSAT1GetsignAC
    OnGetNumeroSessao = ACBrSAT1GetNumeroSessao
    Left = 40
    Top = 49
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    ControlePorta = True
    Left = 137
    Top = 89
  end
  object ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS
    ACBrSAT = ACBrSAT1
    Mask_qCom = ',0.0000'
    Mask_vUnCom = ',0.000'
    NomeArquivo = 'C:\temp\ESCPOS.txt'
    SoftwareHouse = 'i9 Mobile'
    Site = 'http://www.i9mobile.com.br'
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    PosPrinter = ACBrPosPrinter1
    Left = 251
    Top = 93
  end
  object TimerPisca: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerPiscaTimer
    Left = 196
    Top = 64
  end
end
