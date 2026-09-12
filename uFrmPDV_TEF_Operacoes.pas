unit uFrmPDV_TEF_Operacoes;

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
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle;

type
  TListFormasPag = class
    fp_codigo: Integer;
    fp_descricao: String;
    fp_cartao: boolean;
  end;

  TFrmPDV_TEF_Operacoes = class(TForm)
    lblTitulo: TLabel;
    Shape16: TShape;
    lblMsgRapida: TLabel;
    Shape27: TShape;
    lstOpcoes: TcxListView;
    fdFormas: TWiFDQuery;
    foFormas: TDataSource;
    Timer1: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FUsaTeclasDeAtalho: boolean;
    function GetItemSelecionado: Integer;
    function GetOpcoes: TStrings;
    function GetTitulo: String;
    procedure SetItemSelecionado(const Value: Integer);
    procedure SetOpcoes(const Value: TStrings);
    procedure SetTitulo(const Value: String);
    procedure loadOpcoes(Aopcoes: TStrings);
    { Private declarations }
  public
    property Titulo           : String read GetTitulo write SetTitulo;
    property Opcoes           : TStrings read GetOpcoes write SetOpcoes;
    property ItemSelecionado  : Integer read GetItemSelecionado write SetItemSelecionado;
    property UsaTeclasDeAtalho: boolean read FUsaTeclasDeAtalho write FUsaTeclasDeAtalho;
  end;

var
  FrmPDV_TEF_Operacoes: TFrmPDV_TEF_Operacoes;

implementation

{$R *.dfm}

uses uFrmPDV, uGlobalLibPDV;

procedure TFrmPDV_TEF_Operacoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    Vk_ESCAPE:
      ModalResult := mrCancel;
    Vk_RETURN:
      begin
        ModalResult := mrOk;
      end;
  end;
end;

function TFrmPDV_TEF_Operacoes.GetItemSelecionado: Integer;
begin
  Result := lstOpcoes.ItemIndex;
end;

function TFrmPDV_TEF_Operacoes.GetOpcoes: TStrings;
begin
//  Result := lstOpcoes.Items.;
end;

function TFrmPDV_TEF_Operacoes.GetTitulo: String;
begin
  Result := lblTitulo.Caption;
end;

procedure TFrmPDV_TEF_Operacoes.loadOpcoes(Aopcoes: TStrings);
var
  i         : Integer;
  loListItem: TListItem;
begin
  for i := 1 to Aopcoes.Count do
  begin
    loListItem         := lstOpcoes.Items.Add;
    loListItem.Caption := Aopcoes[i - 1];
  end;

end;

procedure TFrmPDV_TEF_Operacoes.SetItemSelecionado(const Value: Integer);
begin
  lstOpcoes.ItemIndex := Value;
end;

procedure TFrmPDV_TEF_Operacoes.SetOpcoes(const Value: TStrings);
begin
  loadOpcoes(Value);
end;

procedure TFrmPDV_TEF_Operacoes.SetTitulo(const Value: String);
begin
  lblTitulo.Caption := Value;
end;

end.
