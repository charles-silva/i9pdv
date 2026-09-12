unit uFrmPDV_DModule;

interface

uses
  SysUtils, Windows, ShellApi, Forms, xmldom, XMLIntf, cxGraphics, DB, DBClient, ImgList, Controls,
  msxmldom, XMLDoc, Classes,
  MConnect, SConnect, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Async, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, AdvToolBar, AdvToolBarStylers, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  uWiFDQuery, FireDAC.Comp.UI, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  System.ImageList, Dialogs, uGlobalLibPDV, cxImageList;

type
  LoggedUser = record
    NickName: string;
    Name: string;
    UserId: string;
    MD5Password: string;
    LoggedTime: TDateTime;
    ProfileName: string;
    ProfileID: string;
    NomeCompletoColaborador: string;
    CPFColaborador: string;
    CargoPrincipal: string;
    FullAccess: string;
    Version: string;
    UserTicketID: Integer;
  end;

  POpenFormStruct = ^TOpenFormStruct;

  TOpenFormStruct = record
    FormPath: String;
    ClassName: String;
    ClassID: Integer;
    Imageidx: Integer;
    Key1: Integer;
    Key2: Integer;
  end;

type
  TFrmPDV_DModule = class(TDataModule)
    XMLConfigDoc: TXMLDocument;
    doConfig: TDataSource;
    DoEmpresa: TDataSource;
    DoIndex: TDataSource;
    SmallImagesNew: TcxImageList;
    ImagesNew: TcxImageList;
    doEmpresaLogo: TDataSource;
    ADConnection1: TFDConnection;
    ADGUIxWaitCursor1: TFDGUIxWaitCursor;
    ADGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog;
    cdsModules: TWiFDQuery;
    cdsConfig: TWiFDQuery;
    cdsSysMessages: TWiFDQuery;
    CdsIndex: TWiFDQuery;
    cdsEmpresaLogo: TWiFDQuery;
    adStoreProc1: TFDStoredProc;
    cdsEmpresa: TWiFDQuery;
    ADStoredProcSimatech1: TFDStoredProc;
    dsReportStore: TDataSource;
    CdsReportStore: TWiFDQuery;
    cnWiBiDC_WiBiControl: TFDConnection;
    adNewModules: TWiFDQuery;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    adMenus: TFDMemTable;
    fdVersions: TFDMemTable;
    fdVersionFiles: TFDMemTable;
    cdsSelect: TWiFDQuery;
    cnConnectionServer: TFDConnection;
    dsgeral: TDataSource;
    fdcgeral: TWiFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADConnection1AfterConnect(Sender: TObject);
    procedure cdsConfigAfterOpen(DataSet: TDataSet);
    procedure ADConnection1Error(ASender: TObject; const AInitiator: IFDStanObject; var AException: Exception);
    procedure ADConnection1Restored(Sender: TObject);
    procedure ADConnection1Recover(ASender, AInitiator: TObject; AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
  private
  public
    User     : LoggedUser;
    FCanClose: Boolean;
    procedure doRegisterLogin;
    function doConnectWiBiDC: Boolean;
    procedure doGetSysMessages;
  end;

var
  FrmPDV_DModule     : TFrmPDV_DModule;
  ServerDateTime     : TDateTime;
  ServerDate         : TDateTime;
  ServerTime         : TTime;
  ServerEmpresa      : Integer;
  ServerEmpresaDescr : String;
  ServerEmpresaCNPJ         : String;
  ServerColigada     : Integer;
  ServerColigadaDescr: String;
  MainHandle         : THandle;
  MasterControlBar   : Integer;
  MainApp            : TApplication;
  ConnectionName     : string;
  ConnectionAddress  : string;
  ConnectionWeb      : Boolean;
  NFeLiteMode        : Boolean;
  PortUpdate         : Integer;

function ExecuteCommandInMainApp(CommandID: Integer): Integer;
function ExecuteCommandInMainAppModal(CommandID: Integer): Integer;

const
  cServer: string      = '138.118.143.0';
  cServerPort: Integer = 3898;
  cDBServer: String    = '138.118.143.0,1598';
  cUserDBWiBi: String  = 'wibiadmin';
  cDBWiBi: String      = 'WiBiControl';
  cDBPassWiBi: String  = 'WiBi!@#_2017_$%^';
  cURLVersion: String  = 'http://www.wibitecnologia.com.br/download/WiBiERP/WiBi74Setup.exe';

implementation

{$R *.dfm}

// {$R dev-ptbr.res}

function TFrmPDV_DModule.doConnectWiBiDC: Boolean;
begin
  Result := false;
  try
    with FrmPDV_DModule do
    begin
      if not cnWiBiDC_WiBiControl.Connected then
      begin
        cnWiBiDC_WiBiControl.Params.Clear;
        cnWiBiDC_WiBiControl.Params.Add('Server=' + cDBServer);
        cnWiBiDC_WiBiControl.Params.Add('User_Name=' + cUserDBWiBi);
        cnWiBiDC_WiBiControl.Params.Add('Database=' + cDBWiBi);
        cnWiBiDC_WiBiControl.Params.Add('Password=' + cDBPassWiBi);
        cnWiBiDC_WiBiControl.Params.Add('DriverID=MSSQL');
        cnWiBiDC_WiBiControl.Connected := true;
      end;
      Result := cnWiBiDC_WiBiControl.Connected;
    end;
  except
    // on E: Exception do
    // MessageBox(Handle, pChar('Erro ao conectar com servidor da . ' + #13 + E.Message), ' One', MB_ICONEXCLAMATION);
  end;
end;

procedure TFrmPDV_DModule.doGetSysMessages;
var
  LErrors: TList;
begin
  LErrors := cdsEmpresa.GetSysMessages(false);
  if LErrors.Count > 0 then
    if TErrorLog(LErrors.Items[0]).error_code = 50000 then
      raise EWiBiInfoException.Create(TErrorLog(LErrors.Items[0]).error_message);

end;

function ExecuteCommandInMainApp(CommandID: Integer): Integer;
begin
  Result := SendMessage(MainHandle, SIM_MSGID, CommandID, 0);
end;

function ExecuteCommandInMainAppModal(CommandID: Integer): Integer;
begin
  Result := SendMessage(MainHandle, SIM_MSGID, CommandID, 2);
end;

procedure TFrmPDV_DModule.ADConnection1AfterConnect(Sender: TObject);
begin
  doRegisterLogin;
end;

procedure TFrmPDV_DModule.ADConnection1Error(ASender: TObject; const AInitiator: IFDStanObject; var AException: Exception);
begin
  doGetSysMessages;
end;

procedure TFrmPDV_DModule.ADConnection1Recover(ASender, AInitiator: TObject; AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
var
  iRes: Integer;
begin
  iRes := MessageDlg('A Conexão com o servidor foi perdida. Clique OK para tentar conectar novamente.', mtConfirmation, [mbOK, mbCancel], 0);
  case iRes of
    mrOk:
      AAction := faRetry;
    mrCancel:
      begin
        AAction := faFail;
        //UnLoadApp;
      end;
  end;
end;

procedure TFrmPDV_DModule.ADConnection1Restored(Sender: TObject);
var
  I: Integer;
begin
  doRegisterLogin;
  for I := 0 to ADConnection1.DataSetCount - 1 do
    if ADConnection1.DataSets[I].Active then
      ADConnection1.DataSets[I].Resync([rmExact]);
end;

procedure TFrmPDV_DModule.cdsConfigAfterOpen(DataSet: TDataSet);
begin
  PortUpdate := cdsConfig.FieldByName('c_portupdate').AsInteger;
end;

procedure TFrmPDV_DModule.DataModuleCreate(Sender: TObject);
begin
  FrmPDV_DModule                     := self;
  ADConnection1.TxOptions.AutoCommit := true;
  ADConnection1.TxOptions.AutoStart  := true;
  ADConnection1.TxOptions.AutoStop   := true;
  // CdsReportStore.Open;
end;


// procedure TFrmDModule.OpenConnection;
// var
// FNode: IXMLNode;
// I: Integer;
// LHost, LLogin, LPassword, LDatabase: OleVariant;
// begin
// try
// try
// XMLConfigDoc.Active := True;
// if XMLConfigDoc.DocumentElement = nil then
// begin
// Application.MessageBox('Erro no arquivo de configuração de conexão!', 'WiBi', MB_ICONERROR);
// // SendMessage(MainHandle, SIM_GENERIC, Integer(gtUnloadApp), 0);
// end;
//
// FNode := XMLConfigDoc.DocumentElement.ChildNodes.FindNode('address');
// if FNode <> nil then
// begin
// SocketConnection.Address := FNode.Text;
// ConnectionAddress := FNode.Text;
// end;
// FNode := XMLConfigDoc.DocumentElement.ChildNodes.FindNode('host');
// if FNode <> nil then
// SocketConnection.Host := FNode.Text;
// FNode := XMLConfigDoc.DocumentElement.ChildNodes.FindNode('port');
// if FNode <> nil then
// SocketConnection.port := StrToIntDef(FNode.Text, 0);
// SocketConnection.ServerGUID := '';
// // if FNode <> nil then
// // SocketConnection.ServerName := FNode.Text
// // else
// SocketConnection.ServerName := 'SimERP6ServerApp.cSimERP6ServerApp';
// FNode := XMLConfigDoc.DocumentElement.ChildNodes.FindNode('Descricao');
// if FNode <> nil then
// ConnectionName := FNode.Text;
// FNode := XMLConfigDoc.DocumentElement.ChildNodes.FindNode('OnLine');
// if FNode <> nil then
// ConnectionWeb := (FNode.Text = '1');
//
// finally
// XMLConfigDoc.Active := false;
// end;
//
// try
// SocketConnection.Open;
// SocketConnection.AppServer.GetConnectionParams(LHost, LLogin, LPassword, LDatabase);
// LLogin := GetFieldInString(LLogin + '=', 2, '=');
// LDatabase := GetFieldInString(LDatabase + '=', 2, '=');
// LHost := GetFieldInString(LHost + '=', 2, '=');
// LPassword := GetFieldInString(LPassword + '=', 2, '=');
//
// // LConnectionString :=
// // 'Provider=SQLNCLI10.1;Integrated Security="";Persist Security Info=False;User ID=@user;Initial Catalog=@database;Data Source=@host;Initial File Name="";Server SPN="";';
// // LConnectionString := StringReplace(LConnectionString, '@user', LLogin, [rfReplaceAll]);
// // LConnectionString := StringReplace(LConnectionString, '@database', LDatabase, [rfReplaceAll]);
// // LConnectionString := StringReplace(LConnectionString, '@host', LHost, [rfReplaceAll]);
// // // ADOConnection.ConnectionString := LConnectionString;
// // // ADOConnection.Open(GetFieldInString(LLogin + '=', 2, '='), GetFieldInString(LPassword + '=', 2, '='));
// //
// //
//
// except
// on E: Exception do
// begin
// FCanClose := True;
// for I := FrmPDV_DModule.SocketConnection.DataSetCount - 1 downto 0 do
// begin
// FrmPDV_DModule.SocketConnection.DataSets[I].Close;
// FrmPDV_DModule.SocketConnection.DataSets[I].Destroy;
// end;
// FrmPDV_DModule.SocketConnection.Close;
// FrmPDV_DModule.SocketConnection.Destroy;
// Application.MessageBox
// (pChar('Erro ao conectar com o servidor. ' + #13 + 'Verifique sua configuração de rede ou contate o suporte.' + #13 + #13 + E.Message),
// 'Servidor não encontrado', MB_ICONSTOP);
// SendMessage(MainHandle, SIM_GENERIC, Integer(gtUnloadApp), 0);
// if FileExists(ExtractFilePath(Application.exename) + 'WiBi.exe') then
// ShellExecute(MainHandle, 'open', 'WiBi.exe', 'Config', '', SW_SHOWNORMAL);
// // WinExec(pAnsiChar(AnsiString(ExtractFilePath(Application.exename)) + 'WiBi.exe'), SW_SHOW);
// raise ;
// end;
// end;
//
// cdsConfig.Active := True;
//
// except
// on E: Exception do
// begin
// Application.MessageBox(pChar(E.Message), 'Erro ao iniciar sistema', MB_ICONSTOP);
// SendMessage(MainHandle, SIM_GENERIC, Integer(gtUnloadApp), 0);
// end;
//
// end;
// end;

procedure TFrmPDV_DModule.doRegisterLogin;
var
  aHostName, aIPAddress: String;
begin
  if StrToIntDef(User.UserId, 0) = 0 then
    exit;

  with FrmPDV_DModule do
  begin
    adStoreProc1.StoredProcName := 'proc_input_log_tmp';
    adStoreProc1.SchemaName     := 'dbo';
    adStoreProc1.Prepare;
    uGlobalLibPDV.GetIPAddress(aHostName, aIPAddress);
    adStoreProc1.Params.ParamByName('@us_codigo').AsInteger := StrToIntDef(FrmPDV_DModule.User.UserId, 0);
    adStoreProc1.Params.ParamByName('@log_IPAddress').AsString := aIPAddress;
    adStoreProc1.Params.ParamByName('@log_HostName').AsString := aHostName;
    adStoreProc1.Params.ParamByName('@log_version').AsString := User.Version;
    adStoreProc1.execProc;
  end;
end;

end.
