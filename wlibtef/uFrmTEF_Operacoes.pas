unit uFrmTEF_Operacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins, cxContainer, cxEdit,
  cxListView, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery;

type
  TListFormasPag = class
    fp_codigo: Integer;
    fp_descricao: String;
    fp_cartao: boolean;
  end;

  TFrmTEF_Operacoes = class(TForm)
    Label38: TLabel;
    Shape16: TShape;
    lblMsgRapida: TLabel;
    Shape27: TShape;
    lstOpcoes: TcxListView;
    fdFormas: TWiFDQuery;
    foFormas: TDataSource;
    Timer1: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Fopcao: Integer;
    { Private declarations }
  public
    property opcao: Integer read Fopcao;
  end;

var
  FrmTEF_Operacoes: TFrmTEF_Operacoes;

implementation

{$R *.dfm}

procedure TFrmTEF_Operacoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  loFindCod  : string;
  loitem     : TListItem;
  OpcaoCodigo: Integer;
  OpcaoDesc  : string;
  OpcaoFinal : string;
begin
  case Key of
    Vk_ESCAPE:
      begin
        close;
      end;
    Vk_RETURN:
      begin
        OpcaoCodigo := lstOpcoes.Items.Item[lstOpcoes.ItemIndex].Caption.ToInteger;
        Fopcao      := lstOpcoes.ItemIndex;
        ModalResult := mrOK;
      end;
    VK_NUMPAD0 .. VK_NUMPAD9:
      begin
        // loFindCod := StrZero(IntToStr(Key - 96), 3);
        // loitem := lstListFormas.FindCaption(0, loFindCod, true, true, true);
        if loitem <> nil then
        begin
          loitem.Focused  := true;
          loitem.Selected := true;
        end;
      end;
  end;
end;

end.
