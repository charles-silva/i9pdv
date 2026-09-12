unit uFrmPDV_Promocoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uWiEventsForm, Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet, uFrmPDV_DModule,
  FireDAC.Comp.Client, uWiFDQuery, cxTextEdit, cxCurrencyEdit, cxListView,
  Vcl.StdCtrls, dxSkinsCore, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle;

type
  TFrmPDV_Promocoes = class(TForm)
    Shape27: TShape;
    Shape16: TShape;
    Label38: TLabel;
    lblMsgRapida: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TcxCurrencyEdit;
    edDescricao: TcxTextEdit;
    fdPromocoes: TWiFDQuery;
    foFormas: TDataSource;
    Timer1: TTimer;
    WiEventsForm1: TWiEventsForm;
    lstDescontoFormas: TcxListView;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    goFormaPagamento: Integer;
  end;

var
  FrmPDV_Promocoes: TFrmPDV_Promocoes;

implementation

uses
  uFrmPDV, uPDVLib;

{$R *.dfm}

procedure TFrmPDV_Promocoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  loitem: TListItem;
begin
  case Key of
    Vk_ESCAPE:
      ModalResult := mrCancel;
    Vk_RETURN:
      begin
        if lstDescontoFormas.ItemFocused <> nil then
          ModalResult := mrOk;
        Key           := 0;
      end;
  end;
end;

procedure TFrmPDV_Promocoes.FormShow(Sender: TObject);
var
  CMD       : string;
  loNF      : TNF;
  loListItem: TListItem;
begin
  loNF := goPDVClass.GetTotaisNF(FrmPDV.goPnf_id);
  try
    CMD := 'Select Formapagpdv, Recebimento, -Desconto as Desconto, :pValor +(:pValor *(desconto/100)) as total from Basei9..recebimento where Formapagpdv is not null';
    fdPromocoes.close;
    fdPromocoes.sql.Text                         := CMD;
    fdPromocoes.ParamByName('pValor').AsCurrency := loNF.TotalProd;
    fdPromocoes.open;
    if fdPromocoes.RecordCount > 0 then
    begin
      lstDescontoFormas.Items.Clear;
      while not fdPromocoes.Eof do
      begin
        loListItem         := lstDescontoFormas.Items.Add;
        loListItem.Data    := Pointer(fdPromocoes.FieldByName('Formapagpdv').AsInteger);
        loListItem.Caption := fdPromocoes.FieldByName('recebimento').AsString;
        if fdPromocoes.FieldByName('desconto').Value >= 0 then
          loListItem.SubItems.Add(fdPromocoes.FieldByName('desconto').AsString + '%');
        // if fdPromocoes.FieldByName('desconto').Value > 0 then
        // loListItem.SubItems.Add('desconto(' + fdPromocoes.FieldByName('desconto').AsString + '%)')
        // else
        // loListItem.SubItems.Add('acrescimo(' + double(fdPromocoes.FieldByName('desconto').value * -1).ToString
        // + '%)');
        loListItem.SubItems.Add(FormatFloat('0.,00', fdPromocoes.FieldByName('total').AsFloat));
        // ALIMENTA UM CAMPO ESCONDIDO PARA QUE POSSA PEGAR ESSE VALOR NA TELA ANTERIOR
        loListItem.SubItems.Add(fdPromocoes.FieldByName('desconto').AsString);
        fdPromocoes.Next;
      end;
    end;
    lstDescontoFormas.SetFocus;

  finally
    if Assigned(loNF) then
      loNF.Destroy;
  end;
end;

end.
