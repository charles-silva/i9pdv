program WiBiConnect;

uses
  Vcl.Forms,
  uFrmConfigConn in 'uFrmConfigConn.pas' {FrmConfigConn};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmConfigConn, FrmConfigConn);
  Application.Run;
end.
