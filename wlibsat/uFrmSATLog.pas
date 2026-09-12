unit uFrmSATLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmSATLog = class(TForm)
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
  FrmSATLog: TFrmSATLog;

implementation

{$R *.dfm}

procedure TFrmSATLog.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Close;
  end;
end;

end.
