unit uFrmBaseExterna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, Data.Win.ADODB, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.Mask, FireDAC.UI.Intf,
  FireDAC.Stan.Async, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.Script;

type
  Tfrmbaseexterna = class(TForm)
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1Controle: TcxGridDBColumn;
    cxGrid2DBTableView1CodProduto: TcxGridDBColumn;
    cxGrid2DBTableView1qtd: TcxGridDBColumn;
    cxGrid2DBTableView1Unidade: TcxGridDBColumn;
    cxGrid2DBTableView1Descricao: TcxGridDBColumn;
    cxGrid2DBTableView1Preco: TcxGridDBColumn;
    cxGrid2DBTableView1Total: TcxGridDBColumn;
    cxGrid2DBTableView1estoquef: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    a1: TADOQuery;
    a1Controle: TAutoIncField;
    a1Preco: TFMTBCDField;
    a1CodProduto: TIntegerField;
    a1Descricao: TStringField;
    a1Unidade: TStringField;
    a1qtd: TBCDField;
    a1Total: TBCDField;
    a1estoquef: TBCDField;
    ds1: TDataSource;
    ADOConnection1: TADOConnection;
    Panel1: TPanel;
    Memo3: TMemo;
    Panel2: TPanel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    edFichaMesa: TLabeledEdit;
    Memo1: TMemo;
    FDScript1: TFDScript;
    FDServerSyncDB: TFDConnection;
    dsConfigSyncServer: TFDQuery;
    fdtensSource: TFDQuery;
    fdVendas: TFDQuery;
    doVendas: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure edFichaMesaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton3Click(Sender: TObject);
    procedure doImport;
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    gopnf_id  : Integer;
    gopterm_id: String;
    procedure doFinalizar(aVD_CODIGO: String);
  end;

var
  frmbaseexterna: Tfrmbaseexterna;

implementation

uses uFrmPDV_DModule, uGlobalLibPDV, uFrmPDV;
 //  uFrmPDV_DModule, uGlobalLibPDV, uFrmPDV

{$R *.dfm}

procedure Tfrmbaseexterna.doFinalizar(aVD_CODIGO: String);
begin
  FrmPDV_DModule.ADConnection1.ExecSQL('update erp.t_vendas set pnf_id = ' + gopnf_id.ToString + ' where vd_codigo = ' + Quotedstr(aVD_CODIGO));
end;

procedure Tfrmbaseexterna.cxButton3Click(Sender: TObject);
begin
   doImport();
end;

procedure Tfrmbaseexterna.cxButton4Click(Sender: TObject);
begin
close;
end;

procedure Tfrmbaseexterna.doImport;
var
  loSQL: string;
begin                 //  pega daqui
  if StrToIntDef(edFichaMesa.Text, 0) = 0 then
    exit;
  try
    FDScript1.SQLScripts[0].SQL.Clear;
    a1.First;
    while not a1.Eof do
    begin

        loSQL := Memo1.Text;
        //loSQL := StringReplace(loSQL, '@pterm_id_in', Quotedstr(gopterm_id), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnf_id_in', Quotedstr(IntToStr(gopnf_id)), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pr_codigo_in', a1.FieldByName('CodProduto').asstring, [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@un_sigla_in', 'UN', [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_qtd_in', SQLDouble(a1.FieldByName('qtd').value), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_valor_unit_in', SQLDouble(a1.FieldByName('preco').value), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_desconto_in', '0', [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_id_comanda_in', edFichaMesa.Text , [rfReplaceAll]);
        FDScript1.SQLScripts[0].SQL.Add(loSQL);
        FDScript1.SQLScripts[0].SQL.Add('GO');

      a1.Next;
    end;
    //fdscript1.SQLScripts.Items
    FDScript1.ExecuteAll;
    ModalResult := mrOK;
  except
    On E: Exception do
    begin
      MessageBox(handle, pChar(E.Message), 'I9 PDV', MB_ICONINFORMATION);
      edFichaMesa.SetFocus;
    end;
  end;
end;

procedure Tfrmbaseexterna.edFichaMesaExit(Sender: TObject);
begin
if edFichaMesa.Text='' then EXIT;

with a1 do
begin
  close;
  sql.Clear;
  sql.Add('EXEC P_IMPORTAR_PRE_VENDA :v0 ');
  Parameters[0].Value:=edFichaMesa.Text;
  Open;
end;
end;

procedure Tfrmbaseexterna.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then SelectNext(ActiveControl, true, true);

end;

procedure Tfrmbaseexterna.FormShow(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'I9PDVERPEXT.EMS') THEN
     begin
       SHOWMESSAGE('Arquivo do SERVIDOR nao encontrado nao podera iniciar o servico I9PDVERPEXT.EMS');
       CLOSE;
     end;
     MEMO3.Clear;
     MEMO3.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'I9PDVERPEXT.EMS');
     ADOConnection1.Connected:=False;
     ADOConnection1.ConnectionString:=Trim(Memo3.Text);
  edFichaMesa.SetFocus;
end;

end.
