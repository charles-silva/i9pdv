unit uFrmTEF;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs, Xml.xmldom, Xml.XMLIntf, ACBrSATExtratoClass, ACBrSATExtratoESCPOS, ACBrPosPrinter, ACBrBase, ACBrSAT, Vcl.ExtCtrls,
  Xml.Win.msxmldom, Xml.XMLDoc, Vcl.StdCtrls, ACBrUtil, ACBrTEFD,
  EasyTEFCliSiTef, TiposCliSiTef;

type
  TSendRetorno = record
    XMLString: String;
    CodigoRetorno: Integer;
    Log: String;
  end;

  TFrmTEF = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    lblTitle: TLabel;
    lblStatus: TLabel;
    ACBrPosPrinter1: TACBrPosPrinter;
    EasyTEF: TEasyTEFCliSiTef;
    Timer1: TTimer;
    procedure EasyTEFExibirMensagem(telaOperador, telaCliente: Boolean; mensagem: AnsiString);
    procedure EasyTEFExibirMenuOpcoesOperador(caption: AnsiString; opcoes: TStrings; var opcaoEscolhida: AnsiString;
      var tipoContinuacao: TTipoContinuacaoColeta);
  private
    interromperFluxo, chequeGenerico, houveCancelamento: Boolean;
  public
  end;

var
  FrmTEF: TFrmTEF;

var
  goCodigoDeAtivacao, goSignAC: String;

implementation

uses
  pcnConversao,
  pcnNFe,
  uFrmDModuleSAT, Vcl.ComCtrls, uFrmTEF_Operacoes;
{$R *.dfm}

procedure TFrmTEF.EasyTEFExibirMensagem(telaOperador, telaCliente: Boolean; mensagem: AnsiString);
begin
  lblStatus.caption := mensagem;
  if mensagem = 'Retire o cartao da leitora' then
    Timer1.Enabled := True;

  if UpperCase(mensagem).Equals('TRANSACAO OK!') then
    Close;
end;

function StrZero(Valor: string; Quant: Integer): string;
{ Insere Zeros à frente de uma string }
var
  I, Tamanho: Integer;
  aux       : string;
begin
  aux     := Valor;
  Tamanho := Length(Valor);
  Valor   := '';
  for I   := 1 to Quant - Tamanho do
    Valor := Valor + '0';
  aux     := Valor + aux;
  StrZero := aux;
end;

procedure TFrmTEF.EasyTEFExibirMenuOpcoesOperador(caption: AnsiString; opcoes: TStrings; var opcaoEscolhida: AnsiString;
  var tipoContinuacao: TTipoContinuacaoColeta);
var
  loListItem: TListItem;
  f         : TFrmTEF_Operacoes;
  I         : Integer;
begin
  f := TFrmTEF_Operacoes.Create(nil);
  try
    f.caption := caption;

    for I := 0 to opcoes.Count - 1 do
    begin
      loListItem         := f.lstOpcoes.Items.Add;
      loListItem.caption := StrZero((I + 1).ToString, 3);
      loListItem.SubItems.Add(opcoes.Strings[I].Substring(2));
    end;
    f.ShowModal;
    opcaoEscolhida := opcoes.Strings[f.opcao];
    if not houveCancelamento then
      houveCancelamento := Pos('CANCELAMENTO', UpperCase(opcaoEscolhida)) > 0;
    if not chequeGenerico then
      chequeGenerico := Pos('GENERICA', UpperCase(opcaoEscolhida)) > 0;
    tipoContinuacao  := tccContinuar;
    if f.ModalResult = mrCancel then
      tipoContinuacao := tccInterromper
    else if f.ModalResult = mrRetry then
      tipoContinuacao := tccMenuAnterior
  finally
    FreeAndNil(f);
  end;

end;

end.
