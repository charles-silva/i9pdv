object FrmConfig_Terminais: TFrmConfig_Terminais
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro do terminal'
  ClientHeight = 593
  ClientWidth = 444
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    444
    593)
  TextHeight = 13
  object Label14: TLabel
    Left = 17
    Top = 30
    Width = 146
    Height = 16
    Caption = 'Numero do Terminal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label36: TLabel
    Left = 17
    Top = 74
    Width = 160
    Height = 16
    Caption = 'Descri'#231#227'o do Terminal'
    FocusControl = edpterm_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 17
    Top = 121
    Width = 83
    Height = 16
    Caption = 'S'#233'rie Fiscal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 444
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    OnMouseDown = Shape16MouseDown
    ExplicitTop = 1
    ExplicitWidth = 430
  end
  object Label38: TLabel
    Left = 17
    Top = 1
    Width = 311
    Height = 23
    Caption = 'Cadastramento de Terminais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Label2: TLabel
    Left = 17
    Top = 567
    Width = 95
    Height = 12
    Anchors = [akRight, akBottom]
    Caption = '[F2] - Gravar e sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 17
    Top = 189
    Width = 407
    Height = 1
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Brush.Style = bsClear
    Pen.Color = 11383299
  end
  object Label10: TLabel
    Left = 108
    Top = 120
    Width = 84
    Height = 16
    Caption = 'Impressora'
    FocusControl = edpterm_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Tag = 1
    Left = 17
    Top = 227
    Width = 148
    Height = 16
    Caption = 'Configura'#231#227'o do TEF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape2: TShape
    Tag = 1
    Left = 17
    Top = 245
    Width = 408
    Height = 1
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Brush.Style = bsClear
    Pen.Color = 11383299
  end
  object Label11: TLabel
    Tag = 2
    Left = 17
    Top = 444
    Width = 177
    Height = 16
    Caption = 'Chave de acesso validador'
    FocusControl = edpterm_pos_chave_validador
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Shape3: TShape
    Tag = 2
    Left = 17
    Top = 439
    Width = 408
    Height = 1
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Brush.Style = bsClear
    Pen.Color = 11383299
  end
  object Label13: TLabel
    Tag = 2
    Left = 17
    Top = 421
    Width = 100
    Height = 16
    Caption = 'Dados do POS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Tag = 3
    Left = 16
    Top = 513
    Width = 287
    Height = 16
    Caption = 'CSC - C'#243'digo de seguran'#231'a do contribuinte'
    FocusControl = edpterm_csc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Shape4: TShape
    Tag = 3
    Left = 16
    Top = 508
    Width = 408
    Height = 1
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Brush.Style = bsClear
    Pen.Color = 11383299
  end
  object Label16: TLabel
    Tag = 3
    Left = 16
    Top = 490
    Width = 116
    Height = 16
    Caption = 'Dados da NFC-e'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape5: TShape
    Left = 17
    Top = 214
    Width = 407
    Height = 1
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Brush.Style = bsClear
    Pen.Color = 11383299
  end
  object lbl1: TLabel
    Tag = 2
    Left = 16
    Top = 249
    Width = 71
    Height = 16
    Caption = 'Prestadora'
    FocusControl = edpterm_pos_chave_validador
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Tag = 2
    Left = 247
    Top = 249
    Width = 61
    Height = 16
    Caption = 'Ambiente'
    FocusControl = edpterm_pos_chave_validador
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Tag = 2
    Left = 16
    Top = 371
    Width = 54
    Height = 16
    Caption = 'Servidor'
    FocusControl = cxDBTextEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Tag = 2
    Left = 16
    Top = 327
    Width = 138
    Height = 16
    Caption = 'Mensagem do PinPad'
    FocusControl = cxDBTextEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblQrCode: TLabel
    Tag = 2
    Left = 16
    Top = 287
    Width = 71
    Height = 16
    Caption = 'Pix QrCode'
    FocusControl = edpterm_pos_chave_validador
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 444
    Height = 569
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = clSilver
    ExplicitLeft = -17
    ExplicitWidth = 461
    ExplicitHeight = 482
  end
  object edpterm_descricao: TcxDBTextEdit
    Left = 17
    Top = 90
    DataBinding.DataField = 'pterm_descricao'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 2
    Width = 407
  end
  object edpterm_serie_fiscal: TcxDBCurrencyEdit
    Left = 17
    Top = 137
    DataBinding.DataField = 'pterm_serie_fiscal'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 3
    Width = 85
  end
  object cbpimp_id: TcxDBLookupComboBox
    Left = 108
    Top = 137
    DataBinding.DataField = 'pimp_id'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.ListColumns = <>
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 4
    Width = 317
  end
  object ckpterm_nfce: TcxRadioButton
    Left = 17
    Top = 167
    Width = 55
    Height = 17
    Caption = '&NFC-e'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    TabStop = True
    GroupIndex = 1
    LookAndFeel.SkinName = 'Whiteprint'
  end
  object ckpterm_sat: TcxRadioButton
    Left = 207
    Top = 167
    Width = 49
    Height = 17
    Caption = '&SAT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    GroupIndex = 1
    LookAndFeel.SkinName = 'Whiteprint'
  end
  object ckpterm_pos: TcxRadioButton
    Left = 17
    Top = 196
    Width = 48
    Height = 17
    Caption = '&POS'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    TabStop = True
    OnClick = ckpterm_posClick
    GroupIndex = 2
    LookAndFeel.SkinName = 'Whiteprint'
  end
  object ckpterm_tef: TcxRadioButton
    Left = 84
    Top = 196
    Width = 42
    Height = 16
    Caption = '&TEF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = ckpterm_tefClick
    GroupIndex = 2
    LookAndFeel.SkinName = 'Whiteprint'
  end
  object edpterm_pos_chave_validador: TcxDBTextEdit
    Tag = 2
    Left = 17
    Top = 460
    DataBinding.DataField = 'pterm_pos_chave_validador'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 12
    Width = 408
  end
  object edpterm_csc: TcxDBTextEdit
    Tag = 3
    Left = 16
    Top = 529
    DataBinding.DataField = 'pterm_csc'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 13
    Width = 408
  end
  object ckpterm_nfce_offline: TcxRadioButton
    Left = 84
    Top = 167
    Width = 112
    Height = 17
    Caption = 'NFC-e (&Off-line)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    GroupIndex = 1
    LookAndFeel.SkinName = 'Whiteprint'
  end
  object rbNaoFiscal: TcxRadioButton
    Left = 275
    Top = 167
    Width = 81
    Height = 17
    Caption = 'SAT (OFF)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    GroupIndex = 1
    LookAndFeel.SkinName = 'Whiteprint'
  end
  object ckpterm_semcartao: TcxRadioButton
    Left = 154
    Top = 196
    Width = 91
    Height = 16
    Caption = 'Sem &Cart'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = ckpterm_semcartaoClick
    GroupIndex = 2
    LookAndFeel.SkinName = 'Whiteprint'
  end
  object edpterm_id: TcxDBTextEdit
    Left = 17
    Top = 46
    TabStop = False
    DataBinding.DataField = 'pterm_id'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    Style.BorderStyle = ebsFlat
    Style.Color = 16119285
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Width = 280
  end
  object ckpterm_modo_servidor: TcxDBCheckBox
    Left = 303
    Top = 48
    Caption = '&Modo Servidor'
    DataBinding.DataField = 'pterm_modo_servidor'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.NullStyle = nssUnchecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Whiteprint'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Whiteprint'
    StyleFocused.LookAndFeel.SkinName = 'Whiteprint'
    StyleHot.LookAndFeel.SkinName = 'Whiteprint'
    TabOrder = 1
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Tag = 2
    Left = 16
    Top = 387
    DataBinding.DataField = 'pterm_tef_servidor'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 16
    Width = 408
  end
  object cbbTipoTEF: TcxDBComboBox
    Left = 16
    Top = 265
    DataBinding.DataField = 'pterm_tef_prestador'
    DataBinding.DataSource = doTerminais
    TabOrder = 14
    Width = 217
  end
  object cbbTEFAmbiente: TcxDBComboBox
    Left = 247
    Top = 265
    DataBinding.DataField = 'pterm_tef_ambiente'
    DataBinding.DataSource = doTerminais
    TabOrder = 15
    Width = 177
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Tag = 2
    Left = 16
    Top = 343
    DataBinding.DataField = 'pterm_tef_mensagem_pinpad'
    DataBinding.DataSource = doTerminais
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.TextColor = clBlack
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 17
    Width = 408
  end
  object cxDBComboBox1: TcxDBComboBox
    Left = 16
    Top = 303
    DataBinding.DataField = 'pterm_tef_qrcode'
    DataBinding.DataSource = doTerminais
    Properties.Items.Strings = (
      'N'#227'o Suportado'
      'Auto'
      'Exibir no PinPad'
      'Exibir na Tela'
      'Imprimir')
    TabOrder = 18
    Width = 217
  end
  object WiEventsForm1: TWiEventsForm
    IDControl = edpterm_descricao
    OnKeyDownEscape = WiEventsForm1KeyDownEscape
    Left = 353
    Top = 400
  end
  object dsTerminais: TWiFDQuery
    AfterInsert = dsTerminaisAfterInsert
    BeforePost = dsTerminaisBeforePost
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      
        'SELECT * FROM pdv.tb_terminais where em_codigo = :em_codigo and ' +
        'pterm_serial_hd = :pterm_serial_hd')
    CustomDelete = False
    ProcedureName = 'pdv.proc_input_tb_terminais'
    TableNameDelete = 'pdv.tb_terminais'
    KeyFieldRefresh = 'pterm_id'
    KeyFieldDelete = 'pterm_id'
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 384
    Top = 86
    ParamData = <
      item
        Name = 'EM_CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'PTERM_SERIAL_HD'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object doTerminais: TDataSource
    DataSet = dsTerminais
    Left = 384
    Top = 195
  end
  object JvBrowseForFolderDialog1: TJvBrowseForFolderDialog
    Left = 220
    Top = 401
  end
end
