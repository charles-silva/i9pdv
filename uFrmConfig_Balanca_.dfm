object FrmConfig_Balanca: TFrmConfig_Balanca
  Left = 270
  Top = 172
  ActiveControl = btnConectar
  BorderStyle = bsNone
  Caption = 'FrmConfig_Balanca'
  ClientHeight = 373
  ClientWidth = 475
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 475
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = 13
    ExplicitWidth = 443
  end
  object Label2: TLabel
    Left = 208
    Top = 159
    Width = 77
    Height = 13
    Caption = 'Ultima Resposta'
    Color = clBtnFace
    ParentColor = False
  end
  object Label3: TLabel
    Left = 208
    Top = 114
    Width = 81
    Height = 13
    Caption = 'Ultimo Peso Lido:'
    Color = clBtnFace
    ParentColor = False
  end
  object Label9: TLabel
    Left = 208
    Top = 312
    Width = 40
    Height = 13
    Caption = 'TimeOut'
    Color = clBtnFace
    ParentColor = False
  end
  object Label10: TLabel
    Left = 208
    Top = 212
    Width = 51
    Height = 13
    Caption = 'Mensagem'
    Color = clBtnFace
    ParentColor = False
  end
  object Label12: TLabel
    Left = 297
    Top = 312
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Arq.Log:'
    Color = clBtnFace
    ParentColor = False
  end
  object SbArqLog: TSpeedButton
    Left = 417
    Top = 328
    Width = 24
    Height = 22
    Caption = '...'
    OnClick = SbArqLogClick
  end
  object Label38: TLabel
    Left = 4
    Top = 4
    Width = 182
    Height = 16
    Caption = 'Cadastro de impressoras'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 475
    Height = 349
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -5
    ExplicitWidth = 580
    ExplicitHeight = 422
  end
  object Label1: TLabel
    Left = 16
    Top = 38
    Width = 37
    Height = 13
    Caption = 'Balanca'
    Color = clBtnFace
    ParentColor = False
  end
  object Label4: TLabel
    Left = 16
    Top = 81
    Width = 55
    Height = 13
    Caption = 'Porta Serial'
    Color = clBtnFace
    ParentColor = False
  end
  object Label5: TLabel
    Left = 16
    Top = 124
    Width = 47
    Height = 13
    Caption = 'Baud rate'
    Color = clBtnFace
    ParentColor = False
  end
  object Label6: TLabel
    Left = 16
    Top = 169
    Width = 43
    Height = 13
    Caption = 'Data Bits'
    Color = clBtnFace
    ParentColor = False
  end
  object Label7: TLabel
    Left = 16
    Top = 213
    Width = 28
    Height = 13
    Caption = 'Parity'
    Color = clBtnFace
    ParentColor = False
  end
  object Label8: TLabel
    Left = 16
    Top = 303
    Width = 61
    Height = 13
    Caption = 'Handshaking'
    Color = clBtnFace
    ParentColor = False
  end
  object Label11: TLabel
    Left = 16
    Top = 256
    Width = 42
    Height = 13
    Caption = 'Stop Bits'
    Color = clBtnFace
    ParentColor = False
  end
  object btnConectar: TButton
    Left = 203
    Top = 40
    Width = 105
    Height = 25
    Caption = 'Ativar'
    TabOrder = 0
    OnClick = btnConectarClick
  end
  object btnDesconectar: TButton
    Left = 331
    Top = 40
    Width = 105
    Height = 25
    Caption = 'Desativar'
    Enabled = False
    TabOrder = 1
    OnClick = btnDesconectarClick
  end
  object btnLerPeso: TButton
    Left = 256
    Top = 80
    Width = 129
    Height = 25
    Caption = 'Ler Peso'
    Enabled = False
    TabOrder = 2
    OnClick = btnLerPesoClick
  end
  object sttPeso: TStaticText
    Left = 208
    Top = 129
    Width = 233
    Height = 24
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object sttResposta: TStaticText
    Left = 208
    Top = 176
    Width = 233
    Height = 32
    AutoSize = False
    TabOrder = 7
  end
  object edtTimeOut: TEdit
    Left = 208
    Top = 328
    Width = 73
    Height = 21
    TabOrder = 3
    Text = '2000'
    OnKeyPress = edtTimeOutKeyPress
  end
  object chbMonitorar: TCheckBox
    Left = 208
    Top = 283
    Width = 126
    Height = 19
    Caption = 'Monitorar a Balan'#231'a'
    TabOrder = 4
    OnClick = chbMonitorarClick
  end
  object Memo1: TMemo
    Left = 208
    Top = 232
    Width = 233
    Height = 42
    TabOrder = 5
  end
  object edLog: TEdit
    Left = 294
    Top = 328
    Width = 122
    Height = 21
    Cursor = crIBeam
    TabOrder = 8
    Text = 'BalLog.txt'
  end
  object cmbBalanca: TComboBox
    Left = 16
    Top = 54
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 9
    Text = 'Nenhuma'
    Items.Strings = (
      'Nenhuma'
      'Filizola'
      'Toledo')
  end
  object cmbPortaSerial: TComboBox
    Left = 16
    Top = 97
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 10
    Text = 'COM1'
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'COM7'
      'COM8')
  end
  object cmbBaudRate: TComboBox
    Left = 16
    Top = 142
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 6
    TabOrder = 11
    Text = '9600'
    Items.Strings = (
      '110'
      '300'
      '600'
      '1200'
      '2400'
      '4800'
      '9600'
      '14400'
      '19200'
      '38400'
      '56000'
      '57600')
  end
  object cmbDataBits: TComboBox
    Left = 16
    Top = 185
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 3
    TabOrder = 12
    Text = '8'
    Items.Strings = (
      '5'
      '6'
      '7'
      '8')
  end
  object cmbHandShaking: TComboBox
    Left = 16
    Top = 321
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 13
    Text = 'Nenhum'
    Items.Strings = (
      'Nenhum'
      'XON/XOFF'
      'RTS/CTS'
      'DTR/DSR')
  end
  object cmbParity: TComboBox
    Left = 16
    Top = 230
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 14
    Text = 'none'
    Items.Strings = (
      'none'
      'odd'
      'even'
      'mark'
      'space')
  end
  object cmbStopBits: TComboBox
    Left = 16
    Top = 274
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 15
    Text = 's1'
    Items.Strings = (
      's1'
      's1,5'
      's2'
      '')
  end
  object ACBrBAL1: TACBrBAL
    Porta = 'COM1'
    OnLePeso = ACBrBAL1LePeso
    Left = 416
    Top = 80
  end
end
