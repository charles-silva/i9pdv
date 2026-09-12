unit umgrlibpdv;

interface

uses

  Messages, SysUtils, Variants, Graphics, xmldom,
  XMLIntf, msxmldom, XMLDoc, Forms, dxScreenTip, StdCtrls, jpeg, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  ComCtrls, ShlObj, cxShellCommon, Menus, cxCheckBox, dxCore, cxDateUtils,
  cxPC, dxBarBuiltInMenu,
  dxBarDBNav, dxTabbedMDI, dxRibbonRadialMenu, dxRibbon, dxRibbonMiniToolbar,
  dxRibbonStatusBar, dxBarApplicationMenu, cxClasses, dxRibbonGallery,
  dxRibbonBackstageViewGalleryControl, dxRibbonBackstageView, dxStatusBar,
  dxBar, dxDBCheckGroupBox, dxDBColorGallery, dxDBColorEdit, dxDBZoomTrackBar,
  cxDBExtLookupComboBox, dxDBBreadcrumbEdit, cxDBNavigator, cxDBEdit,
  cxDBLookupComboBox, cxDBShellComboBox, cxDBRichEdit, cxDBCheckGroup,
  cxDBCheckComboBox, cxDBFontNameComboBox, cxDBColorComboBox, cxDBCheckListBox,
  cxDBTrackBar, cxDBProgressBar, cxDBLabel, dxColorPicker, dxCheckGroupBox,
  dxColorGallery, dxColorEdit, dxZoomTrackBar, dxBreadcrumbEdit, cxNavigator,
  cxListBox, cxRadioGroup, cxLookupEdit, cxDBLookupEdit, cxDropDownEdit,
  cxMRUEdit, cxBlobEdit, cxImage, cxCurrencyEdit, cxTimeEdit, cxHyperLinkEdit,
  cxCalc, cxSpinEdit, cxImageComboBox, cxButtonEdit, cxCalendar, cxMemo,
  cxMaskEdit, cxTextEdit, cxShellComboBox, cxRichEdit, cxGroupBox, cxCheckGroup,
  cxCheckComboBox, cxFontNameComboBox, cxColorComboBox, cxCheckListBox,
  cxTrackBar, cxProgressBar, cxLabel, dxImageSlider, dxGalleryControl, dximctrl,
  Controls, dxAlertWindow, cxScrollBox, dxColorDialog, dxBevel, cxButtons,
  dxShellBreadcrumbEdit, cxShellTreeView, cxShellListView, cxSplitter, cxHeader,
  cxTreeView, cxListView, cxMCListBox, cxSpinButton, cxScrollBar,
  cxShellBrowserDialog, dxTaskbarProgress, Classes, dxCustomHint, cxHint,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTL, cxTLdxBarBuiltInMenu, cxTLData, cxDBTL,
  cxInplaceContainer, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxGridServerModeTableView, cxGridServerModeBandedTableView, cxGridDBChartView,
  cxGridDBLayoutView, cxGridDBCardView, cxGridDBBandedTableView,
  dxLayoutContainer, cxGridLayoutView, cxGridChartView, cxGridCustomLayoutView,
  cxGridCardView, cxGridBandedTableView, dxBarExtItems, cxBarEditItem, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPScxPageControlProducer, dxPSCore,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxCommon,
  cxPivotGridDrillDownDataSet, dxmdaset, cxPivotGridCustomDataSet,
  cxPivotGridSummaryDataSet, cxPivotGridChartConnection, cxCustomPivotGrid,
  cxPivotGridOLAPDataSource, cxDBPivotGrid, cxPivotGrid, dxtree, dxdbtrel,
  cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView,
  cxSchedulerRecurrence, cxSchedulerTreeListBrowser,
  dxdbtree, dxPSDBBasedXplorer, dxPSFileBasedXplorer,
  dxPgsDlg, dxPrnDlg, dxdborgc, dxorgchr, dxNavBar, dxLayoutLookAndFeels,
  dxLayoutControl, cxDateNavigator, cxSchedulerDBStorage,
  cxSchedulerAggregateStorage, dxCustomWizardControl, dxWizardControl,
  cxDBFilterControl, cxFilterControl, cxLocalization, ImgList, cxPropertiesStore,
  ExtCtrls,
  dxNavBarGroupItems, dxLayoutControlAdapters,
  dxDockControl, dxDockPanel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Wait, FireDAC.VCLUI.Async, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,     DBClient, Windows,
  ToolWin, Buttons,
  Dialogs,
  FMTBcd, ACBrMDFe, ACBrNFSe, ACBrCTe, ACBrNFe, ACBrBarCode, ACBrGIF,
  ACBrSpedContabil, ACBrBoleto, ACBrSMSClass, ACBrSMS, ACBrETQ, ACBrBAL,
  ACBrTER, ACBrDIS, ACBrLCB, ACBrCHQ, ACBrGAV, ACBrRFD, ACBrECF, ACBrCargaBal,
  ACBrInStore, ACBrEnterTab, ACBrFala, ACBrValidador, ACBrTroco, ACBrExtenso,
  ACBrCMC7, ACBrCalculadora, ACBrBase, ACBrAAC, ACBrEAD,
  LayeredForm,
  dxNavBarCollns, dxNavBarBase,
  dxGDIPlusClasses, cxVGrid, cxDBVGrid, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers, Vcl.AppEvnts,
  ppDBBDE, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDsgnDB,
  dxSkinsCore, dxSkinBlue, dxSkiniMaginary,
  dxSkinMoneyTwins,  dxSkinCaramel, dxSkinOffice2010Silver,
  dxSkinsdxBarPainter, dxSkinsdxStatusBarPainter, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxSkinscxPCPainter, dxSkinscxSchedulerPainter,
  dxSkinsdxNavBarPainter,
  dxSkinsForm, dxSkinWhiteprint,
  dxSkinDevExpressStyle, dxSkinLilian, dxSkinsdxNavBarAccordionViewPainter,
   ACBr_BCrypt, ACBr_NCrypt, ACBr_NTStatus, ACBr_WinCrypt, ACBr_WinHttp,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TForm1 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
