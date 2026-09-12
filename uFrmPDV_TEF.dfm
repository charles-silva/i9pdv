object FrmPDV_TEF: TFrmPDV_TEF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  ClientHeight = 183
  ClientWidth = 447
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    447
    183)
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 24
    Width = 447
    Height = 159
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 22
  end
  object Shape2: TShape
    Left = 0
    Top = 0
    Width = 447
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
    Width = 432
    Height = 19
    Caption = 'TEF - Transa'#231#227'o Eletronica de Fundos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object lblStatus: TLabel
    Left = 13
    Top = 40
    Width = 421
    Height = 125
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aguarde...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object lblMensagemRodape: TLabel
    Left = 138
    Top = 155
    Width = 170
    Height = 14
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [Enter] para sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    Visible = False
    StyleElements = []
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    Porta = 'COM3'
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    ControlePorta = True
    ArqLOG = 'E:\Wibi Tecnologia\Demos\TEF\Win32\Debug\PosPrinter.log'
    Left = 191
    Top = 44
  end
  object TimerSair: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerSairTimer
    Left = 108
    Top = 44
  end
end
