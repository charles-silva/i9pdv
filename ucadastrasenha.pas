unit ucadastrasenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFCadUsuario = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations  }
  end;

var
  FCadUsuario: TFCadUsuario;

implementation
uses
  uFrmPDV_DModule, uFrmPDV_Login, uFrmConfig_Connection,  uFrmPDV_Login_DefineSenha,
uFrmPDV, uGlobalLibPDV ;
//, uFrmConfig_Connection, , uFrmPDV_Login_DefineSenha;

{$R *.dfm}

end.
