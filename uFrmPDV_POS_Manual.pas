unit uFrmPDV_POS_Manual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uWiEventsForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter, cxClasses, dxLayoutContainer, dxLayoutControl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery, cxContainer, cxEdit, cxDBEdit,
  cxTextEdit, cxCurrencyEdit, Vcl.StdCtrls, Vcl.Menus, cxButtons, cxCheckBox, uGlobalLibPDV, uFrmPDV_DModule, Vcl.ExtCtrls, cxMemo,
  JvBrowseFolder, JvBaseDlg, WibiSkins, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle;

type
  TFrmPDV_POS_Manual = class(TForm)
    WiEventsForm1: TWiEventsForm;
    Label14: TLabel;
    Label36: TLabel;
    edpnfp_pos_dono_cartao: TcxTextEdit;
    Shape16: TShape;
    Label38: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    edpnfp_pos_bin: TcxCurrencyEdit;
    edpnfp_pos_valor: TcxCurrencyEdit;
    edpnfp_pos_ult_quatro_dig: TcxCurrencyEdit;
    Label6: TLabel;
    edpnfp_pos_data_expiracao: TcxDateEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edpnfp_pos_id_fila: TcxCurrencyEdit;
    Label5: TLabel;
    edpnfp_pos_codigo_aut: TcxCurrencyEdit;
    Label7: TLabel;
    edpnfp_pos_parcelas: TcxCurrencyEdit;
    Label8: TLabel;
    edpnfp_pos_tipo: TcxComboBox;
    Shape27: TShape;
    edpnfp_pos_inst_financeira: TcxLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure dsTerminaisBeforePost(DataSet: TDataSet);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    function Validate: Integer;
    function doPost: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPDV_POS_Manual: TFrmPDV_POS_Manual;

implementation

{$R *.dfm}

uses uFrmPDV;

function TFrmPDV_POS_Manual.Validate: Integer;
begin
  result := 0;
  // if (edpnfp_pos_bin.Value <= 0) then
  // result := Integer(edpnfp_pos_bin);
  // if (edpnfp_pos_ult_quatro_dig.Value <= 0) then
  // result := Integer(edpnfp_pos_ult_quatro_dig);
  // if (edpnfp_pos_data_expiracao.Text = '') then
  // result := Integer(edpnfp_pos_data_expiracao);
  // if (edpnfp_pos_dono_cartao.Text = '') then
  // result := Integer(edpnfp_pos_dono_cartao);
  if (edpnfp_pos_tipo.Text = '') then
    result := Integer(edpnfp_pos_tipo);
  if (edpnfp_pos_inst_financeira.Text = '') then
    result := Integer(edpnfp_pos_inst_financeira);
  if (edpnfp_pos_id_fila.Value <= 0) then
    result := Integer(edpnfp_pos_id_fila);
  if (edpnfp_pos_codigo_aut.Value <= 0) then
    result := Integer(edpnfp_pos_codigo_aut);
  if (edpnfp_pos_valor.Value <= 0) then
    result := Integer(edpnfp_pos_valor);
  if (edpnfp_pos_parcelas.Value <= 0) then
    result := Integer(edpnfp_pos_parcelas);
end;

procedure TFrmPDV_POS_Manual.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if edpnfp_pos_bin.Focused then
    close;
end;

function TFrmPDV_POS_Manual.doPost: Boolean;
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
  // if dsTerminais.State in [dsEdit, dsInsert] then
  // dsTerminais.Post;
  result := true;
end;

procedure TFrmPDV_POS_Manual.dsTerminaisBeforePost(DataSet: TDataSet);
begin
  // dsTerminais.FieldByName('em_codigo').AsInteger      := ServerEmpresa;
  // dsTerminais.FieldByName('pterm_serial_hd').AsString := uGlobalLibPDV.GetSerialHD;
end;

procedure TFrmPDV_POS_Manual.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  if MessageBox(handle, 'Deseja gravar alterações ?', 'I9 PDV', MB_ICONQUESTION + MB_DEFBUTTON1 + MB_YESNO) = IDNO then
    if MessageBox(handle, 'Tem certeza que deseja sair sem gravar as alterações ?', 'I9 PDV', MB_ICONQUESTION + MB_DEFBUTTON2 + MB_YESNO) = IDYES then
    begin
      CanClose := true;
      exit;
    end;
  if not doPost then
    exit;
  CanClose    := true;
  ModalResult := mrOk;
end;

procedure TFrmPDV_POS_Manual.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of

    VK_RETURN:
      if edpnfp_pos_parcelas.Focused then
        ModalResult := mrOk;
  end;
end;

procedure TFrmPDV_POS_Manual.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);

  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, edpnfp_pos_inst_financeira, 'SELECT adq_id,adq_nome FROM pdv.tb_adquirentes WHERE adq_ativo=1', 'adq_nome', 'adq_id');
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
  // dsTerminais.ParamByName('em_codigo').AsInteger      := ServerEmpresa;
  // dsTerminais.ParamByName('pterm_serial_hd').AsString := uGlobalLibPDV.GetSerialHD;
  // dsTerminais.Active                                  := true;
end;

procedure TFrmPDV_POS_Manual.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

end.
