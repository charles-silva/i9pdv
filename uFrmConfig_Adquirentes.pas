unit uFrmConfig_Adquirentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uWiEventsForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter, cxClasses, dxLayoutContainer, dxLayoutControl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, cxContainer, cxEdit, cxDBEdit,
  cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls, Vcl.Menus, cxButtons, cxCheckBox, uGlobalLibPDV, uFrmPDV_DModule, Vcl.ExtCtrls, cxMemo,
  JvBrowseFolder, JvBaseDlg,  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSpinEdit,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxDateRanges,
  dxScrollbarAnnotations;

type
  TFrmConfig_Adquirentes = class(TForm)
    WiEventsForm1: TWiEventsForm;
    dsAdquirentes: TWiFDQuery;
    doAdquirentes: TDataSource;
    Shape16: TShape;
    Shape27: TShape;
    Label38: TLabel;
    Shape1: TShape;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Label3: TLabel;
    cxGrid1DBTableView1adq_id: TcxGridDBColumn;
    cxGrid1DBTableView1adq_nome: TcxGridDBColumn;
    cxGrid1DBTableView1adq_cnpj: TcxGridDBColumn;
    cxGrid1DBTableView1adq_ativo: TcxGridDBColumn;
    Label1: TLabel;
    edadq_nome: TcxDBTextEdit;
    Label4: TLabel;
    ckadq_ativo: TcxDBCheckBox;
    edadq_cnpj: TcxDBMaskEdit;
    Label5: TLabel;
    lblMsgRapida: TLabel;
    cxGrid1DBTableView1adq_merchant_id: TcxGridDBColumn;
    Label2: TLabel;
    edadq_merchant_id: TcxDBTextEdit;
    Label6: TLabel;
    edadq_chave_requisicao: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edadq_cnpjExit(Sender: TObject);
  private
    goCanClose: Boolean;
    function Validate: Integer;
    function doPost: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_Adquirentes: TFrmConfig_Adquirentes;

implementation

{$R *.dfm}

uses uFrmPDV;

function TFrmConfig_Adquirentes.Validate: Integer;
begin
  result := 0;
  // if (edpterm_descricao.Text = '') then
  // result := Integer(edpterm_descricao);
  // if (edpterm_serie_fiscal.Value <= 0) then
  // result := Integer(edpterm_serie_fiscal);
  // if (edpterm_numero.Value <= 0) then
  // result := Integer(edpterm_numero);
end;

procedure TFrmConfig_Adquirentes.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  goCanClose := true;
  close;
end;

function TFrmConfig_Adquirentes.doPost: Boolean;
var
  FocusField: Integer;
begin
  result     := false;
  FocusField := Validate;
  if FocusField > 0 then
  begin
    MessageBox(handle, pChar(GetCaptionFromControl(self, TControl(FocusField)) + ' não preenchido.'), 'I9 PDV', MB_ICONEXCLAMATION);
    if TWinControl(FocusField).Enabled then
      TWinControl(FocusField).SetFocus;
    exit;
  end;
  if dsAdquirentes.State in [dsEdit, dsInsert] then
    dsAdquirentes.Post;
  result := true;
end;

procedure TFrmConfig_Adquirentes.edadq_cnpjExit(Sender: TObject);
begin
  if not(dsAdquirentes.State in [dsEdit, dsInsert]) then
    dsAdquirentes.Edit;
  edadq_chave_requisicao.DataBinding.Field.AsString := GeraChaveRequisicaoSAT(ServerEmpresaCNPJ, edadq_cnpj.text);
end;

procedure TFrmConfig_Adquirentes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := goCanClose;
end;

procedure TFrmConfig_Adquirentes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F3:
      if not(dsAdquirentes.State in [dsInsert]) then
        dsAdquirentes.Append;
    VK_F2:
      begin
        goCanClose := false;
        if MessageBox(handle, 'Deseja gravar alterações?', 'I9 PDV', MB_ICONQUESTION + MB_DEFBUTTON1 + MB_YESNO) = IDYES then
          if not doPost then
            exit;
        goCanClose  := true;
        ModalResult := mrOk;
      end;
  end;
end;

procedure TFrmConfig_Adquirentes.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);

  dsAdquirentes.Active := true;
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmConfig_Adquirentes.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

end.
