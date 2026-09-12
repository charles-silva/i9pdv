unit uFrmSAT;

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
  Xml.Win.msxmldom, Xml.XMLDoc, Vcl.StdCtrls, ACBrUtil, uPDVLib, pcnVFPe,
  ACBrSATMFe_integrador;

type

  TFrmSAT = class(TForm)
    XMLDocMensagem: TXMLDocument;
    lblStatus: TLabel;
    Timer1: TTimer;
    ACBrSAT1: TACBrSAT;
    ACBrPosPrinter1: TACBrPosPrinter;
    ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS;
    Shape16: TShape;
    lblTitle: TLabel;
    Shape27: TShape;
    lblMensagemRodape: TLabel;
    TimerPisca: TTimer;

    procedure FormCreate(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure ACBrSAT1GravarLog(const ALogLine: string; var Tratado: Boolean);
    procedure ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
    procedure ACBrSAT1GetsignAC(var Chave: AnsiString);
    procedure TimerPiscaTimer(Sender: TObject);
    procedure ACBrSAT1GetNumeroSessao(var NumeroSessao: Integer);
    // procedure Timer1Timer(Sender: TObject);
  private
    goAbrirGaveta   : Boolean;
    goIDSesssaoAtual: Integer;
    goReturnPressed : Boolean;
    goLog           : TStringList;
    function doVerifyStatusPayCFe(aChaveAcessoValidador, aCNPJ: String; aIDFila: Integer): TRespostaVerificarStatusValidador;
  public
    function doSetCancelCFe(aXML: String): TSendRetorno;
    procedure doSetHeaderCFe(aIDNF, aIDSesssao: Integer; aDestCNPJCPF, aDestNome, aEntregLgr, aEntregNro, aEntregCpl, aEntregBairro, aEntregMun, aEntregUF: String; aVlrDesconto, aVlrAcrescimo, aVlrLei12741: Double; aObs: String; aAbrirGaveta: Boolean);
    procedure doSetDetailCFe(aCodProd, aEAN, aNomeProd, aNCM, aCFOP, aUnidade: String; aQtd, aVlrUnit, aVlrDesc, aVlrLei12741: Double; aOrigemMercadoria: Integer; aCSTPis, aCSTCofins, aCSTCSOSNIcms, aCSTIcms: String; aICMSAliq, aICMS, aBCPis, aPisAliq, aPis, aBCCofins, aCofinsAliq, aCofins: Double;
      aObs: String);
    procedure doSetPaysCFe(aTipoMP: String; aVlrMP: Double);
    function doSendPayCFe(aChaveAcessoValidador, aChaveRequisicao, aMerchantID, aSerialPOS, aCNPJEmitente: String; aIcmsBase, aValorTotalVenda: Double; aHabilitarMultiplosPagamentos, aHabilitarControleAntiFraude: Boolean; const aCodigoMoeda: String = 'BRL'; const aEmitirCupomNFCE: Boolean = false;
      const aOrigemPagamento: String = ''): TWiBiRespostaValidador;
    function doSendCFe: TSendRetorno;
    function doSendFiscalResponseCFe(aChaveAcessoValidador, aChaveAcesso, aCNPJ, aNsu, aNumerodeAprovacao, aBandeira, aAdquirente, aImpressaoFiscal, aNumeroDocumento: String; aIDFila: Integer): TRetornoRespostaFiscal;
    procedure doKeyDown(var Key: Word; Shift: TShiftState);
    destructor Destroy; override;
  end;

var
  FrmSAT: TFrmSAT;

var
  goCodigoDeAtivacao, goSignAC: String;

implementation

uses
  pcnConversao,
  pcnNFe,
  uFrmDModuleSAT, uFrmSATLog, uFrmSATRetorno;
{$R *.dfm}

function TFrmSAT.doSendPayCFe(aChaveAcessoValidador, aChaveRequisicao, aMerchantID, aSerialPOS, aCNPJEmitente: String; aIcmsBase, aValorTotalVenda: Double; aHabilitarMultiplosPagamentos, aHabilitarControleAntiFraude: Boolean; const aCodigoMoeda: String = 'BRL';
  const aEmitirCupomNFCE: Boolean = false; const aOrigemPagamento: String = ''): TWiBiRespostaValidador;
var
  PagamentoMFe                    : TEnviarPagamento;
  RespostaPagamentoMFe            : TRespostaPagamento;
  RespostaVerificarStatusValidador: TRespostaVerificarStatusValidador;
begin
  Result            := nil;
  lblStatus.Caption := 'Enviando pagamento ao VFP-e...';
  lblStatus.repaint;
  sleep(500);
  PagamentoMFe := TEnviarPagamento.create;
  try
    with PagamentoMFe do
    begin
      Clear;
      ChaveAcessoValidador         := aChaveAcessoValidador; // '25CFE38D-3B92-46C0-91CA-CFF751A82D3D';
      ChaveRequisicao              := aChaveRequisicao; // '26359854-5698-1365-9856-965478231456';
      Estabelecimento              := aMerchantID;
      SerialPOS                    := aSerialPOS;
      CNPJ                         := aCNPJEmitente;
      IcmsBase                     := aIcmsBase;
      ValorTotalVenda              := aValorTotalVenda;
      HabilitarMultiplosPagamentos := true;
      HabilitarControleAntiFraude  := false;
      CodigoMoeda                  := aCodigoMoeda;
      EmitirCupomNFCE              := aEmitirCupomNFCE;
      OrigemPagamento              := aOrigemPagamento;
    end;
    RespostaPagamentoMFe := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).EnviarPagamento(PagamentoMFe);
    if (RespostaPagamentoMFe.IDPagamento > 0) or (RespostaPagamentoMFe.StatusPagamento = 'SalvoEmArmazenamentoLocal') then
    begin
      Result := TWiBiRespostaValidador.create;
      if (RespostaPagamentoMFe.StatusPagamento = 'SalvoEmArmazenamentoLocal') then
        Result.IDLocal := RespostaPagamentoMFe.IDPagamento
      else
        Result.IDPagamento := RespostaPagamentoMFe.IDPagamento;

      lblStatus.Caption := 'Realize o pagamento no POS';
      lblStatus.repaint;
      lblMensagemRodape.Caption := 'Pressione [Enter] após concluir pagamento';
      TimerPisca.Enabled        := true;
      while true do
      begin
        Application.ProcessMessages;
        if goReturnPressed then
          break;
      end;
      goReturnPressed := false;
      if (RespostaPagamentoMFe.StatusPagamento <> 'SalvoEmArmazenamentoLocal') then
      begin
        lblStatus.Caption := 'Verificando pagamento no VFP-e...';
        lblStatus.repaint;
        lblMensagemRodape.Caption := 'Aguarde';
        sleep(500);
        RespostaVerificarStatusValidador := doVerifyStatusPayCFe(aChaveAcessoValidador, aCNPJEmitente, RespostaPagamentoMFe.IDPagamento);
        if RespostaVerificarStatusValidador.IDFila = 0 then
          RespostaVerificarStatusValidador.IDFila := RespostaPagamentoMFe.IDPagamento;
        Result.IntegradorResposta                 := RespostaVerificarStatusValidador.IntegradorResposta;
        Result.CodigoAutorizacao                  := RespostaVerificarStatusValidador.CodigoAutorizacao;
        Result.Bin                                := RespostaVerificarStatusValidador.Bin;
        Result.DonoCartao                         := RespostaVerificarStatusValidador.DonoCartao;
        Result.DataExpiracao                      := RespostaVerificarStatusValidador.DataExpiracao;
        Result.InstituicaoFinanceira              := RespostaVerificarStatusValidador.InstituicaoFinanceira;
        Result.Parcelas                           := RespostaVerificarStatusValidador.Parcelas;
        Result.UltimosQuatroDigitos               := RespostaVerificarStatusValidador.UltimosQuatroDigitos;
        Result.CodigoPagamento                    := RespostaVerificarStatusValidador.CodigoPagamento;
        Result.ValorPagamento                     := RespostaVerificarStatusValidador.ValorPagamento;
        Result.IDFila                             := RespostaVerificarStatusValidador.IDFila;
        Result.Tipo                               := RespostaVerificarStatusValidador.Tipo;
        Result.Xml                                := RespostaVerificarStatusValidador.Xml;
      end;
    end;
  finally
    lblMensagemRodape.visible := false;
    PagamentoMFe.Destroy;
    close;
  end;
end;

procedure TFrmSAT.doSetHeaderCFe(aIDNF, aIDSesssao: Integer; aDestCNPJCPF, aDestNome, aEntregLgr, aEntregNro, aEntregCpl, aEntregBairro, aEntregMun, aEntregUF: String; aVlrDesconto, aVlrAcrescimo, aVlrLei12741: Double; aObs: String; aAbrirGaveta: Boolean);
var
  TotalItem, TotalGeral, Pagto1: Double;
  A                            : Integer;
  Loops                        : Integer;
begin
  goAbrirGaveta    := aAbrirGaveta;
  goIDSesssaoAtual := aIDSesssao;
  goLog.Clear;
  lblStatus.Caption := 'Preparando CF-e...';
  lblStatus.repaint;
  ACBrSAT1.CFe.IdentarXML       := true;
  ACBrSAT1.CFe.TamanhoIdentacao := 3;
  ACBrSAT1.CFe.RetirarAcentos   := true;

  // AjustaACBrSAT;
  ACBrSAT1.InicializaCFe;

  with ACBrSAT1.CFe do
  begin
    ide.numeroCaixa := FrmSAT.ACBrSAT1.Config.ide_numeroCaixa;
    ide.cNF         := aIDNF;

    if aDestCNPJCPF <> '' then
    begin
      Dest.CNPJCPF := aDestCNPJCPF;
      Dest.xNome   := ACBrStr(aDestNome);
    end;

    if aEntregLgr <> '' then
    begin
      Entrega.xLgr    := aEntregLgr;
      Entrega.nro     := aEntregNro;
      Entrega.xCpl    := aEntregCpl;
      Entrega.xBairro := aEntregBairro;
      Entrega.xMun    := aEntregMun;
      Entrega.UF      := aEntregUF;
    end;

    Total.DescAcrEntr.vDescSubtot  := aVlrDesconto;
    Total.DescAcrEntr.vAcresSubtot := aVlrAcrescimo;
    Total.vCFeLei12741             := aVlrLei12741;

    InfAdic.infCpl := ACBrStr(aObs);
  end;

  // mVendaEnviar.Lines.Text := ACBrSAT1.CFe.GerarXML(true); // True = Gera apenas as TAGs da aplicação

  // mLog.Lines.Add('Venda Gerada');
end;

procedure TFrmSAT.doSetDetailCFe(aCodProd, aEAN, aNomeProd, aNCM, aCFOP, aUnidade: String; aQtd, aVlrUnit, aVlrDesc, aVlrLei12741: Double; //
  aOrigemMercadoria: Integer; aCSTPis, aCSTCofins, aCSTCSOSNIcms, aCSTIcms: String; aICMSAliq, aICMS, aBCPis, aPisAliq, aPis, aBCCofins, aCofinsAliq, aCofins: Double; aObs: String);
var
  ok: Boolean;
begin
  lblStatus.Caption := 'Preparando Itens...';
  lblStatus.repaint;
  with ACBrSAT1.CFe.Det.Add do
  begin
    nItem         := ACBrSAT1.CFe.Det.Count;
    Prod.cProd    := aCodProd;
    Prod.cEAN     := aEAN;
    Prod.xProd    := aNomeProd;
    Prod.NCM      := aNCM;
    Prod.CFOP     := aCFOP;
    Prod.uCom     := aUnidade;
    Prod.qCom     := aQtd;
    Prod.vUnCom   := aVlrUnit;
    Prod.indRegra := irTruncamento;
    Prod.vDesc    := aVlrDesc;

    // with Prod.obsFiscoDet.Add do
    // begin
    // xCampoDet := 'campo';
    // xTextoDet := 'texto';
    // end;

    Imposto.vItem12741 := aVlrLei12741;

    Imposto.ICMS.orig := TpcnOrigemMercadoria(aOrigemMercadoria);
    if ACBrSAT1.CFe.Emit.cRegTrib = RTSimplesNacional then
      Imposto.ICMS.CSOSN := StrToCSOSNIcms(ok, aCSTCSOSNIcms)
    else
      Imposto.ICMS.CST := StrToCSTICMS(ok, aCSTIcms);

    Imposto.ICMS.pICMS := aICMSAliq;
    Imposto.ICMS.vICMS := aICMS;

    Imposto.PIS.CST  := StrToCSTPIS(ok, aCSTPis);
    Imposto.PIS.vBC  := aBCPis;
    Imposto.PIS.pPIS := aPisAliq;
    Imposto.PIS.vPIS := aPis;

    Imposto.COFINS.CST     := StrToCSTCofins(ok, aCSTCofins);
    Imposto.COFINS.vBC     := aBCCofins;
    Imposto.COFINS.pCOFINS := aCofinsAliq;
    Imposto.COFINS.vCOFINS := aCofins;

    // Imposto.PISST.vBC     := 0;
    // Imposto.PISST.pCOFINS := 0;

    // Imposto.COFINSST.vBC     := 0;
    // Imposto.COFINSST.pCOFINS := 0;

    infAdProd := aObs;
  end;
end;

procedure TFrmSAT.doSetPaysCFe(aTipoMP: String; aVlrMP: Double);
var
  ok: Boolean;
begin
  lblStatus.Caption := 'Registrando pagamentos...';
  lblStatus.repaint;
  with ACBrSAT1.CFe.Pagto.Add do
  begin
    cMP := StrToCodigoMP(ok, aTipoMP);
    vMP := aVlrMP;
  end;
end;

function TFrmSAT.doSendCFe: TSendRetorno;
var
  loXML: String;
begin
  lblStatus.Caption := 'Enviando CF-e...';
  lblStatus.repaint;
  loXML := ACBrSAT1.CFe.GerarXML(true);
  try
    ACBrSAT1.EnviarDadosVenda(loXML);

    Result.CodigoErro      := ACBrSAT1.Resposta.codigoDeErro;
    Result.CodigoRetorno   := ACBrSAT1.Resposta.codigoDeRetorno;
    Result.CodigoSefaz     := ACBrSAT1.Resposta.CodigoSefaz;
    Result.MensagemRetorno := ACBrSAT1.Resposta.MensagemRetorno;
    Result.MensagemSefaz   := ACBrSAT1.Resposta.MensagemSefaz;
    Result.LogText         := goLog.Text;
    Result.ChaveAcesso     := OnlyNumber(ACBrSAT1.CFe.infCFe.ID);
    if ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
    begin
      Result.XMLString  := ACBrSAT1.CFe.AsXMLString;
      lblStatus.Caption := 'CF-e enviado com sucesso!';
      lblStatus.repaint;
      sleep(500);
      try
        ACBrSAT1.ImprimirExtrato;
        if goAbrirGaveta then
          ACBrPosPrinter1.AbrirGaveta;
      except
        on E: Exception do
        begin
          if MessageBox(handle, pchar(E.Message + chr(13) + chr(13) + 'Erro ao imprimir, tentar novamente?'), 'WiBi PDV', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
            exit;
          try
            if ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
              ACBrSAT1.ImprimirExtrato;
          except
          end;
        end;
      end;
    end
    else
    begin
      FrmSATRetorno := TFrmSATRetorno.create(self);
      try
        FrmSATRetorno.goRetorno := Result;
        FrmSATRetorno.goLog.AddStrings(goLog);
        FrmSATRetorno.ShowModal;
      finally
        FrmSATRetorno.Release;
        close;
      end;
    end;
  except
    on E: Exception do
    begin
      close;
    end;
  end;
end;

function TFrmSAT.doSendFiscalResponseCFe(aChaveAcessoValidador, aChaveAcesso, aCNPJ, aNsu, aNumerodeAprovacao, aBandeira, aAdquirente, aImpressaoFiscal, aNumeroDocumento: String; aIDFila: Integer): TRetornoRespostaFiscal;
var
  RespostaFiscal: TRespostaFiscal;
begin
  Result            := nil;
  lblStatus.Caption := 'Enviando resposta fiscal...';
  lblStatus.repaint;
  sleep(500);
  RespostaFiscal := TRespostaFiscal.create;
  try
    with RespostaFiscal do
    begin
      Clear;
      ChaveAcessoValidador := aChaveAcessoValidador;
      IDFila               := aIDFila;
      ChaveAcesso          := aChaveAcesso;
      Nsu                  := aNsu;
      NumerodeAprovacao    := aNumerodeAprovacao;
      Bandeira             := aBandeira;
      Adquirente           := aAdquirente;
      ImpressaoFiscal      := aImpressaoFiscal;
      NumeroDocumento      := aNumeroDocumento;
      CNPJ                 := aCNPJ;
    end;
    Result := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).RespostaFiscal(RespostaFiscal);
  finally
    RespostaFiscal.Destroy;
    close;
  end;
end;

function TFrmSAT.doSetCancelCFe(aXML: String): TSendRetorno;
var
  loLog, loXML: String;

begin
  lblStatus.Caption := 'Cancelando CF-e...';
  lblStatus.repaint;
  ACBrSAT1.CFe.Clear;
  ACBrSAT1.CFe.AsXMLString := aXML;
  loXML                    := ACBrSAT1.CFeCanc.GerarXML(true);
  ACBrSAT1.CancelarUltimaVenda;

  Result.CodigoErro      := ACBrSAT1.Resposta.codigoDeErro;
  Result.CodigoRetorno   := ACBrSAT1.Resposta.codigoDeRetorno;
  Result.CodigoSefaz     := ACBrSAT1.Resposta.CodigoSefaz;
  Result.MensagemRetorno := ACBrSAT1.Resposta.MensagemRetorno;
  Result.MensagemSefaz   := ACBrSAT1.Resposta.MensagemSefaz;
  Result.LogText         := goLog.Text;
  if ACBrSAT1.Resposta.codigoDeRetorno = 7000 then
  begin
    Result.XMLString  := ACBrSAT1.CFeCanc.AsXMLString;
    lblStatus.Caption := 'CF-e cancelado com sucesso!';
    lblStatus.repaint;
    sleep(500);
    try
      ACBrSAT1.ImprimirExtratoCancelamento;
    except
      on E: Exception do
      begin
        if MessageBox(handle, pchar(E.Message + chr(13) + chr(13) + 'Erro ao imprimir, tentar novamente?'), 'WiBi PDV', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
          exit;
        try
          ACBrSAT1.ImprimirExtratoCancelamento;
        except
        end;
      end;
    end;
  end
  else
  begin
    FrmSATRetorno := TFrmSATRetorno.create(self);
    try
      FrmSATRetorno.goRetorno := Result;
      FrmSATRetorno.goLog.AddStrings(goLog);
      FrmSATRetorno.ShowModal;
    finally
      FrmSATRetorno.Release;
      close;
    end;
  end;

end;

procedure TFrmSAT.ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := goCodigoDeAtivacao;
end;

procedure TFrmSAT.ACBrSAT1GetNumeroSessao(var NumeroSessao: Integer);
begin
  NumeroSessao := goIDSesssaoAtual;
end;

procedure TFrmSAT.ACBrSAT1GetsignAC(var Chave: AnsiString);
begin
  Chave := goSignAC;
end;

procedure TFrmSAT.ACBrSAT1GravarLog(const ALogLine: string; var Tratado: Boolean);
begin
  goLog.Add(ALogLine);
end;

destructor TFrmSAT.Destroy;
begin
  goLog.Destroy;
  inherited;
end;

function TFrmSAT.doVerifyStatusPayCFe(aChaveAcessoValidador, aCNPJ: String; aIDFila: Integer): TRespostaVerificarStatusValidador;
var
  VerificarStatusValidador: TVerificarStatusValidador;
begin
  VerificarStatusValidador := TVerificarStatusValidador.create;
  try
    with VerificarStatusValidador do
    begin
      Clear;
      ChaveAcessoValidador := aChaveAcessoValidador;
      IDFila               := aIDFila;
      CNPJ                 := aCNPJ;
    end;
    Result := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).VerificarStatusValidador(VerificarStatusValidador);
  finally
    VerificarStatusValidador.Free;
  end;
end;

//
// with Det.Add do
// begin
// nItem         := 2 + (A * 3);
// Prod.cProd    := '6291041500213';
// Prod.cEAN     := '6291041500213';
// Prod.xProd    := ACBrStr('Outro produto Qualquer, com a Descrição Grande');
// Prod.CFOP     := '5529';
// Prod.uCom     := 'un';
// Prod.qCom     := 1.1205;
// Prod.vUnCom   := 1.210;
// Prod.indRegra := irTruncamento;
// Prod.vOutro   := 2;
//
// TotalItem          := RoundABNT((Prod.qCom * Prod.vUnCom) + Prod.vOutro - Prod.vDesc, -2);
// TotalGeral         := TotalGeral + TotalItem;
// Imposto.vItem12741 := TotalItem * 0.30;
//
// Imposto.ICMS.orig := oeNacional;
// if Emit.cRegTrib = RTSimplesNacional then
// Imposto.ICMS.CSOSN := csosn400
// else
// Imposto.ICMS.CST := cst40;
//
// Imposto.PIS.CST       := pis49;
// Imposto.PIS.qBCProd   := TotalItem;
// Imposto.PIS.vAliqProd := 1.0223;
//
// Imposto.PISST.qBCProd   := TotalItem;
// Imposto.PISST.vAliqProd := 1.0223;
//
// Imposto.COFINS.CST       := cof49;
// Imposto.COFINS.qBCProd   := TotalItem;
// Imposto.COFINS.vAliqProd := 1.0223;
//
// // Imposto.COFINSST.qBCProd := 503.6348;
// // Imposto.COFINSST.vAliqProd := 779.4577;
// end;
//
// with Det.Add do
// begin
// nItem         := 3 + (A * 3);
// Prod.cProd    := 'abc123';
// Prod.cEAN     := '6291041500213';
// Prod.xProd    := 'ACBrSAT rules';
// Prod.NCM      := '99';
// Prod.CFOP     := '5844';
// Prod.uCom     := 'un';
// Prod.qCom     := 1.1205;
// Prod.vUnCom   := 1.210;
// Prod.indRegra := irTruncamento;
//
// TotalItem  := RoundABNT((Prod.qCom * Prod.vUnCom) + Prod.vOutro - Prod.vDesc, -2);
// TotalGeral := TotalGeral + TotalItem;
//
// Imposto.ICMS.orig := oeEstrangeiraImportacaoDireta;
// if Emit.cRegTrib = RTSimplesNacional then
// Imposto.ICMS.CSOSN := csosn102
// else
// Imposto.ICMS.CST := cst60;
//
// Imposto.PIS.CST := pis49;
//
// Imposto.PISST.qBCProd   := TotalItem;
// Imposto.PISST.vAliqProd := 1.1826;
//
// Imposto.COFINS.CST := cof49;
//
// infAdProd := ACBrStr('Informações adicionais');
// end;
//
// end;
// (*
// with Det.Add do
// begin
// nItem := 4;
// Prod.cProd := 'abc123';
// Prod.cEAN := '6291041500213';
// Prod.xProd := 'Nada';
// Prod.CFOP := '5025';
// Prod.uCom := 'horas';
// Prod.qCom := 1.1205;
// Prod.vUnCom := 1.210;
// Prod.vProd := 8;
// Prod.indRegra := irTruncamento;
// Prod.vOutro := 93.31;
//
// Imposto.ICMS.orig := oeEstrangeiraAdquiridaBrasil;
// Imposto.ICMS.CSOSN := csosn900;
// Imposto.ICMS.pICMS := 1.1234;
//
// Imposto.PIS.CST := pis49;
//
// Imposto.PISST.qBCProd := 7528.8947;
// Imposto.PISST.vAliqProd := 296.2348;
//
// Imposto.COFINS.CST := cof49;
// end;
// *)

//
// procedure TFrmSAT.GerarCFe2(Apnf_id: Integer);
// var
// i  : Integer;
// Lok: Boolean;
// begin
// dsNFCe.Open('SELECT * FROM pdv.vw_nota_fiscal where pnf_id = ' + IntToStr(Apnf_id));
// with ACBrNFe.NotasFiscais.Add.NFe do
// begin
// ide.cNF                                           := dsNFCe.FieldByName('pnf_id').AsInteger;
// ide.natOp                                         := dsNFCe.FieldByName('pnf_natureza').Value;
// ide.indPag                                        := ipVista;
// ide.Modelo                                        := 65;
// ide.serie                                         := dsNFCe.FieldByName('pnf_serie').AsInteger;
// ide.nNF                                           := dsNFCe.FieldByName('pnf_numero_fiscal').AsInteger;
// ide.dEmi                                          := dsNFCe.FieldByName('pnf_data_emissao').AsDateTime;
// ide.dSaiEnt                                       := dsNFCe.FieldByName('pnf_data_entrada_saida').AsDateTime;
// ide.hSaiEnt                                       := now;
// ide.tpNF                                          := tnSaida;
// ide.tpEmis                                        := teNormal;
// ide.tpAmb                                         := ACBrNFe.Configuracoes.WebServices.Ambiente;
// ide.cUF                                           := StrToInt(Copy(dsNFCe.FieldByName('pnf_ibge_origem').AsString, 1, 2));
// ide.cMunFG                                        := dsNFCe.FieldByName('pnf_ibge_origem').Value;
// ide.finNFe                                        := fnNormal;
// ide.tpImp                                         := tiNFCe;
// ide.indFinal                                      := cfConsumidorFinal;
// ide.indPres                                       := pcPresencial;
// ACBrNFe.Configuracoes.Geral.ModeloDF              := moNFce;
// ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe  := true;
// ACBrNFe.Configuracoes.Geral.CSC                   := FrmDModuleNFCe.CdsEmpresa.FieldByName('em_csc').AsString;
// InfAdic.infAdFisco                                := dsNFCe.FieldByName('pnf_obs').AsString;
// TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFile           := PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Report\DANFeNFCe.fr3';
// TACBrNFeDANFEFR(ACBrNFe.DANFE).TipoDANFE          := tiNFCe;
// TACBrNFeDANFEFR(ACBrNFe.DANFE).TributosFonte      := 'IBPT';
// TACBrNFeDANFEFR(ACBrNFe.DANFE).URLConsultaPublica := ACBrNFe.GetURLConsultaNFCe(ide.cUF, ide.tpAmb, 4);
//
//
// // Ide.dhCont := date;
// // Ide.xJust  := 'Justificativa Contingencia';
//
// with FrmDModuleNFCe do
// begin
// if CdsEmpresa.FieldByName('em_simples_nacional').AsInteger = 1 then
// Emit.CRT := crtSimplesNacional
// else
// Emit.CRT   := crtRegimeNormal;
// Emit.CNPJCPF := CdsEmpresa.FieldByName('em_cnpj').Value;
// Emit.xNome   := CdsEmpresa.FieldByName('em_razaosocial').Value;
// Emit.xFant   := CdsEmpresa.FieldByName('em_fantasia').Value;
// Emit.IE      := CdsEmpresa.FieldByName('em_ie').Value;
// with Emit.enderEmit do
// begin
// xLgr    := CdsEmpresa.FieldByName('em_endereco').AsString;
// nro     := CdsEmpresa.FieldByName('em_numero').AsString;
// xCpl    := CdsEmpresa.FieldByName('em_complemento').AsString; // 'casa 2';
// xBairro := CdsEmpresa.FieldByName('em_bairro').AsString;
// cMun    := CdsEmpresa.FieldByName('em_ibge_id').AsInteger;
// xMun    := CdsEmpresa.FieldByName('em_cidade').AsString;
// UF      := CdsEmpresa.FieldByName('em_uf').AsString;
// CEP     := CdsEmpresa.FieldByName('em_cep').AsInteger;
// cPais   := 1058;
// xPais   := 'BRASIL';
// fone    := CdsEmpresa.FieldByName('em_fone').AsString;
// end;
// end;
// if dsNFCe.FieldByName('pnf_nfce_identif').AsBoolean then
// begin
// Dest.CNPJCPF := dsNFCe.FieldByName('en_cnpjcpf').AsString;
// Dest.xNome   := dsNFCe.FieldByName('en_nome_completo').AsString;
// Dest.ISUF    := '';
// with Dest.enderDest do
// begin
// xLgr    := dsNFCe.FieldByName('tlo_sigla').AsString + ' ' + dsNFCe.FieldByName('ed_logradouro').AsString;
// nro     := dsNFCe.FieldByName('ed_numero').AsString;
// xCpl    := dsNFCe.FieldByName('ed_complemento').AsString;
// xBairro := dsNFCe.FieldByName('br_descricao').AsString;
// cMun    := dsNFCe.FieldByName('cd_ibge_id').AsInteger;
// xMun    := dsNFCe.FieldByName('cd_descricao').AsString;
// UF      := dsNFCe.FieldByName('uf_id').AsString;
// if dsNFCe.FieldByName('ed_cep').AsString <> '' then
// CEP := dsNFCe.FieldByName('ed_cep').AsInteger;
// cPais := 1058;
// xPais := 'BRASIL';
// fone  := dsNFCe.FieldByName('_fone_dest').AsString;
// end;
//
// Dest.indIEDest := inNaoContribuinte;
// Dest.IE        := '';
// Dest.Email     := dsNFCe.FieldByName('en_email').AsString; // e-mail do cliente
// end;
//
// dsNFCeItens.Open('select * from v_fiscal_nota_fiscal_itens where nf_id = ' + QuotedStr(dsNFCe.FieldByName('nf_id').AsString) + ' order by pr_codigo');
// dsNFCeItens.First;
// for i := 0 to dsNFCeItens.RecordCount - 1 do
// begin
// with Det.Add do
// begin
// Prod.nItem := i + 1;
// Prod.cProd := dsNFCeItens.FieldByName('pr_codigo_fiscal').AsString;
// Prod.xProd := dsNFCeItens.FieldByName('pr_descricao_fiscal').AsString;
// Prod.cEAN  := dsNFCeItens.FieldByName('pr_codigo_barras').AsString;
// Prod.NCM   := dsNFCeItens.FieldByName('nfi_ncm').AsString;
// Prod.CFOP  := dsNFCeItens.FieldByName('cfop_id').AsString;
// if Prod.CFOP = '' then
// begin
// MessageBox(Application.Handle, pChar('CFOP do produto ' + dsNFCeItens.FieldByName('pr_codigo').AsString + ' - ' + dsNFCeItens.FieldByName('pr_descricao').AsString + ' é obrigatório, confira a operação fiscal e redigite o item.'), 'SigoNFe', MB_ICONERROR);
// exit;
// end;
// Prod.uCom     := dsNFCeItens.FieldByName('un_sigla').AsString;
// Prod.qCom     := dsNFCeItens.FieldByName('nfi_qtd').AsCurrency;
// Prod.vUnCom   := dsNFCeItens.FieldByName('nfi_valor_unit').AsCurrency;
// Prod.vDesc    := dsNFCeItens.FieldByName('nfi_desconto').AsCurrency;
// Prod.vProd    := dsNFCeItens.FieldByName('nfi_qtd').AsCurrency * dsNFCeItens.FieldByName('nfi_valor_unit').AsCurrency;
// Prod.cEANTrib := dsNFCeItens.FieldByName('pr_codigo_barras').AsString;
// Prod.uTrib    := dsNFCeItens.FieldByName('un_sigla').AsString;
// Prod.qTrib    := dsNFCeItens.FieldByName('nfi_qtd').AsCurrency;
// Prod.vUnTrib  := dsNFCeItens.FieldByName('nfi_valor_unit').AsCurrency;
// Prod.vOutro   := dsNFCeItens.FieldByName('nfi_outras_desp').AsCurrency;
// Prod.vFrete   := dsNFCeItens.FieldByName('nfi_frete').AsCurrency;
// Prod.vSeg     := dsNFCeItens.FieldByName('nfi_seguro').AsCurrency;
// Prod.CEST     := dsNFCeItens.FieldByName('nfi_cest').AsString;
// with Imposto do
// begin
// vTotTrib                  := dsNFCeItens.FieldByName('pnfi_total_tributos').AsCurrency;
// ICMSUFDest.vBCUFDest      := dsNFCeItens.FieldByName('pnfi_icms_base').AsCurrency;
// ICMSUFDest.pFCPUFDest     := 0; // dsNFCeItens.FieldByName('nfi_fcp_aliq_ufdest').AsCurrency; // Aliquota do Fundo de Amparo a Probreza
// ICMSUFDest.pICMSUFDest    := 0; // dsNFCeItens.FieldByName('nfi_icms_aliq_ufdest').AsCurrency; // Aliquota Interna do Estado de Destino
// ICMSUFDest.pICMSInter     := 0; // dsNFCeItens.FieldByName('nfi_icms_inter_aliq').AsCurrency; // Aliquota interestadual entre origem e destino
// ICMSUFDest.pICMSInterPart := 0; // dsNFCeItens.FieldByName('nfi_icms_inter_part_aliq').AsCurrency; // Aliquota da Partilha -> 40% em 2016; - 60% em 2017; - 80% em 2018; - 100% a partir de 2019.
// ICMSUFDest.vFCPUFDest     := 0; // dsNFCeItens.FieldByName('nfi_fcp_valor_ufdest').AsCurrency; // vBCUFDest*(pFCPUFDest/100)
// ICMSUFDest.vICMSUFDest    := 0; // dsNFCeItens.FieldByName('nfi_icms_valor_ufdest').AsCurrency; // vBCUFDest*(pICMSInter/100) * (pICMSInterPart/100)
// ICMSUFDest.vICMSUFRemet   := 0; // dsNFCeItens.FieldByName('nfi_icms_valor_ufremet').AsCurrency;
//
// ICMS.CST   := StrToCSTICMS(Lok, dsNFCeItens.FieldByName('stb_codigo').AsString);
// ICMS.CSOSN := StrToCSOSNIcms(Lok, dsNFCeItens.FieldByName('stb_codigo_sn').AsString);
// ICMS.orig  := TpcnOrigemMercadoria(dsNFCeItens.FieldByName('pnfi_origem_trib').AsInteger);
// ICMS.modBC := dbiValorOperacao;
// ICMS.vBC   := dsNFCeItens.FieldByName('pnfi_icms_base').AsCurrency;
//
// if dsNFCeItens.FieldByName('pnfi_icms_aliq_sn').AsCurrency > 0 then
// begin
// ICMS.pICMS := dsNFCeItens.FieldByName('pnfi_icms_aliq_sn').AsCurrency;
// ICMS.vICMS := dsNFCeItens.FieldByName('pnfi_icms_sn').AsCurrency;
// end
// else
// begin
// ICMS.pICMS := dsNFCeItens.FieldByName('pnfi_icms_aliq').AsCurrency;
// ICMS.vICMS := dsNFCeItens.FieldByName('pnfi_icms').AsCurrency;
// end;
//
// ICMS.modBCST := dbisPrecoTabelado;
// ICMS.vBCST   := dsNFCeItens.FieldByName('pnfi_icms_base_ST').AsCurrency;
// ICMS.pICMSST := dsNFCeItens.FieldByName('pnfi_icms_aliq_st').AsCurrency;
// ICMS.vICMSST := dsNFCeItens.FieldByName('pnfi_icms_st').AsCurrency;
// ICMS.pRedBC  := dsNFCeItens.FieldByName('pnfi_reducao_perc').AsCurrency;
//
// ICMS.pMVAST   := 0;
// ICMS.pRedBCST := 0;
//
// { PIS }
// PIS.CST  := StrToCSTPIS(Lok, dsNFCeItens.FieldByName('stb_codigo_pis').AsString);
// PIS.vBC  := dsNFCeItens.FieldByName('pnfi_pis_base').AsCurrency;
// PIS.pPIS := dsNFCeItens.FieldByName('pnfi_pis_aliq').AsCurrency;
// PIS.vPIS := dsNFCeItens.FieldByName('pnfi_pis').AsCurrency;
//
// { IPI }
// IPI.CST  := StrToCSTIPI(Lok, dsNFCeItens.FieldByName('stb_codigo_ipi').AsString);
// IPI.cEnq := dsNFCeItens.FieldByName('').AsString;
// IPI.vBC  := dsNFCeItens.FieldByName('pnfi_ipi_base').AsCurrency;
// IPI.pIPI := dsNFCeItens.FieldByName('pnfi_ipi_aliq').AsCurrency;
// IPI.vIPI := dsNFCeItens.FieldByName('pnfi_ipi').AsCurrency;
//
// { COFINS }
// COFINS.CST     := StrToCSTCOFINS(Lok, dsNFCeItens.FieldByName('stb_codigo_cofins').AsString);
// COFINS.vBC     := dsNFCeItens.FieldByName('pnfi_cofins_base').AsCurrency;
// COFINS.pCOFINS := dsNFCeItens.FieldByName('pnfi_cofins_aliq').AsCurrency;
// COFINS.vCOFINS := dsNFCeItens.FieldByName('pnfi_cofins').AsCurrency;
// end;
// end;
//
// dsNFCeItens.Next;
// end;
//
// { fim dos itens }
// with Total.ICMSTot do
// begin
// vTotTrib     := dsNFCe.FieldByName('pnf_total_tributos').AsCurrency;
// vFCPUFDest   := 0; // dsNFCe.FieldByName('nf_fcp_valor_ufdest').AsCurrency;
// vICMSUFDest  := 0; // dsNFCe.FieldByName('nf_icms_valor_ufdest').AsCurrency;
// vICMSUFRemet := 0; // dsNFCe.FieldByName('nf_icms_valor_ufremet').AsCurrency;
//
// vBC     := dsNFCe.FieldByName('pnf_icms_base').AsCurrency;
// vICMS   := dsNFCe.FieldByName('pnf_icms').AsCurrency;
// vBCST   := dsNFCe.FieldByName('pnf_icms_base_ST').AsCurrency;
// vST     := dsNFCe.FieldByName('pnf_icms_st').AsCurrency;
// vProd   := dsNFCe.FieldByName('pnf_total_prods').AsCurrency;
// vFrete  := dsNFCe.FieldByName('pnf_frete').AsCurrency;
// vSeg    := dsNFCe.FieldByName('pnf_seguro').AsCurrency;
// vDesc   := dsNFCe.FieldByName('pnf_desconto').AsCurrency;
// vII     := 0.00;
// vIPI    := dsNFCe.FieldByName('pnf_ipi').AsCurrency;
// vPIS    := dsNFCe.FieldByName('pnf_pis').AsCurrency;
// vCOFINS := dsNFCe.FieldByName('pnf_cofins').AsCurrency;
// vOutro  := dsNFCe.FieldByName('pnf_outras_desp').AsCurrency;
// vNF     := dsNFCe.FieldByName('pnf_total_nota').AsCurrency;
// end;
//
// Total.ISSQNtot.vServ   := 0;
// Total.ISSQNtot.vBC     := 0;
// Total.ISSQNtot.vISS    := 0;
// Total.ISSQNtot.vPIS    := 0;
// Total.ISSQNtot.vCOFINS := 0;
//
// Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE
// with pag.Add do                // PAGAMENTOS apenas para NFC-e
// begin
// // case dsNFCe.FieldByName('FPGTO_id').AsInteger of
// // 1:
// tPag := fpDinheiro;
// // 2:
// // tPag := fpCheque;
// // 3:
// // tPag := fpCartaoDebito;
// // 4:
// // tPag := fpCartaoCredito;
// // end;
//
// vPag := dsNFCe.FieldByName('pnf_total_nota').AsCurrency;
// end;
//
// end;
// ACBrNFe.NotasFiscais.GerarNFe;
// doLog('[>] Assinando ...');
// ACBrNFe.NotasFiscais.Assinar;
// end;
//
// procedure TFrmSAT.doLog(ALog: String);
// begin
// Label1.Caption := ALog;
// Label1.Refresh;
// end;
//
// procedure TFrmSAT.doEnviarCFe(Apnf_id: Integer);
// var
// vNumLote: Integer;
// Sincrono: Boolean;
// begin
//
// vNumLote := 0;
//
// Sincrono := false;
//
// ACBrNFe.NotasFiscais.Clear;
// ACBrNFe.Configuracoes.Geral.ModeloDF := moNFce;
// ACBrNFe.Configuracoes.Geral.VersaoDF := ve400;
// doLog('[>] Gerando NFC-e ...');
// GerarCFe(Apnf_id);
// StoreXML(ACBrNFe.NotasFiscais.Items[0].Xml, Apnf_id);
// doLog('[>] Enviando ...');
// ACBrNFe.Enviar(vNumLote, false, Sincrono);
// doLog('[>] Registrando protocolo ...');
// FrmDModuleNFCe.ADConnection1.ExecSQL('update fiscal_nota_fiscal set nf_chave = ' + QuotedStr(uGlobalLibSat.OnlyNumbers(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID)) + ' where nf_id = ' + IntToStr(ACBrNFe.NotasFiscais.Items[0].NFe.ide.cNF));
// UpdateProtocolo(ACBrNFe.NotasFiscais.Items[0].NFe.ide.cNF, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt, ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);
// doLog('[>] Imprimindo...');
// ACBrNFe.NotasFiscais.Imprimir;
// doLog('[>] Enviado com sucesso!');
// ACBrNFe.NotasFiscais.Clear;
//
// end;
//
procedure TFrmSAT.FormCreate(Sender: TObject);
begin
  goLog := TStringList.create;
end;

procedure TFrmSAT.doKeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        goReturnPressed := true;
      end;
  end;
end;

procedure TFrmSAT.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TFrmSAT.TimerPiscaTimer(Sender: TObject);
begin
  lblMensagemRodape.visible := not lblMensagemRodape.visible;
end;

end.
