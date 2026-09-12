object FrmConfig_SyncServer: TFrmConfig_SyncServer
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Configura'#231#227'o de Conex'#227'o do WiMob'
  ClientHeight = 236
  ClientWidth = 329
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    329
    236)
  TextHeight = 13
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 329
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    ExplicitLeft = -252
    ExplicitWidth = 515
  end
  object Label1: TLabel
    Left = 9
    Top = 33
    Width = 40
    Height = 13
    Caption = 'Servidor'
  end
  object Label2: TLabel
    Left = 206
    Top = 33
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object Label3: TLabel
    Left = 9
    Top = 76
    Width = 77
    Height = 13
    Caption = 'Banco de Dados'
  end
  object Label4: TLabel
    Left = 9
    Top = 119
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label5: TLabel
    Left = 9
    Top = 160
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label38: TLabel
    Left = 5
    Top = 3
    Width = 312
    Height = 19
    Caption = 'Sincronisando com Servidor'
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
    Width = 329
    Height = 212
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitTop = 23
    ExplicitWidth = 294
    ExplicitHeight = 231
  end
  object lblMsgRapida: TLabel
    Left = 9
    Top = 214
    Width = 217
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Pressione [F2] para gravar altera'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    StyleElements = []
    ExplicitTop = 233
  end
  object edpsync_servidor: TcxDBTextEdit
    Left = 9
    Top = 47
    DataBinding.DataField = 'psync_servidor'
    DataBinding.DataSource = doConfigSync
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Width = 193
  end
  object edpsync_database: TcxDBTextEdit
    Left = 9
    Top = 90
    DataBinding.DataField = 'psync_database'
    DataBinding.DataSource = doConfigSync
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 2
    Width = 193
  end
  object edpsync_user: TcxDBTextEdit
    Left = 9
    Top = 133
    DataBinding.DataField = 'psync_user'
    DataBinding.DataSource = doConfigSync
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 3
    Width = 193
  end
  object edpsync_port: TcxDBCurrencyEdit
    Left = 206
    Top = 47
    DataBinding.DataField = 'psync_port'
    DataBinding.DataSource = doConfigSync
    ParentFont = False
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Properties.Nullable = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 1
    Width = 44
  end
  object edpsync_password: TcxTextEdit
    Left = 9
    Top = 174
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Blue'
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 4
    Width = 193
  end
  object dsConfigSync: TWiFDQuery
    BeforePost = dsConfigSyncBeforePost
    AfterScroll = dsConfigSyncAfterScroll
    Connection = FrmPDV_DModule.ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select * from pdv.tb_config_syncserver')
    CustomDelete = False
    ProcedureName = 'pdv.proc_input_config_syncserver'
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 121
    Top = 142
  end
  object doConfigSync: TDataSource
    DataSet = dsConfigSync
    Left = 201
    Top = 142
  end
  object WiEventsForm1: TWiEventsForm
    Left = 169
    Top = 70
  end
end
