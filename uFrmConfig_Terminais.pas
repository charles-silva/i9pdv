unit uFrmConfig_Terminais;

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
  JvBrowseFolder, JvBaseDlg, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxRadioGroup,
  MD5_2010, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle;

type
  TFrmConfig_Terminais = class(TForm)
    WiEventsForm1: TWiEventsForm;
    dsTerminais: TWiFDQuery;
    doTerminais: TDataSource;
    Label14: TLabel;
    Label36: TLabel;
    edpterm_descricao: TcxDBTextEdit;
    Label1: TLabel;
    edpterm_serie_fiscal: TcxDBCurrencyEdit;
    Shape16: TShape;
    Label38: TLabel;
    Label2: TLabel;
    JvBrowseForFolderDialog1: TJvBrowseForFolderDialog;
    Shape1: TShape;
    cbpimp_id: TcxDBLookupComboBox;
    Label10: TLabel;
    ckpterm_nfce: TcxRadioButton;
    ckpterm_sat: TcxRadioButton;
    ckpterm_pos: TcxRadioButton;
    ckpterm_tef: TcxRadioButton;
    Label9: TLabel;
    Shape2: TShape;
    Label11: TLabel;
    Shape3: TShape;
    Label13: TLabel;
    Label15: TLabel;
    Shape4: TShape;
    Label16: TLabel;
    edpterm_pos_chave_validador: TcxDBTextEdit;
    edpterm_csc: TcxDBTextEdit;
    ckpterm_nfce_offline: TcxRadioButton;
    rbNaoFiscal: TcxRadioButton;
    ckpterm_semcartao: TcxRadioButton;
    edpterm_id: TcxDBTextEdit;
    Shape5: TShape;
    ckpterm_modo_servidor: TcxDBCheckBox;
    lbl1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cbbTipoTEF: TcxDBComboBox;
    cbbTEFAmbiente: TcxDBComboBox;
    Label5: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    lblQrCode: TLabel;
    cxDBComboBox1: TcxDBComboBox;
    Shape27: TShape;
    procedure FormShow(Sender: TObject);
    procedure dsTerminaisBeforePost(DataSet: TDataSet);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsTerminaisAfterInsert(DataSet: TDataSet);
    procedure loadCombosTEF;
    procedure FormCreate(Sender: TObject);
    procedure ckpterm_tefClick(Sender: TObject);
    procedure ckpterm_posClick(Sender: TObject);
    procedure ckpterm_semcartaoClick(Sender: TObject);
  private
    goCanClose: Boolean;
    function Validate: Integer;
    function doPost: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_Terminais: TFrmConfig_Terminais;

implementation

{$R *.dfm}

uses uFrmPDV, ACBrTEFAPI, System.TypInfo, ACBrTEFAPIComum;

function TFrmConfig_Terminais.Validate: Integer;
begin
  result := 0;
  if (edpterm_descricao.Text = '') then
    result := Integer(edpterm_descricao);
  if (edpterm_serie_fiscal.Value <= 0) then
    result := Integer(edpterm_serie_fiscal);
  if (edpterm_id.Text = '') then
    result := Integer(edpterm_id);
end;

procedure TFrmConfig_Terminais.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if edpterm_descricao.Focused then
    close;
end;

procedure TFrmConfig_Terminais.ckpterm_posClick(Sender: TObject);
begin
  doTerminais.Edit;
end;

procedure TFrmConfig_Terminais.ckpterm_semcartaoClick(Sender: TObject);
begin
  doTerminais.Edit;
end;

procedure TFrmConfig_Terminais.ckpterm_tefClick(Sender: TObject);
begin
  doTerminais.Edit;
end;

function TFrmConfig_Terminais.doPost: Boolean;
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
  if dsTerminais.State in [dsEdit, dsInsert] then
  begin
    dsTerminais.FieldByName('pterm_nfce').AsBoolean         := ckpterm_nfce.Checked;
    dsTerminais.FieldByName('pterm_nfce_offline').AsBoolean := ckpterm_nfce_offline.Checked;
    dsTerminais.FieldByName('pterm_sat').AsBoolean          := ckpterm_sat.Checked;
    dsTerminais.FieldByName('pterm_tef').AsBoolean          := ckpterm_tef.Checked;
    dsTerminais.FieldByName('pterm_pos').AsBoolean          := ckpterm_pos.Checked;
    dsTerminais.Post;
  end;
  result := true;
end;

procedure TFrmConfig_Terminais.dsTerminaisAfterInsert(DataSet: TDataSet);
begin
  dsTerminais.FieldByName('pterm_id').AsString := MD5String(uGlobalLibPDV.GetSerialHD + ServerEmpresaCNPJ);
end;

procedure TFrmConfig_Terminais.dsTerminaisBeforePost(DataSet: TDataSet);
begin
  dsTerminais.FieldByName('em_codigo').AsInteger      := ServerEmpresa;
  dsTerminais.FieldByName('pterm_serial_hd').AsString := uGlobalLibPDV.GetSerialHD;
  if (dsTerminais.FieldByName('pterm_id').AsString = '1') or (dsTerminais.FieldByName('pterm_id').AsString = '2') then
    dsTerminais.FieldByName('pterm_id').AsString := MD5String(uGlobalLibPDV.GetSerialHD + ServerEmpresaCNPJ);
end;

procedure TFrmConfig_Terminais.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := goCanClose;
end;

procedure TFrmConfig_Terminais.FormCreate(Sender: TObject);
begin
  loadCombosTEF;
end;

procedure TFrmConfig_Terminais.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2:
      begin
        goCanClose := false;
        if MessageBox(handle, 'Deseja gravar alterações?', 'I9 PDV', MB_ICONQUESTION + MB_DEFBUTTON1 + MB_YESNO) = IDYES
        then
          if not doPost then
            exit;
        goCanClose  := true;
        ModalResult := mrOk;
      end;
  end;
end;

procedure TFrmConfig_Terminais.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);

  LoadLookUpComboBox(self, FrmPDV_DModule.ADConnection1, cbpimp_id,
    'SELECT * FROM pdv.tb_impressoras WHERE pimp_ativo=1', 'pimp_descricao;pimp_port', 'pimp_id', '', '', true, 0,
    'Descrição;Porta', '300;100');

  dsTerminais.ParamByName('em_codigo').AsInteger      := ServerEmpresa;
  dsTerminais.ParamByName('pterm_serial_hd').AsString := uGlobalLibPDV.GetSerialHD;
  dsTerminais.Active                                  := true;
  ckpterm_nfce.Checked                                := dsTerminais.FieldByName('pterm_nfce').AsBoolean;
  ckpterm_nfce_offline.Checked                        := dsTerminais.FieldByName('pterm_nfce_offline').AsBoolean;
  ckpterm_sat.Checked                                 := dsTerminais.FieldByName('pterm_sat').AsBoolean;
  ckpterm_tef.Checked                                 := dsTerminais.FieldByName('pterm_tef').AsBoolean;
  ckpterm_pos.Checked                                 := dsTerminais.FieldByName('pterm_pos').AsBoolean;
  ckpterm_semcartao.Checked                           := (not ckpterm_tef.Checked) and (not ckpterm_pos.Checked);
  rbNaoFiscal.Checked                                 := (not ckpterm_sat.Checked) and (not ckpterm_nfce.Checked) and
    (not ckpterm_nfce_offline.Checked);
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
end;

procedure TFrmConfig_Terminais.loadCombosTEF;
var
  M: TACBrTEFAPITipo;
  P: TACBrTEFAPIAmbiente;
begin
  cbbTipoTEF.Properties.Items.Clear;
  For M := Low(TACBrTEFAPITipo) to High(TACBrTEFAPITipo) do
    cbbTipoTEF.Properties.Items.Add(GetEnumName(TypeInfo(TACBrTEFAPITipo), Integer(M)));
  cbbTipoTEF.ItemIndex := 0;

  cbbTEFAmbiente.Properties.Items.Clear;
  For P := Low(TACBrTEFAPIAmbiente) to High(TACBrTEFAPIAmbiente) do
    cbbTEFAmbiente.Properties.Items.Add(GetEnumName(TypeInfo(TACBrTEFAPIAmbiente), Integer(P)));
end;

procedure TFrmConfig_Terminais.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

end.
