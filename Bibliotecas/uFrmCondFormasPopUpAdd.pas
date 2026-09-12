unit uFrmCondFormasPopUpAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls,
  DBClient, Menus, cxLookAndFeelPainters, cxButtons, cxContainer, cxCheckBox,
  ComCtrls, ToolWin, uGlobalLibWiBi, cxLookAndFeels, dxSkinsCore, dxSkinBlue,
  dxSkinMoneyTwins, dxSkinscxPCPainter, ExtCtrls,  cxGroupBox, dxSkinWhiteprint,
  dxSkiniMaginary, dxSkinOffice2010Silver, cxNavigator, dxSkinCaramel,
   dxSkinOffice2013White,  uSCDSource, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, dxSkinDevExpressStyle, WibiSkins;

type
  TFrmCondFormasPopUpAdd = class(TForm)
    doCondicoes: TDataSource;
    doFormas: TDataSource;
    Panel1: TPanel;
    btnConfirmar: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1cp_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1cp_descricao: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1fp_codigo: TcxGridDBColumn;
    cxGridDBTableView1fp_descricao: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid1DBTableView1cp_prazo: TcxGridDBColumn;
    cdsCondicoes: TWiFDQuery;
    cdsFormas: TWiFDQuery;
    procedure cdsFormasAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cxGrid1DBTableView1SelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure cxGridDBTableView1SelectionChanged(
      Sender: TcxCustomGridTableView);
  private
    procedure UpdateButtons;
    { Private declarations }
  public
    Fem_codigo: string;
  end;

var
  FrmCondFormasPopUpAdd: TFrmCondFormasPopUpAdd;

implementation

uses uFrmDModule;

{$R *.dfm}

procedure TFrmCondFormasPopUpAdd.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmCondFormasPopUpAdd.cdsFormasAfterScroll(DataSet: TDataSet);
begin
  if not cdsFormas.IsEmpty then
    btnConfirmar.Enabled := (cdsFormas.FieldByName('fp_codigo').AsInteger > 0)
  else
    btnConfirmar.Enabled := false;
end;

procedure TFrmCondFormasPopUpAdd.cxGrid1DBTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  cdsFormas.Close;
  cdsFormas.CommandText := 'select a.fp_codigo,fp_descricao from t_formaspag a, t_condXformapag b where (a.tp_id = dbo.GetParam(22) or a.tp_id = dbo.GetParam(25)) and a.fp_codigo = b.fp_codigo and a.fp_status = 1 and b.cp_codigo in ' + ConcColumnsSelValues(cxGrid1DBTableView1, cxGrid1DBTableView1cp_codigo.Index) + ' and b.em_codigo = ' + QuotedStr(Fem_codigo) + ' group by a.fp_codigo,fp_descricao';
  cdsFormas.Open;
  UpdateButtons;
end;

procedure TFrmCondFormasPopUpAdd.cxGridDBTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
begin
  UpdateButtons;
end;

procedure TFrmCondFormasPopUpAdd.UpdateButtons;
begin
  btnConfirmar.Enabled := (cxGrid1DBTableView1.DataController.GetSelectedCount > 0) and (cxGridDBTableView1.DataController.GetSelectedCount > 0);
end;

procedure TFrmCondFormasPopUpAdd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE:
      Close;
    VK_RETURN:
      begin
        if not (ssCtrl in Shift) then
          Perform(WM_NEXTDLGCTL, 0, 0)
        else
          btnConfirmar.Click;
      end;
  end;
end;

procedure TFrmCondFormasPopUpAdd.FormShow(Sender: TObject);
begin
  cdsCondicoes.close;
  cdsCondicoes.CommandText := 'select distinct a.* from t_condicoespag a, t_condXformapag b where (a.tp_id = dbo.GetParam(19) or a.tp_id = dbo.GetParam(21)) and a.cp_codigo = b.cp_codigo and cp_status =1 and b.em_codigo = ' + QuotedStr(Fem_codigo);
  cdsCondicoes.open;
end;

procedure TFrmCondFormasPopUpAdd.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

