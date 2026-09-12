unit uFrmPDV_Sync;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.BatchMove.DataSet, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.BatchMove, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins, cxTextEdit, cxMemo,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script, cxProgressBar,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle;

type
  TTipoSentenca = (tpInsert, tpUpdate, tpDelete);

  TFrmPDV_Sync = class(TForm)
    Shape16: TShape;
    Label38: TLabel;
    Shape27: TShape;
    lblStatus: TLabel;
    Timer1: TTimer;
    dsTableServer: TFDQuery;
    dsTableLocal: TFDQuery;
    dsSyncTables: TFDQuery;
    dsConfigSyncServer: TFDQuery;
    FDScript1: TFDScript;
    cxProgressBar1: TcxProgressBar;
    FDScript2: TFDScript;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    function doReadTables(aTableName, aKeyName, aTableDescr: String; aIdentity: Boolean): Boolean;
    procedure doStartSync;
    function doGetValueByType(aField: TField): String;
    procedure doConfigSyncServer;
    procedure doBuildValues(var aLocalTable, aServerTable: TFDQuery; var aValues: String; aTipoSentenca: TTipoSentenca);
    { Private declarations }
  public
    goPterm_id: String;
  end;

var
  FrmPDV_Sync: TFrmPDV_Sync;

  // PRINT 'Tabela de natureza da operação';
  // PRINT 'Tabela de CFOP';
  // PRINT 'Tabela de CFOP Inverso';
  // PRINT 'Tabela de enquadramento legal do IPI';
  // PRINT 'Tabela de situação tributária';
  // PRINT 'Tabela de operações fiscais';
  // PRINT 'Tabela de empresas';
  // PRINT 'Tabela de plano de contas';
  // PRINT 'Tabela de parametrização';
  // PRINT 'Tabela de formas de pagamento';
  // PRINT 'Tabela de classificação de produtos';
  // PRINT 'Tabela de produtos';
  // PRINT 'Tabela de produtos detalhes';
  // PRINT 'Tabela de flexibilidade';
  // PRINT 'Tabela de unidades de produtos';
  // PRINT 'Tabela de operações fiscais de produtos';
  // PRINT 'Tabela de tipos';
  // PRINT 'Tabela de unidades';
  // PRINT 'Tabela de usuários';
  // PRINT 'Tabela de teclas';

implementation

{$R *.dfm}

uses uFrmPDV_DModule, uGlobalLibPDV, uFrmPDV;

procedure TFrmPDV_Sync.doConfigSyncServer;
begin
  dsConfigSyncServer.Open('select * from pdv.tb_config_syncserver');
  with FrmPDV_DModule.cnConnectionServer do
  begin
    Params.Clear;
    Params.Add('DriverID=MSSQL');
    Params.Add('Server=' + dsConfigSyncServer.FieldByName('psync_servidor').AsString + ',' + dsConfigSyncServer.FieldByName('psync_port').AsString);
    Params.Add('Database=' + dsConfigSyncServer.FieldByName('psync_database').AsString);
    Params.Add('User_Name=' + dsConfigSyncServer.FieldByName('psync_user').AsString);
    Params.Add('Password=' + Decrypt(dsConfigSyncServer.FieldByName('psync_password').AsString));
    Params.Add('ExtendedMetaData=True');
    Connected := true;
  end;
end;

procedure TFrmPDV_Sync.FormShow(Sender: TObject);
begin
  // fdConfigSyncServer.Close;
  // fdConfigSyncServer.Active := true;
  // with cnSyncServer do
  // begin
  // Params.Clear;
  // Params.Add('DriverID=MSSQL');
  // Params.Add('Server=' + fdConfigSyncServer.FieldByName('psync_servidor').AsString + ',' + fdConfigSyncServer.FieldByName('psync_port').AsString);
  // Params.Add('Database=' + fdConfigSyncServer.FieldByName('psync_database').AsString);
  // Params.Add('User_Name=' + fdConfigSyncServer.FieldByName('psync_user').AsString);
  // Params.Add('Password=' + fdConfigSyncServer.FieldByName('psync_password').AsString);
  // Params.Add('ExtendedMetaData=True');
  // Connected := true;
  // end;
  Timer1.Enabled := true;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_Sync.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  try
    // with FrmPDV_DModule do
    // begin
    // adStoreProc1.Connection     := ADConnection1;
    // adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
    // adStoreProc1.StoredProcName := 'proc_sync_all';
    // adStoreProc1.SchemaName     := 'pdv';
    // adStoreProc1.Prepare;
    // adStoreProc1.Params.ParamByName('@pterm_id').AsInteger := goPterm_id;
    // adStoreProc1.execProc;
    // close;
    // end;
    doConfigSyncServer;
    dsSyncTables.Open('select * from pdv.tb_sync_tables where pst_ativo = 1 order by pst_order');
    doStartSync;
  except
    raise;
  end;
end;

procedure TFrmPDV_Sync.doStartSync;
var
  iX: Integer;
  I : Integer;
begin
  try
    FDScript1.SQLScripts.Clear;
    cxProgressBar1.Properties.Max := dsSyncTables.RecordCount;
    iX                            := 0;
    dsSyncTables.First;
    while not dsSyncTables.Eof do
    begin
      lblStatus.Caption := dsSyncTables.FieldByName('pst_descricao').AsString;
      lblStatus.Repaint;
      if not doReadTables(dsSyncTables.FieldByName('pst_table_name').AsString, dsSyncTables.FieldByName('pst_key_name').AsString, dsSyncTables.FieldByName('pst_descricao').AsString, dsSyncTables.FieldByName('pst_identity').AsBoolean) then
      begin
        close;
        exit;
      end;
      inc(iX);
      cxProgressBar1.Position := iX;
      dsSyncTables.Next;
    end;
    cxProgressBar1.Visible := false;
    lblStatus.Caption      := 'Sincronismo realizado com sucesso!';
    lblStatus.Repaint;

    MessageBox(handle, 'Sincronismo realizado com sucesso!', 'I9 PDV', MB_ICONINFORMATION);
    close;
  except
    On E: Exception do
      MessageBox(handle, pChar(E.Message), 'I9 PDV', MB_ICONINFORMATION);
  end;
end;

function TFrmPDV_Sync.doGetValueByType(aField: TField): String;
begin
  Result := '0';
  case aField.DataType of
    ftWideMemo, ftVariant, ftWideString, ftMemo, ftString:
      Result := QuotedStr(aField.AsString);
    ftSingle, ftShortint, ftLongWord, ftLargeint, ftAutoInc, ftSmallint, ftInteger, ftWord:
      Result := QuotedStr(aField.AsString);
    ftBoolean:
      Result := QuotedStr(aField.AsString);
    ftFMTBcd, ftBCD, ftCurrency, ftFloat, ftExtended:
      Result := SQLDouble(aField.AsCurrency);
    ftDate, ftTimeStamp:
      Result := SQLServerDate(aField.AsDateTime);
    ftTime:
      Result := QuotedStr(aField.AsString);
    ftDateTime:
      Result := SQLServerDate(aField.AsDateTime);
    ftVarBytes, ftBytes:
      Result := QuotedStr(aField.AsString);
  end;
end;

procedure TFrmPDV_Sync.doBuildValues(var aLocalTable, aServerTable: TFDQuery; var aValues: String; aTipoSentenca: TTipoSentenca);
var
  I      : Integer;
  loField: TField;
begin
  case aTipoSentenca of
    tpInsert:
      begin
        for I := 0 to aServerTable.FieldCount - 1 do
          if aServerTable.Fields.Fields[I].FieldName <> '_checksum' then
            aValues := aValues + doGetValueByType(aServerTable.Fields.Fields[I]) + ',';
      end;
    tpUpdate:
      begin
        for I := 0 to aServerTable.FieldCount - 1 do
          if aServerTable.Fields.Fields[I].FieldName <> '_checksum' then
          begin
            loField := aLocalTable.FindField(aServerTable.Fields.Fields[I].FieldName);
            if loField <> nil then
            begin
              if aServerTable.Fields.Fields[I].Value <> loField.Value then
                aValues := aValues + aServerTable.Fields.Fields[I].FieldName + ' = ' + doGetValueByType(aServerTable.Fields.Fields[I]) + ',';
            end;
          end;
      end;
    tpDelete:
      begin
      end;
  end;
  aValues := Copy(aValues, 1, Length(aValues) - 1);
end;

function TFrmPDV_Sync.doReadTables(aTableName, aKeyName, aTableDescr: String; aIdentity: Boolean): Boolean;
var
  I                 : Integer;
  loFields, loValues: String;
  loSentence        : String;
  loIndex           : Integer;
  loFDSQLScript     : TFDSQLScript;
begin
  Result := false;

  FDScript1.SQLScripts.Clear;
  loFDSQLScript      := FDScript1.SQLScripts.Add;
  loFDSQLScript.Name := aTableName;

  loFields := '';
  dsTableServer.Open('select * from ' + aTableName);
  dsTableLocal.Open('select * from ' + aTableName);

  { Campos }
  for I := 0 to dsTableServer.FieldCount - 1 do
    if dsTableServer.Fields.Fields[I].FieldName <> '_checksum' then
      loFields := loFields + dsTableServer.Fields.Fields[I].FieldName + ',';
  loFields     := Copy(loFields, 1, Length(loFields) - 1);

  { Valores }
  dsTableServer.First;
  while not dsTableServer.Eof do
  begin
    loValues := '';
    if not dsTableLocal.Locate(aKeyName, dsTableServer.FieldByName(aKeyName).AsString, [loCaseInsensitive]) then
    begin
      doBuildValues(dsTableLocal, dsTableServer, loValues, tpInsert);
      if loValues <> '' then
      begin
        if aIdentity then
        begin
          loSentence := 'SET IDENTITY_INSERT ' + aTableName + ' ON';
          loFDSQLScript.SQL.Append(loSentence);
        end;
        loSentence := 'insert ' + aTableName + ' (' + loFields + ') values (' + loValues + ')';
        loFDSQLScript.SQL.Append(loSentence);
        if aIdentity then
        begin
          loSentence := 'SET IDENTITY_INSERT ' + aTableName + ' OFF';
          loFDSQLScript.SQL.Append(loSentence);
        end;
        loFDSQLScript.SQL.Append('GO');
      end;
    end
    else if dsTableServer.FieldByName('_checksum').AsInteger <> dsTableLocal.FieldByName('_checksum').AsInteger then
    begin
      doBuildValues(dsTableLocal, dsTableServer, loValues, tpUpdate);
      if loValues <> '' then
      begin
        loSentence := 'update ' + aTableName + ' set ' + loValues + ' where ' + aKeyName + ' = ' + QuotedStr(dsTableServer.FieldByName(aKeyName).AsString);
        loFDSQLScript.SQL.Append(loSentence);
        loFDSQLScript.SQL.Append('GO');
      end;
    end;
    dsTableServer.Next;
  end;
  // ShowMessage(loFDSQLScript.SQL.text);
  if not FDScript1.ExecuteAll then
  begin
    lblStatus.Caption := 'Falha no sincronismo sincronismo';
    lblStatus.Repaint;
    MessageBox(handle, pChar('Falha ao realizar sincronismo da tabela ' + aTableDescr), 'I9 PDV', MB_ICONINFORMATION);
    exit;
  end;
  Result := true;
end;

end.
