unit uFrmPDV_Splash;

interface

uses
  Windows, Forms, Messages, SysUtils, Variants, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Classes, Vcl.Controls, dxGDIPlusClasses, uFrmPDV, Just1_32;

type
  TFrmPDV_Splash = class(TForm)
    Shape1: TShape;
    lblStatus: TLabel;
    Label1: TLabel;
    Image1: TImage;
    StartTimer: TTimer;
    XMLConfigDoc: TXMLDocument;
    Shape16: TShape;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure StartTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFreeded: Boolean;
    procedure SetStatus(msg: string);
    procedure CreateFlatRoundRgn;
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    // function UnloadDLL(var ADLLHandle: Integer): Boolean;
    // procedure LoadDLLTEF;
    // procedure LoadDLLSAT;
  end;

var
  FrmPDV_Splash: TFrmPDV_Splash;

implementation

{$R *.dfm}

uses uFrmPDV_Login, uFrmPDV_DModule, uFrmPDV_DModule_DS;

procedure TFrmPDV_Splash.CreateFlatRoundRgn;
const
  CORNER_SIZE = 6;
var
  Rgn: HRGN;
begin
  with BoundsRect do
  begin
    Rgn := CreateRoundRectRgn(0, 0, Right - Left + 1, Bottom - Top + 1, CORNER_SIZE, CORNER_SIZE);
    // exclude left-bottom corner
    // ExcludeRectRgn(Rgn, 0, Bottom - Top - CORNER_SIZE div 2, CORNER_SIZE div 2, Bottom - Top + 1);
    // exclude right-bottom corner
    // ExcludeRectRgn(Rgn, Right - Left - CORNER_SIZE div 2, Bottom - Top - CORNER_SIZE div 2, Right - Left, Bottom - Top);
  end;
  // the operating system owns the region, delete the Rgn only SetWindowRgn fails
  if SetWindowRgn(handle, Rgn, True) = 0 then
    DeleteObject(Rgn);

end;

procedure TFrmPDV_Splash.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style             := WS_POPUP;
    WindowClass.Style := WindowClass.Style or CS_DROPSHADOW;
  end;

end;

procedure TFrmPDV_Splash.FormCreate(Sender: TObject);
begin
  BorderStyle := bsNone;
  CreateFlatRoundRgn;
end;

procedure TFrmPDV_Splash.FormShow(Sender: TObject);
begin
  FFreeded := false;
  SetStatus('Carregando servidores disponíveis...');
  StartTimer.Enabled := True;
end;

procedure TFrmPDV_Splash.SetStatus(msg: string);
begin
  lblStatus.Caption := msg;
  lblStatus.Repaint;
end;
//
// function TFrmPDV_Splash.UnloadDLL(var ADLLHandle: Integer): Boolean;
// begin
//
// Result := false;
// if ADLLHandle <> 0 then
// begin
// FreeLibrary(ADLLHandle);
// ADLLHandle               := 0;
// SATStart                 := nil;
// SATSetHeader             := nil;
// SATSetDetails            := nil;
// SATSetPays               := nil;
// SATSendCFe               := nil;
// SATCancelCFe             := nil;
// SATSendPayCFe            := nil;
// SATSendFiscalResponseCFe := nil;
// SATSendKeyDown           := nil;
// end;
// Result := true;
//
// end;

// procedure TFrmPDV_Splash.LoadDLLSAT;
// begin

// HNDLibSAT := LoadLibrary('wlibsat.dll');
// if (HNDLibSAT <> 0) then
// begin
// @SATStart                 := GetProcAddress(HNDLibSAT, 'SATStart');
// @SATSetHeader             := GetProcAddress(HNDLibSAT, 'SATSetHeader');
// @SATSetDetails            := GetProcAddress(HNDLibSAT, 'SATSetDetails');
// @SATSetPays               := GetProcAddress(HNDLibSAT, 'SATSetPays');
// @SATSendCFe               := GetProcAddress(HNDLibSAT, 'SATSendCFe');
// @SATCancelCFe             := GetProcAddress(HNDLibSAT, 'SATCancelCFe');
// @SATSendPayCFe            := GetProcAddress(HNDLibSAT, 'SATSendPayCFe');
// @SATSendFiscalResponseCFe := GetProcAddress(HNDLibSAT, 'SATSendFiscalResponseCFe');
// @SATSendKeyDown           := GetProcAddress(HNDLibSAT, 'SATSendKeyDown');
// @SATShowing               := GetProcAddress(HNDLibSAT, 'SATShowing');
// end;
// end;

// procedure TFrmPDV_Splash.LoadDLLTEF;
// begin
//
// HNDLibTEF := LoadLibrary('wlibtef.dll');
// if (HNDLibTEF <> 0) then
// begin
// @TEFStart       := GetProcAddress(HNDLibTEF, 'TEFStart');
// @TEFStop        := GetProcAddress(HNDLibTEF, 'TEFStop');
// @TEFTransaction := GetProcAddress(HNDLibTEF, 'TEFTransaction');
// end;
// end;

procedure TFrmPDV_Splash.StartTimerTimer(Sender: TObject);
begin
  try
    StartTimer.Enabled := false;
    FrmPDV_DModule     := TFrmPDV_DModule.Create(Application);
    // FrmPDV_DModule_DS  := TFrmPDV_DModule_DS.Create(Application);
    hide;
    FrmPDV_Login := TFrmPDV_Login.Create(Application);
    FrmPDV_Login.Show;
  except
    on E: Exception do
    begin
      Close;
      Application.Terminate;
    end;
  end;

end;

end.
