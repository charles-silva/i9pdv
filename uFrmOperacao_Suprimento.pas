unit uFrmOperacao_AbreCaixaOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls, Vcl.ExtCtrls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, uFrmPDV_DModule, uWiEventsForm, uPDVLib, md5_2010, WibiSkins;

type
  TFrmOperacao_AbreCaixaOperador = class(TForm)
    Label1: TLabel;
    edOperador: TcxCurrencyEdit;
    edNomeOperador: TcxTextEdit;
    Shape16: TShape;
    Label38: TLabel;
    Shape27: TShape;
    WiEventsForm1: TWiEventsForm;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1fp_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1fp_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1pcxov_valor: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dsValores: TWiFDQuery;
    doValores: TDataSource;
    lblMsgRapida: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edOperadorExit(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure dsValoresBeforePost(DataSet: TDataSet);
    procedure Shape27MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dsValoresAfterPost(DataSet: TDataSet);
  private
    goUser: TUser;
  public

  end;

var
  FrmOperacao_AbreCaixaOperador: TFrmOperacao_AbreCaixaOperador;

implementation

{$R *.dfm}

uses uFrmPDV;

procedure TFrmOperacao_AbreCaixaOperador.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmOperacao_AbreCaixaOperador.dsValoresAfterPost(DataSet: TDataSet);
begin
  dsValores.Refresh;
end;

procedure TFrmOperacao_AbreCaixaOperador.dsValoresBeforePost(DataSet: TDataSet);
begin
  dsValores.FieldByName('pcxov_abertura').AsBoolean     := true;
  dsValores.FieldByName('pcxov_encerramento').AsBoolean := false;
end;

procedure TFrmOperacao_AbreCaixaOperador.edOperadorExit(Sender: TObject);
begin
  if StrToIntDef(edOperador.Text, 0) = 0 then
  begin
    edNomeOperador.Clear;
    exit;
  end;
  goUser := goPDVClass.GetUser(StrToIntDef(edOperador.Text, 0));
  if goUser = nil then
  begin
    edNomeOperador.Clear;
    MessageBox(handle, 'Operador não encontrado', 'WiBi PDV', MB_ICONEXCLAMATION);
    edOperador.SetFocus;
    exit;
  end;
  edNomeOperador.Text := goUser.us_apelido;
  FrmPDV.doOpenCloseOperatorCash(StrToIntDef(edOperador.Text, 0), false, false);
  dsValores.ParamByName('pcxo_id').AsInteger := FrmPDV.goPcxo_id_temp;
  dsValores.Active                           := true;

  if dsValores.IsEmpty then
  begin
    MessageBox(handle, 'Nenhuma forma de pagamento cadastrada', 'WiBi PDV', MB_ICONEXCLAMATION);
    close;
    exit;
  end;

end;

procedure TFrmOperacao_AbreCaixaOperador.FormCreate(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
end;

procedure TFrmOperacao_AbreCaixaOperador.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2:
      begin
        ModalResult := mrOk;
      end;
  end;
end;

procedure TFrmOperacao_AbreCaixaOperador.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

procedure TFrmOperacao_AbreCaixaOperador.Shape27MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  dsValores.Refresh;
end;

procedure TFrmOperacao_AbreCaixaOperador.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if edOperador.Focused then
    close;
end;

end.
