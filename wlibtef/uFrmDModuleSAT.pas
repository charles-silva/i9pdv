unit uFrmDModuleSAT;

interface

uses
  SysUtils, Windows, ShellApi, Forms, xmldom, XMLIntf, cxGraphics, DB, DBClient, ImgList, Controls,
  msxmldom, XMLDoc, Classes, uGlobalLibSat, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.VCLUI.Async, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, uWiFDQuery,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TFrmDModuleNFCe = class(TDataModule)
    XMLConfigDoc: TXMLDocument;
    ADConnection1: TFDConnection;
    ADGUIxWaitCursor1: TFDGUIxWaitCursor;
    ADGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog;
    adStoreProc1: TFDStoredProc;
    cdsSelect: TWiFDQuery;
    DoEmpresa: TDataSource;
    cdsEmpresa: TWiFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADConnection1Error(ASender: TObject; const AInitiator: IFDStanObject; var AException: Exception);
    procedure ADConnection1Restored(Sender: TObject);
  private
  public
    procedure doGetSysMessages;
  end;

var
  FrmDModuleNFCe: TFrmDModuleNFCe;

implementation

{$R *.dfm}

procedure TFrmDModuleNFCe.doGetSysMessages;
var
  LErrors: TList;
begin
  LErrors := cdsEmpresa.GetSysMessages(false);
  if LErrors.Count > 0 then
    if TErrorLog(LErrors.Items[0]).error_code = 50000 then
      raise EWiBiInfoException.Create(TErrorLog(LErrors.Items[0]).error_message);

end;

procedure TFrmDModuleNFCe.ADConnection1Error(ASender: TObject; const AInitiator: IFDStanObject; var AException: Exception);
begin
  doGetSysMessages;
end;

procedure TFrmDModuleNFCe.ADConnection1Restored(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ADConnection1.DataSetCount - 1 do
    if ADConnection1.DataSets[I].Active then
      ADConnection1.DataSets[I].Resync([rmExact]);
end;

procedure TFrmDModuleNFCe.DataModuleCreate(Sender: TObject);
begin
  FrmDModuleNFCe                     := self;
  ADConnection1.TxOptions.AutoCommit := true;
  ADConnection1.TxOptions.AutoStart  := true;
  ADConnection1.TxOptions.AutoStop   := true;
end;

end.
