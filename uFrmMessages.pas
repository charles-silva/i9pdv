unit uFrmMessages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, ACBrBase, ACBrPosPrinter,
  Vcl.StdCtrls;

type
  TFrmMessages = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    lblTitle: TLabel;
    lblStatus: TLabel;
    lblMensagemRodape: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMessages: TFrmMessages;

implementation

{$R *.dfm}

procedure TFrmMessages.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        Close;
      end;
    VK_RETURN:
      begin
        Close;
      end;
  end;
end;

end.
