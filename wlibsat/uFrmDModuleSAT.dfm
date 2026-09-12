object FrmDModuleNFCe: TFrmDModuleNFCe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 597
  Width = 714
  object XMLConfigDoc: TXMLDocument
    FileName = 'ConnectConfig.xml'
    Left = 176
    Top = 16
    DOMVendorDesc = 'MSXML'
  end
  object ADConnection1: TFDConnection
    ConnectionName = 'SimERPConn'
    Params.Strings = (
      'Server=localhost,1597'
      'Database=WiBiERP_71'
      'User_Name=sa'
      'Password=1'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvCmdExecMode, rvAutoReconnect, rvSilentMode]
    ResourceOptions.SilentMode = True
    ResourceOptions.AutoReconnect = True
    UpdateOptions.AssignedValues = [uvCheckReadOnly]
    UpdateOptions.CheckReadOnly = False
    TxOptions.AutoStart = False
    TxOptions.AutoStop = False
    LoginPrompt = False
    OnRestored = ADConnection1Restored
    Left = 108
    Top = 220
  end
  object ADGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 384
    Top = 92
  end
  object ADGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog
    Provider = 'Forms'
    Caption = 'Filtrando...'
    Prompt = 'Por favor aguarde...'
    Left = 536
    Top = 88
  end
  object adStoreProc1: TFDStoredProc
    Connection = ADConnection1
    Left = 448
    Top = 20
  end
  object cdsSelect: TWiFDQuery
    Connection = ADConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'SELECT * FROM sistema.tb_modulos WHERE md_ativo=1')
    CustomDelete = False
    MsgBeforeDelete = 'Confirmar exclus'#227'o do registro?'
    MsgTitleBeforeDelete = 'Confirma'#231#227'o'
    ShowMsgBeforeDelete = True
    ReadOnly = False
    Left = 104
    Top = 300
  end
  object DoEmpresa: TDataSource
    AutoEdit = False
    DataSet = cdsEmpresa
    Left = 56
    Top = 128
  end
  object cdsEmpresa: TWiFDQuery
    Connection = ADConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvCheckRequired]
    UpdateOptions.CheckRequired = False
    SQL.Strings = (
      'select * from v_empresa')
    CustomDelete = False
    ShowMsgBeforeDelete = False
    ReadOnly = False
    Left = 60
    Top = 76
  end
end
