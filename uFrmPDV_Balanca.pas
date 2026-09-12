unit uFrmPDV_Balanca;

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
  ACBrBase, ACBrBAL, ACBrDevice;

type
  TListFormasPag = class
    fp_codigo: Integer;
    fp_descricao: String;
    fp_cartao: boolean;
  end;

  TFrmPDV_Balanca = class(TForm)
    Label38: TLabel;
    Shape16: TShape;
    Shape27: TShape;
    ACBrBAL1: TACBrBAL;
    lblStatus: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure ACBrBAL1LePeso(Peso: Double; Resposta: AnsiString);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure doStartBal;
    { Private declarations }
  public
    goPeso: Double;
  end;

var
  FrmPDV_Balanca: TFrmPDV_Balanca;

implementation

{$R *.dfm}

uses uFrmPDV, uGlobalLibPDV, ACBrDeviceSerial;

procedure TFrmPDV_Balanca.ACBrBAL1LePeso(Peso: Double; Resposta: AnsiString);
begin
  if Peso > 0 then
  begin
    goPeso      := Peso;
    ModalResult := mrOK;
  end;
end;

procedure TFrmPDV_Balanca.doStartBal;
begin
  with FrmPDV do
  begin
    // configura porta de comunicação
    ACBrBAL1.Modelo           := TACBrBALModelo(goTerminal.balanca.pbal_modelo);
    ACBrBAL1.Device.HandShake := TACBrHandShake(goTerminal.balanca.pbal_handshake);
    ACBrBAL1.Device.Parity    := TACBrSerialParity(goTerminal.balanca.pbal_parity);
    ACBrBAL1.Device.Stop      := TACBrSerialStop(goTerminal.balanca.pbal_stop);
    ACBrBAL1.Device.Data      := goTerminal.balanca.pbal_data;
    ACBrBAL1.Device.Baud      := goTerminal.balanca.pbal_baud;
    ACBrBAL1.Device.Porta     := goTerminal.balanca.pbal_port;
    // ACBrBAL1.ArqLOG           := edLog.text;
  end;

  // Conecta com a balança
  ACBrBAL1.Ativar;
  Timer1.Enabled := true;
end;

procedure TFrmPDV_Balanca.FormShow(Sender: TObject);
begin
  doStartBal;
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_Balanca.Timer1Timer(Sender: TObject);
begin
  ACBrBAL1.LePeso;
end;

end.
