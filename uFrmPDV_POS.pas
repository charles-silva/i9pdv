unit uFrmPDV_POS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins,
  cxContainer, cxEdit,
  cxListView, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxBarBuiltInMenu,
  cxPC, dxCustomWizardControl, dxWizardControl, cxCustomListBox, cxListBox,
  cxDBEdit, cxTextEdit, cxCurrencyEdit, dxScreenTip, cxClasses, dxCustomHint,
  cxHint;

type

  TListPOS = class
    pos_id: Integer;
    pos_descricao: String;
    pos_serial: String;
    adq_merchant_id: String;
    adq_chave_requisicao: String;
    adq_id: Integer;
  end;

  TListOperadoras = class
    op_id: Integer;
    op_codigo: Integer;
    op_descicao: String;
  end;

  TParcelas = class
    praz_id: Integer;
    praz_parcela: Integer;
    praz_descicao: String;
  end;

  TwizardPagamento = class
    pois_id: Integer;
    pos_autorizacao: String;
    pos_parcelas: Integer;
    pos_cnpj: string;
  end;

  TFrmPDV_POS = class(TForm)
    lblTitle: TLabel;
    Shape16: TShape;
    Shape27: TShape;
    fdPOS: TWiFDQuery;
    doPOS: TDataSource;
    Timer1: TTimer;
    cxPageControl1: TcxPageControl;
    cxtabshitPOS: TcxTabSheet;
    lstListPOS: TcxListView;
    cxTabSheet2: TcxTabSheet;
    cxListView1: TcxListView;
    cxTabSheet3: TcxTabSheet;
    wiQryOperadoras: TWiFDQuery;
    dsOperadoras: TDataSource;
    cxListOperadoras: TcxListView;
    cxTabSheet4: TcxTabSheet;
    Shape10: TShape;
    Label5: TLabel;
    edtAutorizacao: TcxTextEdit;
    cxListPrazo: TcxListView;
    dsPrazos: TDataSource;
    wiQryPrazos: TWiFDQuery;
    lblMsgRapida: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure LoadOperadoras;
    procedure LoadPrazos;
  private
    procedure doConfirme;
    procedure doWizard;
    procedure doConfirmeOperadoras;
    { Private declarations }
  public
    goadq_merchant_id     : String;
    goadq_chave_requisicao: String;
    gopos_serial          : String;
    goadq_id              : Integer;
    gopos_id              : Integer;
    goOp_codigo           : Integer;
    goOp_descricao        : String;
    goParcela             : Integer;
    gWizardFinished       : Boolean;
    goAutorizacao         : string;
  end;

var
  FrmPDV_POS: TFrmPDV_POS;

const
  LstTitle: TArray<String> = ['Selecione um POS para pagamento', 'Selecione uma bandeira',
    'Selecione um PRAZO para pagamento', 'Digite o código de autorização'];

implementation

{$R *.dfm}

uses uFrmPDV, uGlobalLibPDV;

procedure TFrmPDV_POS.doConfirmeOperadoras;
begin

end;

procedure TFrmPDV_POS.doWizard;
begin
  case (cxPageControl1.ActivePageIndex) of
    0:
      begin
        cxPageControl1.ActivePageIndex         := 1;
        lblTitle.Caption                       := LstTitle[1];
        cxListOperadoras.ItemIndex             := 0;
        cxListOperadoras.Items.Item[0].Focused := true;
      end;
    1:
      begin
        cxPageControl1.ActivePageIndex    := 2;
        lblTitle.Caption                  := LstTitle[2];
        cxListPrazo.ItemIndex             := 0;
        cxListPrazo.Items.Item[0].Focused := true;
        cxPageControl1.ActivePageIndex    := 3;
      end;
    2:
      begin
        cxPageControl1.ActivePageIndex := 3;
        lblTitle.Caption               := LstTitle[3];
      end;
    3:
      doConfirme;
  end;
  // cxPageControl1.SelectNextPage(true, false);

end;

procedure TFrmPDV_POS.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  loFindCod: string;
  loitem   : TListItem;
begin
  case Key of
    Vk_ESCAPE:
      begin
        goadq_merchant_id := '; ';
        gopos_serial      := '';
        ModalResult       := mrCancel;
      end;
    Vk_RETURN:
      begin
        doWizard;
      end;
    VK_NUMPAD0 .. VK_NUMPAD9:
      begin
        loFindCod := StrZero(IntToStr(Key - 96), 3);
        loitem    := lstListPOS.FindCaption(0, loFindCod, true, true, true);
        if loitem <> nil then
        begin
          loitem.Focused  := true;
          loitem.Selected := true;
        end;
      end;
  end;
end;

procedure TFrmPDV_POS.FormShow(Sender: TObject);
var
  loListItem: TListItem;
  loListPOS : TListPOS;
begin
  gWizardFinished         := false;
  fdPOS.Active            := true;
  cxPageControl1.HideTabs := true;
  while not fdPOS.Eof do
  begin
    loListPOS                      := TListPOS.Create;
    loListPOS.pos_id               := fdPOS.FieldByName('pos_id').AsInteger;
    loListPOS.pos_descricao        := fdPOS.FieldByName('pos_descricao').AsString;
    loListPOS.pos_serial           := fdPOS.FieldByName('pos_serial').AsString;
    loListPOS.adq_merchant_id      := fdPOS.FieldByName('adq_merchant_id').AsString;
    loListPOS.adq_chave_requisicao := fdPOS.FieldByName('adq_chave_requisicao').AsString;
    loListPOS.adq_id               := fdPOS.FieldByName('adq_id').AsInteger;
    loListItem                     := lstListPOS.Items.Add;
    loListItem.Data                := Pointer(loListPOS);
    loListItem.Caption             := StrZero(fdPOS.FieldByName('pos_id').AsString, 3);
    loListItem.SubItems.Add(fdPOS.FieldByName('pos_descricao').AsString);
    loListItem.SubItems.Add(fdPOS.FieldByName('pos_serial').AsString);
    fdPOS.Next;
  end;
  LoadOperadoras;
  LoadPrazos;
  Timer1.Enabled      := true;
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_POS.LoadOperadoras;
var
  loListItem      : TListItem;
  loListOperadoras: TListOperadoras;
begin
  cxListOperadoras.Clear;
  wiQryOperadoras.Active := true;
  while not wiQryOperadoras.Eof do
  begin
    loListOperadoras             := TListOperadoras.Create;
    loListOperadoras.op_id       := wiQryOperadoras.FieldByName('op_id').AsInteger;
    loListOperadoras.op_codigo   := wiQryOperadoras.FieldByName('op_codigo').AsInteger;
    loListOperadoras.op_descicao := wiQryOperadoras.FieldByName('op_descricao').AsString;
    loListItem                   := cxListOperadoras.Items.Add;
    loListItem.Data              := Pointer(loListOperadoras);
    loListItem.Caption           := wiQryOperadoras.FieldByName('op_codigo').AsString;
    loListItem.SubItems.Add(wiQryOperadoras.FieldByName('op_descricao').AsString);
    wiQryOperadoras.Next;
  end;
end;

procedure TFrmPDV_POS.LoadPrazos;
var
  loListItem: TListItem;
  loPrazo   : TParcelas;
begin
  cxListPrazo.Clear;
  wiQryPrazos.Active := true;
  while not wiQryPrazos.Eof do
  begin
    loPrazo               := TParcelas.Create;
    loPrazo.praz_id       := wiQryPrazos.FieldByName('parc_id').AsInteger;
    loPrazo.praz_parcela  := wiQryPrazos.FieldByName('parc_parcela').AsInteger;
    loPrazo.praz_descicao := wiQryPrazos.FieldByName('parc_descricao').AsString;
    loListItem            := cxListPrazo.Items.Add;
    loListItem.Data       := Pointer(loPrazo);
    loListItem.Caption    := wiQryPrazos.FieldByName('parc_descricao').AsString;
    // loListItem.
    // loListItem.SubItems.Add(wiQryPrazos.FieldByName('parc_descricao').AsString);
    wiQryPrazos.Next;

  end;

end;

procedure TFrmPDV_POS.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  lstListPOS.SetFocus;
  lstListPOS.ItemIndex             := 0;
  lstListPOS.Items.Item[0].Focused := true;
  cxPageControl1.ActivePageIndex   := 0;
end;

procedure TFrmPDV_POS.doConfirme;
begin
  if lstListPOS.ItemFocused = nil then
    exit;
  goadq_chave_requisicao := TListPOS(lstListPOS.ItemFocused.Data).adq_chave_requisicao;
  goadq_merchant_id      := TListPOS(lstListPOS.ItemFocused.Data).adq_merchant_id;
  gopos_serial           := TListPOS(lstListPOS.ItemFocused.Data).pos_serial;
  goadq_id               := TListPOS(lstListPOS.ItemFocused.Data).adq_id;
  gopos_id               := TListPOS(lstListPOS.ItemFocused.Data).pos_id;

  { confirmando valor das operadoras }
  if cxListOperadoras.ItemFocused = nil then
    exit;
  goOp_codigo    := TListOperadoras(cxListOperadoras.ItemFocused.Data).op_codigo;
  goOp_descricao := TListOperadoras(cxListOperadoras.ItemFocused.Data).op_descicao;

  { Parcelas }
  goParcela := TParcelas(cxListPrazo.ItemFocused.Data).praz_parcela;

  { Código de autoriação }
  goAutorizacao := edtAutorizacao.Text;

  if (gopos_serial <> '') and (goadq_merchant_id <> '') and (goAutorizacao <> '') then
  begin
    gWizardFinished := true;
    ModalResult     := mrOk;
  end;
end;

end.
