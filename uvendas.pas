unit uvendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons,
  Vcl.ComCtrls, cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, dxDateRanges, dxScrollbarAnnotations;

type
  Tfvendas = class(TForm)
    Panel1: TPanel;
    dtPesquisa: TDateTimePicker;
    cxButton1: TcxButton;
    fdVendasMes: TFDQuery;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    fdVendasDia: TFDQuery;
    fdVendasMesMes: TIntegerField;
    fdVendasMesAno: TIntegerField;
    fdVendasMesTotal: TFMTBCDField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Mes: TcxGridDBColumn;
    cxGrid1DBTableView1Ano: TcxGridDBColumn;
    cxGrid1DBTableView1Total: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Total: TcxGridDBColumn;
    cxGridDBTableView1Data: TcxGridDBColumn;
    fdVendasDiaTotal: TFMTBCDField;
    fdVendasDiaData: TSQLTimeStampField;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fvendas: Tfvendas;

implementation

uses uFrmPDV_DModule;

{$R *.dfm}

procedure Tfvendas.cxButton1Click(Sender: TObject);
begin
with fdVendasMes do
begin
   close;
   sql.Clear;
   sql.text:='SELECT DATEPART(MM,pnf_data_emissao) AS Mes,DATEPART(YYYY,pnf_data_emissao) AS Ano ,'+
             'SUM(pnf_total_prods) AS Total from [pdv].[vw_nota_fiscal] WHERE pnf_status=4 '+
             ' and DATEPART(yyyy,pnf_data_emissao)= :data1 '+
             'GROUP BY DATEPART(MM,pnf_data_emissao), DATEPART(YYYY,pnf_data_emissao)';
   Params[0].Value:=Copy(datetostr(dtPesquisa.Date),7,4);
   open;
end;
with fdVendasdia do
begin
   close;
   sql.Clear;
   sql.text:='SELECT sum(pnf_total_prods) AS Total,pnf_data_emissao AS Data from [pdv].[vw_nota_fiscal] '+
             ' WHERE pnf_status=4 AND '+
             ' DATEPART(mm,pnf_data_emissao)= :data1  AND DATEPART(yyyy,pnf_data_emissao)= :data2 '+
             ' GROUP BY pnf_data_emissao order by pnf_data_emissao desc';
   Params[0].Value:=Copy(datetostr(dtPesquisa.Date),4,2);
   Params[1].Value:=Copy(datetostr(dtPesquisa.Date),7,4);
   open;
end;
end;

procedure Tfvendas.FormShow(Sender: TObject);
begin
dtPesquisa.Date:=Date;
cxButton1Click(Sender);
end;

end.
