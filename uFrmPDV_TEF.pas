unit uFrmPDV_TEF;

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
  Dialogs, Xml.xmldom, Xml.XMLIntf, ACBrSATExtratoClass, ACBrSATExtratoESCPOS, ACBrPosPrinter, ACBrBase, ACBrSAT,
  Vcl.ExtCtrls,
  Xml.Win.msxmldom, Xml.XMLDoc, Vcl.StdCtrls, ACBrUtil, ACBrTEFD, System.IniFiles,
  ACBrTEFAPIComum, ACBrTEFAPI, uPDVLib, ACBrTEFComum;

type
  // Controla como TFrmPDV_TEF.Exibir apresenta a tela: attmShow n�o bloqueia
  // quem chamou (usado enquanto o processamento roda em background);
  // attmShowModal bloqueia at� o usu�rio confirmar (ESC/Enter), usado quando
  // a mensagem exige uma a��o do usu�rio antes de prosseguir.
  TACBrTEFTelaModo = (attmShow, attmShowModal);

  TFrmPDV_TEF = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    lblTitle: TLabel;
    lblStatus: TLabel;
    ACBrPosPrinter1: TACBrPosPrinter;
    lblMensagemRodape: TLabel;
    TimerSair: TTimer;
    // procedure EasyTEFExibirMensagem(telaOperador, telaCliente: Boolean; mensagem: AnsiString);
    // procedure EasyTEFExibirMenuOpcoesOperador(caption: AnsiString; opcoes: TStrings; var opcaoEscolhida: AnsiString; var tipoContinuacao: TTipoContinuacaoColeta);
    procedure FormCreate(Sender: TObject);
    // procedure EasyTEFInterromperColetaDados(var tipoFluxoColeta: TTipoContinuacaoColeta);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    // procedure EasyTEFLerValor(mensagem: AnsiString; tamanhoMinimo, tamanhoMaximo: Integer; var valorLido: AnsiString; var tipoContinuacao: TTipoContinuacaoColeta);
    procedure TimerSairTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    interromperFluxo, chequeGenerico, houveCancelamento: Boolean;
    goPodeSair                                         : Boolean;
    FContadorAtual                                     : Integer;
    procedure initTEF;
    // function inTEFStart(AOperador: String): Boolean; stdcall;
    // function inTEFTransaction(ANumeroFiscal: AnsiString; AValor: Double; ACartaoDebito: Boolean; AData: TDate; AHora: TTime): Boolean; stdcall;
  public
    procedure doLog(AMsg: String; AContador: Integer = 0);
    procedure PermitirFechar;
    procedure Exibir(AModo: TACBrTEFTelaModo = attmShow);
  end;

implementation

uses
  pcnConversao,
  Vcl.ComCtrls, uFrmPDV_TEF_Operacoes, uFrmPDV_TEF_Parcelas, uFrmPDV,
  System.TypInfo;
{$R *.dfm}

// TFrmPDV_TEF �  apenas o apresentador da mensagem de status: quem decide
// QUANDO/QUANTO contar � o TFrmPDV, dono da regra de consulta TEF. O
// apresentador s� recebe a mensagem e o valor atual do contador, e decide
// COMO exibir: com o sufixo "[N]" ou sem ele, quando AContador = 0.
// Auto-sincroniza com a main thread pois pode ser chamada a partir da thread
// de trabalho que o TFrmPDV usa para rodar a consulta.
procedure TFrmPDV_TEF.doLog(AMsg: String; AContador: Integer);
begin
  if TThread.CurrentThread.ThreadID <> MainThreadID then
  begin
    TThread.Synchronize(nil,
      procedure
      begin
        doLog(AMsg, AContador);
      end);
    Exit;
  end;

  FContadorAtual := AContador;
  if FContadorAtual = 0 then
    lblStatus.caption := AMsg
  else
    lblStatus.caption := AMsg + ' [' + FContadorAtual.ToString + ']';
  lblStatus.Repaint;
  // Self.Width := (Length(lblStatus.caption) * 288) div 15;
end;

// Sinaliza que o processo de consulta terminou: exibe "Pressione [Enter] para
// sair" e libera o fechamento via ESC/ENTER (ver FormKeyDown).
procedure TFrmPDV_TEF.PermitirFechar;
begin
  if TThread.CurrentThread.ThreadID <> MainThreadID then
  begin
    TThread.Synchronize(nil, PermitirFechar);
    Exit;
  end;

  lblMensagemRodape.Visible := true;
end;

// Exibe a tela no modo pedido. attmShow apenas torna a tela vis�vel, sem
// bloquear quem chamou. attmShowModal libera o fechamento por ESC/Enter e
// bloqueia at� o usu�rio confirmar, usado para mensagens do TEF que exigem
// uma a��o do usu�rio (ver ACBrTEFAPI1QuandoExibirMensagem em uFrmPDV).
// Auto-sincroniza com a main thread, pois pode ser chamada a partir da
// thread de trabalho do ACBrTEFAPI1.
procedure TFrmPDV_TEF.Exibir(AModo: TACBrTEFTelaModo);
begin
  if TThread.CurrentThread.ThreadID <> MainThreadID then
  begin
    TThread.Synchronize(nil,
      procedure
      begin
        Exibir(AModo);
      end);
    Exit;
  end;

  case AModo of
    attmShow:
      Show;
    attmShowModal:
      begin
        goPodeSair := false;
        PermitirFechar;
        // ShowModal n�o pode ser chamado com a tela j� vis�vel (modo Show);
        // nesse caso ela � ocultada antes, para depois ser reaberta modal.
        if Visible then
          Hide;
        ShowModal;
      end;
  end;
end;

function StrZero(Valor: string; Quant: Integer): string;
{ Insere Zeros � frente de uma string }
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



procedure TFrmPDV_TEF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := goPodeSair;
end;

procedure TFrmPDV_TEF.FormCreate(Sender: TObject);
begin
  goPodeSair                := false;
  lblMensagemRodape.Visible := false;
end;

procedure TFrmPDV_TEF.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        if lblMensagemRodape.Visible then
          goPodeSair := true;
        Close;
      end;
    VK_RETURN:
      begin
        if lblMensagemRodape.Visible then
          goPodeSair := true;
        Close;
      end;
  end;

end;

procedure TFrmPDV_TEF.FormShow(Sender: TObject);
begin
  Shape2.Brush.Color := FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_TEF.initTEF;
begin
  //
end;

procedure TFrmPDV_TEF.TimerSairTimer(Sender: TObject);
begin
  Application.ProcessMessages;
  if goPodeSair then
  begin
    TimerSair.Enabled := false;
    Close;
  end;
end;

end.
