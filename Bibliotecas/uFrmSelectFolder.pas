unit uFrmSelectFolder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  ExtCtrls, Menus, cxLookAndFeelPainters, cxButtons, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinBlue, dxSkiniMaginary, dxSkinMoneyTwins,
  dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, Vcl.FileCtrl;

type
  TFrmSelectFolder = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DriveComboBox1: TDriveComboBox;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelectFolder: TFrmSelectFolder;

implementation

{$R *.dfm}

procedure TFrmSelectFolder.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmSelectFolder.cxButton2Click(Sender: TObject);
begin
  close;
end;

end.

