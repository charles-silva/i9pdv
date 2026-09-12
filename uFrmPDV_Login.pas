unit uFrmPDV_Login;

interface

uses
  Windows, Forms,
  Messages, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, xmldom, XMLIntf,
  msxmldom, XMLDoc, cxMaskEdit, cxDropDownEdit, cxImageComboBox, StdCtrls, cxButtons, Controls, cxTextEdit, ExtCtrls,
  AdvCircularProgress, AdvWiiProgressBar, dxGDIPlusClasses, Classes, SysUtils,
  Dialogs, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, WideStrings, DBXMsSQL, SqlExpr,
  cxProgressBar, DBClient, ComCtrls, Graphics,
  ShellAPI, jpeg, ACBrNFe, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, md5_2010, dxSkinsCore, dxSkinBlue,
  dxSkinCaramel, dxSkiniMaginary, dxSkinMoneyTwins, dxSkinOffice2010Silver,
  dxSkinWhiteprint, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  FireDAC.DApt, uWiThread2, cxDBEdit, cxCheckBox,
  FireDAC.Comp.ScriptCommands, FireDAC.Comp.Script, Grids, DBGrids,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, uWiEventsForm, WibiSkins, STRUTILS,
  FireDAC.Phys.SQLiteWrapper.Stat, Vcl.Mask, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, cxImage, System.ImageList, Vcl.ImgList,
  cxImageList, Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TFrmPDV_Login = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    XMLDocument1: TXMLDocument;
    cnLocalConfigDB: TFDConnection;
    adConnections: TFDQuery;
    adSelects: TFDQuery;
    adLicenca: TFDQuery;
    adVersion: TFDQuery;
    adLicencaMem: TFDMemTable;
    adConnectionsMem: TFDMemTable;
    adSelectsWiBi: TFDQuery;
    imgLogo: TImage;
    WiEventsForm1: TWiEventsForm;
    Shape1: TShape;
    Shape16: TShape;
    Shape27: TShape;
    us_senha: TcxTextEdit;
    btnEntrar: TcxButton;
    lblEditaConn: TLabel;
    adSelectsCodigo: TFDQuery;
    adSelectsApelido: TFDQuery;
    L1: TListBox;
    Panel1: TPanel;
    edtUsuario: TLabeledEdit;
    edtSenha: TLabeledEdit;
    edtcSenha: TLabeledEdit;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    FDQ1: TFDQuery;
    DS1: TDataSource;
    fdphysmsqldrvrlnk1: TFDPhysMSSQLDriverLink;
    Shape2: TShape;
    us_nome: TcxTextEdit;
    Shape3: TShape;
    lblversion: TLabel;
    cxImageList1: TcxImageList;
    SpeedButton1: TSpeedButton;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure us_senhaPropertiesChange(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lblEditaConnClick(Sender: TObject);
    procedure Label2DblClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure doLoad;
    function doConnectConfigLocalDB: Boolean;
    function doConfigConn: Boolean;
    function doLogin: Boolean;
    procedure doOpenPDV;
    procedure CreateFlatRoundRgn;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
  end;

var
  FrmPDV_Login: TFrmPDV_Login;
  vtexto      : string;

implementation

uses
  uFrmPDV_DModule,
  uFrmPDV_Splash, uFrmPDV, uFrmConfig_Connection, uGlobalLibPDV, uFrmPDV_Login_DefineSenha;

{$R *.dfm}

procedure TFrmPDV_Login.doOpenPDV;
begin
  FrmPDV := TFrmPDV.create(application);
  FrmPDV.Show;
  FrmPDV.edtcodusuario.text := edtUsuario.text; // adSelects.FieldByName('us_codigo').AsString;
  FrmPDV.Top                := 0;
  FrmPDV.Left               := 0;
end;

procedure TFrmPDV_Login.btnEntrarClick(Sender: TObject);
begin
  doLogin;
end;

procedure TFrmPDV_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Assigned(FrmPDV) then
    application.Terminate;

end;

procedure TFrmPDV_Login.FormCreate(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  BorderStyle := bsNone;
  CreateFlatRoundRgn;
end;

procedure TFrmPDV_Login.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      if us_nome.Focused then
        close;
  end;
end;

procedure TFrmPDV_Login.FormShow(Sender: TObject);
begin
  // vtexto:=FrmPDV.Campo_Configuracao('Expiraem');
  // vtexto:=TFrmPDV.DesCriptografar(vtexto,4568);
  // ShowMessage(FrmPDV.Campo_Configuracao('Expiraem'));

  doLoad;

end;

procedure TFrmPDV_Login.Label2Click(Sender: TObject);
begin
  if us_nome.text <> 'I9PDV' then
    Exit;

  Panel1.Visible    := True;
  btnEntrar.Visible := false;
  Panel1.Align      := alClient;
end;

procedure TFrmPDV_Login.Label2DblClick(Sender: TObject);
begin
  ShowMessage(MD5String(us_senha.text));
end;

procedure TFrmPDV_Login.lblEditaConnClick(Sender: TObject);
begin
  ShowMessage(MD5String(us_senha.text));
  Exit;
  doConfigConn;
  doLoad;
end;

procedure TFrmPDV_Login.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure TFrmPDV_Login.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmPDV_Login.us_senhaPropertiesChange(Sender: TObject);
begin
  btnEntrar.Default := ((us_nome.text <> '') and (us_senha.text <> ''));
end;

procedure ExcludeRectRgn(var Rgn: HRGN; LeftRect, TopRect, RightRect, BottomRect: Integer);
var
  RgnEx: HRGN;
begin
  RgnEx := CreateRectRgn(LeftRect, TopRect, RightRect, BottomRect);
  CombineRgn(Rgn, Rgn, RgnEx, RGN_OR);
  DeleteObject(RgnEx);
end;

procedure TFrmPDV_Login.CreateFlatRoundRgn;
const
  CORNER_SIZE = 6;
var
  Rgn: HRGN;
begin
  with BoundsRect do
  begin
    Rgn := CreateRoundRectRgn(0, 0, Right - Left + 1, Bottom - Top + 1, CORNER_SIZE, CORNER_SIZE);
    // exclude left-bottom corner
    // ExcludeRectRgn(Rgn, 0, Bottom - Top - CORNER_SIZE div 2, CORNER_SIZE div 2, Bottom - Top + 1);
    // exclude right-bottom corner
    // ExcludeRectRgn(Rgn, Right - Left - CORNER_SIZE div 2, Bottom - Top - CORNER_SIZE div 2, Right - Left, Bottom - Top);
  end;
  // the operating system owns the region, delete the Rgn only SetWindowRgn fails
  if SetWindowRgn(handle, Rgn, True) = 0 then
    DeleteObject(Rgn);

end;

procedure TFrmPDV_Login.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style             := WS_POPUP;
    WindowClass.Style := WindowClass.Style or CS_DROPSHADOW;
  end;

end;

procedure TFrmPDV_Login.cxButton1Click(Sender: TObject);
var
  MyClass: TComponent;
begin
  if (Trim(edtUsuario.text) = '') or (Trim(edtSenha.text) = '') or (Trim(edtcSenha.text) = '') then
  begin
    ShowMessage('Todos os campos são obrigotios');
    Exit;
  end;
  if Trim(edtSenha.text) <> Trim(edtcSenha.text) then
  begin
    ShowMessage('As senha não confirmam');
    Exit;
  end;

  with FrmPDV_DModule.ADConnection1 do
  begin
    Params.Clear;
    L1.Clear;
    L1.Items.LoadFromFile(ExtractFilePath(application.ExeName) + 'I9PDVINI.EMS');
    // ShowMessage(L1.Items.Text);
    with FrmPDV_DModule.ADConnection1 do
    begin
      Params.Add('DriverID=MSSQL');
      Params.Add('Server=' + splitString(L1.Items[0], '|')[3]);
      // + (adConnectionsMem.FieldByName('Address').AsString));// + ',' + .('').);
      Params.Add('Database=' + splitString(L1.Items[0], '|')[0]);
      // + (adConnectionsMem.FieldByName('database').AsString));
      Params.Add('User_Name=' + splitString(L1.Items[0], '|')[1]);
      // + (adConnectionsMem.FieldByName('username').AsString));
      Params.Add('Password=' + splitString(L1.Items[0], '|')[2]);
      // + (adConnectionsMem.FieldByName('password').AsString));
      Params.Add('ExtendedMetaData=True');
      Connected := True;
    end;
  end;

  with FDQ1 DO
  begin
    close;
    SQL.Clear;
    SQL.text        := 'select us_codigo,us_nome,us_apelido,us_senha  from  t_users WHERE US_NOME = :V0 ';
    Params[0].Value := Trim(edtUsuario.text);
    Open;
  end;
  if FDQ1.RecordCount > 0 then
  begin
    ShowMessage('Usuario já cadastrado na base de dado. Tente Outro');
    Exit;
  end;
  try
    with FDQ1 DO
    begin
      close;
      SQL.Clear;
      SQL.text        := 'exec P_PDV_CRIAUSUARIO :V0, :v1 ';
      Params[0].Value := Trim(edtUsuario.text);
      Params[1].Value := MD5String(edtSenha.text);
      execsql;
    end;
  except
  end;
  ShowMessage('Usuario ' + edtUsuario.text + ' Gravado com sucesso ');
  edtSenha.text   := '';
  edtUsuario.text := '';
  edtcSenha.text  := '';
  // USUARIO SENHA
end;

procedure TFrmPDV_Login.cxButton2Click(Sender: TObject);
begin
  Panel1.Visible    := false;
  btnEntrar.Visible := True;
end;

function TFrmPDV_Login.doConfigConn: Boolean;
begin
  {
    result                    := false;
    cnLocalConfigDB.Connected := false;
    FrmConfig_Connection      := TFrmConfig_Connection.create(self);
    try
    if FrmConfig_Connection.ShowModal = mrok then
    begin
    doLoad;
    result := true;
    end;
    finally
    FrmConfig_Connection.Release;
    FrmConfig_Connection := nil;
    end;
  }
end;

procedure TFrmPDV_Login.doLoad;
// var
// loItem: TcxImageComboBoxItem;
begin
  try
    if doConnectConfigLocalDB then
    begin
      adConnections.Open('select * from tb_conexoes');
      if adConnections.IsEmpty then
        if not doConfigConn then
          Exit;
      if adConnectionsMem.Active then
        adConnectionsMem.EmptyDataSet;
      adConnectionsMem.close;
      adConnectionsMem.Data := adConnections.Data;
    end
    else if not doConfigConn then
      Exit;

    if not cnLocalConfigDB.Connected then
      doConnectConfigLocalDB;

    // cbConexao.Properties.Items.Clear;
    // cbConexao.Properties.Items.BeginUpdate;
    // adConnections.First;
    // while not adConnections.Eof do
    // begin
    // loItem             := cbConexao.Properties.Items.Add;
    // loItem.Description := adConnections.FieldByName('Descricao').AsString;
    // loItem.Value       := adConnections.FieldByName('ID').AsInteger;
    // loItem.ImageIndex  := 215;
    // adConnections.Next;
    // end;
    // cbConexao.Properties.Items.EndUpdate;

    adConnections.First;
    while not adConnections.Eof do
    begin
      if adConnections.FieldByName('con_default').AsInteger = 1 then
      begin
        // cbConexao.EditValue := adConnections.FieldByName('ID').AsInteger;
        // us_nome.Text        := adConnections.FieldByName('LoginCache').AsString;
        // if us_nome.Text <> '' then
        // begin
        // ckRememberUser.Checked := true;
        // us_senha.SetFocus;
        // end;
        break;
      end;
      adConnections.Next;
    end;

    adLicenca.Open('select * from tb_licenca');
    if adLicencaMem.Active then
      adLicencaMem.EmptyDataSet;
    adLicencaMem.close;
    adLicencaMem.Data := adLicenca.Data;
  finally
    cnLocalConfigDB.Connected := false;
  end;

end;

function TFrmPDV_Login.doConnectConfigLocalDB: Boolean;
begin
  result := false;
  try
    if not FileExists(ExtractFilePath(application.ExeName) + 'config.db') then
      Exit;
    cnLocalConfigDB.Params.Clear;
    cnLocalConfigDB.Params.Add('Database=' + ExtractFilePath(application.ExeName) + 'config.db');
    cnLocalConfigDB.Params.Add('DriverID=SQLite');
    cnLocalConfigDB.Connected := True;
    result                    := cnLocalConfigDB.Connected;
  except
    on E: exception do
    begin
      MessageBox(handle, pchar('Erro ao acessar configurações locais' + #13 + E.Message), 'I9 PDV', MB_ICONEXCLAMATION);
    end;
  end;
end;

function TFrmPDV_Login.doLogin: Boolean;
begin
  result := false;
  try
    btnEntrar.Enabled := false;
    btnEntrar.Caption := 'Entrando...';
    us_nome.Enabled   := false;
    us_senha.Enabled  := false;
    // ConnectionAddress := GetFieldInString(Decrypt(adConnectionsMem.FieldByName('Address').AsString), 1, '\');
    with FrmPDV_DModule.ADConnection1 do
    begin
      Params.Clear;
      // Params.Add('DriverID=MSSQL');
      // Params.Add('Server=SERVIDOR'); // + (adConnectionsMem.FieldByName('Address').AsString));// + ',' + .('').);
      // Params.Add('Database=I9PDV'); // + (adConnectionsMem.FieldByName('database').AsString));
      // Params.Add('User_Name=sa'); // + (adConnectionsMem.FieldByName('username').AsString));
      // Params.Add('Password=em150700@'); // + (adConnectionsMem.FieldByName('password').AsString));
      // Params.Add('ExtendedMetaData=True');

      try
        // showmessage((ExtractFilePath(Application.ExeName) + 'I9PDVINI.EMS'));
        if not FileExists(ExtractFilePath(application.ExeName) + 'I9PDVINI.EMS') THEN
        begin
          ShowMessage('Arquivo do SERVIDOR nao encontrado nao podera iniciar o servico');
          application.Terminate;
        end;
        L1.Clear;
        L1.Items.LoadFromFile(ExtractFilePath(application.ExeName) + 'I9PDVINI.EMS');
        with FrmPDV_DModule.ADConnection1 do
        begin
          // Params.Values['Database']  := splitString(l1.Items[0],'|')[0];
          // Params.Values['User_name'] := splitString(l1.Items[0],'|')[1];
          // Params.Values['Password']  := splitString(l1.Items[0],'|')[2];
          // Params.Values['Server']    := splitString(l1.Items[0],'|')[3];
          Connected := false;
          Params.Clear;
          Params.Add('DriverID=MSSQL');
          Params.Add('Server=' + splitString(L1.Items[0], '|')[3]);
          // + (adConnectionsMem.FieldByName('Address').AsString));// + ',' + .('').);
          Params.Add('Database=' + splitString(L1.Items[0], '|')[0]);
          // + (adConnectionsMem.FieldByName('database').AsString));
          Params.Add('User_Name=' + splitString(L1.Items[0], '|')[1]);
          // + (adConnectionsMem.FieldByName('username').AsString));
          Params.Add('Password=' + splitString(L1.Items[0], '|')[2]);
          // + (adConnectionsMem.FieldByName('password').AsString));

          Params.Add('OSAuthent=No');

          Connected := True;
        end;
      except
        on E: exception do
        begin
          ShowMessage('Ocorreu uma Falha na configuração !' + #13 + 'BD ' + splitString(L1.Items[0], '|')[0] + #13 +
            'USUARIO ' + splitString(L1.Items[0], '|')[1] + #13 + 'PASSOWRD ' + splitString(L1.Items[0], '|')[2] + #13 +
            'SERVIDOR ' + splitString(L1.Items[0], '|')[3] + #13 + E.Message);
          application.Terminate;
        end;
      end;

      if FrmPDV_DModule.ADConnection1.Connected then
      begin
        if (uGlobalLibPDV.OnlyAlpha(us_nome.text) = '') then
        begin
          adSelects.SQL.text                           := adSelectsCodigo.SQL.text;
          adSelects.ParamByName('us_codigo').AsInteger := StrToIntDef(us_nome.text, 0);
        end
        else
        begin
          adSelects.SQL.text                           := adSelectsApelido.SQL.text;
          adSelects.ParamByName('us_apelido').AsString := us_nome.text;
        end;
        adSelects.Active := True;
        adSelects.NextRecordSet;
        if adSelects.IsEmpty then
        begin
          FrmPDV_DModule.ADConnection1.Connected := false;
          raise exception.CreateHelp('Usuário não encontrado', 1);
          Exit;
        end;
        if adSelects.FieldByName('us_ativo').AsInteger = 0 then
        begin
          FrmPDV_DModule.ADConnection1.Connected := false;
          raise exception.CreateHelp('Usuário desativado', 2);
          Exit;
        end;
        if adSelects.FieldByName('us_senha').AsString = '' then
        begin
          FrmPDV_Login_DefineSenha             := TFrmPDV_Login_DefineSenha.create(self);
          FrmPDV_Login_DefineSenha.Fus_apelido := us_nome.text; // Erimar Feijo
          try
            if FrmPDV_Login_DefineSenha.ShowModal = mrok then
            begin
              FrmPDV_DModule.ADConnection1.Connected := false;
              us_senha.text                          := FrmPDV_Login_DefineSenha.cxPass1.text;
              doLogin;
              Exit;
            end;
          finally
            FrmPDV_Login_DefineSenha.Release;
            FrmPDV_Login_DefineSenha := nil;
          end;
        end; //
        if MD5String(us_senha.text) <> adSelects.FieldByName('us_senha').AsString then
        begin
          FrmPDV_DModule.ADConnection1.Connected := false;
          raise exception.CreateHelp('Senha incorreta', 3);
          Exit;
        end;
        // FrmPDV.vcodusuario:=adSelects.FieldByName('us_codigo').AsString;
        FrmPDV_DModule.Tag               := adSelects.FieldByName('us_codigo').Value;
        edtUsuario.text                  := adSelects.FieldByName('us_codigo').AsString;
        FrmPDV_DModule.User.NickName     := adSelects.FieldByName('us_apelido').AsString;
        FrmPDV_DModule.User.Name         := adSelects.FieldByName('us_nome').AsString;
        FrmPDV_DModule.User.UserId       := adSelects.FieldByName('us_codigo').AsString;
        FrmPDV_DModule.User.MD5Password  := adSelects.FieldByName('us_senha').AsString;
        FrmPDV_DModule.User.ProfileName  := adSelects.FieldByName('gu_nome').AsString;
        FrmPDV_DModule.User.ProfileID    := adSelects.FieldByName('gu_codigo').AsString;
        FrmPDV_DModule.User.FullAccess   := adSelects.FieldByName('us_full_access').AsString;
        FrmPDV_DModule.User.Version      := cVersion;
        FrmPDV_DModule.User.UserTicketID := adSelects.FieldByName('ps_id').AsInteger;
        // CurrentVersion := adLicenca.FieldByName('versao').AsString;
        // goCNPJ := adLicencaMem.FieldByName('CNPJ').AsString;
{$ENDREGION}
        adSelects.NextRecordSet;
        { Segundo recordset [menus do usuário] }
        // FrmMain.cdsUsersMenus.Data := adSelects.Data;
        // LoadMenuAccess;
        adSelects.NextRecordSet;
        { Terceiro recordset [data e empresa padrão] }
        ServerDateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy/ hh:nn:ss', adSelects.FieldByName('ServerDate')
          .AsDateTime));
        ServerDate    := StrToDateTime(FormatDateTime('dd/mm/yyyy', adSelects.FieldByName('ServerDate').AsDateTime));
        ServerTime    := StrToDateTime(FormatDateTime('hh:mm:ss', adSelects.FieldByName('ServerDate').AsDateTime));
        ServerEmpresa := adSelects.FieldByName('em_codigo').AsInteger;
        ServerEmpresaCNPJ := adSelects.FieldByName('em_cnpj').AsString;
        if ServerEmpresa = 0 then
        begin
          raise exception.create('Nenhuma empresa identificada para este usuário');
          Exit;
        end;

        FrmPDV_DModule.cdsEmpresa.Open
          ('SELECT a.* FROM v_empresa a, t_users_empresas b WHERE a.em_codigo =b.em_codigo AND b.us_codigo = ' +
          FrmPDV_DModule.User.UserId);
        // ShowMessage( FrmPDV_DModule.cdsEmpresa.FieldByName('em_csc').AsString);
        if FrmPDV_DModule.cdsEmpresa.IsEmpty then
        begin
          raise exception.CreateHelp('Nenhuma empresa identificada para este usuário.', 4);
          Exit;
        end;

        FrmPDV_DModule.cdsEmpresaLogo.Open('SELECT * FROM dbo.t_empresa_logo where em_codigo = ' +
          IntToStr(ServerEmpresa));
        if FrmPDV_DModule.cdsEmpresa.Locate('em_codigo', IntToStr(ServerEmpresa), [loCaseInsensitive]) then
          ServerEmpresaDescr := FrmPDV_DModule.cdsEmpresa.FieldByName('em_fantasia').AsString;
        // FrmMain.cbEmpresa.EditValue    := ServerEmpresa;
        FrmPDV_DModule.cdsConfig.Active := True;
        FrmPDV_DModule.doRegisterLogin;
{$REGION 'Efetua login'}
        // doPostCacheLogin;
        hide;
        adSelects.NextRecordSet;
        // if (adSelects.FieldByName('_operador_caixa').AsInteger = 1) then
        doOpenPDV;
        result := True;
{$ENDREGION} end;
    end;
  except
    on E: exception do
    begin
      MessageBox(handle, pchar(E.Message), 'I9 PDV', MB_ICONEXCLAMATION);
      btnEntrar.Enabled := True;
      btnEntrar.Caption := 'Entrar';
      us_nome.Enabled   := True;
      us_senha.Enabled  := True;

      case E.HelpContext of
        1, 2, 4:
          begin
            us_nome.SetFocus;
            us_nome.SelectAll;
          end;
        3:
          begin
            us_senha.SetFocus;
            us_senha.SelectAll;
          end;
      end;
    end;
  end;
end;

end.
