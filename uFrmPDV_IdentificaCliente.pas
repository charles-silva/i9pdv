unit uFrmPDV_IdentificaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, WibiSkins, cxTextEdit, cxMaskEdit,
  cxDBEdit, cxGroupBox, cxRadioGroup, uWiEventsForm, ACBrBase, ACBrValidador,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle;

type
  TFrmPDV_IdentificaCliente = class(TForm)
    Label38: TLabel;
    Shape16: TShape;
    Shape27: TShape;
    lblMsgRapida: TLabel;
    Label11: TLabel;
    EDEN_CNPJCPF: TcxMaskEdit;
    Label2: TLabel;
    edNome: TcxTextEdit;
    WiEventsForm1: TWiEventsForm;
    ACBrValidador1: TACBrValidador;
    rgen_pessoa: TcxRadioGroup;
    procedure rgen_pessoaPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EDEN_CNPJCPFExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPDV_IdentificaCliente: TFrmPDV_IdentificaCliente;

implementation

{$R *.dfm}

uses uFrmPDV;

procedure TFrmPDV_IdentificaCliente.EDEN_CNPJCPFExit(Sender: TObject);
begin
  if Trim(EDEN_CNPJCPF.text) <> '' then
  begin
    ACBrValidador1.Documento := EDEN_CNPJCPF.text;
    if not ACBrValidador1.Validar then
    begin
      MessageBox(handle, 'CPF/CNPJ inválido', 'I9 PDV', MB_ICONEXCLAMATION);
      EDEN_CNPJCPF.SetFocus;
    end;
  end;
end;

procedure TFrmPDV_IdentificaCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        if (Trim(EDEN_CNPJCPF.text) = '') and EDEN_CNPJCPF.Focused then
          Close;

        if (Trim(EDEN_CNPJCPF.text) <> '') and edNome.Focused then
          ModalResult := mrOk;
      end;
  end;
end;

procedure TFrmPDV_IdentificaCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if rgen_pessoa.Focused then
  begin
    if Key = '1' then
      rgen_pessoa.ItemIndex := 0;
   if Key = '2' then
      rgen_pessoa.ItemIndex := 1;
  end;
end;

procedure TFrmPDV_IdentificaCliente.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  Shape16.Brush.Color:=FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_IdentificaCliente.rgen_pessoaPropertiesChange(Sender: TObject);
begin
  case rgen_pessoa.ItemIndex of
    0:
      begin
        ACBrValidador1.TipoDocto         := docCPF;
        EDEN_CNPJCPF.Properties.EditMask := '999.999.999-99;0;_';
        EDEN_CNPJCPF.Clear;
      end;
    1:
      begin
        ACBrValidador1.TipoDocto         := docCNPJ;
        EDEN_CNPJCPF.Properties.EditMask := '99.999.999/9999-99;0;_';
        EDEN_CNPJCPF.Clear;
      end;
  end;
end;

procedure TFrmPDV_IdentificaCliente.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  Close;
end;

end.
