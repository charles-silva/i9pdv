unit uFrmPDV_FormasPag;

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
  cxTextEdit,
  cxCurrencyEdit, uWiEventsForm, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle;

type
  TListFormasPag = class
    fp_codigo: Integer;
    fp_descricao: String;
    fp_cartao: boolean;
    fp_debito: boolean;
    fp_pix: boolean;
  end;

  TFrmPDV_FormasPag = class(TForm)
    Label38: TLabel;
    Shape16: TShape;
    lblMsgRapida: TLabel;
    Shape27: TShape;
    lstListFormas: TcxListView;
    fdFormas: TWiFDQuery;
    foFormas: TDataSource;
    Timer1: TTimer;
    Label1: TLabel;
    edCodigo: TcxCurrencyEdit;
    Label2: TLabel;
    edDescricao: TcxTextEdit;
    WiEventsForm1: TWiEventsForm;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
  private

    procedure doConfirme;
    { Private declarations }
  public
    gofp_codigo      : Integer;
    gofp_descricao   : String;
    gofp_cartao      : boolean;
    gofp_debito      : boolean;
    goSomenteDinheiro: boolean;
  end;

var
  FrmPDV_FormasPag: TFrmPDV_FormasPag;

implementation

{$R *.dfm}

uses uFrmPDV, uGlobalLibPDV;

procedure TFrmPDV_FormasPag.FormDestroy(Sender: TObject);
var
  I: Integer;
begin

  for I := lstListFormas.Items.Count - 1 downto 0 do
  begin
    if lstListFormas.Items.Item[I].Data <> nil then
      if TObject(lstListFormas.Items.Item[I].Data) is TListFormasPag then
        TListFormasPag(lstListFormas.Items.Item[I].Data).Destroy;
    lstListFormas.Items.Item[I].Delete;
  end;

end;

procedure TFrmPDV_FormasPag.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  loitem: TListItem;
begin
  case Key of
    Vk_ESCAPE:
      gofp_codigo := 0;
    Vk_RETURN:
      begin
        if lstListFormas.Focused then
          doConfirme
        else if (edCodigo.Value > 0) and edCodigo.Focused then
        begin
          loitem := lstListFormas.FindCaption(0, StrZero(edCodigo.text, 3), true, true, true);
          if loitem <> nil then
          begin
            edDescricao.text := loitem.SubItems.Strings[0];
            lstListFormas.Setfocus;
            loitem.Focused  := true;
            loitem.Selected := true;
          end;
        end;
        Key := 0;
      end;
  end;
end;

procedure TFrmPDV_FormasPag.FormShow(Sender: TObject);
var
  loListItem     : TListItem;
  loListFormasPag: TListFormasPag;
begin
  WiEventsForm1.Open(handle);
  fdFormas.ParamByName('dinheiro').AsInteger := 0;
  if goSomenteDinheiro then
    fdFormas.ParamByName('dinheiro').AsInteger := 1;
  fdFormas.Active                              := true;

  fdFormas.Filtered := False;
  if FrmPDV.goFormaPagamento > 0 then
  begin
    fdFormas.Filter   := 'fp_codigo = ' + FrmPDV.goFormaPagamento.ToString;
    fdFormas.Filtered := true;
  end;

  while not fdFormas.Eof do
  begin
    loListFormasPag              := TListFormasPag.Create;
    loListFormasPag.fp_codigo    := fdFormas.FieldByName('fp_codigo').AsInteger;
    loListFormasPag.fp_descricao := fdFormas.FieldByName('fp_descricao').AsString;
    loListFormasPag.fp_cartao    := (fdFormas.FieldByName('fp_cartao').AsInteger = 1);
    loListFormasPag.fp_pix       := (fdFormas.FieldByName('fp_pix').AsInteger = 1);
    loListFormasPag.fp_debito    := fdFormas.FieldByName('fp_debito').AsBoolean;
    loListItem                   := lstListFormas.Items.Add;
    loListItem.Data              := Pointer(loListFormasPag);
    loListItem.Caption           := StrZero(fdFormas.FieldByName('fp_indice_pdv').AsString, 3);
    loListItem.SubItems.Add(fdFormas.FieldByName('fp_descricao').AsString);
    fdFormas.Next;
  end;
  Timer1.Enabled      := true;
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_FormasPag.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  // lstListFormas.Setfocus;
  // lstListFormas.ItemIndex             := 0;
  // lstListFormas.Items.Item[0].Focused := true;
end;

procedure TFrmPDV_FormasPag.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  close;
end;

procedure TFrmPDV_FormasPag.doConfirme;
begin
  if FrmPDV_FormasPag.lstListFormas.ItemFocused = nil then
    exit;
  gofp_codigo    := TListFormasPag(FrmPDV_FormasPag.lstListFormas.ItemFocused.Data).fp_codigo;
  gofp_descricao := TListFormasPag(FrmPDV_FormasPag.lstListFormas.ItemFocused.Data).fp_descricao;
  gofp_cartao    := TListFormasPag(FrmPDV_FormasPag.lstListFormas.ItemFocused.Data).fp_cartao;
  gofp_debito    := TListFormasPag(FrmPDV_FormasPag.lstListFormas.ItemFocused.Data).fp_debito;
  if gofp_codigo > 0 then
    ModalResult := mrOk;
end;

end.
