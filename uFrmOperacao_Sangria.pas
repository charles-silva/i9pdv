unit uFrmOperacao_Sangria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls, Vcl.ExtCtrls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, uFrmPDV_DModule, uWiEventsForm, uPDVLib, md5_2010, WibiSkins,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFrmOperacao_Sangria = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    edFuncionario: TcxCurrencyEdit;
    edNomeFuncionario: TcxTextEdit;
    Shape16: TShape;
    Label38: TLabel;
    Shape27: TShape;
    Label2: TLabel;
    Label4: TLabel;
    edSenhaSupervisor: TcxTextEdit;
    dsValores: TWiFDQuery;
    doValores: TDataSource;
    cxGrid1DBTableView1fp_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1fp_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1pcxov_valor: TcxGridDBColumn;
    Label5: TLabel;
    edSupervisor: TcxCurrencyEdit;
    edNomeSupervisor: TcxTextEdit;
    WiEventsForm1: TWiEventsForm;
    Shape1: TShape;
    lblMsgRapida: TLabel;
    dsTransId: TWiFDQuery;
    FDTransaction1: TFDTransaction;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsValoresBeforePost(DataSet: TDataSet);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dsValoresAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
  private

    goData      : TDateTime;
    goOperador  : TUser;
    goSupervisor: TUser;
    function doValidSupervisor: Boolean;
  public
    gous_codigo_supervisor: Integer;
    goPcxo_id             : Integer;
    goTransID             : Integer;
  end;

var
  FrmOperacao_Sangria: TFrmOperacao_Sangria;

implementation

{$R *.dfm}

uses uFrmPDV;

procedure TFrmOperacao_Sangria.dsValoresAfterPost(DataSet: TDataSet);
begin
  dsValores.Refresh;
end;

procedure TFrmOperacao_Sangria.dsValoresBeforePost(DataSet: TDataSet);
begin
  dsValores.FieldByName('pcxo_id').AsInteger              := goPcxo_id;
  dsValores.FieldByName('pterm_id').AsString              := FrmPDV.goPterm_id;
  dsValores.FieldByName('pcxov_abertura').AsBoolean       := false;
  dsValores.FieldByName('pcxov_encerramento').AsBoolean   := false;
  dsValores.FieldByName('pcxov_suprimento').AsBoolean     := false;
  dsValores.FieldByName('pcxov_sangria').AsBoolean        := true;
  dsValores.FieldByName('pcxov_trans_id').AsInteger       := goTransID;
  dsValores.FieldByName('pcxov_data').AsDateTime          := goData;
  dsValores.FieldByName('us_codigo_supervisor').AsInteger := gous_codigo_supervisor;
end;

procedure TFrmOperacao_Sangria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FrmPDV_DModule.ADConnection1.InTransaction then
    FrmPDV_DModule.ADConnection1.Rollback;
end;

procedure TFrmOperacao_Sangria.FormCreate(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
end;

procedure TFrmOperacao_Sangria.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        Close;
      end;
    Vk_F2:
      begin
        if FrmPDV_DModule.ADConnection1.InTransaction then
          FrmPDV_DModule.ADConnection1.Commit;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TFrmOperacao_Sangria.FormShow(Sender: TObject);
begin
  dsTransId.Active := true;
  goTransID        := dsTransId.FieldByName('trans_id').AsInteger;
  goData           := ServerDateTime;

  FDTransaction1.Options.AutoCommit       := false;
  FDTransaction1.Options.DisconnectAction := xdRollback;
  FDTransaction1.StartTransaction;

  dsValores.ParamByName('pterm_id').AsString        := FrmPDV.goPterm_id;
  dsValores.ParamByName('pcxo_id').AsInteger        := goPcxo_id;
  dsValores.ParamByName('pcxov_trans_id').AsInteger := goTransID;
  dsValores.Active                                  := true;

  if dsValores.IsEmpty then
  begin
    MessageBox(handle, 'Nenhum registro encontrado', 'I9 PDV', MB_ICONEXCLAMATION);
    Close;
    exit;
  end;

  edFuncionario.EditValue := dsValores.FieldByName('us_codigo').AsInteger;
  edNomeFuncionario.Text  := dsValores.FieldByName('us_apelido').AsString;

  goOperador := goPDVClass.GetUser(StrToIntDef(edFuncionario.Text, 0));
  if goOperador = nil then
  begin
    MessageBox(handle, 'Operador não encontrado', 'I9 PDV', MB_ICONEXCLAMATION);
    exit;
  end;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmOperacao_Sangria.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

procedure TFrmOperacao_Sangria.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  Close;
end;

function TFrmOperacao_Sangria.doValidSupervisor: Boolean;
begin
  result := false;
  if (goSupervisor.us_senha = '') then
    exit;
  result := (goSupervisor.us_senha = md5_2010.MD5String(edSenhaSupervisor.Text));
end;

end.
