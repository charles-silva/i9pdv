unit uFrmOpcoesTEF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, cxContainer, cxEdit, cxListView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uWiFDQuery, Vcl.StdCtrls;

type
  TfrmOpcoesTEF = class(TForm)
    Shape27: TShape;
    Shape16: TShape;
    Label38: TLabel;
    lblMsgRapida: TLabel;
    lstOpcoes: TcxListView;
    fdFormas: TWiFDQuery;
    foFormas: TDataSource;
    Timer1: TTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpcoesTEF: TfrmOpcoesTEF;

implementation

{$R *.dfm}

end.
