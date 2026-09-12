object FrmNFCe: TFrmNFCe
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
    Caption = 'Processando NFC-e'
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
    Width = 264
    Height = 16
    Caption = 'Nota fiscal eletr'#244'nica ao consumidor'
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
  object TimerPisca: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerPiscaTimer
    Left = 196
    Top = 64
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFE = ACBrNFeDANFEFR1
    Left = 128
    Top = 56
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    ACBrNFe = ACBrNFe
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiSemGeracao
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    CasasDecimais._Mask_qCom = ',0.00'
    CasasDecimais._Mask_vUnCom = ',0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 8
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    EspessuraBorda = 1
    ExibirTotalTributosItem = False
    ExibeCampoFatura = True
    TributosPercentual = ptValorProdutos
    ImprimirUnQtVlComercial = iuComercial
    Detalhado = False
    DescricaoViaEstabelec = 'Via do Consumidor'
    ExpandirDadosAdicionaisAuto = False
    ImprimirDadosArma = True
    QuebraLinhaEmDetalhamentoEspecifico = True
    IncorporarBackgroundPdf = True
    IncorporarFontesPdf = True
    ImprimirDadosDocReferenciados = True
    Left = 168
    Top = 68
  end
end
