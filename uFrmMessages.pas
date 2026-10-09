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
    TimerEspera: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure TimerEsperaTimer(Sender: TObject);
  private
    FFinalEspera: TDateTime;
  public
    // Milissegundos de espera antes de fechar sozinho (ModalResult := mrOK).
    // <= 0 significa que s� fecha manualmente (ESC/Enter) -- ver
    // ACBrTEFAPI1QuandoExibirMensagem em uFrmPDV.pas, mesmo uso de
    // TFormExibeMensagem.TempoEspera no demo oficial do ACBr.
    TempoEspera: Integer;
  end;

var
  FrmMessages: TFrmMessages;

implementation

{$R *.dfm}

uses
  System.DateUtils;

procedure TFrmMessages.FormShow(Sender: TObject);
begin
  if (TempoEspera > 0) then
  begin
    FFinalEspera         := IncMilliSecond(Now, TempoEspera);
    TimerEspera.Interval := 200;
    TimerEspera.Enabled  := true;
  end
  else
    TimerEspera.Enabled := false;
end;

procedure TFrmMessages.TimerEsperaTimer(Sender: TObject);
begin
  if (Now >= FFinalEspera) then
  begin
    TimerEspera.Enabled := false;
    ModalResult         := mrOK;
  end;
end;

procedure TFrmMessages.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE, VK_RETURN:
      begin
        TimerEspera.Enabled := false;
        Close;
      end;
  end;
end;

end.
