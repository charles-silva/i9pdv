object FrmConfig_Connection: TFrmConfig_Connection
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Configura'#231#227'o da conex'#227'o'
  ClientHeight = 179
  ClientWidth = 361
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
    361
    179)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape27: TShape
    Left = 0
    Top = 24
    Width = 361
    Height = 155
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = 11383299
    ExplicitLeft = -5
  end
  object Label11: TLabel
    Left = 8
    Top = 32
    Width = 36
    Height = 16
    Caption = 'CNPJ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblStatus: TLabel
    Left = 8
    Top = 124
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
    StyleElements = []
    ExplicitTop = 148
  end
  object Shape16: TShape
    Left = 0
    Top = 0
    Width = 361
    Height = 24
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Brush.Color = 5986569
    OnMouseDown = Shape16MouseDown
    ExplicitLeft = -110
    ExplicitWidth = 450
  end
  object Label38: TLabel
    Left = 137
    Top = 2
    Width = 216
    Height = 19
    Caption = 'Autoriza'#231#227'o de Uso'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentFont = False
    StyleElements = []
  end
  object Bevel1: TShape
    Left = 8
    Top = 119
    Width = 346
    Height = 1
    Anchors = [akLeft, akRight, akBottom]
    Brush.Color = 5986569
    ExplicitTop = 143
  end
  object edCNPJ: TcxMaskEdit
    Left = 8
    Top = 48
    ParentFont = False
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.IgnoreMaskBlank = True
    Properties.EditMask = '99.999.999/9999-99;0;_'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
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
    Text = '              '
    Width = 141
  end
  object cxButton3: TcxButton
    Left = 8
    Top = 79
    Width = 120
    Height = 34
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = 'Pesquisa On-line'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = cxButton3Click
  end
  object mem_sql_create1: TMemo
    Left = 219
    Top = 153
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
    TabOrder = 3
    Visible = False
    WordWrap = False
  end
  object mem_sql_licenca: TMemo
    Left = 219
    Top = 104
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
    TabOrder = 2
    Visible = False
    WordWrap = False
  end
  object btnConfirma: TcxButton
    Left = 8
    Top = 130
    Width = 100
    Height = 37
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = '&Ok'
    Enabled = False
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 203
    OptionsImage.Images = FrmPDV_DModule.SmallImagesNew
    TabOrder = 4
    OnClick = btnConfirmaClick
  end
  object btnVoltar: TcxButton
    Left = 113
    Top = 130
    Width = 100
    Height = 37
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = '&Retornar'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    OptionsImage.ImageIndex = 81
    OptionsImage.Images = FrmPDV_DModule.SmallImagesNew
    TabOrder = 5
    OnClick = btnVoltarClick
  end
  object cxButton1: TcxButton
    Left = 135
    Top = 79
    Width = 120
    Height = 34
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    Caption = 'Pesquisa Manual'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Silver'
    TabOrder = 6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = cxButton1Click
  end
  object cnWiBiDC: TFDConnection
    Params.Strings = (
      'Server=138.118.143.0\SQLEXPRESS,1597 '
      'User_Name=sa'
      'Database=ERPWibi'
      'Password=WiBiERP!@#_2013*'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 156
    Top = 4
  end
  object fdConexoesCli: TFDQuery
    Connection = cnWiBiDC
    SQL.Strings = (
      'SELECT  con.* ,'
      '        en.en_nome_completo'
      'FROM    sistema.tb_conexoes con ,'
      '        sistema.tb_conexoes_cli concl ,'
      '        vendas.tb_clientes cl ,'
      '        param.tb_entidades en'
      'WHERE   con.con_id = concl.con_id AND'
      '        concl.cl_id = cl.cl_id AND'
      '        cl.en_id = en.en_id AND'
      '        en.en_cnpjcpf = :en_cnpjcpf AND'
      '        con_pdv = :con_pdv')
    Left = 184
    Top = 28
    ParamData = <
      item
        Name = 'EN_CNPJCPF'
        ParamType = ptInput
      end
      item
        Name = 'CON_PDV'
        ParamType = ptInput
      end>
  end
  object XMLConfigDoc: TXMLDocument
    FileName = 'servers.xml'
    Left = 424
    Top = 152
    DOMVendorDesc = 'MSXML'
  end
  object cnLocalConfigDB: TFDConnection
    Params.Strings = (
      
        'Database=D:\Dropbox\WiBi\Projetos\Softwares\ERP\Fonte\MainApp\Wi' +
        'n32\Debug\config.widb'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 204
    Top = 16
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 468
    Top = 68
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
    Left = 412
    Top = 272
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 400
    Top = 68
  end
  object fdLicenca: TFDQuery
    Connection = cnWiBiDC
    Left = 432
    Top = 212
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
    Left = 400
    Top = 248
  end
end
