unit uFrmConfig_Impressoras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uWiEventsForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, cxContainer, cxEdit,
  cxDBEdit,
  cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls, Vcl.Menus, cxButtons, cxCheckBox, uGlobalLibPDV, uFrmPDV_DModule,
  Vcl.ExtCtrls, cxMemo,
  JvBrowseFolder, JvBaseDlg, WibiSkins, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSpinEdit, Printers,
  cxDataControllerConditionalFormattingRulesManagerDialog, ACBrBase,
  ACBrPosPrinter, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxDateRanges, dxScrollbarAnnotations;

type
  TFrmConfig_Impressoras = class(TForm)
    WiEventsForm1: TWiEventsForm;
    dsImpressoras: TWiFDQuery;
    doImpressoras: TDataSource;
    Shape16: TShape;
    Shape27: TShape;
    Label38: TLabel;
    Shape1: TShape;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Label3: TLabel;
    cxGrid1DBTableView1pimp_id: TcxGridDBColumn;
    cxGrid1DBTableView1pimp_descricao: TcxGridDBColumn;
    cxGrid1DBTableView1pimp_modelo: TcxGridDBColumn;
    cxGrid1DBTableView1pimp_port: TcxGridDBColumn;
    cxGrid1DBTableView1pimp_ativo: TcxGridDBColumn;
    Label1: TLabel;
    edpimp_descricao: TcxDBTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ckpimp_hardflow: TcxDBCheckBox;
    ckpimp_softflow: TcxDBCheckBox;
    ckpimp_ativo: TcxDBCheckBox;
    cbpimp_baud: TcxDBLookupComboBox;
    cbpimp_data: TcxDBLookupComboBox;
    cbpimp_parity: TcxDBLookupComboBox;
    cbpimp_stop: TcxDBLookupComboBox;
    cbpimp_handshake: TcxDBLookupComboBox;
    cbpimp_modelo: TcxDBLookupComboBox;
    lblMsgRapida: TLabel;
    Label2: TLabel;
    cbpimp_impressora: TcxDBComboBox;
    ACBrPosPrinter1: TACBrPosPrinter;
    cbpimp_port: TcxDBComboBox;
    cxButton1: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxButton1Click(Sender: TObject);
  private
    function Validate: Integer;
    function doPost: Boolean;
    procedure LoadImpressoras;
    procedure ConfigurarPosPrinter;
    procedure AtivarPosPrinter;
    procedure AdicionarLinhaImpressao(ALinha: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_Impressoras: TFrmConfig_Impressoras;

implementation

{$R *.dfm}

uses uFrmPDV, System.AnsiStrings, System.TypInfo;

function TFrmConfig_Impressoras.Validate: Integer;
begin
  result := 0;
  // if (edpterm_descricao.Text = '') then
  // result := Integer(edpterm_descricao);
  // if (edpterm_serie_fiscal.Value <= 0) then
  // result := Integer(edpterm_serie_fiscal);
  // if (edpterm_numero.Value <= 0) then
  // result := Integer(edpterm_numero);
end;

procedure TFrmConfig_Impressoras.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if edpimp_descricao.Focused then
    close;
end;

procedure TFrmConfig_Impressoras.ConfigurarPosPrinter;
begin
  ACBrPosPrinter1.Desativar;
  ACBrPosPrinter1.Modelo         := TACBrPosPrinterModelo(cbpimp_modelo.ItemIndex);
 // ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo(cppimp_pagina.ItemIndex);
  ACBrPosPrinter1.Porta          := cbpimp_port.Text;
  // ACBrPosPrinter1.ColunasFonteNormal := seColunas.Value;
  // ACBrPosPrinter1.LinhasEntreCupons := seLinhasPular.Value;
  // ACBrPosPrinter1.EspacoEntreLinhas := seEspLinhas.Value;
end;

procedure TFrmConfig_Impressoras.AtivarPosPrinter;
begin

  ConfigurarPosPrinter;
  if (ACBrPosPrinter1.Porta <> '') then
    ACBrPosPrinter1.Ativar
  else
    raise Exception.Create('Porta não definida');
end;

procedure TFrmConfig_Impressoras.cxButton1Click(Sender: TObject);
var
  SL: TStringList;
begin
  try
    AtivarPosPrinter;

    SL := TStringList.Create;
    try
      SL.Add('</zera>');
      SL.Add('</linha_dupla>');
      SL.Add('FONTE NORMAL: ' + IntToStr(ACBrPosPrinter1.ColunasFonteNormal) + ' Colunas');
      SL.Add(LeftStr('....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8',
        ACBrPosPrinter1.ColunasFonteNormal));
      SL.Add('<e>EXPANDIDO: ' + IntToStr(ACBrPosPrinter1.ColunasFonteExpandida) + ' Colunas');
      SL.Add(LeftStr('....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8',
        ACBrPosPrinter1.ColunasFonteExpandida));
      SL.Add('</e><c>CONDENSADO: ' + IntToStr(ACBrPosPrinter1.ColunasFonteCondensada) + ' Colunas');
      SL.Add(LeftStr('....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8',
        ACBrPosPrinter1.ColunasFonteCondensada));
      SL.Add('</c><n>FONTE NEGRITO</N>');
      SL.Add('<in>FONTE INVERTIDA</in>');
      SL.Add('<S>FONTE SUBLINHADA</s>');
      SL.Add('<i>FONTE ITALICO</i>');
      SL.Add('FONTE NORMAL');
      SL.Add('');
      SL.Add('TESTE DE ACENTOS. ÁÉÍÓÚáéíóú');
      SL.Add('');
      SL.Add('</corte_total>');

       AdicionarLinhaImpressao(SL.Text);
    finally
      SL.Free;
    end;
  except
    On E: Exception do
    begin
      MessageDlg('Falha ao ativar a Impressora' + sLineBreak + E.Message, mtError, [mbOK], 0);
    end;
  end

end;

procedure TFrmConfig_Impressoras.AdicionarLinhaImpressao(ALinha: String);
begin

  if ACBrPosPrinter1.Ativo then
    ACBrPosPrinter1.Imprimir(ALinha);
end;

function TFrmConfig_Impressoras.doPost: Boolean;
var
  FocusField: Integer;
begin
  result     := false;
  FocusField := Validate;
  if FocusField > 0 then
  begin
    MessageBox(handle, pChar(GetCaptionFromControl(self, TControl(FocusField)) + ' não preenchido.'), 'I9 PDV',
      MB_ICONEXCLAMATION);
    if TWinControl(FocusField).Enabled then
      TWinControl(FocusField).SetFocus;
    exit;
  end;
  if dsImpressoras.State in [dsEdit, dsInsert] then
    dsImpressoras.Post;
  result := true;
end;

procedure TFrmConfig_Impressoras.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  if MessageBox(handle, 'Deseja gravar alterações?', 'I9 PDV', MB_ICONQUESTION + MB_DEFBUTTON1 + MB_YESNO) = IDNO then
    if MessageBox(handle, 'Tem certeza que deseja sair sem gravar as alterações?', 'I9 PDV',
      MB_ICONQUESTION + MB_DEFBUTTON2 + MB_YESNO) = IDYES then
    begin
      CanClose := true;
      exit;
    end;
  if not doPost then
    exit;
  CanClose    := true;
  ModalResult := mrOk;
end;

procedure TFrmConfig_Impressoras.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2:
      ModalResult := mrOk;
  end;
end;

procedure TFrmConfig_Impressoras.LoadImpressoras;
begin
  cbpimp_port.Properties.Items.Clear;
  ACBrPosPrinter1.Device.AcharPortasSeriais(cbpimp_port.Properties.Items);
{$IFDEF MSWINDOWS}
  ACBrPosPrinter1.Device.AcharPortasUSB(cbpimp_port.Properties.Items);
{$ENDIF}
  ACBrPosPrinter1.Device.AcharPortasRAW(cbpimp_port.Properties.Items);

  cbpimp_port.Properties.Items.Add('TCP:192.168.0.31:9100');
end;

procedure TFrmConfig_Impressoras.FormShow(Sender: TObject);
var
  i: TACBrPosPaginaCodigo;
begin
  WiEventsForm1.Open(handle);

  cbpimp_impressora.Properties.Items.Text := Printer.Printers.Text;
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpimp_modelo, 'SELECT * FROM pdv.GetListPrinterModels()',
    'descricao', 'idx');
  // LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpimp_port, 'SELECT * FROM pdv.GetListPorts()', 'descricao', 'descricao');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpimp_baud, 'SELECT * FROM pdv.GetListBaudRate()',
    'descricao', 'descricao');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpimp_data, 'SELECT * FROM pdv.GetListDataBit()', 'descricao',
    'descricao');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpimp_parity, 'SELECT * FROM pdv.GetListSerialParity()',
    'descricao', 'idx');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpimp_stop, 'SELECT * FROM pdv.GetListSerialStop()',
    'descricao', 'idx');
  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpimp_handshake, 'SELECT * FROM pdv.GetListHandShake()',
    'descricao', 'idx');

//  cppimp_pagina.Properties.Items.Clear;
//  For i := Low(TACBrPosPaginaCodigo) to High(TACBrPosPaginaCodigo) do
//    cppimp_pagina.Properties.Items.Add(GetEnumName(TypeInfo(TACBrPosPaginaCodigo), Integer(i)));

  LoadImpressoras;

  dsImpressoras.Active := true;
  Shape16.Brush.Color  := FrmPDV.CordoMes.Color;
end;

procedure TFrmConfig_Impressoras.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

end.
