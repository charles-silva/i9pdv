unit uFrmPDV_ImportaComanda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins,
  cxTextEdit, cxCurrencyEdit, uWiEventsForm, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script, Vcl.Grids, Vcl.DBGrids,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle;

type
  TFrmPDV_ImportaComanda = class(TForm)
    Shape16: TShape;
    Label38: TLabel;
    lblUser: TLabel;
    edFichaMesa: TcxCurrencyEdit;
    Shape27: TShape;
    WiEventsForm1: TWiEventsForm;
    FDSysPDV: TFDConnection;
    FDScript1: TFDScript;
    fdComandaItensSource: TFDQuery;
    Memo1: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure doImport;

    { Private declarations }
  public
    gopnf_id: Integer;
    procedure doFinalizar(aCSO_NUMERO: String);
  end;

var
  FrmPDV_ImportaComanda: TFrmPDV_ImportaComanda;

implementation

{$R *.dfm}

uses uFrmPDV_DModule, uGlobalLibPDV, uFrmPDV;

procedure TFrmPDV_ImportaComanda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      doImport;
  end;
end;

procedure TFrmPDV_ImportaComanda.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_ImportaComanda.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  close;
end;

procedure TFrmPDV_ImportaComanda.doFinalizar(aCSO_NUMERO: String);
begin
  FDSysPDV.ExecSQL('update consumo set CSO_STATUS = ' + Quotedstr('V') + ' where CSO_NUMERO = ' + Quotedstr(aCSO_NUMERO));
end;

procedure TFrmPDV_ImportaComanda.doImport;
var
  loSQL: string;
begin
  if StrToIntDef(edFichaMesa.Text, 0) = 0 then
    exit;
  try
    FDSysPDV.Params.Values['Server'] := '192.168.0.200';
    FDSysPDV.Connected               := true;
    fdComandaItensSource.close;
    fdComandaItensSource.ParamByName('FICCOD').AsInteger := StrToIntDef(edFichaMesa.Text, 0);
    fdComandaItensSource.Active                          := true;
    if fdComandaItensSource.isEmpty then
    begin
      MessageBox(handle, 'Comanda não encontrada.', 'I9 PDV', MB_ICONINFORMATION);
      exit;
    end;
    FDScript1.SQLScripts[0].SQL.clear;
    fdComandaItensSource.First;
    while not fdComandaItensSource.Eof do
    begin
      loSQL := Memo1.Text;
      loSQL := StringReplace(loSQL, '@pnf_id_in', Quotedstr(IntToStr(gopnf_id)), [rfReplaceAll]);
      loSQL := StringReplace(loSQL, '@pr_codigo_in', Quotedstr(IntToStr(fdComandaItensSource.FieldByName('PROCOD').AsInteger)), [rfReplaceAll]);
      loSQL := StringReplace(loSQL, '@un_sigla_in', Quotedstr(''), [rfReplaceAll]);
      loSQL := StringReplace(loSQL, '@pnfi_qtd_in', SQLDouble(fdComandaItensSource.FieldByName('CSI_QTD_VENDA').asCurrency), [rfReplaceAll]);
      loSQL := StringReplace(loSQL, '@pnfi_valor_unit_in', SQLDouble(fdComandaItensSource.FieldByName('CSI_PRECO_VENDA').asCurrency), [rfReplaceAll]);
      loSQL := StringReplace(loSQL, '@pnfi_desconto_in', '0', [rfReplaceAll]);
      loSQL := StringReplace(loSQL, '@pnfi_id_comanda_in', fdComandaItensSource.FieldByName('CSO_NUMERO').AsString, [rfReplaceAll]);
      FDScript1.SQLScripts[0].SQL.Add(loSQL);
      FDScript1.SQLScripts[0].SQL.Add('GO');
      fdComandaItensSource.Next;
    end;
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

end.
