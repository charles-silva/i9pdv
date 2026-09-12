unit uFrmResumoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Win.ADODB, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, ppDB, ppDBPipe,
  ppParameter, ppDesignLayer, ppCtrls, ppBands, ppReport, ppStrtch, ppSubRpt,
  ppVar, dxGDIPlusClasses, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, dxDateRanges, dxScrollbarAnnotations,
  dxSkinsCore, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle;

type
  TfrmResumo = class(TForm)
    resumo: TADOQuery;
    dsresumo: TDataSource;
    fdResumo: TFDQuery;
    DataSource2: TDataSource;
    FDQuery2: TFDQuery;
    fdResumoId: TIntegerField;
    fdResumoAbertura: TSQLTimeStampField;
    fdResumoFechamento: TSQLTimeStampField;
    fdResumousuario: TStringField;
    FlowPanel1: TFlowPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Id: TcxGridDBColumn;
    cxGrid1DBTableView1Abertura: TcxGridDBColumn;
    cxGrid1DBTableView1Fechamento: TcxGridDBColumn;
    cxGrid1DBTableView1usuario: TcxGridDBColumn;
    fdAnalitico: TFDQuery;
    dsAnalitico: TDataSource;
    fdAnaliticofp_descricao: TStringField;
    fdAnaliticoCalculado: TFMTBCDField;
    fdAnaliticoDeclarado: TFMTBCDField;
    fdAnaliticoDiferenca: TFMTBCDField;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1fp_descricao: TcxGridDBColumn;
    cxGrid2DBTableView1Calculado: TcxGridDBColumn;
    cxGrid2DBTableView1Declarado: TcxGridDBColumn;
    cxGrid2DBTableView1Diferenca: TcxGridDBColumn;
    ppResumoCaixa: TppReport;
    ppHeaderResumoVenda: TppHeaderBand;
    ppLine4: TppLine;
    ppDBText2: TppDBText;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLabel17: TppLabel;
    ppImage2: TppImage;
    ppSystemVariable2: TppSystemVariable;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLine14: TppLine;
    ppLabel19: TppLabel;
    ppLine15: TppLine;
    ppDetailBandResumoVenda: TppDetailBand;
    ppLine5: TppLine;
    ppFooterBandResumoVendas: TppFooterBand;
    ppLine12: TppLine;
    ppDBText29: TppDBText;
    ppLine17: TppLine;
    ppSummaryBandResumoVenda: TppSummaryBand;
    ppLine11: TppLine;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBResumoVenda: TppDBPipeline;
    Imprimir: TcxButton;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppId: TppLabel;
    ppAbertura: TppLabel;
    ppEncerramento: TppLabel;
    ppUsuario: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText6: TppDBText;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResumo: TfrmResumo;

implementation

{$R *.dfm}

uses uFrmPDV, uFrmPDV_DModule;

procedure TfrmResumo.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
with fdAnalitico do
begin
  close;
  SQL.Clear;
  sql.Text:='EXEC pdv.proc_output_resumo_caixa_formaspag '+fdResumoId.AsString+',    1';
  Open;
end;
end;

procedure TfrmResumo.FormShow(Sender: TObject);
begin
with fdResumo do
begin
  close;
  SQL.Clear;
  sql.Text:='SELECT top 30 pcxo_id as Id,pcxo_data_abertura as Abertura,pcxo_data_fechamento as Fechamento , '+
            '  ( SELECT    us_apelido '+
            '   FROM      dbo.t_users x '+
            '   WHERE     x.us_codigo = a.us_codigo ) as usuario '+
            ' FROM    pdv.tb_caixa_operador a order by fechamento desc ';
  Open;
end;
end;

procedure TfrmResumo.ImprimirClick(Sender: TObject);
begin
 ppResumoCaixa.DeviceType:='Screen';     // := 'Screen';    print
  ppResumoCaixa.ShowPrintDialog:= True;   // false;
  ppId.Caption:=fdResumoId.AsString;
  ppAbertura.Caption:=fdResumoAbertura.AsString;
  ppEncerramento.Caption:=fdResumoFechamento.AsString;
  ppusuario.Caption:=fdResumousuario.AsString;
  ppResumoCaixa.Print;
end;

end.
