unit uFrmPDV_PesqProds;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue,
  dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxTextEdit, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxCurrencyEdit, Vcl.WinXCtrls, Vcl.ComCtrls, cxListView, uWiEventsForm,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxDateRanges,
  dxScrollbarAnnotations;

type
  TFrmPDV_PesqProds = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Label38: TLabel;
    Shape16: TShape;
    fdProdutos: TFDQuery;
    doProdutos: TDataSource;
    cxGrid1DBTableView1pr_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1pr_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1pr_venda: TcxGridDBColumn;
    cxGrid1DBTableView1_estoque: TcxGridDBColumn;
    cxGrid1DBTableView1pr_codigo_barras: TcxGridDBColumn;
    edPesquisa: TSearchBox;
    Shape27: TShape;
    cxGrid1DBTableView1Secao: TcxGridDBColumn;
    cxGrid1DBTableView1Grupo: TcxGridDBColumn;
    WiEventsForm1: TWiEventsForm;
    procedure FormShow(Sender: TObject);
    procedure edPesquisaInvokeSearch(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPDV_PesqProds: TFrmPDV_PesqProds;

implementation

{$R *.dfm}

uses uFrmPDV_DModule, uGlobalLibPDV, uFrmPDV;

procedure TFrmPDV_PesqProds.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      if edPesquisa.Focused then
        edPesquisa.OnInvokeSearch(edPesquisa);
  end;
end;

procedure TFrmPDV_PesqProds.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;

end;

procedure TFrmPDV_PesqProds.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if edPesquisa.Focused then
    close;
end;

procedure TFrmPDV_PesqProds.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      if fdProdutos.FieldByName('pr_codigo').AsInteger > 0 then
        ModalResult := mrOk;
  end;
end;

procedure TFrmPDV_PesqProds.edPesquisaInvokeSearch(Sender: TObject);
var
  W           : array [0 .. 1] of String;
  LForSQLWhere: String;
  LFields     : String;
  LSQlWhere   : String;
begin
  LSQlWhere    := '';
  LForSQLWhere := GetGridColumnsNamesForSQLWhere(cxGrid1, cxGrid1DBTableView1, 'and');

  if (Trim(edPesquisa.Text) <> EmptyStr) then
    W[0] := GetStringSQLConc(edPesquisa.Text, LForSQLWhere);
  W[1]   := ' and isnull(tp_produto,0) = dbo.GetParam(112)';

  LFields := GetGridColumnsFieldNameGrouped(cxGrid1, cxGrid1DBTableView1);

  LSQlWhere := Format('select ' + LFields + ' from pdv.v_pesquisa_produtos where em_codigo = ' + IntToStr(ServerEmpresa) + ' %s %s group by ' + LFields + ' order by pr_descricao', [W[0], W[1]]);

  fdProdutos.Open(StringReplace(LSQlWhere, '%s', '', [rfReplaceAll]));
  if fdProdutos.IsEmpty then
    edPesquisa.SetFocus
  else
    cxGrid1.SetFocus;
end;

end.
