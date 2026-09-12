unit uRepDefault;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uWiEventsForm;

type
  TRepDefault = class(TForm)
    WiEventsForm1: TWiEventsForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RepDefault: TRepDefault;

implementation

{$R *.dfm}

end.
