unit uFrmNFCeLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmNFCeLog = class(TForm)
    Shape16: TShape;
    lblTitle: TLabel;
    Shape27: TShape;
    mem_log: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNFCeLog: TFrmNFCeLog;

implementation

{$R *.dfm}

procedure TFrmNFCeLog.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Close;
  end;
end;

end.
