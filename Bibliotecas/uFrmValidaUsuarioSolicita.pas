unit uFrmValidaUsuarioSolicita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls, cxButtons, cxControls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, DBClient, uSCDSource, cxContainer,
  cxTextEdit, cxMemo, cxNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, dxSkinsCore,
  dxSkinBlue, dxSkiniMaginary, dxSkinMoneyTwins, 
  dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter, dxSkinCaramel,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFrmValidaUsuarioSolicita = class(TForm)
    BConfirma: TcxButton;
    BitBtn1: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1us_apelido: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    doUsers: TDataSource;
    Label1: TLabel;
    lblParametro: TLabel;
    cxGrid1DBTableView1us_nome: TcxGridDBColumn;
    edHistorico: TcxMemo;
    Label2: TLabel;
    cxGrid1DBTableView1autu_data: TcxGridDBColumn;
    cxGrid1DBTableView1autu_hora: TcxGridDBColumn;
    mem_sql_users: TMemo;
    cdsUsers: TWiFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BConfirmaClick(Sender: TObject);
  private
    procedure doFilterUsers;
    {Private declarations}
  public
    Fpm_descricao, Fpm_descricao2: String;
    Fpm_id: String;
    Faut_id: Integer;
  end;

var
  FrmValidaUsuarioSolicita: TFrmValidaUsuarioSolicita;

implementation

uses uFrmDModule, uFrmValidaUsuario;
{$R *.dfm}

procedure TFrmValidaUsuarioSolicita.BConfirmaClick(Sender: TObject);
var
  LReturn: OleVariant;
begin
  if MessageBox(handle, pChar('Confirmar solicitação de liberação ao usuário ' + cdsUsers.FieldByName('us_apelido').AsString + ' ?'), 'i9 Moble', MB_ICONQUESTION + MB_DEFBUTTON2 + MB_YESNO) = idNo then
    exit;

  with FrmDModule do
  begin
    adStoreProc1.Connection := ADConnection1;
    adStoreProc1.CatalogName := ADConnection1.Params.Values['DataBase'];
    adStoreProc1.StoredProcName := 'proc_input_autorizacao';
    adStoreProc1.SchemaName := 'dbo';
    adStoreProc1.Prepare;
    adStoreProc1.Params.ParamByName('@aut_id').AsInteger := Faut_id;
    adStoreProc1.Params.ParamByName('@pm_id').AsInteger := StrToIntDef(Fpm_id, 0);
    adStoreProc1.Params.ParamByName('@aut_historico').AsMemo := AnsiString(edHistorico.Text);
    adStoreProc1.Params.ParamByName('@us_codigo_to').AsInteger := cdsUsers.FieldByName('us_codigo').AsInteger;
    adStoreProc1.execProc;

    if adStoreProc1.FindParam('@max') <> nil then
      LReturn := adStoreProc1.ParamByName('@max').AsInteger;
  end;
  if LReturn > 0 then
  begin
    MessageBox(handle, pChar('Solicitação de liberação enviada com sucesso ao usuário ' + cdsUsers.FieldByName('us_apelido').AsString + #13 +
          'Quando sua solicitação for autorizada a tela de liberação será preenchida automaticamente com os dados do usuário autorizador.'), 'i9 Moble', MB_ICONINFORMATION);
    close;
  end;
end;

procedure TFrmValidaUsuarioSolicita.doFilterUsers;
begin
  cdsUsers.CommandText := StringReplace(mem_sql_users.Text, '@pm_id', QuotedStr(Fpm_id), [rfReplaceAll]);
  cdsUsers.CommandText := StringReplace(cdsUsers.CommandText, '@us_codigo', QuotedStr(FrmDModule.User.UserId), [rfReplaceAll]);
  cdsUsers.close;
  cdsUsers.Open;
  edHistorico.Text := cdsUsers.FieldByName('_hist').AsString;
end;

procedure TFrmValidaUsuarioSolicita.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmValidaUsuarioSolicita.FormShow(Sender: TObject);
begin
  lblParametro.Caption := Fpm_descricao + #13 + Fpm_descricao2;
  doFilterUsers;
end;

end.
