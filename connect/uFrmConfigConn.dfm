object FrmConfigConn: TFrmConfigConn
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Configura'#231#227'o da conex'#227'o'
  ClientHeight = 459
  ClientWidth = 663
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    663
    459)
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 8
    Top = 14
    Width = 25
    Height = 13
    Caption = 'CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblStatus: TLabel
    Left = 8
    Top = 404
    Width = 337
    Height = 11
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 101
  end
  object Bevel1: TBevel
    Left = 8
    Top = 396
    Width = 648
    Height = 5
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
    ExplicitTop = 93
    ExplicitWidth = 319
  end
  object btnConnect: TcxButton
    Left = 8
    Top = 424
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = 'Confirmar'
    Enabled = False
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 203
    TabOrder = 4
    OnClick = btnConnectClick
    ExplicitTop = 122
  end
  object btnVoltar: TcxButton
    Left = 95
    Top = 424
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = 'Voltar'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 81
    TabOrder = 5
    OnClick = btnVoltarClick
    ExplicitTop = 122
  end
  object edCNPJ: TcxMaskEdit
    Left = 8
    Top = 27
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.IgnoreMaskBlank = True
    Properties.EditMask = '99.999.999/9999-99;0;_'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.SkinName = 'Blue'
    StyleDisabled.LookAndFeel.SkinName = 'Blue'
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.LookAndFeel.SkinName = 'Blue'
    StyleHot.BorderStyle = ebsOffice11
    StyleHot.LookAndFeel.SkinName = 'Blue'
    TabOrder = 0
    Text = '              '
    Width = 126
  end
  object cxButton3: TcxButton
    Left = 8
    Top = 59
    Width = 101
    Height = 25
    Caption = 'Validar acesso'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 104
    TabOrder = 2
    OnClick = cxButton3Click
  end
  object mem_sql_create1: TMemo
    Left = 167
    Top = 252
    Width = 113
    Height = 43
    Lines.Strings = (
      'BEGIN TRANSACTION;'
      'DROP TABLE IF EXISTS `tb_conexoes`;'
      'DROP TABLE IF EXISTS `tb_licenca`;'
      'DROP TABLE IF EXISTS `tb_version_files`;'
      'DROP TABLE IF EXISTS `tb_version`;'
      ''
      'CREATE TABLE "tb_version_files" ('
      #9'`ver_id`'#9'INTEGER,'
      #9'`verf_id`'#9'INTEGER,'
      #9'`verf_filename`'#9'TEXT,'
      #9'`verf_md5`'#9'TEXT,'
      #9'PRIMARY KEY(verf_id)'
      ');'
      'CREATE TABLE "tb_version" ('
      #9'`ver_id`'#9'INTEGER,'
      #9'`ver_data`'#9'TEXT,'
      #9'`ver_versao`'#9'TEXT,'
      #9'`ver_descricao`'#9'TEXT,'
      #9'`ver_instalada`'#9'INTEGER DEFAULT 0,'
      #9'`ver_baixada`'#9'INTEGER DEFAULT 0,'
      #9'PRIMARY KEY(ver_id)'
      ');'
      'CREATE TABLE "tb_licenca" ('
      #9'`CNPJ`'#9'TEXT,'
      #9'PRIMARY KEY(CNPJ)'
      ');'
      'CREATE TABLE `tb_conexoes` ('
      #9'`ID`'#9'INTEGER,'
      #9'`Address`'#9'TEXT,'
      #9'`Port`'#9'INTEGER,'
      #9'`Database`'#9'TEXT,'
      #9'`Descricao`'#9'TEXT,'
      #9'`UserName`'#9'TEXT,'
      #9'`Password`'#9'TEXT,'
      #9'`LoginCache`'#9'TEXT,'
      #9'`con_default`'#9'INTEGER,'
      #9'PRIMARY KEY(ID)'
      ');'
      'COMMIT;'
      '')
    TabOrder = 6
    Visible = False
    WordWrap = False
  end
  object mem_sql_connect: TMemo
    Left = 167
    Top = 347
    Width = 113
    Height = 43
    Lines.Strings = (
      ''
      'SELECT  con.* ,'
      '        en.en_nome_completo'
      'FROM    sistema.tb_conexoes con ,'
      '        sistema.tb_conexoes_cli concl ,'
      '        vendas.tb_clientes cl ,'
      '        param.tb_entidades en'
      'WHERE   con.con_id = concl.con_id AND'
      '        concl.cl_id = cl.cl_id AND'
      '        cl.en_id = en.en_id AND'
      '        en.en_cnpjcpf = @cnpj; '
      '')
    TabOrder = 1
    Visible = False
    WordWrap = False
  end
  object mem_sql_licenca: TMemo
    Left = 167
    Top = 301
    Width = 113
    Height = 43
    Lines.Strings = (
      'SELECT TOP 1'
      '        ver_versao'
      'FROM    sistema.tb_version a ,'
      '        sistema.tb_version_clientes b ,'
      '        vendas.tb_clientes c ,'
      '        param.tb_entidades d'
      'WHERE   a.ver_id = b.ver_id AND'
      '        b.cl_id = c.cl_id AND'
      '        c.en_id = d.en_id AND'
      '        d.en_cnpjcpf = @cnpj'
      'ORDER BY a.ver_id DESC;')
    TabOrder = 3
    Visible = False
    WordWrap = False
  end
  object cnWiBiDC: TFDConnection
    Params.Strings = (
      'Server=138.118.143.0\SQLEXPRESS,1597 '
      'User_Name=sa'
      'Database=ERPWibi'
      'Password=WiBiERP!@#_2013*'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 184
    Top = 20
  end
  object fdConexoesCli: TFDQuery
    Connection = cnWiBiDC
    Left = 188
    Top = 128
  end
  object XMLConfigDoc: TXMLDocument
    FileName = 'servers.xml'
    Left = 324
    Top = 284
    DOMVendorDesc = 'MSXML'
  end
  object cnLocalConfigDB: TFDConnection
    Params.Strings = (
      
        'Database=D:\Dropbox\WiBi\Projetos\Softwares\ERP\Fonte\MainApp\Wi' +
        'n32\Debug\config.widb'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 424
    Top = 12
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 36
    Top = 232
  end
  object fdLocalConfig: TFDQuery
    Connection = cnLocalConfigDB
    SQL.Strings = (
      'SELECT  a.*,c.en_nome_completo'
      'FROM    sistema.tb_clientes_conexoes a ,'
      '        vendas.tb_clientes b ,'
      '        param.tb_entidades c'
      'WHERE   a.cl_id = b.cl_id AND'
      '        b.en_id = c.en_id AND'
      '        c.en_cnpjcpf = @cnpj AND'
      '        a.clcon_access_pass = @senha;')
    Left = 428
    Top = 60
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 36
    Top = 252
  end
  object fdLicenca: TFDQuery
    Connection = cnWiBiDC
    Left = 188
    Top = 72
  end
  object fdLocalLicenca: TFDQuery
    Connection = cnLocalConfigDB
    SQL.Strings = (
      'SELECT  a.*,c.en_nome_completo'
      'FROM    sistema.tb_clientes_conexoes a ,'
      '        vendas.tb_clientes b ,'
      '        param.tb_entidades c'
      'WHERE   a.cl_id = b.cl_id AND'
      '        b.en_id = c.en_id AND'
      '        c.en_cnpjcpf = @cnpj AND'
      '        a.clcon_access_pass = @senha;')
    Left = 436
    Top = 112
  end
end
