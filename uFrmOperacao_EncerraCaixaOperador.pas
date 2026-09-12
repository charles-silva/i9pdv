unit uFrmOperacao_EncerraCaixaOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls, Vcl.ExtCtrls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, uFrmPDV_DModule, uWiEventsForm, uPDVLib, md5_2010,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxDateRanges,
  dxScrollbarAnnotations;

type
  TFrmOperacao_EncerraCaixaOperador = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsValoresBeforePost(DataSet: TDataSet);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dsValoresAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
  private
    goOperador  : TUser;
  public
    goPcxo_id: Integer;
  end;

var
  FrmOperacao_EncerraCaixaOperador: TFrmOperacao_EncerraCaixaOperador;

implementation

{$R *.dfm}

uses uFrmPDV;

procedure TFrmOperacao_EncerraCaixaOperador.dsValoresAfterPost(DataSet: TDataSet);
begin
  dsValores.Refresh;
end;

procedure TFrmOperacao_EncerraCaixaOperador.dsValoresBeforePost(DataSet: TDataSet);
begin
  dsValores.FieldByName('pterm_id').AsString            := FrmPDV.goTerminal.pterm_id;
  dsValores.FieldByName('pcxo_id').AsInteger            := goPcxo_id;
  dsValores.FieldByName('pcxov_abertura').AsBoolean     := false;
  dsValores.FieldByName('pcxov_encerramento').AsBoolean := true;
end;

procedure TFrmOperacao_EncerraCaixaOperador.FormCreate(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
end;

procedure TFrmOperacao_EncerraCaixaOperador.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    Vk_F2:
      begin

        ModalResult := mrOk;
      end;
  end;
end;

procedure TFrmOperacao_EncerraCaixaOperador.FormShow(Sender: TObject);
begin
  dsValores.ParamByName('pterm_id').AsString := FrmPDV.goTerminal.pterm_id;
  dsValores.ParamByName('pcxo_id').AsInteger := goPcxo_id;
  dsValores.Active                           := true;

  if dsValores.IsEmpty then
  begin
    MessageBox(handle, 'Nenhum registro encontrado', 'I9 PDV', MB_ICONEXCLAMATION);
    close;
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

procedure TFrmOperacao_EncerraCaixaOperador.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

procedure TFrmOperacao_EncerraCaixaOperador.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  close;
end;

end.
