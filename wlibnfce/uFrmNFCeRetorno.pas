unit uFrmNFCeRetorno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmNFCeRetorno = class(TForm)
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
    goLog: TStringList;
  end;

var
  FrmNFCeRetorno: TFrmNFCeRetorno;

implementation

{$R *.dfm}

uses uFrmNFCeLog;

procedure TFrmNFCeRetorno.FormCreate(Sender: TObject);
begin
  goLog := TStringList.create;
end;

procedure TFrmNFCeRetorno.FormDestroy(Sender: TObject);
begin
  goLog.Destroy;
end;

procedure TFrmNFCeRetorno.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  case Key of
    VK_ESCAPE:
      Close;
    VK_F3:
      begin
        try
          FrmNFceLog := TFrmNFCeLog.create(self);
          FrmNFceLog.mem_log.Lines.AddStrings(goLog);
          FrmNFceLog.ShowModal;
        finally
          FrmNFceLog.Destroy;
        end;
      end;
  end;
end;

procedure TFrmNFCeRetorno.FormShow(Sender: TObject);
begin
  // lblCodigoRetorno.Caption := IntTostr(goRetorno.CodigoRetorno);
  // lblCodigoErro.Caption    := IntTostr(goRetorno.CodigoErro);
  // lblCodigoSefaz.Caption   := IntTostr(goRetorno.CodigoSefaz);
  //
  // lblMensagemRetorno.Caption := goRetorno.MensagemRetorno;
  // lblMensagemSefaz.Caption   := goRetorno.MensagemSefaz;
end;

end.
