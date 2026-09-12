unit uFrmSATRetorno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uPDVLib;

type
  TFrmSATRetorno = class(TForm)
    Shape27: TShape;
    Shape16: TShape;
    lblTitle: TLabel;
    Label20: TLabel;
    Shape8: TShape;
    Label1: TLabel;
    Shape1: TShape;
    Label2: TLabel;
    Shape2: TShape;
    Label3: TLabel;
    Shape3: TShape;
    Label4: TLabel;
    Shape4: TShape;
    lblMsgRapida: TLabel;
    lblCodigoRetorno: TLabel;
    lblMensagemRetorno: TLabel;
    lblCodigoSefaz: TLabel;
    lblMensagemSefaz: TLabel;
    lblCodigoErro: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    goRetorno: TSendRetorno;
    goLog    : TStringList;
  end;

var
  FrmSATRetorno: TFrmSATRetorno;

implementation

{$R *.dfm}

uses uFrmSATLog;

procedure TFrmSATRetorno.FormCreate(Sender: TObject);
begin
  goLog := TStringList.create;
end;

procedure TFrmSATRetorno.FormDestroy(Sender: TObject);
begin
  goLog.Destroy;
end;

procedure TFrmSATRetorno.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  case Key of
    VK_ESCAPE:
      Close;
    VK_F3:
      begin
        try
          FrmSATLog := TFrmSATLog.create(self);
          FrmSATLog.mem_log.Lines.AddStrings(goLog);
          FrmSATLog.ShowModal;
        finally
          FrmSATLog.Destroy;
        end;
      end;
  end;
end;

procedure TFrmSATRetorno.FormShow(Sender: TObject);
begin
  lblCodigoRetorno.Caption := IntTostr(goRetorno.CodigoRetorno);
  lblCodigoErro.Caption    := IntTostr(goRetorno.CodigoErro);
  lblCodigoSefaz.Caption   := IntTostr(goRetorno.CodigoSefaz);

  lblMensagemRetorno.Caption := goRetorno.MensagemRetorno;
  lblMensagemSefaz.Caption   := goRetorno.MensagemSefaz;
end;

end.
