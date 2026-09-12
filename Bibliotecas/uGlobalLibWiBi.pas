unit uGlobalLibWiBi;

interface

uses
  Windows, Graphics, SysUtils, Classes, Controls, DBClient, TypInfo, DB, StdCtrls, cxEdit, cxDropDownEdit,
  Menus, Messages, Dialogs, cxDBLookupComboBox, SConnect, cxImageComboBox,
  variants, SqlExpr, Provider, Registry, Forms, IdCoderMIME, cxDBTL, cxTL, WinSock, AdvSmoothSlider,
  pngimage, Contnrs,
  GIFImg, jpeg, ExtCtrls, ComObj, tlHelp32, smtpsend, mimemess, mimepart, dxPrnPg, ppReport,
  dxBar, cxGridCustomView, cxGrid, cxGridDBTableView, cxPivotGrid, cxDBPivotGrid, cxGridServerModeTableView, cxDataStorage, cxFilter, dxCore,
  FireDAC.Comp.Client, uMessages, IniFiles, ACBrUtil, TaskDialogEx, TaskDialog, dxRibbon, uFrmSendEmail, IdGlobal,
  cxTextEdit, cxCurrencyEdit, cxCalendar, FireDAC.Stan.Param;

type
  TErrorLog = class
    error_procedure: string;
    error_line_error: Integer;
    error_message: string;
    error_code: Integer;
  end;

  TPopupTipos = (tpString, tpInteger, tpData, tpCombobox);

  TPopupInputs = class
    Caption: string;
    Tipo: TPopupTipos;
    Obrigatorio: Boolean;
    Valores: string;
  end;

  TStatePessoa = set of (spFisica, spJuridica);

  TStateCols = record
    LVisible: Boolean;
    LVisibleCustom: Boolean;
  end;

  PStateCols = array of TStateCols;

  ESQLException = class(Exception);

  EWiBiException     = class(Exception);
  EWiBiInfoException = class(Exception);

const
  TABLEID_CLIENTES                   = 1;
  TABLEID_PARAMETRO                  = 2;
  TABLEID_VERSAO                     = 3;
  TABLEID_ROTAS                      = 4;
  TABLEID_CAR                        = 5;
  TABLEID_CARGA_ITEM                 = 6;
  TABLEID_COBERTURA_CLIENTE          = 7;
  TABLEID_COBERTURA_OUTROS           = 8;
  TABLEID_CONDICAO_PAGAMENTO         = 9;
  TABLEID_CONDICAO_PAGAMENTO_PARCELA = 10;
  TABLEID_CONDPAGCLI                 = 11;
  TABLEID_FORMA_PAGAMENTO            = 12;
  TABLEID_GRUPOS_PRODUTOS            = 13;
  TABLEID_MARCAS                     = 14;
  TABLEID_MARCAS_OUTRAS              = 15;
  TABLEID_OCORRENCIA                 = 16;
  TABLEID_TIPO_PEDIDO                = 17;
  TABLEID_CARGA                      = 18;
  TABLEID_PESQMERCDB                 = 19;
  TABLEID_LISTAPQDB                  = 20;
  TABLEID_CATEGPQDB                  = 21;
  TABLEID_PEDIDOSDB                  = 22;
  TABLEID_PEDIDOSITENSDB             = 23;
  TABLEID_ASSINATURADB               = 24;
  TABLEID_TIPO_PEDIDO_ITEM           = 25;
  TABLEID_EVENTOSDB                  = 26;
  TABLEID_REGRAS                     = 27;
  TABLEID_RESP_PESQMERC              = 28;
  TABLEID_ESTOQPRECO                 = 29;
  TABLEID_VERSAO_TIPOS_PED           = 30;
  TABLEID_COND_FORMA_TIPOS_PED       = 31;
  TABLEID_ENTRADAS                   = 32;

  SIM_MSGID           = WM_APP + 500;
  SIM_MENU            = WM_APP + 501;
  SIM_DEFMODEPRINT    = WM_APP + 502;
  SIM_PRINT           = WM_APP + 503;
  SIM_PREVIEW         = WM_APP + 504;
  SIM_COMDATASET      = WM_APP + 505;
  SIM_GENERIC         = WM_APP + 506;
  SIM_EXEMENU         = WM_APP + 507;
  SIM_LOGUSER         = WM_APP + 508;
  SIM_MAN_LAYOUT      = WM_APP + 509;
  SIM_DEFINEGRID      = WM_APP + 510;
  SIM_PDF             = WM_APP + 511;
  SIM_EXEMENU_IN      = WM_APP + 512;
  SIM_DEFINEREPORT    = WM_APP + 513;
  SIM_APPLYSTYLE      = WM_APP + 514;
  SIM_REMOVEALLCOLS   = WM_APP + 515;
  SIM_TABGROUPSRIBBON = WM_APP + 516;
  SIM_BARCONTROL      = WM_APP + 517;
  WM_AFTER_CREATE     = WM_USER + 301;

  MSG_NEW     = 1;
  MSG_EDIT    = 2;
  MSG_POST    = 3;
  MSG_REFRESH = 4;
  MSG_DELETE  = 5;
  MSG_CANCEL  = 6;
  MSG_ALL     = 7;
  MSG_NONE    = 8;
  MSG_LAYOUT  = 17;

type
  TSendExport = class
    AFileName: String;
    APrinterPage: TdxPrinterPage;
    AReportBuilder: TppReport;
    AHandleTargetPDF: HWND;
  end;

type
  TOpenMode = (omAppend, omEdit, omDelete);

type
  TGenericType = (gtUnloadApp, gtStopTimers, gtLogoff);

type
  TSeparatorPos = (spBeginning, spEnd);

  { Functions DataSet }

function LoadLookUpComboBox(aOwner: TComponent; aAdConnection: TFDConnection; acxGridDBColumn: TcxGridDBColumn; aSQL, aFieldNames, aFieldKeys: string; const aDefaultField: string = ''; const aDefaultValue: string = ''; const aReload: Boolean = true; const aListFieldIndex: Integer = 0;
  const aFieldsCaption: string = ''; const aFieldsWidth: string = ''): Variant; overload;
function LoadLookUpComboBox(aOwner: TComponent; aAdConnection: TFDConnection; acxDBTreeListColumn: TcxDBTreeListColumn; aSQL, aFieldNames, aFieldKeys: string; const aDefaultField: string = ''; const aDefaultValue: string = ''; const aReload: Boolean = true; const aListFieldIndex: Integer = 0)
  : Variant; overload;
function LoadLookUpComboBox(aOwner: TComponent; aAdConnection: TFDConnection; aLookUpCombo: TcxDBLookupComboBox; aSQL, aFieldNames, aFieldKeys: string; const aDefaultField: string = ''; const aDefaultValue: string = ''; const aReload: Boolean = true; const aListFieldIndex: Integer = 0;
  const aFieldsCaption: string = ''; const aFieldsWidth: string = ''): Variant; overload;
function LoadLookUpComboBox(aOwner: TComponent; aAdConnection: TFDConnection; aLookUpCombo: TcxLookupComboBox; aSQL, aFieldNames, aFieldKeys: string; const aDefaultField: string = ''; const aDefaultValue: string = ''; const aReload: Boolean = true; const aListFieldIndex: Integer = 0;
  const aFieldsCaption: string = ''; const aFieldsWidth: string = ''): Variant; overload;

{ Functions General }
function GetPathInRegistry(aProdName, aPathLabel: String): String;
function Formatar(Texto: string; TamanhoDesejado: Integer; AcrescentarADireita: Boolean = true; CaracterAcrescentar: char = ' '): string;
function ConvertVirgPPonto(vValor: string): string;
function ConvertPontoPVirg(vValor: string): string;
function PegaValorSemPonto(vValor: string): string;
function GetCaptionFromControl(aOwner: TComponent; aControlFrom: TObject): String;
function GetFieldInStringRight(Source: string; Index: Integer; CharSeparator: char): string;
function GetFieldInString(Source: string; Index: Integer; CharSeparator: char): string; overload;
function GetFieldInString(Source: string; Index: Integer; CharSeparator, CharStarted: string; var PosFound: Integer): string; overload;
function GetFieldInString(Source: string; CharSeparator: string): TStrings; overload;
procedure VisibleComponentes(aOwner: TComponent; Tag: Integer; UnVisible: Boolean = false);
procedure VisibleControls(AParent: TWinControl; Tag: Integer; UnVisible: Boolean = false);
procedure EnabledComponentes(aOwner: TComponent; Tag: Integer; Disabled: Boolean = false);
procedure EnabledControls(AParent: TWinControl; Tag: Integer; Disabled: Boolean = false);
function GetFocusedComponent(aOwner: TComponent): TComponent;
procedure ReadOnlyComponentes(aOwner: TComponent; Tag: Integer; ReadOnly: Boolean = false);
function RepeatChar(Count: Integer; LChar: char): string;
function AlignRight(aValue: String; ACount: Integer): string;
function SortClientDataSet(ClientDataSet: TClientDataSet; const FieldName: string): Boolean;
function IsNumeric(Source: string): Boolean;
function IsAlfa(Source: string): Boolean;
function CPF(Num: string): Boolean;
function CGC(Num: string): Boolean;
function OnlyNumbers(Num: string): string;
function OnlyAlpha(Alpha: string): string;
function CheckDoc(Num: string): Boolean;
function GetValueWithOutPoint(vValor: string): string;
function SQLDouble(aValue: Double): string;
function SQLServerDate(date: TDateTime): string; overload;
function SQLServerDate(date: string): string; overload;
function SQLServerDateTime(date: TDateTime): string;
function ValidateAllcxControls(aOwner: TComponent): Boolean; overload;
function ValidateAllcxControls(AControl: TWinControl): Boolean; overload;
procedure MergeMenus(MainMenuItemSrc: TMenuItem; MainMenuItemDest: TMenuItem);
function GetMenuPath(aMenuItem: TMenuItem): String; overload;
function GetMenuPath(dxBarButton: TdxBarButton): String; overload;
function GetMenuPath2(aMenuItem: TMenuItem): String;
function GetThreeListPath(ANode: TcxTreeListNode): String;
function KillTask(ExeFileName: string): Integer;
procedure KillProcess(hWindowHandle: HWND);
function WordsCount(s: string): Integer;
function AjustaStr(str: string; tam: Integer): string;
function ConcFields(LDataSet: TDataSet; FieldName, CharSeparator: string): string;
function CalculaTime(Time1, Time2: TDateTime): string;
function ConcColumnsValues(GridView: TcxCustomGridView; ColumnIndex: Integer): string; overload;
function ConcColumnsValues(GridView: TcxCustomGridView; ColumnIndex: Integer; CountZeroLeft: Integer; Separator: string; SeparatorPos: TSeparatorPos): string; overload;
function ConcColumnsSelValues(GridView: TcxCustomGridView; ColumnIndex: Integer): string;
function ConcColumnsSelValuesCheckBox(GridView: TcxCustomGridView; ColumnIndex, AColCheckBox: Integer): string;
function ConcColumnsSelValuesWithNames(GridView: TcxGridDBTableView): string;
function doApplyFilterCompareGridViews(aGridView1: TcxGridDBTableView; aGridView2: TcxGridDBTableView): string; overload;
function tbKeyIsDown(const Key: Integer): Boolean;
function Encrypt(cChave: string): string;
function Decrypt(cChave: string): string;
function GetFileInfo(FName, InfoType: string): string;
Function GetFileInfo2(Arquivo: string): string;
function FileLastModified(const TheFile: string): string;
function GetFileDate(AFileName: string): string;
function GetFileDateByType(AFileName: string; AType: Integer): String;
function GetSerialHD: string;
function StrZero(Valor: string; Quant: Integer): string;
function GetStringPGSQLConc(aStrSource, aStrModel: string): string;
function GetStringSQLConc(aStrSource, aStrModel: string): string;
procedure PostCacheFind(aClassOwner: TClass; aComponent: TComponent; aContent, aUserID: string);
function FormatCharLen(aValue: string; aChar: char; aLen: Integer): string;
function GetCellValue(aGrid: TcxGrid; aView: TcxGridDBTableView; aRecordIndex, aColumnId: Integer): Variant;
function GetGridColumnsNamesForFilter(aGrid: TcxGrid; aView: TcxGridDBTableView; aTypeWhere: String): string;

function GetGridColumnsNamesForPGWhere(aGrid: TcxGrid; aView: TcxGridDBTableView; aTypeWhere: String): string;
function GetGridColumnsNamesForFilterWhere(aGrid: TcxGrid; aView: TcxGridDBTableView; aTypeWhere: String): string;
function GetGridColumnsNamesForSQLWhere(aGrid: TcxGrid; aView: TcxGridDBTableView; aTypeWhere: String): string; overload;
function GetGridColumnsNamesForSQLWhere(aGrid: TcxGrid; aView: TcxGridServerModeTableView; aTypeWhere: String): string; overload;
function GetGridColumnsNamesForSQLWhere(aView: TcxGridServerModeTableView; aTypeWhere: String): string; overload;
function GetGridColumnsNamesForSQLWhere(aView: TcxGridDBTableView; aTypeWhere: String): string; overload;

function GetGridColumnsFieldName(aGrid: TcxGrid; aView: TcxGridDBTableView): string;

function GetGridColumnsFieldNameGrouped(aView: TcxGridDBTableView; aZero: Boolean = false): string; overload;
function GetGridColumnsFieldNameGrouped(aView: TcxGridServerModeTableView; aZero: Boolean = false): string; overload;
function GetGridColumnsFieldNameGrouped(aGrid: TcxGrid; aView: TcxGridDBTableView; aZero: Boolean = false): string; overload;
function GetGridColumnsFieldNameGrouped(aGrid: TcxGrid; aView: TcxGridServerModeTableView; aZero: Boolean = false): string; overload;
function GetGridColumnsFieldNameGroupedForWhereSub(aGrid: TcxGrid; aView: TcxGridDBTableView; const aAlias: String = ''): string;
function GetGridColumnsFieldNameGroupedForWhereSubDirect(aGrid: TcxGrid; aView: TcxGridDBTableView): string;
function GetPivotGridColumnsFieldNameGrouped(aPivotGrid: TcxDBPivotGrid; aZero: Boolean = false): string;
function GetOrdersGrid(aGridView: TcxGridDBTableView; const aVisibleOnly: Boolean = false): string;
function GetIdeDiskSerialNumber: string;
function GetIdeDiskSerialNumber2: string;
procedure DrawSketch(var aBitmap: TBitmap; B: string; OffSetX, OffSetY: Integer);
function TextToOleData(const AText: string): OleVariant;
function OleDataToText(const AData: OleVariant): string;
function MemoryStreamToOleVariant(Strm: TMemoryStream): OleVariant;
function OleVariantToMemoryStream(OV: OleVariant): TMemoryStream;
function StreamToString(AStream: TStream): string;
function GetTempDir: string;
Function GetTemporaryDir: String;
function GetWinDir: string;
function GetRegistryValue(Folder, KeyName: string): string;
procedure SetRegistryValue(Folder, KeyName, KeyValue: string);
function FileExistsWithFilter(aDir, aExtension: string): Boolean;
function Base64Decode(const EncodedText: string): TBytes;
function Base64Encode(const Text: TidBytes): AnsiString;
procedure GetIPAddress(out AHostName, IPAddress: String);
function GetStateSlider(aValue: Integer): TAdvSmoothSliderState;
function GetValueSlider(aState: TAdvSmoothSliderState): String;
function GetSliderInvertedValue(aState: TAdvSmoothSliderState): TAdvSmoothSliderState;
function GetTextSimNao(aValue: Integer): String;
function ConvertBoolToInt(aValue: Boolean): Integer;
function GetBitmapSign(AData: String): TBitmap;
function GetGraphicSign(AData: String): TGraphic;
function GetGraphicSignNoDecode(AData: AnsiString): TGraphic;
function Control2Bitmap(Control_: TWinControl): TBitmap;
function GetDaysInMonth(Month, Year: Integer): Integer;
function bintostr(const bin: array of byte): string;
function ShellUnzip(zipfile, targetfolder: string; filter: string = ''): Boolean;
function ShellZip(zipfile, sourcefolder: string; filter: string = ''): Boolean;
function Iif(Teste: Boolean; ValorTrue, ValorFalse: String): String; overload;
function Iif(Teste: Boolean; ValorTrue, ValorFalse: Double): Double; overload;
function Iif(Teste: Boolean; ValorTrue, ValorFalse: Integer): Integer; overload;
procedure EnviarEmailNormal(const sSmtpHost, sSmtpPort, sSmtpUser, sSmtpPasswd, sFrom, sTo, sAssunto: String; sMensagem: TStrings; SSL: Boolean; sCC, Anexos: TStrings; PedeConfirma, AguardarEnvio: Boolean; NomeRemetente: String; TLS: Boolean; StreamNFe: TStringStream; NomeArq: String);
function SetExportPrinterPage(APrinterPage: TdxPrinterPage; AFileName: String): TSendExport;
procedure GetExportPrinterPage(ASendExport: TSendExport; var APrinterPage: TdxPrinterPage; var AFileName: String);
function SetExportRBPrinterPage(AReportBuilder: TppReport; AFileName: String): TSendExport;
procedure GetExportRBPrinterPage(ASendExport: TSendExport; var AReportBuilder: TppReport; var AFileName: String);
function SetExportPDF(AHandleTargetPDF: HWND; AFileName: String): TSendExport;
procedure GetExportPDF(ASendExport: TSendExport; var AHandleTargetPDF: HWND; var AFileName: String);
procedure GetStateGridCols(aGridView: TcxGridDBTableView; var aStateCols: PStateCols);
procedure SetStateGridCols(aGridView: TcxGridDBTableView; aStateCols: PStateCols);
procedure SetStateGridColsTag(aGridView: TcxGridDBTableView; aVisible, AVisibleCustom: Boolean; ATag: Integer);
Function LeINICrypt(INI: TIniFile; Section, Ident, Pass: String): String;
Procedure GravaINICrypt(INI: TIniFile; Section, Ident, AString, Pass: String);
procedure LoadMenuInTreeView(ARibbon: TdxRibbon; var adMenus: TFDMemTable);
procedure LoadMenuInDatabase(ARibbon: TdxRibbon; var adMenus: TFDMemTable);

/// <summary>Mensagem melhorada, com questão [Confimar, Cancelar].</summary>
/// <param name="Titulo"> Titulo da Mensagem.</param>
/// <param name="Conteudo"> Conteúdo da Mensagem.</param>
/// <returns> Boolean</returns>
function MsgSimQuestion(Titulo: string; Conteudo: string): Boolean;

/// <summary>Mensagem melhorada, confirmação, erro ou informação.</summary>
/// <param name="Titulo"> Titulo da Mensagem.</param>
/// <param name="Conteudo"> Conteúdo da Mensagem.</param>
/// <param name="icone"> Define o tipo da mensagem tiBlank, tiWarning, tiQuestion, tiError, tiInformation,tiNotUsed,tiShield.</param>
procedure MsgSimInformation(Titulo: string; Conteudo: string; Icone: TTaskDialogIcon);
function InputWiPopup(ATitulo: string; AInputs: TObjectList; var ARetorno: TStrings): Boolean;
procedure WiSendEmail(AssuntoEmail: string; TextoEMail: string; AFiles: TStringList; Compact: Boolean = false; aDir: string = ''; AFileName: String = ''; AddEmails: TStrings = nil);
{ Procudures para os relatórios customizados }

procedure TrimAppMemorySize;

function DecryptStr(const s: string; Key: Word): string;
function EncryptStr(const s: string; Key: Word): string;
function BreakString(AString: string; Delimiter: char; Return: TStrings): TStrings; // add Charles Silva 05/10/2016
procedure doFillColumnsGrid(var AFDConnection: TFDConnection; Alay_id: Integer; var AGridDBTableView: TcxGridDBTableView);
function getClassProperties(aClassName: String): TcxCustomEditPropertiesClass;
function getClassPropertiesAlias(aPropertiesClass: TcxCustomEditPropertiesClass): String;
procedure LoadComponentFromStream(Component: TComponent; AStream: TStream);
procedure AddLogFile(AFileName, aSQL: String; const aClear: Boolean = false);

procedure DesignSaveCompToStream(AComp: TComponent; AStream: TStream);
function DesignLoadCompFromStream(AComp: TComponent; AStream: TStream; AOnError: TReaderError): TComponent;
procedure SaveComponentToFile(Component: TComponent; const FileName: TFileName);
procedure LoadComponentFromFile(Component: TComponent; const FileName: TFileName);
procedure SaveComponentToStream(Component: TComponent; AStream: TStream);

const
  cAPIKey = 'AIzaSyB-9EdO2tqujRvC0RFx42yhQjynMV4dI3Q';

implementation

uses
  cxGridTableView,
  cxCustomData, ppTypes, uWiFDQuery, ppDBBDE, uFrmDefaultPopup,
  CommCtrl;

type
  TAccessComponent = class(TComponent);

type
  TArray = array of Integer;
{$WARNINGS OFF}

const
  // a: TArray<String> = ['Delphi','XE7']; funciona apartir do delphi XE7
  SHCONTCH_NOPROGRESSBOX   = 4;
  SHCONTCH_AUTORENAME      = 8;
  SHCONTCH_RESPONDYESTOALL = 16;
  SHCONTF_INCLUDEHIDDEN    = 128;
  SHCONTF_FOLDERS          = 32;
  SHCONTF_NONFOLDERS       = 64;

  TpcnTpEventoDescricao: array [0 .. 30] of String = ('teCCe', 'Cancalada', 'Manifestação confirmada', 'Manifestação ciência', 'Manifestação desconhecida', 'Manifestação não realiazda', 'Encerrada', 'EPEC', 'Inclusão do Condutor', 'Multi Modal', 'Registro de Passagem', 'Registro de Passagem BRId',
    'EPECNFe', 'Registro CTe', 'Registro Passagem NFe Cancelado', 'Registro Passagem NFe RFID', 'CTe Cancelado', 'MDFe Cancelado', 'Vistoria Suframa', 'Pedido Prorrogação-1', 'Pedido Prorrogação-2', 'Cancelamento Pedeido Prorrogado-1', 'Cancelamento Pedido Prorrogado-2', 'Evento Fisco PP1',
    'Evento Fisco PP2', 'Evento Fisco CPP1', 'Evento Fisco CPP2', 'Registro Passagem NFe', 'Confimar Internalizacao', 'CTe Autorizado', 'MDFe Autorizado');

function BreakString(AString: string; Delimiter: char; Return: TStrings): TStrings;
begin
  Return.Delimiter     := Delimiter;
  Return.DelimitedText := AString;
  Result               := Return;
end;

Function LeINICrypt(INI: TIniFile; Section, Ident, Pass: String): String;
var
  SStream : TStringStream;
  CryptStr: String;
begin
  SStream := TStringStream.Create('');
  try
    INI.ReadBinaryStream(Section, Ident, SStream);
    CryptStr := SStream.DataString;
    Result   := StrCrypt(CryptStr, Pass);
  finally
    SStream.Free;
  end;
end;

procedure WiSendEmail(AssuntoEmail: string; TextoEMail: string; AFiles: TStringList; Compact: Boolean = false; aDir: string = ''; AFileName: String = ''; AddEmails: TStrings = nil);
var
  loForm: TFrmSendEmail;
begin
  loForm              := TFrmSendEmail.Create(Application);
  loForm.AssuntoEmail := AssuntoEmail;
  loForm.TextoEMail   := TextoEMail;
  loForm.ListaAquivos := AFiles;
  loForm.ListaEmails.AddStrings(AddEmails);
  loForm.CompactaArquivo  := Compact;
  loForm.DiretorioDestino := IncludeTrailingPathDelimiter(aDir);
  loForm.NomeArquivo      := AFileName;
  try
    loForm.ShowModal;
  finally
    loForm.Free;
  end;
end;

procedure LoadMenuInTreeView(ARibbon: TdxRibbon; var adMenus: TFDMemTable);
var
  I, y        : Integer;
  loTab       : TdxRibbonTab;
  loGroup     : TdxRibbonTabGroup;
  loRoot      : Integer;
  loParentLink: Integer;
  loSimAdMenu : TFDMemTable;
  function InsertMenu(ANome: string; ACodigo: Integer; ACaption: string; AParent: Integer; aInstanceId: Integer): Integer;
  begin
    loSimAdMenu.Append;
    loSimAdMenu.FieldByName('mn_nome').Value := ANome;
    if ACodigo = 0 then
      loSimAdMenu.FieldByName('mn_descricao').Value := ACaption
    else
      loSimAdMenu.FieldByName('mn_descricao').Value := IntTostr(ACodigo) + ' - ' + ACaption;
    loSimAdMenu.FieldByName('mn_codigo').Value      := ACodigo;
    loSimAdMenu.FieldByName('mn_parent').Value      := AParent;
    loSimAdMenu.FieldByName('mn_instance_id').Value := aInstanceId;
    loSimAdMenu.Post;
    Result := loSimAdMenu.FieldByName('mn_id').Value;
  end;
  procedure LoadRecusiveSubItem(ASubItem: TdxBarSubItem; AParent: Integer);
  var
    I       : Integer;
    loItem  : TdxBarItemLinks;
    loParent: Integer;
  begin
    loItem := ASubItem.ItemLinks;
    for I  := 0 to loItem.Count - 1 do
    begin
      if (loItem.Items[I].Item is TdxBarLargeButton) then
        InsertMenu(TdxBarLargeButton(loItem.Items[I].Item).Name, TdxBarLargeButton(loItem.Items[I].Item).Tag, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I].Item))
      else if (loItem.Items[I].Item is TdxBarButton) then
        InsertMenu(TdxBarButton(loItem.Items[I].Item).Name, TdxBarButton(loItem.Items[I].Item).Tag, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I].Item))
      else if (loItem.Items[I].Item is TdxBarSubItem) then
      begin
        loParent := InsertMenu('', 0, TdxBarSubItem(loItem.Items[I].Item).Caption, AParent, Integer(loItem.Items[I].Item));
        LoadRecusiveSubItem(TdxBarSubItem(loItem.Items[I].Item), loParent);
      end
      else
        InsertMenu('', 0, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I]));
    end;
  end;

  procedure LoadRecusiveItem(Agroup: TdxRibbonTabGroup; AParent: Integer);
  var
    I       : Integer;
    loItem  : TdxBarItemLinks;
    loParent: Integer;
  begin
    loItem := Agroup.ToolBar.ItemLinks;
    for I  := 0 to loItem.Count - 1 do
    begin
      if (loItem.Items[I].Item is TdxBarLargeButton) then
        InsertMenu(TdxBarLargeButton(loItem.Items[I].Item).Name, TdxBarLargeButton(loItem.Items[I].Item).Tag, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I].Item))
      else if (loItem.Items[I].Item is TdxBarButton) then
        InsertMenu(TdxBarButton(loItem.Items[I].Item).Name, TdxBarLargeButton(loItem.Items[I].Item).Tag, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I].Item))
      else if (loItem.Items[I].Item is TdxBarSubItem) then
      begin
        loParent := InsertMenu('', 0, TdxBarSubItem(loItem.Items[I].Item).Caption, AParent, Integer(loItem.Items[I].Item));
        LoadRecusiveSubItem(TdxBarSubItem(loItem.Items[I].Item), loParent);
      end
      else
        InsertMenu('', 0, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I]));
      Application.ProcessMessages;
    end;
  end;

begin
  loSimAdMenu := TFDMemTable.Create(nil);
  try
    loSimAdMenu.FieldDefs.Add('mn_id', ftAutoInc);
    loSimAdMenu.FieldDefs.Add('mn_descricao', ftString, 255);
    loSimAdMenu.FieldDefs.Add('mn_nome', ftString, 150);
    loSimAdMenu.FieldDefs.Add('mn_parent', ftInteger);
    loSimAdMenu.FieldDefs.Add('mn_codigo', ftInteger);
    loSimAdMenu.FieldDefs.Add('mn_instance_id', ftInteger);

    loSimAdMenu.CreateDataSet;
    for I := 0 to ARibbon.Tabs.Count - 1 do
    begin
      loTab  := ARibbon.Tabs.Items[I];
      loRoot := InsertMenu('', 0, loTab.Caption, 0, 0);
      for y  := 0 to loTab.Groups.Count - 1 do
      begin
        loGroup := loTab.Groups.Items[y];
        if (loGroup.Caption = '') or (not loGroup.Visible) then
          Continue;
        loParentLink := InsertMenu('', 0, loGroup.Caption, loRoot, 0);
        LoadRecusiveItem(loGroup, loParentLink);
        Application.ProcessMessages;
      end;
    end;
    if adMenus.Active then
      adMenus.EmptyDataSet;
    adMenus.Close;
    adMenus.Data := loSimAdMenu.Data;
  finally
    loSimAdMenu.Free;
  end;
end;

procedure LoadMenuInDatabase(ARibbon: TdxRibbon; var adMenus: TFDMemTable);
var
  I, y        : Integer;
  loTab       : TdxRibbonTab;
  loGroup     : TdxRibbonTabGroup;
  loRoot      : Integer;
  loParentLink: Integer;
  loSimAdMenu : TWiFDQuery;
  function InsertMenu(ANome: string; ACodigo: Integer; ACaption: string; AParent: Integer; aInstanceId: Integer): Integer;
  begin
    loSimAdMenu.Append;
    loSimAdMenu.FieldByName('mn_nome').Value := ANome;
    if ACodigo = 0 then
      loSimAdMenu.FieldByName('mn_descricao').Value := ACaption
    else
      loSimAdMenu.FieldByName('mn_descricao').Value := IntTostr(ACodigo) + ' - ' + ACaption;
    loSimAdMenu.FieldByName('mn_codigo').Value      := ACodigo;
    loSimAdMenu.FieldByName('mn_parent').Value      := AParent;
    loSimAdMenu.Post;
    Result := loSimAdMenu.ReturnValue;
  end;
  procedure LoadRecusiveSubItem(ASubItem: TdxBarSubItem; AParent: Integer);
  var
    I       : Integer;
    loItem  : TdxBarItemLinks;
    loParent: Integer;
  begin
    loItem := ASubItem.ItemLinks;
    for I  := 0 to loItem.Count - 1 do
    begin
      if (loItem.Items[I].Item is TdxBarLargeButton) then
        InsertMenu(TdxBarLargeButton(loItem.Items[I].Item).Name, TdxBarLargeButton(loItem.Items[I].Item).Tag, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I].Item))
      else if (loItem.Items[I].Item is TdxBarButton) then
        InsertMenu(TdxBarButton(loItem.Items[I].Item).Name, TdxBarButton(loItem.Items[I].Item).Tag, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I].Item))
      else if (loItem.Items[I].Item is TdxBarSubItem) then
      begin
        loParent := InsertMenu('', 0, TdxBarSubItem(loItem.Items[I].Item).Caption, AParent, Integer(loItem.Items[I].Item));
        LoadRecusiveSubItem(TdxBarSubItem(loItem.Items[I].Item), loParent);
      end
      else
        InsertMenu('', 0, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I]));
    end;
  end;

  procedure LoadRecusiveItem(Agroup: TdxRibbonTabGroup; AParent: Integer);
  var
    I       : Integer;
    loItem  : TdxBarItemLinks;
    loParent: Integer;
  begin
    loItem := Agroup.ToolBar.ItemLinks;
    for I  := 0 to loItem.Count - 1 do
    begin
      if (loItem.Items[I].Item is TdxBarLargeButton) then
        InsertMenu(TdxBarLargeButton(loItem.Items[I].Item).Name, TdxBarLargeButton(loItem.Items[I].Item).Tag, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I].Item))
      else if (loItem.Items[I].Item is TdxBarButton) then
        InsertMenu(TdxBarButton(loItem.Items[I].Item).Name, TdxBarLargeButton(loItem.Items[I].Item).Tag, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I].Item))
      else if (loItem.Items[I].Item is TdxBarSubItem) then
      begin
        loParent := InsertMenu('', 0, TdxBarSubItem(loItem.Items[I].Item).Caption, AParent, Integer(loItem.Items[I].Item));
        LoadRecusiveSubItem(TdxBarSubItem(loItem.Items[I].Item), loParent);
      end
      else
        InsertMenu('', 0, loItem.Items[I].Caption, AParent, Integer(loItem.Items[I]));
      Application.ProcessMessages;
    end;
  end;

begin
  loSimAdMenu := TWiFDQuery.Create(nil);
  try
    loSimAdMenu.ConnectionName := 'SimERPConn';
    loSimAdMenu.SQL.Text       := 'TRUNCATE TABLE sistema.tb_menus';
    loSimAdMenu.ExecSQL;

    if not loSimAdMenu.Active then
    begin
      loSimAdMenu.ProcedureName := ' sistema.proc_input_tb_menus';
      loSimAdMenu.Open('select * from sistema.tb_menus where 1=0');
    end;

    // loPerfil := loSimAdMenu.FieldByName('mnp_id').Value;
    for I := 0 to ARibbon.Tabs.Count - 1 do
    begin
      loTab  := ARibbon.Tabs.Items[I];
      loRoot := InsertMenu('', 0, loTab.Caption, 0, 0);
      for y  := 0 to loTab.Groups.Count - 1 do
      begin
        loGroup := loTab.Groups.Items[y];
        if (loGroup.Caption = '') or (not loGroup.Visible) then
          Continue;
        loParentLink := InsertMenu('', 0, loGroup.Caption, loRoot, 0);
        LoadRecusiveItem(loGroup, loParentLink);
        Application.ProcessMessages;
      end;
    end;
    if adMenus.Active then
      adMenus.EmptyDataSet;
    adMenus.Close;
    adMenus.Data := loSimAdMenu.Data;
    // loSimAdMenu.Refresh;
  finally
    loSimAdMenu.Free;
  end;
end;

Procedure GravaINICrypt(INI: TIniFile; Section, Ident, AString, Pass: String);
var
  SStream : TStringStream;
  CryptStr: String;
begin
  CryptStr := StrCrypt(AString, Pass);
  SStream  := TStringStream.Create(CryptStr);
  try
    INI.WriteBinaryStream(Section, Ident, SStream);
  finally
    SStream.Free;
  end;
end;

procedure TrimAppMemorySize;
var
  MainHandle: THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
    CloseHandle(MainHandle);
  except
  end;
  Application.ProcessMessages;
end;

function MsgSimQuestion(Titulo: string; Conteudo: string): Boolean;
var
  Dialog: TAdvTaskDialogEx;
begin
  Dialog := TAdvTaskDialogEx.Create(Application);
  try
    Dialog            := TAdvTaskDialogEx.Create(nil);
    Dialog.Title      := Titulo;
    Dialog.Icon       := TaskDialog.tiWarning;
    Dialog.Options    := [TaskDialog.doHyperlinks];
    Dialog.Footer     := 'Desenvolvido por:<A href="www.I9Mobile.com.br">I9 Mobile</A>';
    Dialog.FooterIcon := TaskDialog.tfiInformation;

    Dialog.Content       := Conteudo;
    Dialog.CommonButtons := [];
    Dialog.CustomButtons.Clear;
    Dialog.CustomButtons.Add('Confirmar');
    Dialog.CustomButtons.Add('Cancelar');

    Dialog.ExpandedText       := 'para maiores informações, consulte o suporte.' + #13 + 'Contato: ' + MsgEmpresaTelefone;
    Dialog.CollapsControlText := 'Ver detalhes';
    Dialog.ExpandControlText  := 'Ocultar Detalhes';
    Result                    := (Dialog.Execute = 100);
  finally
    Dialog.Free;
  end;

end;

procedure MsgSimInformation(Titulo: string; Conteudo: string; Icone: TTaskDialogIcon);
var
  Dialog: TAdvTaskDialogEx;
begin
  Dialog := TAdvTaskDialogEx.Create(Application);
  try
    Dialog            := TAdvTaskDialogEx.Create(nil);
    Dialog.Title      := Titulo;
    Dialog.Icon       := Icone;
    Dialog.Options    := [TaskDialog.doHyperlinks];
    Dialog.Footer     := 'Desenvolvido por:<A href="www.i9mobile.com.br">I9 Mobile</A>';
    Dialog.FooterIcon := TaskDialog.tfiInformation;

    Dialog.Content       := Conteudo;
    Dialog.CommonButtons := [];
    Dialog.CustomButtons.Clear;
    Dialog.CustomButtons.Add('OK');
    Dialog.ExpandedText       := 'para maiores informações, consulte o suporte.' + #13 + 'Contato: ' + MsgEmpresaTelefone;
    Dialog.CollapsControlText := 'Ver detalhes';
    Dialog.ExpandControlText  := 'Ocultar Detalhes';
    Dialog.Execute;
  finally
    Dialog.Free;
  end;

end;

function InputWiPopup(ATitulo: string; AInputs: TObjectList; var ARetorno: TStrings): Boolean;
var
  loForm: TFrmDefaultPopup;
begin
  loForm := TFrmDefaultPopup.Create(Application);
  try
    loForm.gInputs  := AInputs;
    loForm.gTitulo  := ATitulo;
    loForm.gRetorno := ARetorno;
    Result          := loForm.ShowModal = mrOk;
  finally
    loForm.Free;
  end;
end;

procedure GetStateGridCols(aGridView: TcxGridDBTableView; var aStateCols: PStateCols);
var
  I: Integer;
begin
  SetLength(aStateCols, aGridView.ColumnCount);
  for I := 0 to aGridView.ColumnCount - 1 do
  begin
    aStateCols[I].LVisible       := aGridView.Columns[I].Visible;
    aStateCols[I].LVisibleCustom := aGridView.Columns[I].VisibleForCustomization;
  end;
end;

procedure SetStateGridCols(aGridView: TcxGridDBTableView; aStateCols: PStateCols);
var
  I: Integer;
begin
  for I := low(aStateCols) to High(aStateCols) do
  begin
    aGridView.Columns[I].Visible                 := aStateCols[I].LVisible;
    aGridView.Columns[I].VisibleForCustomization := aStateCols[I].LVisibleCustom;
  end;
end;

procedure SetStateGridColsTag(aGridView: TcxGridDBTableView; aVisible, AVisibleCustom: Boolean; ATag: Integer);
var
  I: Integer;
begin
  for I := 0 to aGridView.ColumnCount - 1 do
  begin
    if aGridView.Columns[I].Tag <> ATag then
      Continue;
    aGridView.Columns[I].Visible                 := aVisible;
    aGridView.Columns[I].VisibleForCustomization := AVisibleCustom;
  end;
end;

function SetExportRBPrinterPage(AReportBuilder: TppReport; AFileName: String): TSendExport;
begin
  Result                := TSendExport.Create;
  Result.AFileName      := AFileName;
  Result.AReportBuilder := AReportBuilder;

end;

function SetExportPDF(AHandleTargetPDF: HWND; AFileName: String): TSendExport;
begin
  Result                  := TSendExport.Create;
  Result.AFileName        := AFileName;
  Result.AHandleTargetPDF := AHandleTargetPDF;
end;

function SetExportPrinterPage(APrinterPage: TdxPrinterPage; AFileName: String): TSendExport;
begin
  Result              := TSendExport.Create;
  Result.AFileName    := AFileName;
  Result.APrinterPage := APrinterPage;
end;

procedure GetExportRBPrinterPage(ASendExport: TSendExport; var AReportBuilder: TppReport; var AFileName: String);
begin
  AFileName      := ASendExport.AFileName;
  AReportBuilder := ASendExport.AReportBuilder;
end;

procedure GetExportPDF(ASendExport: TSendExport; var AHandleTargetPDF: HWND; var AFileName: String);
begin
  AFileName        := ASendExport.AFileName;
  AHandleTargetPDF := ASendExport.AHandleTargetPDF;
end;

procedure GetExportPrinterPage(ASendExport: TSendExport; var APrinterPage: TdxPrinterPage; var AFileName: String);
begin
  AFileName    := ASendExport.AFileName;
  APrinterPage := ASendExport.APrinterPage;
end;

procedure EnviarEmailNormal(const sSmtpHost, sSmtpPort, sSmtpUser, sSmtpPasswd, sFrom, sTo, sAssunto: String; sMensagem: TStrings; SSL: Boolean; sCC, Anexos: TStrings; PedeConfirma, AguardarEnvio: Boolean; NomeRemetente: String; TLS: Boolean; StreamNFe: TStringStream; NomeArq: String);
var
  smtp      : TSMTPSend;
  msg_lines : TStringList;
  m         : TMimemess;
  p         : TMimepart;
  I         : Integer;
  CorpoEmail: TStringList;
begin

  msg_lines  := TStringList.Create;
  CorpoEmail := TStringList.Create;
  smtp       := TSMTPSend.Create;
  m          := TMimemess.Create;
  try
    p := m.AddPartMultipart('mixed', nil);
    if sMensagem <> nil then
    begin
      CorpoEmail.Text := sMensagem.Text;
      m.AddPartText(CorpoEmail, p);
    end;

    if StreamNFe <> nil then
      m.AddPartBinary(StreamNFe, NomeArq, p);

    if assigned(Anexos) then
      for I := 0 to Anexos.Count - 1 do
      begin
        m.AddPartBinaryFromFile(Anexos[I], p);
      end;

    m.header.tolist.Add(sTo);
    m.header.From    := sFrom;
    m.header.subject := sAssunto;
    m.EncodeMessage;
    msg_lines.Add(m.Lines.Text);

    smtp.UserName := sSmtpUser;
    smtp.Password := sSmtpPasswd;

    smtp.TargetHost := sSmtpHost;
    smtp.TargetPort := sSmtpPort;

    smtp.FullSSL := SSL;
    smtp.AutoTLS := SSL;

    if not smtp.Login then
      raise Exception.Create('SMTP ERROR: Login: ' + smtp.EnhCodeString + sLineBreak + smtp.FullResult.Text);

    if not smtp.MailFrom(sFrom, Length(sFrom)) then
      raise Exception.Create('SMTP ERROR: MailFrom: ' + smtp.EnhCodeString + sLineBreak + smtp.FullResult.Text);

    if not smtp.MailTo(sTo) then
      raise Exception.Create('SMTP ERROR: MailTo: ' + smtp.EnhCodeString + sLineBreak + smtp.FullResult.Text);

    if sCC <> nil then
    begin
      for I := 0 to sCC.Count - 1 do
      begin
        if not smtp.MailTo(sCC.Strings[I]) then
          raise Exception.Create('SMTP ERROR: MailTo: ' + smtp.EnhCodeString + sLineBreak + smtp.FullResult.Text);
      end;
    end;

    if not smtp.MailData(msg_lines) then
      raise Exception.Create('SMTP ERROR: MailData: ' + smtp.EnhCodeString + sLineBreak + smtp.FullResult.Text);

    if not smtp.Logout then
      raise Exception.Create('SMTP ERROR: Logout: ' + smtp.EnhCodeString + sLineBreak + smtp.FullResult.Text);
  finally
    msg_lines.Free;
    CorpoEmail.Free;
    smtp.Free;
    m.Free;
  end;
end;

function Iif(Teste: Boolean; ValorTrue, ValorFalse: String): String; overload;
begin
  If Teste then
    Result := ValorTrue
  else
    Result := ValorFalse;
end;

function Iif(Teste: Boolean; ValorTrue, ValorFalse: Double): Double;
begin
  If Teste then
    Result := ValorTrue
  else
    Result := ValorFalse;
end;

function Iif(Teste: Boolean; ValorTrue, ValorFalse: Integer): Integer;
begin
  If Teste then
    Result := ValorTrue
  else
    Result := ValorFalse;
end;

function ShellUnzip(zipfile, targetfolder: string; filter: string = ''): Boolean;
var
  shellobj         : Variant;
  srcfldr, destfldr: Variant;
  shellfldritems   : Variant;
begin
  shellobj := CreateOleObject('Shell.Application');

  srcfldr  := shellobj.NameSpace(zipfile);
  destfldr := shellobj.NameSpace(targetfolder);

  shellfldritems := srcfldr.Items;
  if (filter <> '') then
    shellfldritems.filter(SHCONTF_INCLUDEHIDDEN or SHCONTF_NONFOLDERS or SHCONTF_FOLDERS, filter);

  destfldr.CopyHere(shellfldritems, SHCONTCH_NOPROGRESSBOX or SHCONTCH_RESPONDYESTOALL);
end;

// counts the number of threads in the process
function NumProcessThreads: Integer;
var
  hsnapshot  : THandle;
  Te32       : TTHREADENTRY32;
  proch      : dword;
  procthreads: Integer;
begin
  procthreads := 0;

  proch := GetCurrentProcessID;

  hsnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0);

  Te32.dwSize := sizeof(TTHREADENTRY32);

  if Thread32First(hsnapshot, Te32) then
  begin
    if Te32.th32OwnerProcessID = proch then
      inc(procthreads);

    while Thread32Next(hsnapshot, Te32) do
    begin
      if Te32.th32OwnerProcessID = proch then
        inc(procthreads);
    end;
  end;
  CloseHandle(hsnapshot);
  Result := procthreads;
end;

function ShellZip(zipfile, sourcefolder: string; filter: string = ''): Boolean;
const
  emptyzip: array [0 .. 23] of byte = (80, 75, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
var
  ms               : TMemoryStream;
  shellobj         : Variant;
  srcfldr, destfldr: Variant;
  shellfldritems   : Variant;
  numt             : Integer;
begin
  if not FileExists(zipfile) then
  begin
    // create a new empty ZIP file
    ms := TMemoryStream.Create;
    ms.WriteBuffer(emptyzip, sizeof(emptyzip));
    ms.SaveToFile(zipfile);
    ms.Free;
  end;

  numt := NumProcessThreads;

  shellobj := CreateOleObject('Shell.Application');

  srcfldr  := shellobj.NameSpace(sourcefolder);
  destfldr := shellobj.NameSpace(zipfile);

  shellfldritems := srcfldr.Items;

  if (filter <> '') then
    shellfldritems.filter(SHCONTF_INCLUDEHIDDEN or SHCONTF_NONFOLDERS or SHCONTF_FOLDERS, filter);

  destfldr.CopyHere(shellfldritems, 0);

  // wait till all shell threads are terminated
  while NumProcessThreads <> numt do
  begin
    sleep(100);
  end;
end;

function GetDaysInMonth(Month, Year: Integer): Integer;
begin
  GetDaysInMonth := 0;
  case Month of
    1:
      GetDaysInMonth := 31;
    2:
      if Year mod 4 = 0 then
        GetDaysInMonth := 29
      else
        GetDaysInMonth := 28;
    3:
      GetDaysInMonth := 31;
    4:
      GetDaysInMonth := 30;
    5:
      GetDaysInMonth := 31;
    6:
      GetDaysInMonth := 30;
    7:
      GetDaysInMonth := 31;
    8:
      GetDaysInMonth := 31;
    9:
      GetDaysInMonth := 30;
    10:
      GetDaysInMonth := 31;
    11:
      GetDaysInMonth := 30;
    12:
      GetDaysInMonth := 31;
  end;
end;

function Control2Bitmap(Control_: TWinControl): TBitmap;
begin
  Result := TBitmap.Create;
  with Result do
  begin
    Height        := Control_.Height;
    Width         := Control_.Width;
    Canvas.Handle := CreateDC(nil, nil, nil, nil);
    Canvas.Lock;
    Control_.PaintTo(Canvas.Handle, 0, 0);
    Canvas.Unlock;
    DeleteDC(Canvas.Handle);
  end;
end;

function GetTextSimNao(aValue: Integer): String;
begin
  case aValue of
    0:
      Result := 'Não';
    1:
      Result := 'Sim';
  end;
end;

function ConvertBoolToInt(aValue: Boolean): Integer;
begin
  if aValue then
    Result := 1
  else
    Result := 0;
end;

function GetStateSlider(aValue: Integer): TAdvSmoothSliderState;
begin
  case aValue of
    0:
      Result := ssOff;
    1:
      Result := ssOn;
  end;
end;

function GetValueSlider(aState: TAdvSmoothSliderState): String;
begin
  case aState of
    ssOff:
      Result := '0';
    ssOn:
      Result := '1';
  end;
end;

function GetSliderInvertedValue(aState: TAdvSmoothSliderState): TAdvSmoothSliderState;
begin
  case aState of
    ssOff:
      Result := ssOn;
    ssOn:
      Result := ssOff;
  end;
end;

procedure DeleteArrayItem(var A: TArray; const Index: Cardinal);
var
  ALength: Cardinal;
  I      : Cardinal;
begin
  ALength := Length(A);
  Assert(ALength > 0);
  Assert(Index < ALength);
  for I      := Index + 1 to ALength - 1 do
    A[I - 1] := A[I];
  SetLength(A, ALength - 1);
end;

function bintostr(const bin: array of byte): string;
const
  HexSymbols = '0123456789ABCDEF';
var
  I: Integer;
begin
  SetLength(Result, 2 * Length(bin));
  for I := 0 to Length(bin) - 1 do
  begin
    Result[1 + 2 * I + 0] := HexSymbols[1 + bin[I] shr 4];
    Result[1 + 2 * I + 1] := HexSymbols[1 + bin[I] and $0F];
  end;
end;

function Base64Encode(const Text: TidBytes): AnsiString;
var
  Encoder: TIdEncoderMime;
begin
  Encoder := TIdEncoderMime.Create(nil);
  Result  := Encoder.EncodeBytes(Text);
  FreeAndNil(Encoder);
end;

function Base64Decode(const EncodedText: string): TBytes;
var
  DecodedStm: TBytesStream;
  Decoder   : TIdDecoderMIME;
begin
  Decoder := TIdDecoderMIME.Create(nil);
  try
    DecodedStm := TBytesStream.Create;
    try
      Decoder.DecodeBegin(DecodedStm);
      Decoder.Decode(EncodedText);
      Decoder.DecodeEnd;
      Result := DecodedStm.Bytes;
      SetLength(Result, DecodedStm.Size); // add this line
    finally
      DecodedStm.Free;
    end;
  finally
    Decoder.Free;
  end;
end;

procedure GetIPAddress(out AHostName, IPAddress: String);
var
  p : pHostEnt;
  s : array [0 .. 128] of char;
  p2: pAnsiChar;
begin
  GetHostName(@s, 128);
  p         := GetHostByName(@s);
  p2        := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
  AHostName := p.h_Name;
  IPAddress := p2;
end;

function FileExistsWithFilter(aDir, aExtension: string): Boolean;
var
  sr: TSearchRec;
begin
  Result := false;
  if FindFirst(aDir + aExtension, faAnyFile, sr) = 0 then
    repeat
      Result := true;
      break;
    until FindNext(sr) <> 0;
  SysUtils.FindClose(sr);
end;

procedure SetRegistryValue(Folder, KeyName, KeyValue: string);
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;

  Registry.RootKey := HKEY_LOCAL_MACHINE;

  Registry.OpenKey('Software\Simatech\' + Folder, true);
  Registry.WriteString(KeyName, KeyValue);
  Registry.Free;
end;

function GetRegistryValue(Folder, KeyName: string): string;
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;

  Registry.RootKey := HKEY_LOCAL_MACHINE;

  Registry.OpenKey('SOFTWARE\Simatech\' + Folder, false);
  Result := Registry.ReadString(KeyName);
  // if Result = '' then
  // SetRegistryValue(folder, KeyName, '');

  Registry.Free;
end;

Function GetTemporaryDir: String;
var
  pNetpath: ARRAY [0 .. MAX_path - 1] of char;
  nlength : Cardinal;
begin
  nlength := MAX_path;
  FillChar(pNetpath, sizeof(pNetpath), #0);
  GetTemppath(nlength, pNetpath);
  Result := StrPas(pNetpath);
end;

function GetTempDir: String;
var
  tempFolder: array [0 .. MAX_path] of char;
begin
  GetTemppath(MAX_path, @tempFolder);
  Result := StrPas(tempFolder);
end;

function GetWinDir: string;
var
  dir: array [0 .. MAX_path] of char;
begin
  GetWindowsDirectory(dir, MAX_path);
  Result := StrPas(dir);
end;

function SystemDir: string;
var
  dir: array [0 .. MAX_path] of char;
begin
  GetSystemDirectory(dir, MAX_path);
  Result := StrPas(dir);
end;

function GetPathInRegistry(aProdName, aPathLabel: String): String;
begin
  if (aPathLabel = 'InstallPath') or (aPathLabel = 'InstallPDA') or (aPathLabel = 'InstallPathPalm') then
    Result := GetRegistryValue(aProdName + '\', aPathLabel)
  else if (aPathLabel = 'Windows') then
    Result := GetWinDir
  else if (aPathLabel = 'System32') then
    Result := SystemDir
  else if (aPathLabel = '') then
    Result := ExtractFilePath(Application.ExeName)
  else
    Result := aPathLabel;

end;

function TextToOleData(const AText: string): OleVariant;
var
  nSize: Integer;
  pData: Pointer;
begin
  nSize := Length(AText);
  if nSize = 0 then
    Result := Null
  else
  begin
    Result := VarArrayCreate([0, nSize - 1], varByte);
    pData  := VarArrayLock(Result);
    try
      Move(Pchar(AText)^, pData^, nSize);
    finally
      VarArrayUnlock(Result);
    end;
  end;
end;

function OleDataToText(const AData: OleVariant): string;
var
  nSize: Integer;
  pData: Pointer;
begin
  if AData = Null then
    Result := ''
  else
  begin
    nSize := VarArrayHighBound(AData, 1) - VarArrayLowBound(AData, 1) + 1;
    SetLength(Result, nSize);
    pData := VarArrayLock(AData);
    try
      Move(pData^, Pchar(Result)^, nSize);
    finally
      VarArrayUnlock(AData);
    end;
  end;
end;

function StreamToString(AStream: TStream): string;
var
  SS: TStringStream;
begin
  if AStream <> nil then
  begin
    SS := TStringStream.Create('');
    try
      SS.CopyFrom(AStream, 0); // No need to position at 0 nor provide size
      Result := SS.DataString;
    finally
      SS.Free;
    end;
  end
  else
  begin
    Result := '';
  end;
end;

function MemoryStreamToOleVariant(Strm: TMemoryStream): OleVariant;
var
  Data: PByteArray;
begin
  Result := VarArrayCreate([0, Strm.Size - 1], varByte);
  Data   := VarArrayLock(Result);
  try
    Strm.Position := 0;
    Strm.ReadBuffer(Data^, Strm.Size);
  finally
    VarArrayUnlock(Result);
  end;
end;

function OleVariantToMemoryStream(OV: OleVariant): TMemoryStream;
var
  Data: PByteArray;
  Size: Integer;
begin
  Result := TMemoryStream.Create;
  try
    Size := VarArrayHighBound(OV, 1) - VarArrayLowBound(OV, 1) + 1;
    Data := VarArrayLock(OV);
    try
      Result.Position := 0;
      Result.WriteBuffer(Data^, Size);
    finally
      VarArrayUnlock(OV);
    end;
  except
    Result.Free;
    Result := nil;
  end;
end;

function Formatar(Texto: string; TamanhoDesejado: Integer; AcrescentarADireita: Boolean = true; CaracterAcrescentar: char = ' '): string;
{
  OBJETIVO: Eliminar caracteres inválidos e acrescentar caracteres à esquerda ou à direita do texto original para que a string resultante fique com o tamanho desejado

  Texto : Texto original
  TamanhoDesejado: Tamanho que a string resultante deverá ter
  AcrescentarADireita: Indica se o carácter será acrescentado à direita ou à esquerda
  TRUE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à direita
  Se o tamanho do texto for MAIOR que o desejado, eliminar últimos caracteres do texto
  FALSE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à esquerda
  Se o tamanho do texto for MAIOR que o desejado, eliminar primeiros caracteres do texto
  CaracterAcrescentar: Carácter que deverá ser acrescentado
}
var
  QuantidadeAcrescentar, TamanhoTexto, PosicaoInicial, I: Integer;

begin
  case CaracterAcrescentar of
    '0' .. '9', 'a' .. 'z', 'A' .. 'Z':
      ; { Não faz nada }
  else
    CaracterAcrescentar := ' ';
  end;

  Texto        := Trim(AnsiUpperCase(Texto));
  TamanhoTexto := Length(Texto);
  for I        := 1 to (TamanhoTexto) do
  begin
    if Pos(Texto[I], ' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
    begin
      case Texto[I] of
        'Á', 'À', 'Â', 'Ä', 'Ã':
          Texto[I] := 'A';
        'É', 'È', 'Ê', 'Ë':
          Texto[I] := 'E';
        'Í', 'Ì', 'Î', 'Ï':
          Texto[I] := 'I';
        'Ó', 'Ò', 'Ô', 'Ö', 'Õ':
          Texto[I] := 'O';
        'Ú', 'Ù', 'Û', 'Ü':
          Texto[I] := 'U';
        'Ç':
          Texto[I] := 'C';
        'Ñ':
          Texto[I] := 'N';
      else
        Texto[I] := ' ';
      end;
    end;
  end;

  QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
  if QuantidadeAcrescentar < 0 then
    QuantidadeAcrescentar := 0;
  if CaracterAcrescentar = '' then
    CaracterAcrescentar := ' ';
  if TamanhoTexto >= TamanhoDesejado then
    PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
  else
    PosicaoInicial := 1;

  if AcrescentarADireita then
    Texto := Copy(Texto, 1, TamanhoDesejado) + StringOfChar(CaracterAcrescentar, QuantidadeAcrescentar)
  else
    Texto := StringOfChar(CaracterAcrescentar, QuantidadeAcrescentar) + Copy(Texto, PosicaoInicial, TamanhoDesejado);

  Result := AnsiUpperCase(Texto);
end;

procedure DrawSketch(var aBitmap: TBitmap; B: string; OffSetX, OffSetY: Integer);
var
  I, j         : Integer;
  Width, Height: Integer;
  StrokeCount  : Integer;
  x, y         : Integer;
begin
  Width          := Ord(B[1]);
  Height         := Ord(B[2]);
  aBitmap.Width  := Width + 4;
  aBitmap.Height := Height + 4;
  // aBitmap.Canvas.Rectangle(0, 0, Width + 4, Height + 4);

  I := 3;
  while I <= Length(B) do
  begin
    StrokeCount := Ord(B[I + 1]);
    I           := I + 2;

    x := Ord(B[I]) + 2;     // + OffSetX;
    y := Ord(B[I + 1]) + 2; // + OffSetY;
    aBitmap.Canvas.MoveTo(x, y);
    I := I + 2;

    if StrokeCount = 1 then
      aBitmap.Canvas.Pixels[x, y] := aBitmap.Canvas.Pen.Color // Just a dot
    else
    begin
      for j := 2 to StrokeCount do
      begin
        x := Ord(B[I]) + 2;     // + OffSetX;
        y := Ord(B[I + 1]) + 2; // + OffSetY;
        aBitmap.Canvas.LineTo(x, y);
        I := I + 2;
      end;
      aBitmap.Canvas.Pixels[x, y] := aBitmap.Canvas.Pen.Color
      // End point of last line
    end;
  end;
end;

function LoadLookUpComboBox(aOwner: TComponent; aAdConnection: TFDConnection; acxGridDBColumn: TcxGridDBColumn; aSQL, aFieldNames, aFieldKeys: string; const aDefaultField: string = ''; const aDefaultValue: string = ''; const aReload: Boolean = true; const aListFieldIndex: Integer = 0;
  const aFieldsCaption: string = ''; const aFieldsWidth: string = ''): Variant;

  procedure SetDefault(aAdQuery: TFDQuery; LDefaultField, LDefaultValue: string);
  begin
    Result := UnAssigned;
    if LDefaultField = '' then
      Exit;

    if aAdQuery.FindField(LDefaultField) = nil then
      Exit;

    aAdQuery.First;
    while not aAdQuery.Eof do
    begin
      if aAdQuery.FieldByName(LDefaultField).AsString = LDefaultValue then
      begin
        Result := aAdQuery.FieldByName(aFieldKeys).AsString;
        break;
      end;
      aAdQuery.next;
    end;
  end;

var
  LADQuery     : TFDQuery;
  LDataSource  : TDataSource;
  LFieldCaption: string;
  LComp        : TComponent;
  I            : Integer;
  LFieldWidth  : string;
begin
  LComp := aOwner.FindComponent('ad_' + aOwner.Name + '_' + acxGridDBColumn.Name);

  if LComp <> nil then
  begin
    if aReload then
      TFDQuery(LComp).Open(aSQL)
    else
      TFDQuery(LComp).Refresh;
    SetDefault(TFDQuery(LComp), aDefaultField, aDefaultValue);
    Exit;
  end;
  LADQuery            := TFDQuery.Create(aOwner);
  LADQuery.Connection := aAdConnection;
  LADQuery.Name       := 'ad_' + aOwner.Name + '_' + acxGridDBColumn.Name;
  LADQuery.Open(aSQL);

  LDataSource         := TDataSource.Create(aOwner);
  LDataSource.Name    := 'do_' + aOwner.Name + '_' + acxGridDBColumn.Name;
  LDataSource.DataSet := LADQuery;

  if acxGridDBColumn.Properties.ClassNameIs('TcxLookupComboBoxProperties') then
  begin
    (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).ListSource := LDataSource;
    (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).ListFieldNames := aFieldNames;
    (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).KeyFieldNames := aFieldKeys;
    (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).ListFieldIndex := aListFieldIndex;
  end;

  for I := 0 to (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).ListColumns.Count - 1 do
  begin
    LFieldCaption := uGlobalLibWiBi.GetFieldInString(aFieldsCaption + ';', I + 1, ';');
    if LFieldCaption = 'null' then
      break;
    (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).ListColumns.Items[I].Caption := LFieldCaption;
  end;

  for I := 0 to (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).ListColumns.Count - 1 do
  begin
    LFieldWidth := uGlobalLibWiBi.GetFieldInString(aFieldsWidth + ';', I + 1, ';');
    if (LFieldWidth = 'null') or (LFieldWidth = '') then
      break;
    if I = 0 then
      (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).ListColumns.Items[I].SortOrder := TdxSortOrder.soAscending;
    (acxGridDBColumn.Properties as TcxLookupComboBoxProperties).ListColumns.Items[I].Width := StrToInt(LFieldWidth);
  end;

  SetDefault(LADQuery, aDefaultField, aDefaultValue);
end;

function LoadLookUpComboBox(aOwner: TComponent; aAdConnection: TFDConnection; acxDBTreeListColumn: TcxDBTreeListColumn; aSQL, aFieldNames, aFieldKeys: string; const aDefaultField: string = ''; const aDefaultValue: string = ''; const aReload: Boolean = true;
  const aListFieldIndex: Integer = 0): Variant;
  procedure SetDefault(aAdQuery: TFDQuery; LDefaultField, LDefaultValue: string);
  begin
    Result := UnAssigned;
    if LDefaultField = '' then
      Exit;

    if aAdQuery.FindField(LDefaultField) = nil then
      Exit;

    aAdQuery.First;
    while not aAdQuery.Eof do
    begin
      if aAdQuery.FieldByName(LDefaultField).AsString = LDefaultValue then
      begin
        Result := aAdQuery.FieldByName(aFieldKeys).AsString;
        break;
      end;
      aAdQuery.next;
    end;
  end;

var
  LADQuery   : TFDQuery;
  LDataSource: TDataSource;
  LComp      : TComponent;
begin
  LComp := aOwner.FindComponent('ad_' + aOwner.Name + '_' + acxDBTreeListColumn.Name);

  if LComp <> nil then
  begin
    if aReload then
      TFDQuery(LComp).Open(aSQL)
    else
      TFDQuery(LComp).Refresh;
    SetDefault(TFDQuery(LComp), aDefaultField, aDefaultValue);
    Exit;
  end;
  LADQuery            := LADQuery.Create(aOwner);
  LADQuery.Connection := aAdConnection;
  LADQuery.Name       := 'ad_' + aOwner.Name + '_' + acxDBTreeListColumn.Name;
  LADQuery.Open(aSQL);

  LDataSource         := TDataSource.Create(aOwner);
  LDataSource.Name    := 'do_' + aOwner.Name + '_' + acxDBTreeListColumn.Name;
  LDataSource.DataSet := LADQuery;

  if acxDBTreeListColumn.Properties.ClassNameIs('TcxLookupComboBoxProperties') then
  begin
    (acxDBTreeListColumn.Properties as TcxLookupComboBoxProperties).ListSource := LDataSource;
    (acxDBTreeListColumn.Properties as TcxLookupComboBoxProperties).ListFieldNames := aFieldNames;
    (acxDBTreeListColumn.Properties as TcxLookupComboBoxProperties).KeyFieldNames := aFieldKeys;
    (acxDBTreeListColumn.Properties as TcxLookupComboBoxProperties).ListFieldIndex := aListFieldIndex;
  end;

  SetDefault(LADQuery, aDefaultField, aDefaultValue);
end;

function LoadLookUpComboBox(aOwner: TComponent; aAdConnection: TFDConnection; aLookUpCombo: TcxDBLookupComboBox; aSQL, aFieldNames, aFieldKeys: string; const aDefaultField: string = ''; const aDefaultValue: string = ''; const aReload: Boolean = true; const aListFieldIndex: Integer = 0;
  const aFieldsCaption: string = ''; const aFieldsWidth: string = ''): Variant;
  procedure SetDefault(aAdQuery: TFDQuery; LDefaultField, LDefaultValue: string);
  begin
    Result := UnAssigned;
    if LDefaultField = '' then
      Exit;
    if aAdQuery.FindField(LDefaultField) = nil then
      Exit;

    aAdQuery.First;
    while not aAdQuery.Eof do
    begin
      if aAdQuery.FieldByName(LDefaultField).AsString = LDefaultValue then
      begin
        Result := aAdQuery.FieldByName(aFieldKeys).AsString;
        break;
      end;
      aAdQuery.next;
    end;
  end;

var
  LADQuery     : TFDQuery;
  LDataSource  : TDataSource;
  LFieldCaption: string;
  I            : Integer;
  LFieldWidth  : string;
begin
  LADQuery    := TFDQuery(aOwner.FindComponent('ad_' + aOwner.Name + '_' + aLookUpCombo.Name));
  LDataSource := TDataSource(aOwner.FindComponent('do_' + aOwner.Name + '_' + aLookUpCombo.Name));

  if LADQuery <> nil then
  begin
    if aReload then
      LADQuery.Open(aSQL)
    else
      LADQuery.Refresh;
    SetDefault(LADQuery, aDefaultField, aDefaultValue);
  end
  else
  begin
    LADQuery            := TFDQuery.Create(aOwner);
    LADQuery.Connection := aAdConnection;
    LADQuery.Name       := 'ad_' + aOwner.Name + '_' + aLookUpCombo.Name;
    LADQuery.Open(aSQL);

    LDataSource         := TDataSource.Create(aOwner);
    LDataSource.Name    := 'do_' + aOwner.Name + '_' + aLookUpCombo.Name;
    LDataSource.DataSet := LADQuery;

    aLookUpCombo.Properties.ListSource     := LDataSource;
    aLookUpCombo.Properties.ListFieldNames := aFieldNames;
    aLookUpCombo.Properties.KeyFieldNames  := aFieldKeys;
    aLookUpCombo.Properties.ListFieldIndex := aListFieldIndex;
  end;

  for I := 0 to aLookUpCombo.Properties.ListColumns.Count - 1 do
  begin
    LFieldCaption := uGlobalLibWiBi.GetFieldInString(aFieldsCaption + ';', I + 1, ';');
    if LFieldCaption = 'null' then
      break;
    aLookUpCombo.Properties.ListColumns.Items[I].Caption := LFieldCaption;
  end;

  for I := 0 to aLookUpCombo.Properties.ListColumns.Count - 1 do
  begin
    LFieldWidth := uGlobalLibWiBi.GetFieldInString(aFieldsWidth + ';', I + 1, ';');
    if (LFieldWidth = 'null') or (LFieldWidth = '') then
      break;
    if I = 0 then
      aLookUpCombo.Properties.ListColumns.Items[I].SortOrder := TdxSortOrder.soAscending;
    aLookUpCombo.Properties.ListColumns.Items[I].Width := StrToInt(LFieldWidth);
  end;

  SetDefault(LADQuery, aDefaultField, aDefaultValue);
end;

function LoadLookUpComboBox(aOwner: TComponent; aAdConnection: TFDConnection; aLookUpCombo: TcxLookupComboBox; aSQL, aFieldNames, aFieldKeys: string; const aDefaultField: string = ''; const aDefaultValue: string = ''; const aReload: Boolean = true; const aListFieldIndex: Integer = 0;
  const aFieldsCaption: string = ''; const aFieldsWidth: string = ''): Variant;
  procedure SetDefault(aAdQuery: TFDQuery; LDefaultField, LDefaultValue: string);
  begin
    Result := UnAssigned;
    if LDefaultField = '' then
      Exit;
    if aAdQuery.FindField(LDefaultField) = nil then
      Exit;

    aAdQuery.First;
    while not aAdQuery.Eof do
    begin
      if aAdQuery.FieldByName(LDefaultField).AsString = LDefaultValue then
      begin
        Result := aAdQuery.FieldByName(aFieldKeys).AsString;
        break;
      end;
      aAdQuery.next;
    end;
  end;

var
  LadLoad    : TFDQuery;
  LDataSource: TDataSource;
  // LComp        : TComponent;
  LFieldCaption: string;
  I            : Integer;
  LFieldWidth  : string;
begin
  LadLoad     := TFDQuery(aOwner.FindComponent('ad_' + aOwner.Name + '_' + aLookUpCombo.Name));
  LDataSource := TDataSource(aOwner.FindComponent('do_' + aOwner.Name + '_' + aLookUpCombo.Name));

  if LadLoad <> nil then
  begin
    if aReload then
      LadLoad.Open(aSQL)
    else
      LadLoad.Refresh;
  end
  else
  begin
    LadLoad            := TFDQuery.Create(aOwner);
    LadLoad.Connection := aAdConnection;
    LadLoad.Name       := 'ad_' + aOwner.Name + '_' + aLookUpCombo.Name;
    LadLoad.Open(aSQL);

    LDataSource         := TDataSource.Create(aOwner);
    LDataSource.Name    := 'do_' + aOwner.Name + '_' + aLookUpCombo.Name;
    LDataSource.DataSet := LadLoad;
  end;

  aLookUpCombo.Properties.ListSource     := LDataSource;
  aLookUpCombo.Properties.ListFieldNames := aFieldNames;
  aLookUpCombo.Properties.KeyFieldNames  := aFieldKeys;
  aLookUpCombo.Properties.ListFieldIndex := aListFieldIndex;

  for I := 0 to aLookUpCombo.Properties.ListColumns.Count - 1 do
  begin
    LFieldCaption := uGlobalLibWiBi.GetFieldInString(aFieldsCaption + ';', I + 1, ';');
    if LFieldCaption = 'null' then
      break;
    aLookUpCombo.Properties.ListColumns.Items[I].Caption := LFieldCaption;
  end;

  for I := 0 to aLookUpCombo.Properties.ListColumns.Count - 1 do
  begin
    LFieldWidth := uGlobalLibWiBi.GetFieldInString(aFieldsWidth + ';', I + 1, ';');
    if (LFieldWidth = 'null') or (LFieldWidth = '') then
      break;
    aLookUpCombo.Properties.ListColumns.Items[I].Width := StrToInt(LFieldWidth);
  end;

  SetDefault(LadLoad, aDefaultField, aDefaultValue);
end;

procedure ChangeByteOrder(var Data; Size: Integer);
var
  ptr: Pchar;
  I  : Integer;
  c  : char;
begin
  ptr   := @Data;
  for I := 0 to (Size shr 1) - 1 do
  begin
    c          := ptr^;
    ptr^       := (ptr + 1)^;
    (ptr + 1)^ := c;
    inc(ptr, 2);
  end;
end;

function GetIdeDiskSerialNumber: string;
type
  TSrbIoControl = packed record
    HeaderLength: ULONG;
    Signature: array [0 .. 7] of char;
    Timeout: ULONG;
    ControlCode: ULONG;
    ReturnCode: ULONG;
    Length: ULONG;
  end;

  SRB_IO_CONTROL = TSrbIoControl;
  PSrbIoControl  = ^TSrbIoControl;

  TIDERegs = packed record
    bFeaturesReg: byte;     // especificar "comandos" SMART
    bSectorCountReg: byte;  // registro de contador de setor
    bSectorNumberReg: byte; // registro de número de setores
    bCylLowReg: byte;       // valor de cilindro (byte mais baixo)
    bCylHighReg: byte;      // valor de cilindro (byte mais alto)
    bDriveHeadReg: byte;    // registro de drive/cabeça
    bCommandReg: byte;      // comando IDE
    bReserved: byte;        // reservado- tem que ser zero
  end;

  IDEREGS  = TIDERegs;
  PIDERegs = ^TIDERegs;

  TSendCmdInParams = packed record
    cBufferSize: dword;
    irDriveRegs: TIDERegs;
    bDriveNumber: byte;
    bReserved: array [0 .. 2] of byte;
    dwReserved: array [0 .. 3] of dword;
    bBuffer: array [0 .. 0] of byte;
  end;

  SENDCMDINPARAMS  = TSendCmdInParams;
  PSendCmdInParams = ^TSendCmdInParams;

  TIdSector = packed record
    wGenConfig: Word;
    wNumCyls: Word;
    wReserved: Word;
    wNumHeads: Word;
    wBytesPerTrack: Word;
    wBytesPerSector: Word;
    wSectorsPerTrack: Word;
    wVendorUnique: array [0 .. 2] of Word;
    sSerialNumber: array [0 .. 19] of char;
    wBufferType: Word;
    wBufferSize: Word;
    wECCSize: Word;
    sFirmwareRev: array [0 .. 7] of char;
    sModelNumber: array [0 .. 39] of char;
    wMoreVendorUnique: Word;
    wDoubleWordIO: Word;
    wCapabilities: Word;
    wReserved1: Word;
    wPIOTiming: Word;
    wDMATiming: Word;
    wBS: Word;
    wNumCurrentCyls: Word;
    wNumCurrentHeads: Word;
    wNumCurrentSectorsPerTrack: Word;
    ulCurrentSectorCapacity: ULONG;
    wMultSectorStuff: Word;
    ulTotalAddressableSectors: ULONG;
    wSingleWordDMA: Word;
    wMultiWordDMA: Word;
    bReserved: array [0 .. 127] of byte;
  end;

  PIdSector = ^TIdSector;

const
  IDE_ID_FUNCTION              = $EC;
  IDENTIFY_BUFFER_SIZE         = 512;
  DFP_RECEIVE_DRIVE_DATA       = $0007C088;
  IOCTL_SCSI_MINIPORT          = $0004D008;
  IOCTL_SCSI_MINIPORT_IDENTIFY = $001B0501;
  DataSize                     = sizeof(TSendCmdInParams) - 1 + IDENTIFY_BUFFER_SIZE;
  BufferSize                   = sizeof(SRB_IO_CONTROL) + DataSize;
  W9xBufferSize                = IDENTIFY_BUFFER_SIZE + 16;
var
  hDevice        : THandle;
  cbBytesReturned: dword;
  pInData        : PSendCmdInParams;
  pOutData       : Pointer; // PSendCmdOutParams
  Buffer         : array [0 .. BufferSize - 1] of byte;
  srbControl     : TSrbIoControl absolute Buffer;

begin
  Result := '';
  FillChar(Buffer, BufferSize, #0);

  if Win32Platform = VER_PLATFORM_WIN32_NT then
  // Windows NT, Windows 2000, Windows XP
  begin
    // recuperar handle da porta SCSI
    hDevice := CreateFile('\\.\Scsi0:',
      // Nota: '\\.\C:' precisa de privilégios administrativos
      GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
    if hDevice = INVALID_HANDLE_VALUE then
    begin
      if Trim(Result) = '' then
        Result := GetIdeDiskSerialNumber2;
      Exit;
    end;
    try
      srbControl.HeaderLength := sizeof(SRB_IO_CONTROL);
      System.Move('SCSIDISK', srbControl.Signature, 8);
      srbControl.Timeout     := 2;
      srbControl.Length      := DataSize;
      srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
      pInData                := PSendCmdInParams(Pchar(@Buffer) + sizeof(SRB_IO_CONTROL));
      pOutData               := pInData;
      with pInData^ do
      begin
        cBufferSize  := IDENTIFY_BUFFER_SIZE;
        bDriveNumber := 0;
        with irDriveRegs do
        begin
          bFeaturesReg     := 0;
          bSectorCountReg  := 1;
          bSectorNumberReg := 1;
          bCylLowReg       := 0;
          bCylHighReg      := 0;
          bDriveHeadReg    := $A0;
          bCommandReg      := IDE_ID_FUNCTION;
        end;
      end;
      if not DeviceIoControl(hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil) then
      begin
        if Trim(Result) = '' then
          Result := GetIdeDiskSerialNumber2;
        Exit;
      end;

    finally
      CloseHandle(hDevice);
    end;
  end
  else
  begin
    // Windows 95 OSR2, Windows 98, Windows ME
    hDevice := CreateFile('\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0);
    if hDevice = INVALID_HANDLE_VALUE then
    begin
      if Trim(Result) = '' then
        Result := GetIdeDiskSerialNumber2;
      Exit;
    end;

    try
      pInData  := PSendCmdInParams(@Buffer);
      pOutData := @pInData^.bBuffer;
      with pInData^ do
      begin
        cBufferSize  := IDENTIFY_BUFFER_SIZE;
        bDriveNumber := 0;
        with irDriveRegs do
        begin
          bFeaturesReg     := 0;
          bSectorCountReg  := 1;
          bSectorNumberReg := 1;
          bCylLowReg       := 0;
          bCylHighReg      := 0;
          bDriveHeadReg    := $A0;
          bCommandReg      := IDE_ID_FUNCTION;
        end;
      end;
      if not DeviceIoControl(hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, sizeof(TSendCmdInParams) - 1, pOutData, W9xBufferSize, cbBytesReturned, nil) then
      begin
        if Trim(Result) = '' then
          Result := GetIdeDiskSerialNumber2;
        Exit;
      end;

    finally
      CloseHandle(hDevice);
    end;
  end;
  with PIdSector(Pchar(pOutData) + 16)^ do
  begin
    ChangeByteOrder(sSerialNumber, sizeof(sSerialNumber));
    SetString(Result, sSerialNumber, sizeof(sSerialNumber));
  end;
  if Trim(Result) = '' then
    Result := GetIdeDiskSerialNumber2;
end;

function GetIdeDiskSerialNumber2: string;
var
  Serial       : dword;
  DirLen, Flags: dword;
  DLabel       : array [0 .. 11] of char;
begin
  try
    GetVolumeInformation('C:\', DLabel, 12, @Serial, DirLen, Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  except
    Result := '';
  end;
end;


// function GetColumnIdx(aGrid: TcxGrid; aView: TcxGridDBTableView; aColumnId: integer): Integer;
// var
// i: Integer;
// begin
// if aView = nil then
// aView := TcxGridDBTableView(aGrid.ActiveView);
//
/// /  if VarType(columnId) = varOleStr then
/// /  begin
/// /    for i := 0 to aView.ColumnCount - 1 do
/// /      if aView.Columns[i].Caption = columnId then
/// /        Result := aView.Columns[i];
/// /  end
/// /  else
// for i := 0 to aView.ColumnCount - 1 do
// if aView.Columns[i].ID = aColumnId then
// Result := aView.Columns[i];
// end;

function GetCellValue(aGrid: TcxGrid; aView: TcxGridDBTableView; aRecordIndex, aColumnId: Integer): Variant;
// var
// LCol: TcxGridDBColumn;
// LRow: TcxCustomGridRow;
begin
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  // LCol := GetColumnIdx(aGrid, aView, aColumnId);
  // LRow := aView.ViewData.Rows[aRowIndex];

  Result := aView.DataController.DisplayTexts[aRecordIndex, aColumnId];
end;

function GetGridColumnsNamesForFilterWhere(aGrid: TcxGrid; aView: TcxGridDBTableView; aTypeWhere: String): string;
  function GetSymbol(aField: TField): String;
  begin
    case aField.DataType of
      ftString, ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo:
        Result := ' LIKE %s';
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := ' LIKE %d';
    else
      Result := ' LIKE %s';
    end;
  end;

  function GetFormat(aField: TField): String;
  begin
    case aField.DataType of
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := Format('%s', [aField.FullName]);
    else
      Result := aField.FullName;
    end;
  end;

var
  I     : Integer;
  LNames: string;
begin
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  for I := 0 to aView.ColumnCount - 1 do
  begin
    if aView.Columns[I].DataBinding.Field = nil then
      Continue;

    if (((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0)) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + '(' + GetFormat(aView.Columns[I].DataBinding.Field) + GetSymbol(aView.Columns[I].DataBinding.Field) + ' ) or ';
  end;
  { aTypeWhere - AND -> OR }
  LNames := ' ' + aTypeWhere + ' (' + Copy(LNames, 1, StrLen(Pchar(LNames)) - 4) + ')';
  Result := LNames;
end;

function GetGridColumnsNamesForPGWhere(aGrid: TcxGrid; aView: TcxGridDBTableView; aTypeWhere: String): string;
  function GetSymbol(aField: TField): String;
  begin
    case aField.DataType of
      ftString, ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo:
        Result := ' LIKE %s';
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := ' LIKE %d';
    else
      Result := ' LIKE %s';
    end;
  end;

  function GetFormat(aField: TField): String;
  begin
    case aField.DataType of
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := Format('CAST(%s AS TEXT)', [aField.FullName]);
    else
      Result := aField.FullName;
    end;
  end;

var
  I     : Integer;
  LNames: string;
begin
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  for I := 0 to aView.ColumnCount - 1 do
  begin
    if aView.Columns[I].DataBinding.Field = nil then
      Continue;

    if (((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0)) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + '(' + GetFormat(aView.Columns[I].DataBinding.Field) + GetSymbol(aView.Columns[I].DataBinding.Field) + ' ) or ';
  end;
  { aTypeWhere - AND -> OR }
  LNames := ' ' + aTypeWhere + ' (' + Copy(LNames, 1, StrLen(Pchar(LNames)) - 4) + ')';
  Result := LNames;
end;

function GetGridColumnsNamesForSQLWhere(aView: TcxGridServerModeTableView; aTypeWhere: String): string;
  function GetSymbol(aField: TField): String;
  begin
    case aField.DataType of
      ftString, ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo:
        Result := ' collate SQL_Latin1_General_CP1_CI_AI LIKE %s';
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := ' LIKE %d';
    else
      Result := ' LIKE %s';
    end;
  end;

var
  I     : Integer;
  LNames: string;
begin
  for I := 0 to aView.ColumnCount - 1 do
  begin
    if aView.Columns[I].DataBinding.Field = nil then
      Continue;

    if (((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0)) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + '(' + aView.Columns[I].DataBinding.FieldName + GetSymbol(aView.Columns[I].DataBinding.Field) + ' ) or ';
  end;
  { aTypeWhere - AND -> OR }
  LNames := ' ' + aTypeWhere + ' (' + Copy(LNames, 1, StrLen(Pchar(LNames)) - 4) + ')';

  Result := LNames;
end;

function GetGridColumnsNamesForSQLWhere(aView: TcxGridDBTableView; aTypeWhere: String): string;
  function GetSymbol(aField: TField): String;
  begin
    case aField.DataType of
      ftString, ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo:
        Result := ' collate SQL_Latin1_General_CP1_CI_AI LIKE %s';
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := ' LIKE %d';
    else
      Result := ' LIKE %s';
    end;
  end;

var
  I     : Integer;
  LNames: string;
begin
  for I := 0 to aView.ColumnCount - 1 do
  begin
    if aView.Columns[I].DataBinding.Field = nil then
      Continue;

    if (((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0)) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + '(' + aView.Columns[I].DataBinding.FieldName + GetSymbol(aView.Columns[I].DataBinding.Field) + ' ) or ';
  end;
  { aTypeWhere - AND -> OR }
  LNames := ' ' + aTypeWhere + ' (' + Copy(LNames, 1, StrLen(Pchar(LNames)) - 4) + ')';

  Result := LNames;
end;

function GetGridColumnsNamesForSQLWhere(aGrid: TcxGrid; aView: TcxGridServerModeTableView; aTypeWhere: String): string;
  function GetSymbol(aField: TField): String;
  begin
    case aField.DataType of
      ftString, ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo:
        Result := ' collate SQL_Latin1_General_CP1_CI_AI LIKE %s';
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := ' LIKE %d';
    else
      Result := ' LIKE %s';
    end;
  end;

var
  I     : Integer;
  LNames: string;
begin
  if aView = nil then
    aView := TcxGridServerModeTableView(aGrid.ActiveView);

  for I := 0 to aView.ColumnCount - 1 do
  begin
    if aView.Columns[I].DataBinding.Field = nil then
      Continue;

    if (((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0)) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + '(' + aView.Columns[I].DataBinding.FieldName + GetSymbol(aView.Columns[I].DataBinding.Field) + ' ) or ';
  end;
  { aTypeWhere - AND -> OR }
  LNames := ' ' + aTypeWhere + ' (' + Copy(LNames, 1, StrLen(Pchar(LNames)) - 4) + ')';

  Result := LNames;
end;

function GetGridColumnsNamesForSQLWhere(aGrid: TcxGrid; aView: TcxGridDBTableView; aTypeWhere: String): string;
  function GetSymbol(aField: TField): String;
  begin
    case aField.DataType of
      ftString, ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo:
        Result := ' collate SQL_Latin1_General_CP1_CI_AI LIKE %s';
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := ' LIKE %d';
    else
      Result := ' LIKE %s';
    end;
  end;

var
  I     : Integer;
  LNames: string;
begin
  LNames := '';
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  for I := 0 to aView.ColumnCount - 1 do
  begin
    if aView.Columns[I].DataBinding.Field = nil then
      Continue;

    if (((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0)) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + '(' + aView.Columns[I].DataBinding.FieldName + GetSymbol(aView.Columns[I].DataBinding.Field) + ' ) or ';
  end;
  { aTypeWhere - AND -> OR }
  if LNames <> '' then
    LNames := ' ' + aTypeWhere + ' (' + Copy(LNames, 1, StrLen(Pchar(LNames)) - 4) + ')';

  Result := LNames;
end;

function GetGridColumnsNamesForFilter(aGrid: TcxGrid; aView: TcxGridDBTableView; aTypeWhere: String): string;
  function GetSymbol(aField: TField): String;
  begin
    case aField.DataType of
      ftString, ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo:
        Result := ' LIKE %s';
      ftExtended, ftSingle, ftLargeint, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftFMTBcd, ftLongWord, ftShortint, ftByte:
        Result := ' LIKE %d';
    else
      Result := ' LIKE %s';
    end;
  end;

var
  I     : Integer;
  LNames: string;
begin
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  for I := 0 to aView.ColumnCount - 1 do
  begin
    if aView.Columns[I].DataBinding.Field = nil then
      Continue;

    if (((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0)) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + '(UPPER(' + aView.Columns[I].DataBinding.FieldName + ') ' + GetSymbol(aView.Columns[I].DataBinding.Field) + ' ) or ';
  end;
  { aTypeWhere - AND -> OR }
  LNames := ' ' + aTypeWhere + ' (' + Copy(LNames, 1, StrLen(Pchar(LNames)) - 4) + ')';

  Result := LNames;
end;

function GetGridColumnsFieldName(aGrid: TcxGrid; aView: TcxGridDBTableView): string;
var
  I     : Integer;
  LNames: string;
begin
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  for I := 0 to aView.ColumnCount - 1 do
    if aView.Columns[I].DataBinding.FieldName <> '' then
      LNames := LNames + aView.Columns[I].DataBinding.FieldName + ',';

  LNames := Copy(LNames, 1, StrLen(Pchar(LNames)) - 1);

  Result := LNames;
end;

function GetGridColumnsFieldNameGrouped(aGrid: TcxGrid; aView: TcxGridServerModeTableView; aZero: Boolean = false): string;
var
  I     : Integer;
  LNames: string;
begin
  if aView = nil then
    aView := TcxGridServerModeTableView(aGrid.ActiveView);

  if aZero then
  begin
    for I := 0 to aView.ColumnCount - 1 do
      if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and ((aView.Columns[I].Tag = 0) or (aView.Columns[I].Tag = 1000)) then
        if aView.Columns[I].DataBinding.FieldName <> '' then
          LNames := LNames + 'null as ' + aView.Columns[I].DataBinding.FieldName + ',';
  end
  else
  begin
    for I := 0 to aView.ColumnCount - 1 do
      if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and ((aView.Columns[I].Tag = 0) or (aView.Columns[I].Tag = 1000)) then
        if aView.Columns[I].DataBinding.FieldName <> '' then
          LNames := LNames + aView.Columns[I].DataBinding.FieldName + ',';
  end;

  LNames := Copy(LNames, 1, StrLen(Pchar(LNames)) - 1);

  Result := LNames;
end;

{ Retorna todas as colunas visiveis do grid, desprezando todas que tiverem tag diferente de 0 }

function GetGridColumnsFieldNameGrouped(aGrid: TcxGrid; aView: TcxGridDBTableView; aZero: Boolean = false): string;
var
  I     : Integer;
  LNames: string;
begin
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  if aZero then
  begin
    for I := 0 to aView.ColumnCount - 1 do
      if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and ((aView.Columns[I].Tag = 0) or (aView.Columns[I].Tag = 1000)) then
        if aView.Columns[I].DataBinding.FieldName <> '' then
          LNames := LNames + 'null as ' + aView.Columns[I].DataBinding.FieldName + ',';
  end
  else
  begin
    for I := 0 to aView.ColumnCount - 1 do
      if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and ((aView.Columns[I].Tag = 0) or (aView.Columns[I].Tag = 1000)) then
        if aView.Columns[I].DataBinding.FieldName <> '' then
          LNames := LNames + aView.Columns[I].DataBinding.FieldName + ',';
  end;

  LNames := Copy(LNames, 1, StrLen(Pchar(LNames)) - 1);

  Result := LNames;
end;

function GetGridColumnsFieldNameGrouped(aView: TcxGridDBTableView; aZero: Boolean = false): string;
var
  I     : Integer;
  LNames: string;
begin
  if aZero then
  begin
    for I := 0 to aView.ColumnCount - 1 do
      if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and ((aView.Columns[I].Tag = 0) or (aView.Columns[I].Tag = 1000)) then
        if aView.Columns[I].DataBinding.FieldName <> '' then
          LNames := LNames + 'null as ' + aView.Columns[I].DataBinding.FieldName + ',';
  end
  else
  begin
    for I := 0 to aView.ColumnCount - 1 do
      if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and ((aView.Columns[I].Tag = 0) or (aView.Columns[I].Tag = 1000)) then
        if aView.Columns[I].DataBinding.FieldName <> '' then
          LNames := LNames + aView.Columns[I].DataBinding.FieldName + ',';
  end;

  LNames := Copy(LNames, 1, StrLen(Pchar(LNames)) - 1);

  Result := LNames;
end;

function GetGridColumnsFieldNameGrouped(aView: TcxGridServerModeTableView; aZero: Boolean = false): string;
var
  I     : Integer;
  LNames: string;
begin
  if aZero then
  begin
    for I := 0 to aView.ColumnCount - 1 do
      if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and ((aView.Columns[I].Tag = 0) or (aView.Columns[I].Tag = 1000)) then
        if aView.Columns[I].DataBinding.FieldName <> '' then
          LNames := LNames + 'null as ' + aView.Columns[I].DataBinding.FieldName + ',';
  end
  else
  begin
    for I := 0 to aView.ColumnCount - 1 do
      if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and ((aView.Columns[I].Tag = 0) or (aView.Columns[I].Tag = 1000)) then
        if aView.Columns[I].DataBinding.FieldName <> '' then
          LNames := LNames + aView.Columns[I].DataBinding.FieldName + ',';
  end;

  LNames := Copy(LNames, 1, StrLen(Pchar(LNames)) - 1);

  Result := LNames;
end;

function GetGridColumnsFieldNameGroupedForWhereSub(aGrid: TcxGrid; aView: TcxGridDBTableView; const aAlias: String = ''): string;
var
  I     : Integer;
  LNames: string;
  function GetDefaultType(aValueType: TcxValueTypeClass): String;
  begin
    Result := '0';
    if aValueType = TcxStringValueType then
      Result := QuotedStr('');
    if aValueType = TcxWideStringValueType then
      Result := QuotedStr('');
    if aValueType = TcxSmallintValueType then
      Result := '0';
    if aValueType = TcxIntegerValueType then
      Result := '0';
    if aValueType = TcxWordValueType then
      Result := '0';
    if aValueType = TcxBooleanValueType then
      Result := QuotedStr('');
    if aValueType = TcxFloatValueType then
      Result := '0';
    if aValueType = TcxCurrencyValueType then
      Result := '0';
    if aValueType = TcxDateTimeValueType then
      Result := QuotedStr('');
    if aValueType = TcxLargeIntValueType then
      Result := '0';
    if aValueType = TcxFMTBcdValueType then
      Result := '0';
    if aValueType = TcxSQLTimeStampValueType then
      Result := QuotedStr('');
    if aValueType = TcxVariantValueType then
      Result := QuotedStr('');
    if aValueType = TcxObjectValueType then
      Result := QuotedStr('');

  end;

begin
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  for I := 0 to aView.ColumnCount - 1 do
    if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + 'isnull(' + aView.Columns[I].DataBinding.FieldName + ',' + GetDefaultType(aView.Columns[I].DataBinding.ValueTypeClass) + ') = isnull(' + aAlias + '.' + aView.Columns[I].DataBinding.FieldName + ',' + GetDefaultType(aView.Columns[I].DataBinding.ValueTypeClass) + ') and ';

  LNames := Copy(LNames, 1, StrLen(Pchar(LNames)) - 5);

  Result := LNames;
end;

function GetGridColumnsFieldNameGroupedForWhereSubDirect(aGrid: TcxGrid; aView: TcxGridDBTableView): string;
var
  I     : Integer;
  LNames: string;
  function GetDefaultType(aValueType: TcxValueTypeClass): String;
  begin
    Result := '0';
    if aValueType = TcxStringValueType then
      Result := QuotedStr('');
    if aValueType = TcxWideStringValueType then
      Result := QuotedStr('');
    if aValueType = TcxSmallintValueType then
      Result := '0';
    if aValueType = TcxIntegerValueType then
      Result := '0';
    if aValueType = TcxWordValueType then
      Result := '0';
    if aValueType = TcxBooleanValueType then
      Result := QuotedStr('');
    if aValueType = TcxFloatValueType then
      Result := '0';
    if aValueType = TcxCurrencyValueType then
      Result := '0';
    if aValueType = TcxDateTimeValueType then
      Result := QuotedStr('');
    if aValueType = TcxLargeIntValueType then
      Result := '0';
    if aValueType = TcxFMTBcdValueType then
      Result := '0';
    if aValueType = TcxSQLTimeStampValueType then
      Result := QuotedStr('');
    if aValueType = TcxVariantValueType then
      Result := QuotedStr('');
    if aValueType = TcxObjectValueType then
      Result := QuotedStr('');

  end;
  function GetValueByType(aField: TField): String;
  begin
    Result := '0';
    case aField.DataType of
      ftWideMemo, ftVariant, ftWideString, ftMemo, ftString:
        Result := QuotedStr(aView.Columns[I].DataBinding.Field.AsString);
      ftSingle, ftShortint, ftLongWord, ftLargeint, ftAutoInc, ftSmallint, ftInteger, ftWord:
        Result := QuotedStr(aView.Columns[I].DataBinding.Field.AsString);
      ftBoolean:
        Result := QuotedStr(aView.Columns[I].DataBinding.Field.AsString);
      ftFMTBcd, ftBCD, ftCurrency, ftFloat, ftExtended:
        Result := SQLDouble(aView.Columns[I].DataBinding.Field.AsCurrency);
      ftDate, ftTimeStamp:
        Result := SQLServerDate(aView.Columns[I].DataBinding.Field.AsDateTime);
      ftTime:
        Result := QuotedStr(aView.Columns[I].DataBinding.Field.AsString);
      ftDateTime:
        Result := SQLServerDate(aView.Columns[I].DataBinding.Field.AsDateTime);
      ftVarBytes, ftBytes:
        Result := QuotedStr(aView.Columns[I].DataBinding.Field.AsString);
    end;
  end;

begin
  if aView = nil then
    aView := TcxGridDBTableView(aGrid.ActiveView);

  for I := 0 to aView.ColumnCount - 1 do
    if ((aView.Columns[I].Visible) or (aView.Columns[I].GroupIndex > -1)) and (aView.Columns[I].Tag = 0) then
      if aView.Columns[I].DataBinding.FieldName <> '' then
        LNames := LNames + 'isnull(' + aView.Columns[I].DataBinding.FieldName + ',' + GetDefaultType(aView.Columns[I].DataBinding.ValueTypeClass) + ') = isnull(' + GetValueByType(aView.Columns[I].DataBinding.Field) + ',' + GetDefaultType(aView.Columns[I].DataBinding.ValueTypeClass) + ') and ';

  LNames := Copy(LNames, 1, StrLen(Pchar(LNames)) - 5);

  Result := LNames;
end;

function GetPivotGridColumnsFieldNameGrouped(aPivotGrid: TcxDBPivotGrid; aZero: Boolean = false): string;
var
  I     : Integer;
  LNames: string;
begin
  if aZero then
  begin
    for I := 0 to aPivotGrid.FieldCount - 1 do
      if ((aPivotGrid.Fields[I].Visible) or (aPivotGrid.Fields[I].GroupIndex > -1)) and (aPivotGrid.Fields[I].Tag = 0) then
        if TcxDBPivotGridField(aPivotGrid.Fields[I]).DataBinding.FieldName <> '' then
          LNames := LNames + 'null as ' + TcxDBPivotGridField(aPivotGrid.Fields[I]).DataBinding.FieldName + ',';
  end
  else
  begin
    for I := 0 to aPivotGrid.FieldCount - 1 do
      if ((aPivotGrid.Fields[I].Visible) or (aPivotGrid.Fields[I].GroupIndex > -1)) and (aPivotGrid.Fields[I].Tag = 0) then
        if TcxDBPivotGridField(aPivotGrid.Fields[I]).DataBinding.FieldName <> '' then
          LNames := LNames + TcxDBPivotGridField(aPivotGrid.Fields[I]).DataBinding.FieldName + ',';
  end;

  LNames := Copy(LNames, 1, StrLen(Pchar(LNames)) - 1);

  Result := LNames;
end;

function GetOrdersGrid(aGridView: TcxGridDBTableView; const aVisibleOnly: Boolean = false): string;
var
  I: Integer;
begin
  for I := 0 to aGridView.SortedItemCount - 1 do
  begin
    if aVisibleOnly then
    begin
      if (aGridView.SortedItems[I].Visible) then
      begin
        case aGridView.SortedItems[I].SortOrder of
          TdxSortOrder.soAscending:
            Result := Result + TcxGridDBColumn(aGridView.SortedItems[I]).DataBinding.FieldName + ',';
          TdxSortOrder.soDescending:
            Result := Result + TcxGridDBColumn(aGridView.SortedItems[I]).DataBinding.FieldName + ' desc,';
        end;
      end;
    end
    else
    begin
      case aGridView.SortedItems[I].SortOrder of
        TdxSortOrder.soAscending:
          Result := Result + TcxGridDBColumn(aGridView.SortedItems[I]).DataBinding.FieldName + ',';
        TdxSortOrder.soDescending:
          Result := Result + TcxGridDBColumn(aGridView.SortedItems[I]).DataBinding.FieldName + ' desc,';
      end;
    end;
  end;
  Result := Copy(Result, 1, Length(Result) - 1);
  if Result = '' then
    Result := TcxGridDBColumn(aGridView.VisibleColumns[0]).DataBinding.FieldName;
  if Result = '' then
    if aGridView.GroupedColumnCount > 0 then
      Result := TcxGridDBColumn(aGridView.GroupedColumns[0]).DataBinding.FieldName;

end;

function FormatCharLen(aValue: string; aChar: char; aLen: Integer): string;
begin
  if aLen <= StrLen(Pchar(aValue)) then
    Result := aValue
  else
    Result := RepeatChar(aLen - StrLen(Pchar(aValue)), aChar) + aValue;
end;

procedure PostCacheFind(aClassOwner: TClass; aComponent: TComponent; aContent, aUserID: string);
begin
  if Trim(aContent) = 'Digite aqui para pesquisar' then
    Exit;
end;

function GetStringSQLConc(aStrSource, aStrModel: string): string;
var
  LValueField, LString: string;
  I                   : Integer;
  LTempStr            : string;
begin
  aStrSource := StringReplace(Trim(aStrSource), ' ', ';', [rfReplaceAll]);
  I          := 1;
  while true do
  begin
    LValueField := GetFieldInString(aStrSource + ';', I, ';');
    if LValueField = 'null' then
      break;
    LTempStr := StringReplace(aStrModel, '%s', QuotedStr('%' + UpperCase(LValueField) + '%'), [rfReplaceAll]);
    if IsNumeric(LValueField) then
      LString := LString + StringReplace(LTempStr, '%d', LValueField, [rfReplaceAll])
    else
      LString := LString + StringReplace(aStrModel, '%s', QuotedStr('%' + UpperCase(LValueField) + '%'), [rfReplaceAll]);
    inc(I);
  end;
  LString := StringReplace(LString, '%d', '-1', [rfReplaceAll]);
  LString := StringReplace(LString, '%s', QuotedStr(''), [rfReplaceAll]);
  Result  := LString;
end;

function GetStringPGSQLConc(aStrSource, aStrModel: string): string;
var
  LValueField, LString: string;
  I                   : Integer;
  LTempStr            : string;
begin
  aStrSource := StringReplace(Trim(aStrSource), ' ', ';', [rfReplaceAll]);
  I          := 1;
  while true do
  begin
    LValueField := GetFieldInString(aStrSource + ';', I, ';');
    if LValueField = 'null' then
      break;
    LTempStr := StringReplace(aStrModel, '%s', QuotedStr('%' + UpperCase(LValueField) + '%'), [rfReplaceAll]);
    if IsNumeric(LValueField) then
      LString := LString + StringReplace(LTempStr, '%d', QuotedStr('%' + LValueField), [rfReplaceAll])
    else
      LString := LString + StringReplace(aStrModel, '%s', QuotedStr('%' + UpperCase(LValueField) + '%'), [rfReplaceAll]);
    inc(I);
  end;
  LString := StringReplace(LString, '%d', QuotedStr('-1'), [rfReplaceAll]);
  LString := StringReplace(LString, '%s', QuotedStr(''), [rfReplaceAll]);
  Result  := LString;
end;

function GetSerialHD: string;
begin
  Result := Trim(GetIdeDiskSerialNumber);
end;

Function GetFileInfo2(Arquivo: string): string;
type
  PFFI = ^vs_FixedFileInfo;
var
  F       : PFFI;
  Handle  : dword;
  Len     : Longint;
  Data    : Pchar;
  Buffer  : Pointer;
  Tamanho : dword;
  Parquivo: Pchar;
begin
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len    := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '\', Buffer, Tamanho);
      F      := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs), LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs), LoWord(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

function GetFileInfo(FName, InfoType: string): string;
var
  Info    : Pointer;
  InfoData: Pointer;
  InfoSize: Longint;
  InfoLen : {$IFDEF WIN32} dword; {$ELSE} Longint; {$ENDIF}
DataLen: {$IFDEF WIN32} UInt; {$ELSE} Word; {$ENDIF}
LangPtr:
Pointer;
begin
  Result  := '';
  DataLen := 255;
  if Length(FName) <= 0 then
    Exit;
  FName    := FName + #0;
  InfoSize := GetFileVersionInfoSize(@FName[1], InfoLen);
  if (InfoSize > 0) then
  begin
    GetMem(Info, InfoSize);
    try
      if GetFileVersionInfo(@FName[1], InfoLen, InfoSize, Info) then
      begin
        if VerQueryValue(Info, '\VarFileInfo\Translation', LangPtr, DataLen) then
          InfoType := Format('\StringFileInfo\%0.4x%0.4x\%s'#0, [LoWord(Longint(LangPtr^)), HiWord(Longint(LangPtr^)), InfoType]);
        if VerQueryValue(Info, @InfoType[1], InfoData, DataLen) then
          Result := StrPas(pAnsiChar(InfoData));
      end;
    finally
      FreeMem(Info, InfoSize);
    end;
  end;
end;

function GetFileDateByType(AFileName: string; AType: Integer): String;
  function ReportTime(const Name: string; const FileTime: TFileTime): String;
  var
    SystemTime, LocalTime: TSystemTime;
  begin
    if not FileTimeToSystemTime(FileTime, SystemTime) then
      RaiseLastOSError;
    if not SystemTimeToTzSpecificLocalTime(nil, SystemTime, LocalTime) then
      RaiseLastOSError;
    Result := DateTimeToStr(SystemTimeToDateTime(LocalTime));
  end;

var
  fad: TWin32FileAttributeData;
begin
  if not GetFileAttributesEx(Pchar(AFileName), GetFileExInfoStandard, @fad) then
    RaiseLastOSError;
  case AType of
    1:
      Result := ReportTime('Created', fad.ftCreationTime);
    2:
      Result := ReportTime('Modified', fad.ftLastWriteTime);
    3:
      Result := ReportTime('Accessed', fad.ftLastAccessTime);
  end;
end;

function GetFileDate(AFileName: string): string;
var
  FHandle: Integer;
begin
  FHandle := FileOpen(AFileName, 0);
  try
    Result := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)));
  finally
    FileClose(FHandle);
  end;
end;

function FileLastModified(const TheFile: string): string;
var
  FileH           : THandle;
  LocalFT         : TFileTime;
  DosFT           : dword;
  LastAccessedTime: TDateTime;
  FindData        : TWin32FindData;
begin
  Result := '';
  FileH  := FindFirstFile(Pchar(TheFile), FindData);
  if FileH <> INVALID_HANDLE_VALUE then
  begin
    // Windows.FindClose();
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
      FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFT);
      FileTimeToDosDateTime(LocalFT, LongRec(DosFT).Hi, LongRec(DosFT).Lo);
      LastAccessedTime := FileDateToDateTime(DosFT);
      Result           := DateTimeToStr(LastAccessedTime);
    end;
  end;
end;

procedure SaveComponentToFile(Component: TComponent; const FileName: TFileName);
var
  FileStream: TFileStream;
  MemStream : TMemoryStream;
begin
  MemStream := nil;

  if not assigned(Component) then
    raise Exception.Create('Component is not assigned');

  FileStream := TFileStream.Create(FileName, fmCreate);
  try
    MemStream := TMemoryStream.Create;
    MemStream.WriteComponent(Component);
    MemStream.Position := 0;
    ObjectBinaryToText(MemStream, FileStream);
  finally
    MemStream.Free;
    FileStream.Free;
  end;
end;

procedure LoadComponentFromFile(Component: TComponent; const FileName: TFileName);
var
  FileStream: TFileStream;
  MemStream : TMemoryStream;
  I         : Integer;
begin
  MemStream := nil;

  if not assigned(Component) then
    raise Exception.Create('Component is not assigned');

  if FileExists(FileName) then
  begin
    FileStream := TFileStream.Create(FileName, fmOpenRead);
    try
      for I := Component.ComponentCount - 1 downto 0 do
      begin
        if Component.Components[I] is TControl then
          TControl(Component.Components[I]).Parent := nil;
        Component.Components[I].Free;
      end;

      MemStream := TMemoryStream.Create;
      ObjectTextToBinary(FileStream, MemStream);
      MemStream.Position := 0;
      MemStream.ReadComponent(Component);
      Application.InsertComponent(Component);
    finally
      MemStream.Free;
      FileStream.Free;
    end;
  end;
end;

procedure SaveComponentToStream(Component: TComponent; AStream: TStream);
var
  MemStream: TMemoryStream;
begin
  MemStream := nil;

  if not assigned(Component) then
    raise Exception.Create('Component is not assigned');

  try
    MemStream := TMemoryStream.Create;
    MemStream.WriteComponent(Component);
    MemStream.Position := 0;
    ObjectBinaryToText(MemStream, AStream);
  finally
    MemStream.Free;
  end;
end;

procedure LoadComponentFromStream(Component: TComponent; AStream: TStream);
var
  MemStream: TMemoryStream;
  I        : Integer;
begin
  MemStream := nil;


  // raise Exception.Create('Component is not assigned');

  try
    if assigned(Component) then
      for I := Component.ComponentCount - 1 downto 0 do
      begin
        if Component.Components[I] is TControl then
          TControl(Component.Components[I]).Parent := nil;
        Component.Components[I].Free;
      end;

    MemStream := TMemoryStream.Create;
    ObjectTextToBinary(AStream, MemStream);
    MemStream.Position := 0;
    MemStream.ReadComponent(Component);
    if Component <> nil then
      Application.InsertComponent(Component);
  finally
    MemStream.Free;
  end;
end;

function DesignLoadCompFromStream(AComp: TComponent; AStream: TStream; AOnError: TReaderError): TComponent;
var
  MemStream    : TMemoryStream;
  CompDesigning: Boolean;
begin
  MemStream := TMemoryStream.Create;
  try
    ObjectTextToBinary(AStream, MemStream);
    MemStream.Position := 0;
    with TReader.Create(MemStream, 4096) do
      try
        OnError := AOnError;
        { We have to set the container into design mode so all loaded components
          are in design mode. }
        CompDesigning := csDesigning in AComp.ComponentState;
        TAccessComponent(AComp).SetDesigning(true, false);
        try
          Result := ReadRootComponent(AComp);
        finally
          if not CompDesigning then
            TAccessComponent(AComp).SetDesigning(CompDesigning, false);
        end;
      finally
        Free;
      end;
  finally
    MemStream.Free;
  end;
end;

procedure DesignSaveCompToStream(AComp: TComponent; AStream: TStream);
var
  ms: TStringStream;
begin
  ms := TStringStream.Create;
  try
    ms.WriteComponent(AComp);
    ms.Position := 0;
    ObjectBinaryToText(ms, AStream);
  finally
    ms.Free;
  end;
end;

function Encrypt(cChave: string): string;
const
  Alfa: array [1 .. 70] of string = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '_', '+', '.', '/', ':', '\', ',', '-');
  Num: array [0 .. 9] of string    = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
  AlfaC: array [1 .. 70] of string = ('1e', '5c', '8a', '9b', '6e', '6h', '8j', '5b', '5e', '9q', '6f', '2g', '1h', '1p', '3q', '6i', '9s', '8n', '8z', '3b', '3m', '2k', '2l', '4p', '7s', '8k', '1E', '5C', '8A', '9B', '6E', '6H', '8J', '5B', '5E', '9Q', '6F', '2G', '1H', '1P', '3Q', '6I', '9S',
    '8N', '8Z', '3B', '3M', '2K', '2L', '4P', '7S', '8K', '=1', '_2', ')3', '(4', '*5', '&6', '¨7', '%8', '$9', '#0', '@1', '!2', '0i', '1i', '2i', '3i', '4i', '5i');
  NumC: array [0 .. 9] of string = ('1c', '5h', '5n', '3g', '7w', '2p', '6q', '4a', '8b', '9a');
var
  I, I2: Integer;
  res  : string;
begin
  res   := '';
  for I := 1 to Length(cChave) do
  begin
    for I2 := low(Alfa) to High(Alfa) do
      if StrComp(Pchar(Alfa[I2]), Pchar(Copy(cChave, I, 1))) = 0 then
        res := res + AlfaC[I2];
    for I2  := Low(Num) to High(Num) do
      if Copy(cChave, I, 1) = Num[I2] then
        res := res + NumC[I2];
  end;
  Result := res;
end;

function Decrypt(cChave: string): string;
const
  Alfa: array [1 .. 70] of string = ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '_', '+', '.', '/', ':', '\', ',', '-');
  Num: array [0 .. 9] of string    = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
  AlfaC: array [1 .. 70] of string = ('1e', '5c', '8a', '9b', '6e', '6h', '8j', '5b', '5e', '9q', '6f', '2g', '1h', '1p', '3q', '6i', '9s', '8n', '8z', '3b', '3m', '2k', '2l', '4p', '7s', '8k', '1E', '5C', '8A', '9B', '6E', '6H', '8J', '5B', '5E', '9Q', '6F', '2G', '1H', '1P', '3Q', '6I', '9S',
    '8N', '8Z', '3B', '3M', '2K', '2L', '4P', '7S', '8K', '=1', '_2', ')3', '(4', '*5', '&6', '¨7', '%8', '$9', '#0', '@1', '!2', '0i', '1i', '2i', '3i', '4i', '5i');
  NumC: array [0 .. 9] of string = ('1c', '5h', '5n', '3g', '7w', '2p', '6q', '4a', '8b', '9a');
var
  I, I2: Integer;
  res  : string;

begin
  res := '';
  I   := 1;
  while I < Length(cChave) do
  begin
    for I2 := low(Alfa) to High(Alfa) do
      if StrComp(Pchar(AlfaC[I2]), Pchar(Copy(cChave, I, 2))) = 0 then
        res := res + Alfa[I2];
    for I2  := low(Num) to High(Num) do
      if Copy(cChave, I, 2) = NumC[I2] then
        res := res + Num[I2];
    inc(I, 2)
  end;
  Result := res;
end;

function ConcColumnsValues(GridView: TcxCustomGridView; ColumnIndex: Integer; CountZeroLeft: Integer; Separator: string; SeparatorPos: TSeparatorPos): string;
var
  SQLValue: string;
  I       : Integer;
  FSource : string;
begin
  SQLValue := '';
  case SeparatorPos of
    spBeginning:
      for I := 0 to GridView.DataController.GetRowCount - 1 do
      begin
        FSource  := GridView.DataController.GetDisplayText(GridView.DataController.GetRowInfo(I).RecordIndex, ColumnIndex);
        SQLValue := SQLValue + Separator + RepeatChar(CountZeroLeft - Length(FSource), '0') + FSource;
      end;
    spEnd:
      begin
        for I      := 0 to GridView.DataController.GetRowCount - 1 do
          SQLValue := SQLValue + RepeatChar(CountZeroLeft - Length(FSource), '0') + FSource + Separator;
        SQLValue   := Copy(SQLValue, 1, Length(SQLValue) - 1);
      end;
  end;

  Result := SQLValue;
end;

function ConcColumnsValues(GridView: TcxCustomGridView; ColumnIndex: Integer): string;
var
  SQLValue: string;
  I       : Integer;
begin
  SQLValue   := '(';
  for I      := 0 to GridView.DataController.GetRowCount - 1 do
    SQLValue := SQLValue + QuotedStr(GridView.DataController.GetDisplayText(GridView.DataController.GetRowInfo(I).RecordIndex, ColumnIndex)) + ',';
  SQLValue   := Copy(SQLValue, 1, Length(SQLValue) - 1);
  SQLValue   := SQLValue + ')';
  if SQLValue = ')' then
    SQLValue := '(0)';
  Result     := SQLValue;
end;

function doApplyFilterCompareGridViews(aGridView1: TcxGridDBTableView; aGridView2: TcxGridDBTableView): string; overload;
var
  I: Integer;
  procedure FindColumnView(aGridView: TcxGridDBTableView; aFieldName: String);
  var
    I2: Integer;
  begin
    for I2 := 0 to aGridView.ColumnCount - 1 do
    begin
      if aGridView.Columns[I2].DataBinding.FieldName = aFieldName then
      begin
        aGridView.Columns[I2].Visible := true;

        aGridView.DataController.filter.AddItem(aGridView.DataController.filter.Root, aGridView.Columns[I2], TcxFilterOperatorKind(0), aGridView1.Columns[I].DataBinding.Field.AsVariant, aGridView1.Columns[I].DataBinding.Field.AsVariant);
      end;
    end;
  end;

begin
  for I := 0 to aGridView1.ColumnCount - 1 do
    if (aGridView1.Columns[I].Visible or (aGridView1.Columns[I].GroupIndex > -1)) then
      FindColumnView(aGridView2, aGridView1.Columns[I].DataBinding.FieldName);
end;

function ConcColumnsSelValues(GridView: TcxCustomGridView; ColumnIndex: Integer): string;
var
  SQLValue: string;
  I       : Integer;
begin
  SQLValue   := '(';
  for I      := 0 to GridView.DataController.GetSelectedCount - 1 do
    SQLValue := SQLValue + GridView.DataController.GetDisplayText(GridView.DataController.GetRowInfo(GridView.DataController.GetSelectedRowIndex(I)).RecordIndex, ColumnIndex) + ',';
  SQLValue   := Copy(SQLValue, 1, Length(SQLValue) - 1);
  SQLValue   := SQLValue + ')';
  if SQLValue = ')' then
    SQLValue := '(0)';
  Result     := SQLValue;
end;

function ConcColumnsSelValuesWithNames(GridView: TcxGridDBTableView): string;
var
  ColValues, loResult: string;
  iColIndex, I2      : Integer;
begin
  loResult      := '';
  for iColIndex := 0 to GridView.ColumnCount - 1 do
  begin
    if GridView.Columns[iColIndex].DataBinding.Field = nil then
      Continue;

    if (((GridView.Columns[iColIndex].Visible) or (GridView.Columns[iColIndex].GroupIndex > -1)) and (GridView.Columns[iColIndex].Tag = 0)) then
      if GridView.Columns[iColIndex].DataBinding.FieldName <> '' then
      begin
        ColValues   := '';
        for I2      := 0 to GridView.DataController.GetSelectedCount - 1 do
          ColValues := ColValues + QuotedStr(GridView.DataController.GetDisplayText(GridView.DataController.GetRowInfo(GridView.DataController.GetSelectedRowIndex(I2)).RecordIndex, iColIndex)) + ',';
        ColValues   := Copy(ColValues, 1, Length(ColValues) - 1);
        if ColValues = '' then
          ColValues := '(0)';
        loResult    := loResult + ' and ' + GridView.Columns[iColIndex].DataBinding.FieldName + ' in (' + ColValues + ')';
      end;
  end;

  Result := loResult;
end;

function ConcColumnsSelValuesCheckBox(GridView: TcxCustomGridView; ColumnIndex, AColCheckBox: Integer): string;
var
  SQLValue     : string;
  I            : Integer;
  loRecordIndex: Integer;
begin

  SQLValue := '(';
  for I    := 0 to GridView.DataController.GetRowCount - 1 do
  begin
    loRecordIndex := GridView.DataController.GetRowInfo(I).RecordIndex;
    if GridView.DataController.Values[loRecordIndex, AColCheckBox] = true then
      SQLValue := SQLValue + GridView.DataController.GetDisplayText(loRecordIndex, ColumnIndex) + ',';
  end;
  SQLValue := Copy(SQLValue, 1, Length(SQLValue) - 1);
  SQLValue := SQLValue + ')';
  if SQLValue = ')' then
    SQLValue := '(0)';
  Result     := SQLValue;
end;

function tbKeyIsDown(const Key: Integer): Boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

function ConcFields(LDataSet: TDataSet; FieldName, CharSeparator: string): string;
var
  FTmp: string;
begin
  if (not LDataSet.Active) or (FieldName = '') then
    Exit;
  try
    FTmp := '';
    while not LDataSet.Eof do
    begin
      FTmp := FTmp + LDataSet.FieldByName(FieldName).AsString + CharSeparator;
      LDataSet.next;
    end;
    FTmp := Copy(FTmp, 1, Length(FTmp) - 1);
  except
    Result := '0'
  end;
  Result := FTmp;
end;

function CalculaTime(Time1, Time2: TDateTime): string;
begin
  Result := FormatDateTime('hh:mm:ss:zzz', Time2 - Time1);
end;

function AjustaStr(str: string; tam: Integer): string;
begin
  while Length(str) < tam do
    str := str + ' ';
  if Length(str) > tam then
    str  := Copy(str, 1, tam);
  Result := str;
end;

function WordsCount(s: string): Integer;
var
  ps        : Pchar;
  nSpaces, n: Integer;
begin
  n  := 0;
  s  := s + #0;
  ps := @s[1];
  while (#0 <> ps^) do
  begin
    while ((' ' = ps^) and (#0 <> ps^)) do
    begin
      inc(ps);
    end;
    nSpaces := 0;
    while ((' ' <> ps^) and (#0 <> ps^)) do
    begin
      inc(nSpaces);
      inc(ps);
    end;
    if (nSpaces > 0) then
    begin
      inc(n);
    end;
  end;
  Result := n;
end;

procedure KillProcess(hWindowHandle: HWND);
var
  hprocessID   : Integer;
  processHandle: THandle;
  DWResult     : dword;
begin
  SendMessageTimeout(hWindowHandle, WM_CLOSE, 0, 0, SMTO_ABORTIFHUNG or SMTO_NORMAL, 5000, DWResult);

  if isWindow(hWindowHandle) then
  begin
    // PostMessage(hWindowHandle, WM_QUIT, 0, 0);

    { Get the process identifier for the window }
    GetWindowThreadProcessID(hWindowHandle, @hprocessID);
    if hprocessID <> 0 then
    begin
      { Get the process handle }
      processHandle := OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, false, hprocessID);
      if processHandle <> 0 then
      begin
        { Terminate the process }
        TerminateProcess(processHandle, 0);
        CloseHandle(processHandle);
      end;
    end;
  end;
end;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop   : BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result                 := 0;
  FSnapshotHandle        := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := sizeof(FProcessEntry32);
  ContinueLoop           := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      Result     := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure FAddNodeMerge(FMenuItemSource: TMenuItem; FMenuItemDest: TMenuItem; IsChild: Boolean; FOnClick: TNotifyEvent; AllowUserControl: Boolean);
var
  I       : Integer;
  FMenuTmp: TMenuItem;
begin
  FMenuTmp         := TMenuItem.Create(FMenuItemSource);
  FMenuTmp.Caption := FMenuItemSource.Caption;
  if FMenuItemSource.Caption <> '-' then
  begin
    FMenuTmp.Name       := FMenuItemSource.Name;
    FMenuTmp.Tag        := FMenuItemSource.Tag;
    FMenuTmp.Enabled    := FMenuItemSource.Enabled;
    FMenuTmp.Visible    := FMenuItemSource.Visible;
    FMenuTmp.ImageIndex := FMenuItemSource.ImageIndex;
    FMenuTmp.OnClick    := FOnClick;
  end;

  FMenuItemDest.Add(FMenuTmp);
  for I := 0 to FMenuItemSource.Count - 1 do
    FAddNodeMerge(FMenuItemSource.Items[I], FMenuItemDest.Items[FMenuItemDest.Count - 1], (FMenuItemDest.Count > 0), FMenuItemSource.Items[I].OnClick, AllowUserControl);
end;

function GetThreeListPath(ANode: TcxTreeListNode): String;
var
  s: string;
begin
  s := '[' + ANode.Texts[0] + ']';
  if assigned(ANode) then
    while ANode.Parent <> ANode.Root do
    begin
      s     := '[' + ANode.Parent.Texts[0] + '] > ' + s;
      ANode := ANode.Parent;
    end;
  Result := s;
end;

function GetMenuPath(aMenuItem: TMenuItem): String;
var
  I         : Integer;
  LArrayPath: array of string;
begin
  Result := '';
  while (aMenuItem.Parent <> nil) do
  begin
    SetLength(LArrayPath, Length(LArrayPath) + 1);
    LArrayPath[high(LArrayPath)] := aMenuItem.Caption;
    aMenuItem                    := aMenuItem.Parent;
  end;

  for I := high(LArrayPath) to low(LArrayPath) do
  begin
    Result := Result + LArrayPath[I] + '>';
  end;
  Result := Copy(Result, 1, Length(Result) - 1);
end;

function GetMenuPath(dxBarButton: TdxBarButton): String;
// function by DevExpress, slightly modified
  function GetParentLink(ALink: TdxBarItemLink; AIndex: Integer = 0): TdxBarItemLink;
  begin
    if (ALink.Owner <> nil) and (ALink.Owner.Owner <> nil) and (ALink.Owner.Owner is TdxBarSubItem) then
      Result := TdxBarItem(ALink.Owner.Owner).Links[AIndex]
    else
      Result := nil;
  end;

var
  Parent: TdxBarItemLink;
begin
  // Get Caption of clicked item
  Result := dxBarButton.Caption;

  if dxBarButton.Links[0] = nil then
    Exit;
  // Get Caption of all parents
  Parent := GetParentLink(dxBarButton.Links[0]);
  while Parent <> nil do
  begin
    // Insert Caption of current parent at beginning
    Result := Parent.Caption + ' > ' + Result;

    // get next parent
    Parent := GetParentLink(Parent);
  end;

end;

function GetMenuPath2(aMenuItem: TMenuItem): String;
var
  Parent: TMenuItem;
begin
  Result := aMenuItem.Caption;

  if aMenuItem.Parent = nil then
    Exit;
  Parent := aMenuItem.Parent;
  while Parent <> nil do
  begin
    Result := Parent.Caption + ' > ' + Result;
    Parent := Parent.Parent;
  end;

end;

procedure MergeMenus(MainMenuItemSrc: TMenuItem; MainMenuItemDest: TMenuItem);
var
  FNewMenuItem: TMenuItem;
  I           : Integer;
  function FindEqualsMenuItem(LSrcMenu: TMenuItem; LFindMenu: TMenuItem;

    var LastFoundMenu: TMenuItem): TMenuItem;
  var
    FMenuAddress : string;
    LMenuTmp     : TMenuItem;
    I2           : Integer;
    FFoundCaption: string;
  begin
    Result       := nil;
    LMenuTmp     := LSrcMenu;
    FMenuAddress := LMenuTmp.Caption + ';';
    { Montagem do endereço do menu }
    while (LMenuTmp.Parent.Caption <> '') do
    begin
      FMenuAddress := LMenuTmp.Parent.Caption + ';' + FMenuAddress;
      LMenuTmp     := LMenuTmp.Parent;
      if (LMenuTmp.Parent.Caption = '') then
        break;
    end;
    { Procuramos no destino se há o endereço especificado }
    I2            := 1;
    LMenuTmp      := LFindMenu;
    LastFoundMenu := LFindMenu;
    FFoundCaption := '';
    while UpperCase(FFoundCaption) <> 'NULL' do
    begin
      FFoundCaption := GetFieldInString(FMenuAddress, I2, ';');
      if UpperCase(FFoundCaption) <> 'NULL' then
      begin
        if FFoundCaption = '-' then
          Result := nil
        else
          Result := LMenuTmp.Find(FFoundCaption);
        if Result <> nil then
        begin
          LastFoundMenu := Result;
          LMenuTmp      := Result;
        end;
      end;
      inc(I2);
    end;
  end;

begin
  try
    for I := 0 to MainMenuItemSrc.Count - 1 do
      if not(FindEqualsMenuItem(MainMenuItemSrc.Items[I], MainMenuItemDest, FNewMenuItem) = nil) then
        MergeMenus(MainMenuItemSrc.Items[I], MainMenuItemDest)
      else
        FAddNodeMerge(MainMenuItemSrc.Items[I], FNewMenuItem, false, MainMenuItemSrc.Items[I].OnClick, true);

  finally
    // FMenu.Destroy;
  end;
end;

function SQLServerDate(date: TDateTime): string;
begin
  try
    Result := QuotedStr(FormatDateTime('yyyymmdd', date));
  except
    Result := QuotedStr('');
  end;
end;

function SQLServerDate(date: string): string;
begin
  try
    Result := QuotedStr(FormatDateTime('yyyymmdd', strtodate(date)));
  except
    Result := QuotedStr('');
  end;
end;

function SQLServerDateTime(date: TDateTime): string;
begin
  try
    Result := QuotedStr(FormatDateTime('yyyymmdd hh:nn:ss', date));
  except
    Result := QuotedStr('');
  end;
end;

function GetValueWithOutPoint(vValor: string): string;
var
  I: Integer;
begin
  for I := 0 to Length(vValor) do
  begin
    if Copy(vValor, I, 1) = '.' then
    begin
      Result := Copy(vValor, 1, I - 1) + Copy(vValor, I + 1, Length(vValor) - I);
    end;
  end;
  if StrScan(Pchar(vValor), '.') = nil then
    Result := vValor;
  if vValor = '' then
    Result := '0';
end;

function SQLDouble(aValue: Double): string;
begin
  Result := ConvertVirgPPonto(PegaValorSemPonto(CurrToStr(aValue)));
end;

function StrZero(Valor: string; Quant: Integer): string;
{ Insere Zeros à frente de uma string }
var
  I, Tamanho: Integer;
  aux       : string;
begin
  aux     := Valor;
  Tamanho := Length(Valor);
  Valor   := '';
  for I   := 1 to Quant - Tamanho do
    Valor := Valor + '0';
  aux     := Valor + aux;
  StrZero := aux;
end;

function RepeatChar(Count: Integer; LChar: char): string;
var
  I: Integer;
begin
  Result   := '';
  for I    := 1 to Count do
    Result := Result + LChar;
end;

function AlignRight(aValue: String; ACount: Integer): string;
begin
  if ACount > Length(aValue) then
    Result := RepeatChar(ACount - Length(aValue), ' ') + aValue
  else
    Result := aValue;
end;

function IsNumeric(Source: string): Boolean;
var
  I: Integer;
begin
  Result := true;
  for I  := 1 to StrLen(Pchar(Source)) do
    if not(Source[I] in ['0' .. '9']) then
      Result := false;

end;

function IsAlfa(Source: string): Boolean;
var
  I: Integer;
begin
  Result := true;
  for I  := 1 to StrLen(Pchar(Source)) do
    if Source[I] in ['0' .. '9'] then
      Result := false;
end;

function CPF(Num: string): Boolean;
var
  Temp  : Integer;
  Numero: string;
  n     : array [1 .. 9] of Integer;
  d     : array [1 .. 2] of Integer;
begin
  Numero   := '';
  for Temp := 1 to 14 do
    if Num[Temp] in ['0' .. '9'] then
      Numero := Numero + Num[Temp];
  for Temp   := 1 to 9 do
    n[Temp]  := StrToInt(Numero[Temp]);
  d[1]       := n[9] * 2 + n[8] * 3 + n[7] * 4 + n[6] * 5 + n[5] * 6 + n[4] * 7 + n[3] * 8 + n[2] * 9 + n[1] * 10;
  d[1]       := 11 - (d[1] mod 11);
  if d[1] >= 10 then
    d[1] := 0;
  d[2]   := d[1] * 2 + n[9] * 3 + n[8] * 4 + n[7] * 5 + n[6] * 6 + n[5] * 7 + n[4] * 8 + n[3] * 9 + n[2] * 10 + n[1] * 11;
  d[2]   := 11 - (d[2] mod 11);
  if d[2] >= 10 then
    d[2] := 0;
  if IntTostr(d[1]) + IntTostr(d[2]) = Numero[10] + Numero[11] then
    CPF := true
  else
    CPF := false;
end;

function CGC(Num: string): Boolean;
var
  Temp  : Integer;
  Numero: string;
  n     : array [1 .. 12] of Integer;
  d     : array [1 .. 2] of Integer;
begin
  Numero   := '';
  for Temp := 1 to 18 do
    if Num[Temp] in ['0' .. '9'] then
      Numero := Numero + Num[Temp];
  for Temp   := 1 to 12 do
    n[Temp]  := StrToInt(Numero[Temp]);
  d[1]       := n[12] * 2 + n[11] * 3 + n[10] * 4 + n[9] * 5 + n[8] * 6 + n[7] * 7 + n[6] * 8 + n[5] * 9 + n[4] * 2 + n[3] * 3 + n[2] * 4 + n[1] * 5;
  d[1]       := 11 - (d[1] mod 11);
  if d[1] >= 10 then
    d[1] := 0;
  d[2]   := d[1] * 2 + n[12] * 3 + n[11] * 4 + n[10] * 5 + n[9] * 6 + n[8] * 7 + n[7] * 8 + n[6] * 9 + n[5] * 2 + n[4] * 3 + n[3] * 4 + n[2] * 5 + n[1] * 6;
  d[2]   := 11 - (d[2] mod 11);
  if d[2] >= 10 then
    d[2] := 0;
  if IntTostr(d[1]) + IntTostr(d[2]) = Numero[13] + Numero[14] then
    CGC := true
  else
    CGC := false;
end;

function OnlyNumbers(Num: string): string;
var
  I: Integer;
begin
  Result := '';
  if Length(Num) = 0 then
    Exit;

  for I := 0 to Length(Num) do
  begin
    if Num[I] in ['0' .. '9'] then
      Result := Result + Num[I];
  end;
end;

function OnlyAlpha(Alpha: string): string;
var
  I: Integer;
begin
  Result := '';
  if Length(Alpha) = 0 then
    Exit;

  for I := 0 to Length(Alpha) do
  begin
    if (Alpha[I] in ['A' .. 'Z', 'a' .. 'z', '@', '!', '#', '$', '%', '^', '&', '`', '~', '*', '(', ')', '-', '_', '=', '+', '|', ',', '/', '<', '>', '"', ';', ':', '[', ']', '{', '}', '''']) then
      Result := Result + Alpha[I];
  end;
end;

function CheckDoc(Num: string): Boolean;
var
  str: string;
begin
  str    := '';
  Result := false;
  str    := OnlyNumbers(Num);
  case Length(str) of
    11:
      Result := CPF(str);
    14:
      Result := CGC(str);
  end;
end;

function ConvertPontoPVirg(vValor: string): string;
var
  I: Integer;
begin
  for I := 0 to Length(vValor) do
  begin
    if Copy(vValor, I, 1) = '.' then
    begin
      Result := Copy(vValor, 1, I - 1) + ',' + Copy(vValor, I + 1, Length(vValor) - I);
    end;
  end;
  if StrScan(Pchar(vValor), '.') = nil then
    Result := vValor;
  if vValor = '' then
    Result := '0';
end;

function ConvertVirgPPonto(vValor: string): string;
var
  I: Integer;
begin
  for I := 0 to Length(vValor) do
  begin
    if Copy(vValor, I, 1) = ',' then
    begin
      Result := Copy(vValor, 1, I - 1) + '.' + Copy(vValor, I + 1, Length(vValor) - I);
    end;
  end;
  if StrScan(Pchar(vValor), ',') = nil then
    Result := vValor;
  if vValor = '' then
    Result := '0';
end;

function PegaValorSemPonto(vValor: string): string;
begin
  // for I := 0 to Length(vValor) do begin
  // if Copy(vValor, I, 1) = '.' then begin
  // Result := Copy(vValor, 1, I - 1) + Copy(vValor, I + 1, Length(vValor) - I);
  // end;
  // end;
  vValor := StringReplace(vValor, '.', '', [rfReplaceAll]);
  if StrScan(Pchar(vValor), '.') = nil then
    Result := vValor;
  if vValor = '' then
    Result := '0';
end;

function GetCaptionFromControl(aOwner: TComponent; aControlFrom: TObject): String;
var
  I: Integer;
begin
  Result := 'Campo';
  for I  := 0 to aOwner.ComponentCount - 1 do
  begin
    if aOwner.Components[I] is TLabel then
      if TLabel(aOwner.Components[I]).FocusControl = aControlFrom then
      begin
        Result := Trim(StringReplace(TLabel(aOwner.Components[I]).Caption, '*', '', [rfReplaceAll]));
        Result := StringReplace(Result, '.', '', [rfReplaceAll]);
        Result := StringReplace(Result, ':', '', [rfReplaceAll]);
        Result := StringReplace(Result, '&', '', [rfReplaceAll]);
        Exit;
      end;
  end;

end;

function GetFieldInString(Source: string; Index: Integer; CharSeparator: char): string;
var
  Start, I: Integer;
  IRef    : Integer;
begin
  Start := 1;
  IRef  := 1;
  for I := 1 to StrLen(Pchar(Source)) do
    if Copy(Source, I, 1) = CharSeparator then
    begin
      Result := Copy(Source, Start, I - Start);
      if Index = IRef then
        Exit;
      Start := I + 1;
      inc(IRef);
    end;

  Result := 'null';
end;

function GetFieldInStringRight(Source: string; Index: Integer; CharSeparator: char): string;
var
  Start, I: Integer;
  IRef    : Integer;
begin
  Start := 1;
  IRef  := 1;
  for I := StrLen(Pchar(Source)) downto 1 do
    if Copy(Source, I, 1) = CharSeparator then
    begin
      Result := Copy(Source, I - (Start - 2), StrLen(Pchar(Source)) - I);
      if Index = IRef then
        Exit;
      Start := I + 1;
      inc(IRef);
    end;

  Result := 'null';
end;

function GetFieldInString(Source: string; Index: Integer; CharSeparator, CharStarted: string;

  var PosFound: Integer): string;
var
  Start, I, I2: Integer;
  IRef        : Integer;
  Found       : Boolean;
begin
  Start := 1;
  IRef  := 1;
  Found := false;
  for I := 1 to StrLen(Pchar(Source)) do
    if Copy(Source, I, 1) = CharSeparator then
    begin
      for I2 := I downto 1 do
        if (Copy(Source, I2, Length(CharStarted)) = CharStarted) then
        begin
          Start := I2 + Length(CharStarted);
          Found := true;
          break;
        end;
      if not Found then
        break;

      Result   := Trim(Copy(Source, Start, I - Start));
      PosFound := Start + (I - Start);

      if Index = IRef then
        Exit;
      Start := I + 1;
      inc(IRef);
    end;

  Result := 'null';
end;

function GetFieldInString(Source: string; CharSeparator: string): TStrings;
var
  strItem                           : String;
  ListaAuxUTILS                     : TStrings;
  NumCaracteres, TamanhoSeparador, I: Integer;
Begin
  ListaAuxUTILS    := TStringList.Create;
  strItem          := '';
  NumCaracteres    := Length(Source);
  TamanhoSeparador := Length(CharSeparator);
  I                := 1;
  While I <= NumCaracteres Do
  Begin
    If (Copy(Source, I, TamanhoSeparador) = CharSeparator) or (I = NumCaracteres) Then
    Begin
      if (I = NumCaracteres) then
        strItem := strItem + Source[I];
      ListaAuxUTILS.Add(Trim(strItem));
      strItem := '';
      I       := I + (TamanhoSeparador - 1);
    end
    Else
      strItem := strItem + Source[I];

    I := I + 1;
  End;
  Result := ListaAuxUTILS;
end;

procedure ReadOnlyComponentes(aOwner: TComponent; Tag: Integer; ReadOnly: Boolean = false);
var
  I: Integer;
begin
  for I := 0 to aOwner.ComponentCount - 1 do
    if aOwner.Components[I] is TControl then
      if aOwner.Components[I].Tag = Tag then
        TCustomEdit(aOwner.Components[I]).ReadOnly := ReadOnly;
end;

function GetFocusedComponent(aOwner: TComponent): TComponent;
var
  I: Integer;
begin
  Result := nil;
  for I  := 0 to aOwner.ComponentCount - 1 do
  begin
    if aOwner.Components[I] is TWinControl then
      if TWinControl(aOwner.Components[I]).Focused then
      begin
        Result := aOwner.Components[I];
        Exit;
      end;
  end;
  for I := 0 to aOwner.ComponentCount - 1 do
  begin
    if aOwner.Components[I] is TcxGridColumn then
      if TcxGridColumn(aOwner.Components[I]).Focused then
      begin
        Result := aOwner.Components[I];
        Exit;
      end;
  end;
end;

procedure VisibleComponentes(aOwner: TComponent; Tag: Integer; UnVisible: Boolean = false);
var
  I: Integer;
begin
  for I := 0 to aOwner.ComponentCount - 1 do
    if aOwner.Components[I] is TControl then
      if aOwner.Components[I].Tag = Tag then
        TWinControl(aOwner.Components[I]).Visible := not UnVisible;
end;

procedure VisibleControls(AParent: TWinControl; Tag: Integer; UnVisible: Boolean = false);
var
  I: Integer;
begin
  for I := 0 to AParent.ControlCount - 1 do
    if AParent.Controls[I] is TControl then
      if AParent.Controls[I].Tag = Tag then
        TWinControl(AParent.Controls[I]).Visible := not UnVisible;
end;

procedure EnabledComponentes(aOwner: TComponent; Tag: Integer; Disabled: Boolean = false);
var
  I: Integer;
begin
  for I := 0 to aOwner.ComponentCount - 1 do
    if aOwner.Components[I] is TControl then
      if aOwner.Components[I].Tag = Tag then
        TWinControl(aOwner.Components[I]).Enabled := not Disabled;

end;

procedure EnabledControls(AParent: TWinControl; Tag: Integer; Disabled: Boolean = false);
var
  I: Integer;
begin
  for I := 0 to AParent.ControlCount - 1 do
    if AParent.Controls[I] is TControl then
      if AParent.Controls[I].Tag = Tag then
        TWinControl(AParent.Controls[I]).Enabled := not Disabled;

end;

function SortCustomClientDataSet(DataSet: TCustomClientDataSet;

  const FieldName: string): Boolean;
var
  I           : Integer;
  IndexDefs   : TIndexDefs;
  IndexName   : string;
  IndexOptions: TIndexOptions;
  Field       : TField;
begin
  Result := false;
  Field  := DataSet.Fields.FindField(FieldName);
  // If invalid field name, exit.
  if Field = nil then
    Exit;
  // if invalid field type, exit.
  if (Field is TObjectField) or (Field is TBlobField) or (Field is TAggregateField) or (Field is TVariantField) or (Field is TBinaryField) then
    Exit;
  // Get IndexDefs and IndexName using RTTI
  if IsPublishedProp(DataSet, 'IndexDefs') then
    IndexDefs := GetObjectProp(DataSet, 'IndexDefs') as TIndexDefs
  else
    Exit;
  if IsPublishedProp(DataSet, 'IndexName') then
    IndexName := GetStrProp(DataSet, 'IndexName')
  else
    Exit;
  // Ensure IndexDefs is up-to-date
  IndexDefs.Update;
  // If an ascending index is already in use,
  // switch to a descending index
  if IndexName = FieldName + '__IdxA' then
  begin
    IndexName    := FieldName + '__IdxD';
    IndexOptions := [ixDescending];
  end
  else
  begin
    IndexName    := FieldName + '__IdxA';
    IndexOptions := [];
  end;
  // Look for existing index
  for I := 0 to Pred(IndexDefs.Count) do
  begin
    if IndexDefs[I].Name = IndexName then
    begin
      Result := true;
      break
    end; // if
  end;   // for
  // If existing index not found, create one
  if not Result then
  begin
    DataSet.AddIndex(IndexName, FieldName, IndexOptions);
    Result := true;
  end;
  // if not
  // Set the index
  SetStrProp(DataSet, 'IndexName', IndexName);
end;

// works with ClientDataSets.

function SortClientDataSet(ClientDataSet: TClientDataSet;

  const FieldName: string): Boolean;
var
  I           : Integer;
  NewIndexName: string;
  IndexOptions: TIndexOptions;
  Field       : TField;
begin
  Result := false;
  Field  := ClientDataSet.Fields.FindField(FieldName);
  // If invalid field name, exit.
  if Field = nil then
    Exit;
  // if invalid field type, exit.
  if (Field is TObjectField) or (Field is TBlobField) or (Field is TAggregateField) or (Field is TVariantField) or (Field is TBinaryField) then
    Exit;
  // Get IndexDefs and IndexName using RTTI
  // Ensure IndexDefs is up-to-date
  ClientDataSet.IndexDefs.Update;
  // If an ascending index is already in use,
  // switch to a descending index
  if ClientDataSet.IndexName = FieldName + '__IdxA' then
  begin
    NewIndexName := FieldName + '__IdxD';
    IndexOptions := [ixDescending];
  end
  else
  begin
    NewIndexName := FieldName + '__IdxA';
    IndexOptions := [];
  end;
  // Look for existing index
  for I := 0 to Pred(ClientDataSet.IndexDefs.Count) do
  begin
    if ClientDataSet.IndexDefs[I].Name = NewIndexName then
    begin
      Result := true;
      break
    end;
    // if
  end; // for
  // If existing index not found, create one
  if not Result then
  begin
    ClientDataSet.AddIndex(NewIndexName, FieldName, IndexOptions);
    Result := true;
  end;
  // if not
  // Set the index
  ClientDataSet.IndexName := NewIndexName;
end;

function ValidateAllcxControls(aOwner: TComponent): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I  := 0 to aOwner.ComponentCount - 1 do
  begin
    if aOwner.Components[I] is TcxCustomEdit then
      if not TcxCustomEdit(aOwner.Components[I]).ValidateEdit(true) then
        Exit;
    if aOwner.Components[I] is TcxCustomComboBox then
      if not TcxCustomComboBox(aOwner.Components[I]).ValidateEdit(true) then
        Exit;

  end;
  Result := true;
end;

function ValidateAllcxControls(AControl: TWinControl): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I  := 0 to AControl.ControlCount - 1 do
  begin
    if AControl.Controls[I] is TcxCustomEdit then
      if not TcxCustomEdit(AControl.Controls[I]).ValidateEdit(true) then
        Exit;
    if AControl.Controls[I] is TcxCustomComboBox then
      if not TcxCustomComboBox(AControl.Controls[I]).ValidateEdit(true) then
        Exit;

  end;
  Result := true;
end;
{$WARNINGS ON}

function GetBitmapSign(AData: String): TBitmap;
var
  FS        : TMemoryStream;
  FirstBytes: AnsiString;
  Graphic   : TGraphic;
begin
  Graphic := nil;
  Result  := nil;
  if AData = '' then
    Exit;
  FS := TStringStream.Create(Base64Decode(AData));
  try
    // FS.LoadFromStream(AStream);
    SetLength(FirstBytes, 8);
    FS.Read(FirstBytes[1], 8);
    if Copy(FirstBytes, 1, 2) = 'BM' then
    begin
      Graphic := TBitmap.Create;
    end
    else if FirstBytes = #137'PNG'#13#10#26#10 then
    begin
      Graphic := TPNGImage.Create;
    end
    else if Copy(FirstBytes, 1, 3) = 'GIF' then
    begin
      Graphic := TGIFImage.Create;
    end
    else if Copy(FirstBytes, 1, 2) = #$FF#$D8 then
    begin
      Graphic := TJPEGImage.Create;
    end;
    if assigned(Graphic) then
    begin
      try
        FS.Seek(0, soFromBeginning);
        Graphic.LoadFromStream(FS);
        Result             := TBitmap.Create;
        Result.PixelFormat := pf32bit;
        Result.Width       := Graphic.Width;
        Result.Height      := Graphic.Height;
        Result.Canvas.Draw(0, 0, Graphic);
      except
        raise;
      end;
      Graphic.Free;
    end;
  finally
    FS.Free;
  end;
end;

function GetGraphicSign(AData: String): TGraphic;
var
  FS        : TMemoryStream;
  FirstBytes: AnsiString;
  Graphic   : TGraphic;
begin
  Graphic := nil;
  Result  := nil;
  if AData = '' then
    Exit;
  FS := TStringStream.Create(Base64Decode(AData));
  try
    // FS.LoadFromStream(AStream);
    SetLength(FirstBytes, 8);
    FS.Read(FirstBytes[1], 8);
    if Copy(FirstBytes, 1, 2) = 'BM' then
    begin
      Graphic := TBitmap.Create;
    end
    else if FirstBytes = #137'PNG'#13#10#26#10 then
    begin
      Graphic := TPNGImage.Create;
    end
    else if Copy(FirstBytes, 1, 3) = 'GIF' then
    begin
      Graphic := TGIFImage.Create;
    end
    else if Copy(FirstBytes, 1, 2) = #$FF#$D8 then
    begin
      Graphic := TJPEGImage.Create;
    end;
    if assigned(Graphic) then
    begin
      try
        FS.Seek(0, soFromBeginning);
        Graphic.LoadFromStream(FS);
        Result := Graphic;
      except
        raise;
      end;
    end;
  finally
    FS.Free;
  end;
end;

function GetGraphicSignNoDecode(AData: AnsiString): TGraphic;
var
  FS        : TMemoryStream;
  FirstBytes: AnsiString;
  Graphic   : TGraphic;
begin
  // if AData = '' then
  // Exit;
  Graphic := nil;
  Result  := nil;
  // ShowMessage(bintostr(AData));
  FS := TStringStream.Create(AData);
  try
    SetLength(FirstBytes, 8);
    FS.Read(FirstBytes[1], 8);
    if Copy(FirstBytes, 1, 2) = 'BM' then
    begin
      Graphic := TBitmap.Create;
    end
    else if FirstBytes = #137'PNG'#13#10#26#10 then
    begin
      Graphic := TPNGImage.Create;
    end
    else if Copy(FirstBytes, 1, 3) = 'GIF' then
    begin
      Graphic := TGIFImage.Create;
    end
    else if Copy(FirstBytes, 1, 2) = #$FF#$D8 then
    begin
      Graphic := TJPEGImage.Create;
    end;
    if assigned(Graphic) then
    begin
      try
        FS.Seek(0, soFromBeginning);
        Graphic.LoadFromStream(FS);
        Result := Graphic;
      except
        raise;
      end;
    end;
  finally
    FS.Free;
  end;
end;

function EncryptStr(const s: string; Key: Word): string;
var
  I: Integer;
const
  C1 = 53761;
  C2 = 32618;
begin
  Result := s;
  for I  := 1 to Length(s) do
  begin
    Result[I] := char(byte(s[I]) xor (Key shr 8));
    Key       := (byte(Result[I]) + Key) * C1 + C2;
  end;
end;

function DecryptStr(const s: string; Key: Word): string;
var
  I: Integer;
const
  C1 = 53761;
  C2 = 32618;
begin
  Result := s;
  for I  := 1 to Length(s) do
  begin
    Result[I] := char(byte(s[I]) xor (Key shr 8));
    Key       := (byte(s[I]) + Key) * C1 + C2;
  end;
end;

procedure doFillColumnsGrid(var AFDConnection: TFDConnection; Alay_id: Integer; var AGridDBTableView: TcxGridDBTableView);
var
  loGridDBColumn  : TcxGridDBColumn;
  loLayoutDetalhes: TWiFDQuery;
begin
  AGridDBTableView.BeginUpdate;
  AGridDBTableView.ClearItems;
  loLayoutDetalhes            := TWiFDQuery.Create(nil);
  loLayoutDetalhes.Connection := AFDConnection;
  try
    loLayoutDetalhes.SQL.Text                        := 'SELECT * FROM sistema.tb_layout_detalhes WHERE lay_id = :lay_id order by layd_index';
    loLayoutDetalhes.ParamByName('lay_id').AsInteger := Alay_id;
    loLayoutDetalhes.Active                          := true;
    loLayoutDetalhes.First;
    while not loLayoutDetalhes.Eof do
    begin
      loGridDBColumn                       := AGridDBTableView.CreateColumn;
      loGridDBColumn.Name                  := loLayoutDetalhes.FieldByName('layd_name').AsString;
      loGridDBColumn.DataBinding.FieldName := loLayoutDetalhes.FieldByName('layd_fieldname').AsString;
      loGridDBColumn.Caption               := loLayoutDetalhes.FieldByName('layd_caption').AsString;
      loGridDBColumn.HeaderAlignmentHorz   := TAlignment(loLayoutDetalhes.FieldByName('layd_header_align').AsInteger);
      if loLayoutDetalhes.FieldByName('layd_width').AsInteger > 0 then
        loGridDBColumn.Width    := loLayoutDetalhes.FieldByName('layd_width').AsInteger;
      loGridDBColumn.GroupIndex := loLayoutDetalhes.FieldByName('layd_group_idx').AsInteger;
      if loGridDBColumn.GroupIndex > -1 then
        loGridDBColumn.Visible               := false;
      loGridDBColumn.SortIndex               := loLayoutDetalhes.FieldByName('layd_sort_idx').AsInteger;
      loGridDBColumn.SortOrder               := TdxSortOrder(loLayoutDetalhes.FieldByName('layd_sort_order').AsInteger);
      loGridDBColumn.Index                   := loLayoutDetalhes.FieldByName('layd_index').AsInteger;
      loGridDBColumn.Visible                 := loLayoutDetalhes.FieldByName('layd_visible').AsBoolean;
      loGridDBColumn.VisibleForCustomization := loLayoutDetalhes.FieldByName('layd_visible_customize').AsBoolean;

      loGridDBColumn.PropertiesClass := getClassProperties(loLayoutDetalhes.FieldByName('layd_properties').AsString);
      if loGridDBColumn.Properties <> nil then
      begin
        loGridDBColumn.Properties.Alignment.Horz := TAlignment(loLayoutDetalhes.FieldByName('layd_content_align').AsInteger);
        if loGridDBColumn.Properties is TcxCurrencyEditProperties then
        begin
          TcxCurrencyEditProperties(loGridDBColumn.Properties).DecimalPlaces := loLayoutDetalhes.FieldByName('layd_decimalplaces').AsInteger;
          TcxCurrencyEditProperties(loGridDBColumn.Properties).DisplayFormat := loLayoutDetalhes.FieldByName('layd_displayformat').AsString;
          TcxCurrencyEditProperties(loGridDBColumn.Properties).EditFormat := loLayoutDetalhes.FieldByName('layd_editformat').AsString;
        end;
      end;
      loLayoutDetalhes.next;
    end;
  finally
    loLayoutDetalhes.Destroy;
    AGridDBTableView.EndUpdate;
  end;
end;

function getClassProperties(aClassName: String): TcxCustomEditPropertiesClass;
begin
  Result := nil;
  if aClassName = 'TextEdit' then
    Result := TcxTextEditProperties;
  if aClassName = 'CurrencyEdit' then
    Result := TcxCurrencyEditProperties;
  if aClassName = 'DateEdit' then
    Result := TcxDateEditProperties;
end;

function getClassPropertiesAlias(aPropertiesClass: TcxCustomEditPropertiesClass): String;
begin
  Result := '';
  if aPropertiesClass = TcxTextEditProperties then
    Result := 'TextEdit';
  if aPropertiesClass = TcxCurrencyEditProperties then
    Result := 'CurrencyEdit';
  if aPropertiesClass = TcxDateEditProperties then
    Result := 'DateEdit';
end;

procedure AddLogFile(AFileName, aSQL: String; const aClear: Boolean = false);
var
  lStringList: TStrings;
  loFileName : string;
begin
  loFileName := ExtractFilePath(Application.ExeName) + '\' + AFileName + '.sql';
  if aClear then
    DeleteFile(loFileName);
  lStringList := TStringList.Create;
  try
    if FileExists(loFileName) then
      lStringList.LoadFromFile(loFileName);
    lStringList.Add(aSQL);
    lStringList.Add('GO');
    lStringList.SaveToFile(loFileName);
  finally
    lStringList.Free;
  end;
end;

initialization

// RegisterClass(TFrmSendEmail);

end.
