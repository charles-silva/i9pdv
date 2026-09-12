unit uFrmConfigConn;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlue, StdCtrls,
  uFrmDModule, dxSkinOffice2010Silver, cxControls, cxContainer, cxEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, xmldom, XMLIntf, FireDAC.Comp.UI, FireDAC.Phys.SQLite, msxmldom,
  XMLDoc, DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, cxMaskEdit, cxButtons,
  md5_2010, ExtCtrls, dxSkinCaramel, dxSkinDevExpressStyle, dxSkinWhiteprint,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Phys.SQLiteDef, WibiSkins;

type
  TServer = class
    Address: String;
    Port: Integer;
    Database: String;
    Descricao: String;
    UserName: String;
    Password: String;
    Default: Integer;
  end;

type
  TFrmConfigConn = class(TForm)
    btnConnect: TcxButton;
    btnVoltar: TcxButton;
    Label11: TLabel;
    edCNPJ: TcxMaskEdit;
    cxButton3: TcxButton;
    cnWiBiDC: TFDConnection;
    fdConexoesCli: TFDQuery;
    lblStatus: TLabel;
    XMLConfigDoc: TXMLDocument;
    cnLocalConfigDB: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    fdLocalConfig: TFDQuery;
    mem_sql_create1: TMemo;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    mem_sql_connect: TMemo;
    Bevel1: TBevel;
    mem_sql_licenca: TMemo;
    fdLicenca: TFDQuery;
    fdLocalLicenca: TFDQuery;
    procedure cxButton3Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FServers: array of TServer;
    function doConnectWiBiDC: Boolean;
    function doConnectConfigLocalDB: Boolean;
  public
    { Public declarations }
  end;

var
  FrmConfigConn: TFrmConfigConn;

const
  cKeyCrypt: Word = 22016;

implementation

{$R *.dfm}

uses uGlobalLibWiBi, uFrmLogin, uFrmMain;

procedure TFrmConfigConn.btnConnectClick(Sender: TObject);
var
  I: Integer;
begin
  if not doConnectConfigLocalDB then
    exit;
  try
    // cnLocalConfigDB.StartTransaction;
    fdLocalConfig.Open('select * from tb_conexoes');
    for I := Low(FServers) to High(FServers) do
    begin
      fdLocalConfig.Append;
      fdLocalConfig.FieldByName('Address').AsString      := Encrypt(FServers[I].Address);
      fdLocalConfig.FieldByName('Port').AsInteger        := FServers[I].Port;
      fdLocalConfig.FieldByName('Database').AsString     := Encrypt(FServers[I].Database);
      fdLocalConfig.FieldByName('Descricao').AsString    := FServers[I].Descricao;
      fdLocalConfig.FieldByName('UserName').AsString     := Encrypt(FServers[I].UserName);
      fdLocalConfig.FieldByName('Password').AsString     := Encrypt(FServers[I].Password);
      fdLocalConfig.FieldByName('con_default').AsInteger := FServers[I].Default;
      fdLocalConfig.Post;
    end;

    fdLocalLicenca.Open('select * from tb_licenca');
    fdLocalLicenca.Append;
    fdLocalLicenca.FieldByName('CNPJ').AsString := edCNPJ.Text;
    fdLocalLicenca.Post;

  finally
    // cnLocalConfigDB.Commit;
    cnLocalConfigDB.Connected := false;
    ModalResult               := mrOk;
  end;
end;

function TFrmConfigConn.doConnectWiBiDC: Boolean;
begin
  Result := false;
  try
    cnWiBiDC.Params.Clear;
    cnWiBiDC.Params.Add('Server=' + cDBServer);
    cnWiBiDC.Params.Add('User_Name=' + cUserDBWiBi);
    cnWiBiDC.Params.Add('Database=' + cDBWiBi);
    cnWiBiDC.Params.Add('Password=' + cDBPassWiBi);
    cnWiBiDC.Params.Add('DriverID=MSSQL');
    cnWiBiDC.Connected := true;
    Result             := cnWiBiDC.Connected;
  except
    on E: exception do
      MessageBox(handle, pchar('Erro ao conectar com servidor. ' + #13 + E.Message), 'I9 Mobile One', MB_ICONEXCLAMATION);
  end;
end;

procedure TFrmConfigConn.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      Perform(WM_NEXTDLGCTL, 0, 0);
    VK_ESCAPE:
      close;
  end;
end;

procedure TFrmConfigConn.FormShow(Sender: TObject);
begin
  edCNPJ.SetFocus;
end;

procedure TFrmConfigConn.btnVoltarClick(Sender: TObject);
begin
  close;
end;

function TFrmConfigConn.doConnectConfigLocalDB: Boolean;
begin
  Result := false;
  try
    cnLocalConfigDB.Params.Clear;
    cnLocalConfigDB.Params.Add('Database=' + ExtractFilePath(Application.ExeName) + 'config.widb');
    cnLocalConfigDB.Params.Add('DriverID=SQLite');
    cnLocalConfigDB.Connected := true;
    cnLocalConfigDB.ExecSQL(mem_sql_create1.Text);
    Result := cnLocalConfigDB.Connected;
  except
    on E: exception do
    begin
      MessageBox(handle, pchar('Erro ao acessar configurações locais' + #13 + E.Message), 'WiBi One', MB_ICONEXCLAMATION);
    end;
  end;
end;

procedure TFrmConfigConn.cxButton3Click(Sender: TObject);
var
  LSQL: string;
begin
  SetLength(FServers, 0);
  lblStatus.Caption := 'Conectando...';
  lblStatus.Repaint;
  if doConnectWiBiDC then
  begin
    lblStatus.Caption := 'Validando...';
    lblStatus.Repaint;
    LSQL := mem_sql_connect.Text;
    LSQL := StringReplace(LSQL, '@cnpj', QuotedStr(edCNPJ.Text), [rfReplaceAll]);
    // LSQL := StringReplace(LSQL, '@senha', QuotedStr(MD5String(edPassword.Text)), [rfReplaceAll]);
    fdConexoesCli.Open(LSQL);
    if not fdConexoesCli.IsEmpty then
    begin
      fdConexoesCli.First;
      while not fdConexoesCli.eof do
      begin
        SetLength(FServers, Length(FServers) + 1);
        FServers[high(FServers)] := TServer.Create;
        if fdConexoesCli.FieldByName('con_instancia').AsString <> '' then
          FServers[high(FServers)].Address := fdConexoesCli.FieldByName('con_servidor').AsString + '\' + fdConexoesCli.FieldByName('con_instancia').AsString
        else
          FServers[high(FServers)].Address := fdConexoesCli.FieldByName('con_servidor').AsString;

        FServers[high(FServers)].Port      := fdConexoesCli.FieldByName('con_port').AsInteger;
        FServers[high(FServers)].Database  := fdConexoesCli.FieldByName('con_database').AsString;
        FServers[high(FServers)].Descricao := fdConexoesCli.FieldByName('con_descricao').AsString;
        FServers[high(FServers)].UserName  := fdConexoesCli.FieldByName('con_username').AsString;
        FServers[high(FServers)].Password  := fdConexoesCli.FieldByName('con_password').AsString;
        if fdConexoesCli.FieldByName('con_default').AsBoolean then
          FServers[high(FServers)].Default := 1
        else
          FServers[high(FServers)].Default := 0;
        fdConexoesCli.Next;
      end;
      LSQL := mem_sql_licenca.Text;
      LSQL := StringReplace(LSQL, '@cnpj', QuotedStr(edCNPJ.Text), [rfReplaceAll]);
      fdLicenca.Open(LSQL);

      lblStatus.Caption    := 'Acesso liberado para : ' + fdConexoesCli.FieldByName('en_nome_completo').AsString;
      lblStatus.Font.Color := clBlue;
      btnConnect.Enabled   := true;
      btnConnect.SetFocus;
    end
    else
    begin
      lblStatus.Caption    := 'Acesso não permitido.';
      lblStatus.Font.Color := clRed;
    end;
  end;
end;

end.
