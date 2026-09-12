unit uFrmPDV_DModule_DS;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery,
  ppDB, ppDBPipe, ppParameter, ppDesignLayer, ppBands, ppReport, ppSubRpt, ppStrtch, ppMemo, ppVar, dxGDIPlusClasses, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, uFrmPDV_DModule;

type
  TFrmPDV_DModule_DS = class(TDataModule)
    ppVenda: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLine9: TppLine;
    ppDBText16: TppDBText;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLine10: TppLine;
    ppLine13: TppLine;
    lblTitleVenda: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel9: TppLabel;
    ppDBText11: TppDBText;
    ppDBText1: TppDBText;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppDetailBand2: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine2: TppLine;
    ppDBMemo1: TppDBMemo;
    ppSummaryBand2: TppSummaryBand;
    ppDBText10: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDBText14: TppDBText;
    ppLine1: TppLine;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppDBVenda: TppDBPipeline;
    ppDBVendaItens: TppDBPipeline;
    ppDBVendasPags: TppDBPipeline;
    ppDBVendasPagsppField1: TppField;
    ppDBVendasPagsppField2: TppField;
    ppDBVendasPagsppField3: TppField;
    ppDBVendasPagsppField4: TppField;
    ppDBVendasPagsppField5: TppField;
    ppDBVendasPagsppField6: TppField;
    ppDBVendasPagsppField7: TppField;
    ppDBVendasPagsppField8: TppField;
    ppDBVendasPagsppField9: TppField;
    ppDBVendasPagsppField10: TppField;
    ppDBVendasPagsppField11: TppField;
    ppDBVendasPagsppField12: TppField;
    ppDBVendasPagsppField13: TppField;
    ppDBVendasPagsppField14: TppField;
    ppDBVendasPagsppField15: TppField;
    ppDBVendasPagsppField16: TppField;
    ppDBVendasPagsppField17: TppField;
    ppDBVendasPagsppField18: TppField;
    ppDBVendasPagsppField19: TppField;
    ppDBVendasPagsppField20: TppField;
    ppDBVendasPagsppField21: TppField;
    fdPagamentosAll: TWiFDQuery;
    fdPagamentos: TWiFDQuery;
    dsVendasPags: TWiFDQuery;
    doVendasPags: TDataSource;
    doVendasItens: TDataSource;
    dsVendasItens: TWiFDQuery;
    dsVendas: TWiFDQuery;
    ppDBEmpresaLogo: TppDBPipeline;
    doVendas: TDataSource;
    ppDBEmpresa: TppDBPipeline;
    doItensDelete: TDataSource;
    dsItensDelete: TWiFDQuery;
    fdNotas: TWiFDQuery;
    doNotas: TDataSource;
    dsResumoFormasPag: TWiFDQuery;
    doResumoFormasPag: TDataSource;
    doSangria: TDataSource;
    dsSangria: TWiFDQuery;
    dsTeclas: TWiFDQuery;
    doTeclas: TDataSource;
    dsResumoCaixa: TWiFDQuery;
    doResumoCaixa: TDataSource;
    ppResumoCaixa: TppReport;
    ppHeaderResumoVenda: TppHeaderBand;
    ppLine4: TppLine;
    ppDBText2: TppDBText;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLabel17: TppLabel;
    ppImage2: TppImage;
    ppSystemVariable2: TppSystemVariable;
    ppDetailBandResumoVenda: TppDetailBand;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppFooterBandResumoVendas: TppFooterBand;
    ppSummaryBandResumoVenda: TppSummaryBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBandResumoFormas: TppTitleBand;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine8: TppLine;
    ppDetailBandResumoFormas: TppDetailBand;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppSummaryBandResumoFormas: TppSummaryBand;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppLine11: TppLine;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBResumoVenda: TppDBPipeline;
    ppDBResumoFormas: TppDBPipeline;
    ppDBCalc1: TppDBCalc;
    ppLine7: TppLine;
    ppLine12: TppLine;
    ppLabel10: TppLabel;
    ppDBText15: TppDBText;
    ppLabel11: TppLabel;
    ppDBText17: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBText23: TppDBText;
    ppLabel15: TppLabel;
    ppDBResumoCaixa: TppDBPipeline;
    ppDBText24: TppDBText;
    ppLabel16: TppLabel;
    ppDBText25: TppDBText;
    ppLabel18: TppLabel;
    ppLine14: TppLine;
    ppLabel19: TppLabel;
    ppDBText28: TppDBText;
    ppLine15: TppLine;
    ppLine5: TppLine;
    ppLine16: TppLine;
    ppDBText29: TppDBText;
    ppLine17: TppLine;
    dsVendasItensConsumo: TWiFDQuery;
    ppSangria: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine18: TppLine;
    ppDBText30: TppDBText;
    ppLine19: TppLine;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppImage3: TppImage;
    ppSystemVariable3: TppSystemVariable;
    ppLine20: TppLine;
    ppLabel27: TppLabel;
    ppDBText34: TppDBText;
    ppLine21: TppLine;
    ppDetailBand3: TppDetailBand;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine24: TppLine;
    ppDBText38: TppDBText;
    ppLine25: TppLine;
    ppSummaryBand3: TppSummaryBand;
    ppLine28: TppLine;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppDBSangria: TppDBPipeline;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBCalc7: TppDBCalc;
    procedure ppDetailBandResumoVendaBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPDV_DModule_DS: TFrmPDV_DModule_DS;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses uFrmPDV;

{$R *.dfm}

procedure TFrmPDV_DModule_DS.ppDetailBandResumoVendaBeforePrint(Sender: TObject);
begin
  ppLine5.Visible  := (ppDBText18.Text = 'VENDA LIQUIDA');
  ppLine16.Visible := (ppDBText18.Text = 'VENDA LIQUIDA');
end;

end.
