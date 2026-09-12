unit uFrmPDV_Funcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue, dxSkinCaramel,
  dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxDataControllerConditionalFormattingRulesManagerDialog, frxClass,
  dxDateRanges, dxScrollbarAnnotations;

type
  TFrmPDV_Funcoes = class(TForm)
    Shape16: TShape;
    Label38: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Shape27: TShape;
    fdFuncoesSistema: TFDQuery;
    doFuncoesSistema: TDataSource;
    cxGrid1DBTableView1func_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1func_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1func_grupo: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    fdFuncoesVenda: TFDQuery;
    doFuncoesVenda: TDataSource;
    frxReport1: TfrxReport;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1EditKeyPress(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    FFuncao: String;
  end;

var
  FrmPDV_Funcoes: TFrmPDV_Funcoes;

implementation

{$R *.dfm}

uses uFrmPDV_DModule, uFrmPDV;

procedure TFrmPDV_Funcoes.cxGrid1DBTableView1EditKeyPress
  (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
  if Key = #13 then
  begin
    FFuncao := fdFuncoesSistema.FieldByName('func_codigo').AsString;
  end;
end;

procedure TFrmPDV_Funcoes.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        FFuncao := fdFuncoesSistema.FieldByName('func_codigo').AsString;
        ModalResult := mrOk;
      end;
    VK_RIGHT:
      cxGrid2.SetFocus;
  end;
end;

procedure TFrmPDV_Funcoes.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        FFuncao := fdFuncoesSistema.FieldByName('func_codigo').AsString;
        ModalResult := mrOk;
      end;
    VK_LEFT:
      cxGrid1.SetFocus;
  end;
end;

procedure TFrmPDV_Funcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      close;
  end;
end;

procedure TFrmPDV_Funcoes.FormShow(Sender: TObject);
begin
  fdFuncoesSistema.Active := true;
  fdFuncoesVenda.Active := true;
  cxGrid1DBTableView1.ViewData.Expand(true);
  cxGridDBTableView1.ViewData.Expand(true);
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
end;

end.
