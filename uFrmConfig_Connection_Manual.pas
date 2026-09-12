unit uFrmConfig_Connection_Manual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins, cxTextEdit, cxMaskEdit, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Menus, cxButtons, cxCurrencyEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, uWiEventsForm;

type
  TFrmConfig_Connection_Manual = class(TForm)
    Label38: TLabel;
    Shape16: TShape;
    Shape27: TShape;
    Label11: TLabel;
    edServidor: TcxTextEdit;
    edBancoDados: TcxTextEdit;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    btnVoltar: TcxButton;
    btnConfirma: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edPorta: TcxCurrencyEdit;
    cxButton1: TcxButton;
    cnTest: TFDConnection;
    WiEventsForm1: TWiEventsForm;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig_Connection_Manual: TFrmConfig_Connection_Manual;

implementation

{$R *.dfm}

uses uFrmPDV;

procedure TFrmConfig_Connection_Manual.btnConfirmaClick(Sender: TObject);
begin
  ModalResult := MrOk;
end;

procedure TFrmConfig_Connection_Manual.btnVoltarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConfig_Connection_Manual.cxButton1Click(Sender: TObject);
begin
  with cnTest do
  begin
    Params.Clear;
    Params.Add('DriverID=MSSQL');
    Params.Add('Server=' + edServidor.Text + ',' + edPorta.Text);
    Params.Add('Database=' + edBancoDados.Text);
    Params.Add('User_Name=' + edUsuario.Text);
    Params.Add('Password=' + edSenha.Text);
    Params.Add('ExtendedMetaData=True');
    Connected := true;
    if Connected then
      ShowMessage('Conexão realizada com sucesso!')
    else
      ShowMessage('Falha ao tentar conectar-se');
  end;
end;

procedure TFrmConfig_Connection_Manual.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmConfig_Connection_Manual.Shape16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(handle, WM_SYSCOMMAND, $F012, 0);

end;

procedure TFrmConfig_Connection_Manual.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  close;
end;

end.
