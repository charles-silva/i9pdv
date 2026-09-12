unit uFrmPDV_SAT;

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
  Dialogs, Xml.xmldom, Xml.XMLIntf, ACBrSATExtratoESCPOS, ACBrPosPrinter, ACBrBase, ACBrSAT, Vcl.ExtCtrls,
  Xml.Win.msxmldom, Xml.XMLDoc, Vcl.StdCtrls, ACBrUtil, pcnVFPe,
  ACBrSATMFe_integrador,
  ACBrSATClass,
  pcnConversao,
  ACBrConsts,
  ACBrDevice, uPDVLib, ACBrIntegrador, ACBrSATExtratoClass, ACBrDFeReport,
  ACBrDFe, ACBrSATWS, dxGDIPlusClasses, ACBrSATExtratoReportClass,
  ACBrSATExtratoFR, ACBrTEFComum, ACBrTEFAPIComum;

type

  TFrmPDV_SAT = class(TForm)
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
    ACBrSATExtratoFR1: TACBrSATExtratoFR;
    procedure FormCreate(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure ACBrSAT1GravarLog(const ALogLine: string; var Tratado: Boolean);
    procedure ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
    procedure ACBrSAT1GetsignAC(var Chave: AnsiString);
    procedure TimerPiscaTimer(Sender: TObject);
    procedure ACBrIntegrador1GravarLog(const ALogLine: string; var Tratado: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ACBrSAT1GetNumeroSessao(var NumeroSessao: Integer);
    // procedure Timer1Timer(Sender: TObject);
  private
    goAbrirGaveta  : Boolean;
    goReturnPressed: Boolean;
    goLog          : TStringList;
    function doVerifyStatusPayCFe(aChaveAcessoValidador, aCNPJ: String; aIDFila: Integer)
      : TRespostaVerificarStatusValidador;
    function imprimirNFCe(ASat: TACBrSAT; var ARetorno: TSendRetorno): Boolean;
    procedure ImprimirComprovantes(ATEFResp: TACBrTEFResp);
    procedure ImprimirRelatorio(ATexto: String);
    procedure AdicionarLinhaImpressao(ALinha: String);
    procedure ImprimirTodosComprovantes;

  public
    goPNFId         : Integer;
    goIDSesssaoAtual: Integer;
    goTEFResp       : TACBrTEFAPIRespostas;
    function doSATCancelCFe(aXML: String): TSendRetorno;
    procedure doSetHeaderCFe(aIDNF, aIDSesssao: Integer; aDestCNPJCPF, aDestNome, aEntregLgr, aEntregNro, aEntregCpl,
      aEntregBairro, aEntregMun, aEntregUF: String; aVlrDesconto, aVlrAcrescimo, aVlrLei12741: Double; aObs: String;
      aAbrirGaveta: Boolean);
    procedure doSetDetailCFe(aCodProd, aEAN, aNomeProd, aNCM, aCFOP, aUnidade: String;
      aQtd, aVlrUnit, aVlrDesc, aVlrLei12741: Double; aOrigemMercadoria: Integer;
      aCSTPis, aCSTCofins, aCSTCSOSNIcms, aCSTIcms: String; aICMSAliq, aICMS, aBCPis, aPisAliq, aPis, aBCCofins,
      aCofinsAliq, aCofins: Double; aObs: String);
    procedure doSetPaysCFe(aTipoMP: String; aVlrMP: Double);
    function doSendPayCFe(aIDSesssao: Integer; aChaveAcessoValidador, aChaveRequisicao, aMerchantID, aSerialPOS,
      aCNPJEmitente: String; aIcmsBase, aValorTotalVenda: Double;
      aHabilitarMultiplosPagamentos, aHabilitarControleAntiFraude: Boolean; const aCodigoMoeda: String = 'BRL';
      const aEmitirCupomNFCE: Boolean = false; const aOrigemPagamento: String = ''): TWiBiRespostaValidador;
    function doSendCFe: TSendRetorno;
    function doSendFiscalResponseCFe(aChaveAcessoValidador, aChaveAcesso, aCNPJ, aNsu, aNumerodeAprovacao, aBandeira,
      aAdquirente, aImpressaoFiscal, aNumeroDocumento: String; aIDFila: Integer): TRetornoRespostaFiscal;
    procedure doSATStart(aHandle: Cardinal; aCodigoDeAtivacao, aSignAC: String; aNumeroCaixa, aAmbiente: Integer;
      aSwHCNPJ, aEmitCNPJ, aEmitIE, aEmitIM: String; aEmitRegTrib, aEmitRegTribISSQN, aIndRatISSQN: Integer;
      aVersaoCFe: String; aSalvarCFe, aSalvarCFeCanc, aSalvarEnvio, aSepararPorCNPJ, aSepararPorMes: Boolean;
      aPastaInput, aPastaOutput: String; aTimeout, aPrinterModel: Integer; aPrinterPort: string;
      aPrinterBaud, aPrinterData, aPrinterParity, aPrinterStop, aPrinterHandshake: Integer;
      aPrinterHardflow, aPrinterSoftflow: Boolean); stdcall;
    procedure doKeyDown(var Key: Word; Shift: TShiftState);
    destructor Destroy; override;
  end;

var
  FrmPDV_SAT: TFrmPDV_SAT;

var
  goCodigoDeAtivacao, goSignAC: String;

implementation

uses
  uFrmPDV, ACBrDeviceSerial, uFrmPDV_DModule;
{$R *.dfm}

procedure TFrmPDV_SAT.doSATStart(aHandle: Cardinal; aCodigoDeAtivacao, aSignAC: String; //
  aNumeroCaixa, aAmbiente: Integer;                                                     //
  aSwHCNPJ, aEmitCNPJ, aEmitIE, aEmitIM: String;                                        //
  aEmitRegTrib, aEmitRegTribISSQN, aIndRatISSQN: Integer;                               //
  aVersaoCFe: String;                                                                   //
  aSalvarCFe, aSalvarCFeCanc, aSalvarEnvio, aSepararPorCNPJ, aSepararPorMes: Boolean;   //
  aPastaInput, aPastaOutput: String;                                                    //
  aTimeout: Integer;                                                                    //
  aPrinterModel: Integer;                                                               //
  aPrinterPort: string;                                                                 //
  aPrinterBaud: Integer;                                                                //
  aPrinterData: Integer;                                                                //
  aPrinterParity: Integer;                                                              //
  aPrinterStop: Integer;                                                                //
  aPrinterHandshake: Integer;                                                           //
  aPrinterHardflow: Boolean;                                                            //
  aPrinterSoftflow: Boolean); stdcall;
begin
  // goHandleMain       := aHandle;
  goCodigoDeAtivacao := aCodigoDeAtivacao;
  goSignAC           := aSignAC;
  ForceDirectories(ExtractFilePath(application.ExeName) + '\satlog\');
  with ACBrSAT1 do
  begin
    // Integrador :=  ACBrIntegrador1;
    Modelo                        := TACBrSATModelo(satDinamico_stdcall);
    ArqLOG                        := ExtractFilePath(application.ExeName) + '\satlog\satlog.log';
    NomeDLL                       := ExtractFilePath(application.ExeName) + '\mfe.dll';;
    Config.ide_numeroCaixa        := aNumeroCaixa;
    Config.ide_tpAmb              := TpcnTipoAmbiente(aAmbiente);
    Config.ide_CNPJ               := aSwHCNPJ;
    Config.emit_CNPJ              := aEmitCNPJ;
    Config.emit_IE                := aEmitIE;
    Config.emit_IM                := aEmitIM;
    Config.emit_cRegTrib          := TpcnRegTrib(aEmitRegTrib);
    Config.emit_cRegTribISSQN     := TpcnRegTribISSQN(aEmitRegTribISSQN);
    Config.emit_indRatISSQN       := TpcnindRatISSQN(aIndRatISSQN);
    Config.PaginaDeCodigo         := CUTF8CodPage;
    Config.EhUTF8                 := true;
    Config.infCFe_versaoDadosEnt  := StringToFloat(aVersaoCFe);
    numeroTentativasValidarSessao := 10;

    ConfigArquivos.SalvarCFe      := aSalvarCFe;
    ConfigArquivos.SalvarCFeCanc  := aSalvarCFeCanc;
    ConfigArquivos.SalvarEnvio    := aSalvarEnvio;
    ConfigArquivos.SepararPorCNPJ := aSepararPorCNPJ;
    ConfigArquivos.SepararPorMes  := aSepararPorMes;
    ValidarNumeroSessaoResposta   := true;

    // Integrador.PastaInput  := aPastaInput;
    // Integrador.PastaOutput := aPastaOutput;
    // Integrador.Timeout     := aTimeout;

    ACBrPosPrinter1.Desativar;
    ACBrPosPrinter1.Modelo                  := TACBrPosPrinterModelo(aPrinterModel);
    ACBrPosPrinter1.PaginaDeCodigo          := TACBrPosPaginaCodigo(pc860);
    ACBrPosPrinter1.Porta                   := aPrinterPort;
//    ACBrPosPrinter1.ColunasFonteNormal      := 48;
//    ACBrPosPrinter1.LinhasEntreCupons       := 0;
//    ACBrPosPrinter1.EspacoEntreLinhas       := 0;
//    ACBrPosPrinter1.Device.Baud             := aPrinterBaud;
//    ACBrPosPrinter1.Device.Data             := aPrinterData;
//    ACBrPosPrinter1.Device.Parity           := TACBrSerialParity(aPrinterParity);
//    ACBrPosPrinter1.Device.Stop             := TACBrSerialStop(aPrinterStop);
//    ACBrPosPrinter1.Device.Handshake        := TACBrHandShake(aPrinterHandshake);
//    ACBrPosPrinter1.Device.HardFlow         := aPrinterHardflow;
//    ACBrPosPrinter1.Device.Softflow         := aPrinterSoftflow;
//    ACBrSATExtratoESCPOS1.ImprimeQRCode     := true;
//    ACBrSATExtratoESCPOS1.ImprimeEmUmaLinha := false;
    Inicializado                            := true;
  end
end;

procedure TFrmPDV_SAT.ImprimirTodosComprovantes;
var
  i: Integer;
begin
  for i := 0 to goTEFResp.Count - 1 do
    ImprimirComprovantes(goTEFResp[i]);
end;

procedure TFrmPDV_SAT.ImprimirComprovantes(ATEFResp: TACBrTEFResp);
begin
  if not Assigned(ATEFResp) then
    Exit;

  if (ATEFResp.ImagemComprovante2aVia.Count > 0) then
    ImprimirRelatorio(ATEFResp.ImagemComprovante2aVia.Text);

  if (ATEFResp.ImagemComprovante1aVia.Count > 0) then
    // if ImprimirViaCliente then
    ImprimirRelatorio(ATEFResp.ImagemComprovante1aVia.Text);
end;

procedure TFrmPDV_SAT.ImprimirRelatorio(ATexto: String);
begin
  AdicionarLinhaImpressao('</zera>' + ATexto + '</lf></corte_total>');
end;

procedure TFrmPDV_SAT.AdicionarLinhaImpressao(ALinha: String);
begin
  if ACBrPosPrinter1.Ativo then
    ACBrPosPrinter1.Imprimir(ALinha);
end;

function TFrmPDV_SAT.doSendPayCFe(aIDSesssao: Integer; aChaveAcessoValidador, aChaveRequisicao, aMerchantID, aSerialPOS,
  aCNPJEmitente: String; aIcmsBase, aValorTotalVenda: Double;
  aHabilitarMultiplosPagamentos, aHabilitarControleAntiFraude: Boolean; const aCodigoMoeda: String = 'BRL';
  const aEmitirCupomNFCE: Boolean = false; const aOrigemPagamento: String = ''): TWiBiRespostaValidador;
var
  PagamentoMFe                    : TEnviarPagamento;
  RespostaPagamentoMFe            : TRespostaPagamento;
  RespostaVerificarStatusValidador: TRespostaVerificarStatusValidador;
begin
  Result            := nil;
  goIDSesssaoAtual  := aIDSesssao;
  lblStatus.Caption := 'Enviando pagamento ao VFP-e...';
  lblStatus.repaint;
  PagamentoMFe := TEnviarPagamento.Create;
  try
    with PagamentoMFe do
    begin
      Clear;
      ChaveAcessoValidador         := aChaveAcessoValidador; // '25CFE38D-3B92-46C0-91CA-CFF751A82D3D';
      ChaveRequisicao              := aChaveRequisicao;      // '26359854-5698-1365-9856-965478231456'; //
      Estabelecimento              := aMerchantID;           // '10';
      SerialPOS                    := aSerialPOS;
      CNPJ                         := aCNPJEmitente;
      IcmsBase                     := aIcmsBase;
      ValorTotalVenda              := aValorTotalVenda;
      HabilitarMultiplosPagamentos := true;
      HabilitarControleAntiFraude  := false;
      CodigoMoeda                  := aCodigoMoeda;
      EmitirCupomNFCE              := aEmitirCupomNFCE;
      OrigemPagamento              := 'VENDA BALCAO'; // aOrigemPagamento;
    end;
    Result := TWiBiRespostaValidador.Create;
    if ACBrSAT1.SAT is TACBrSATMFe_integrador_XML then
      RespostaPagamentoMFe := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).EnviarPagamento(PagamentoMFe);
    // else
    // RespostaPagamentoMFe := ACBrIntegrador1.EnviarPagamento(PagamentoMFe);

    if (RespostaPagamentoMFe.IDPagamento > 0) or (RespostaPagamentoMFe.StatusPagamento = 'SalvoEmArmazenamentoLocal')
    then
    begin
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
        application.ProcessMessages;
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
        RespostaVerificarStatusValidador := doVerifyStatusPayCFe(aChaveAcessoValidador, aCNPJEmitente,
          RespostaPagamentoMFe.IDPagamento);
        if RespostaVerificarStatusValidador.IDFila = 0 then
          RespostaVerificarStatusValidador.IDFila := RespostaPagamentoMFe.IDPagamento;
        // Result.IntegradorResposta                 := RespostaVerificarStatusValidador.IntegradorResposta;
        Result.CodigoAutorizacao     := RespostaVerificarStatusValidador.CodigoAutorizacao;
        Result.Bin                   := RespostaVerificarStatusValidador.Bin;
        Result.DonoCartao            := RespostaVerificarStatusValidador.DonoCartao;
        Result.DataExpiracao         := RespostaVerificarStatusValidador.DataExpiracao;
        Result.InstituicaoFinanceira := RespostaVerificarStatusValidador.InstituicaoFinanceira;
        Result.Parcelas              := RespostaVerificarStatusValidador.Parcelas;
        Result.UltimosQuatroDigitos  := RespostaVerificarStatusValidador.UltimosQuatroDigitos;
        Result.CodigoPagamento       := RespostaVerificarStatusValidador.CodigoPagamento;
        Result.ValorPagamento        := RespostaVerificarStatusValidador.ValorPagamento;
        Result.IDFila                := RespostaVerificarStatusValidador.IDFila;
        Result.Tipo                  := RespostaVerificarStatusValidador.Tipo;
        Result.Xml                   := RespostaVerificarStatusValidador.Xml;
      end;
    end;
  finally
    lblMensagemRodape.visible := false;
    PagamentoMFe.Destroy;
    close;
  end;
end;

procedure TFrmPDV_SAT.doSetHeaderCFe(aIDNF, aIDSesssao: Integer; aDestCNPJCPF, aDestNome, aEntregLgr, aEntregNro,
  aEntregCpl, aEntregBairro, aEntregMun, aEntregUF: String; aVlrDesconto, aVlrAcrescimo, aVlrLei12741: Double;
  aObs: String; aAbrirGaveta: Boolean);
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

  // ACBrSAT1.ValidarNumeroSessaoResposta;
  // AjustaACBrSAT;
  ACBrSAT1.InicializaCFe;

  with ACBrSAT1.CFe do
  begin
    ide.numeroCaixa := ACBrSAT1.Config.ide_numeroCaixa;
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

procedure TFrmPDV_SAT.doSetDetailCFe(aCodProd, aEAN, aNomeProd, aNCM, aCFOP, aUnidade: String;
  aQtd, aVlrUnit, aVlrDesc, aVlrLei12741: Double; //
  aOrigemMercadoria: Integer; aCSTPis, aCSTCofins, aCSTCSOSNIcms, aCSTIcms: String;
  aICMSAliq, aICMS, aBCPis, aPisAliq, aPis, aBCCofins, aCofinsAliq, aCofins: Double; aObs: String);
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
    Prod.vProd    := aVlrUnit;
    Prod.NCM      := aNCM;
    Prod.CFOP     := aCFOP;
    Prod.uCom     := aUnidade;
    Prod.qCom     := aQtd;
    Prod.vUnCom   := aVlrUnit;
    Prod.indRegra := irTruncamento;
    // Prod.vDesc    := aVlrDesc;
    // Prod.vItem    := aVlrUnit - aVlrDesc;

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
    Imposto.PIS.vPIS := (aBCPis * aPisAliq) / 100000; // aPis;

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

procedure TFrmPDV_SAT.doSetPaysCFe(aTipoMP: String; aVlrMP: Double);
var
  ok: Boolean;

begin
  lblStatus.Caption := 'Registrando pagamentos...';
  lblStatus.repaint;
  with ACBrSAT1.CFe.Pagto.Add do
  begin
    cMP   := StrToCodigoMP(ok, aTipoMP);
    vMP   := aVlrMP;
    cAdmC := 999;
    if cMP in [mpCartaodeCredito, mpCartaodeDebito] then
      cAut := '999999999999999999';
  end;
end;

function TFrmPDV_SAT.doSendCFe: TSendRetorno;
var
  SATError      : Boolean;
  sessao        : Integer;
  i             : Integer;
  loop          : Integer;
  cStat, xMotivo: String;
begin
  lblStatus.Caption := 'Enviando CF-e...';
  lblStatus.repaint;
  // loXML := ACBrSAT1.CFe.GerarXML(true);
  try
    // ACBrSAT1.ConsultarNumeroSessao(541436);
    /// ShowMessage(ACBrSAT1.ModeloStr);
    // verificando numero sessao
    if (goIDSesssaoAtual > 0) then
    begin
      ACBrSAT1.ConsultarNumeroSessao(goIDSesssaoAtual);
      if imprimirNFCe(ACBrSAT1, Result) then
        Exit;
    end;

    ACBrSAT1.ConsultarSAT;
    SATError := (ACBrSAT1.Resposta.codigoDeRetorno <> 8000);
    if (SATError) then
    begin
      Result.CodigoErro      := ACBrSAT1.Resposta.codigoDeRetorno;
      Result.MensagemRetorno := ACBrSAT1.Resposta.MensagemRetorno;
      Result.sessao          := '0';
      Exit;
    end;
    // ACBrSAT1.ConsultarNumeroSessao(goIDSesssaoAtual);
    ACBrSAT1.EnviarDadosVenda;
    // sessao := ACBrSAT1.NumeroSessao;
    // sleep(3000);

    if ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
    begin
      Result.CodigoRetorno   := ACBrSAT1.Resposta.codigoDeRetorno;
      Result.CodigoSefaz     := ACBrSAT1.Resposta.CodigoSefaz;
      Result.MensagemRetorno := ACBrSAT1.Resposta.MensagemRetorno;
      Result.MensagemSefaz   := ACBrSAT1.Resposta.MensagemSefaz;
      Result.LogText         := goLog.Text;
      Result.ChaveAcesso     := OnlyNumber(ACBrSAT1.CFe.infCFe.ID);
      Result.nCFe            := ACBrSAT1.CFe.ide.nCFe;
      Result.sessao          := ACBrSAT1.NumeroSessao.ToString;

      Result.XMLString  := ACBrSAT1.CFe.AsXMLString;
      lblStatus.Caption := 'CF-e enviado com sucesso!';
      lblStatus.repaint;
      // sleep(500);
      try
        ACBrSAT1.ImprimirExtrato;
        if goAbrirGaveta then
          ACBrPosPrinter1.AbrirGaveta;
      except
        on E: Exception do
        begin
          if MessageBox(handle, pchar(E.Message + chr(13) + chr(13) + 'Erro ao imprimir, tentar novamente?'), 'I9 PDV',
            MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
            Exit;
          try
            if ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
              ACBrSAT1.ImprimirExtrato;
          except
          end;
        end;
      end;
      // end
      // else
      // begin
      // FrmSATRetorno := TFrmSATRetorno.create(self);
      // try
      // FrmSATRetorno.goRetorno := Result;
      // FrmSATRetorno.goLog.AddStrings(goLog);
      // FrmSATRetorno.ShowModal;
      // finally
      // FrmSATRetorno.Release;
      // close;
      // end;
    end
    else
    begin
      // ACBrSAT1.ConsultarNumeroSessao(sessao);
      // if imprimirNFCe(ACBrSAT1, Result) then

      Result.CodigoRetorno   := ACBrSAT1.Resposta.codigoDeRetorno;
      Result.CodigoSefaz     := ACBrSAT1.Resposta.CodigoSefaz;
      Result.MensagemRetorno := ACBrSAT1.Resposta.MensagemRetorno;
      Result.MensagemSefaz   := ACBrSAT1.Resposta.MensagemSefaz;
      Result.LogText         := goLog.Text;
      Result.sessao          := ACBrSAT1.NumeroSessao.ToString;

      // xMotivo := MensagemCodigoRetorno(Result.CodigoRetorno);
      // if Result.CodigoRetorno = 06010 then
      // if Trim(Result.MensagemRetorno) <> '' then
      // xMotivo := xMotivo + sLineBreak + Result.MensagemRetorno;
      //
      // if Trim(xMotivo) = '' then
      // xMotivo := 'Falha de comunicação com o Integrador Fiscal - MFE, verifique se o mesmo está em execução.';
      //
      // raise EACBrSATErro.Create(Format('Mensagem Retorno: %s - %s', [Result.CodigoRetorno, xMotivo]));
    end;
    // begin
    // loop     := 0;
    // for loop := 1 to 10 do
    // begin
    // try
    // lblStatus.Caption := string.Format('Consultando cupom. Tentativa[%d]', [loop]);
    // lblStatus.repaint;
    // application.ProcessMessages;
    // ACBrSAT1.ConsultarNumeroSessao(sessao);
    // if imprimirNFCe(ACBrSAT1, Result) then
    // exit;
    // sleep(1000);
    // except
    // end;
    // end;
    // end;

  except
    on E: Exception do
    begin
      Result.sessao := '0';
      MessageBox(handle, PWideChar('Falha de comunicação, verifique módulo e/ou integrador.' + sLineBreak + E.Message +
        ' retorno:' + ACBrSAT1.Resposta.codigoDeErro.ToString), 'I9 PDV', MB_ICONQUESTION + MB_OK);
      close;
    end;
  end;
end;

function TFrmPDV_SAT.imprimirNFCe(ASat: TACBrSAT; var ARetorno: TSendRetorno): Boolean;
begin
  if ASat.CFe.infCFe.ID = '' then
  begin
    Result := false;
  end
  else
  begin
    with ASat do
    begin
      ARetorno.CodigoErro      := ASat.Resposta.codigoDeErro;
      ARetorno.CodigoRetorno   := ASat.Resposta.codigoDeRetorno;
      ARetorno.CodigoSefaz     := ASat.Resposta.CodigoSefaz;
      ARetorno.MensagemRetorno := ASat.Resposta.MensagemRetorno;
      ARetorno.MensagemSefaz   := ASat.Resposta.MensagemSefaz;
      ARetorno.LogText         := goLog.Text;
      ARetorno.ChaveAcesso     := OnlyNumber(ACBrSAT1.CFe.infCFe.ID);
      ARetorno.nCFe            := ASat.CFe.ide.nCFe;
      ARetorno.XMLString       := ACBrSAT1.CFe.AsXMLString;
      ARetorno.sessao          := goIDSesssaoAtual.ToString;
      lblStatus.Caption        := 'CF-e enviado com sucesso!';
      lblStatus.repaint;
      sleep(500);
      try
        ACBrSAT1.ImprimirExtrato;
        if goAbrirGaveta then
          ACBrPosPrinter1.AbrirGaveta;
        Result := true;
      except
        Result := false;
      end;

    end;
  end;
end;

function TFrmPDV_SAT.doSendFiscalResponseCFe(aChaveAcessoValidador, aChaveAcesso, aCNPJ, aNsu, aNumerodeAprovacao,
  aBandeira, aAdquirente, aImpressaoFiscal, aNumeroDocumento: String; aIDFila: Integer): TRetornoRespostaFiscal;
var
  RespostaFiscal: TRespostaFiscal;
begin
  Result            := nil;
  lblStatus.Caption := 'Enviando resposta fiscal...';
  lblStatus.repaint;
  sleep(500);
  RespostaFiscal := TRespostaFiscal.Create;
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
    if ACBrSAT1.SAT is TACBrSATMFe_integrador_XML then
      Result := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).RespostaFiscal(RespostaFiscal);
    // else
    // Result := ACBrIntegrador1.RespostaFiscal(RespostaFiscal);

  finally
    RespostaFiscal.Destroy;
    close;
  end;
end;

function TFrmPDV_SAT.doSATCancelCFe(aXML: String): TSendRetorno;
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
        if MessageBox(handle, pchar(E.Message + chr(13) + chr(13) + 'Erro ao imprimir, tentar novamente?'), 'I9 PDV',
          MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
          Exit;
        try
          ACBrSAT1.ImprimirExtratoCancelamento;
        except
        end;
      end;
    end;
    // end
    // else
    // begin
    // FrmSATRetorno := TFrmSATRetorno.create(self);
    // try
    // FrmSATRetorno.goRetorno := Result;
    // FrmSATRetorno.goLog.AddStrings(goLog);
    // FrmSATRetorno.ShowModal;
    // finally
    // FrmSATRetorno.Release;
    // close;
    // end;
  end;

end;

procedure TFrmPDV_SAT.ACBrIntegrador1GravarLog(const ALogLine: string; var Tratado: Boolean);
begin
  // goLog.Add(ALogLine);
  // goLog.SaveToFile(ExtractFilePath(application.ExeName) + 'logintegrador' + FormatDateTime('ddmmyyyyhhnnsszzz', Now) + '.txt');
end;

procedure TFrmPDV_SAT.ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := goCodigoDeAtivacao;
end;

procedure TFrmPDV_SAT.ACBrSAT1GetNumeroSessao(var NumeroSessao: Integer);
begin
  // goIDSesssaoAtual := NumeroSessao;
  // NumeroSessao := goIDSesssaoAtual;
  // ShowMessage('mudou sessao: ' + NumeroSessao.ToString);
end;

procedure TFrmPDV_SAT.ACBrSAT1GetsignAC(var Chave: AnsiString);
begin
  Chave := goSignAC;
end;

procedure TFrmPDV_SAT.ACBrSAT1GravarLog(const ALogLine: string; var Tratado: Boolean);
begin
  // goLog.Add(ALogLine);
  // goLog.SaveToFile(ExtractFilePath(application.ExeName) + 'log' + FormatDateTime('ddmmyyyyhhnnsszzz', Now) + '.txt');
end;

destructor TFrmPDV_SAT.Destroy;
begin
  if (goLog <> nil) then
    goLog.Destroy;
  inherited;
end;

function TFrmPDV_SAT.doVerifyStatusPayCFe(aChaveAcessoValidador, aCNPJ: String; aIDFila: Integer)
  : TRespostaVerificarStatusValidador;
var
  VerificarStatusValidador: TVerificarStatusValidador;
begin
  VerificarStatusValidador := TVerificarStatusValidador.Create;
  try
    with VerificarStatusValidador do
    begin
      Clear;
      ChaveAcessoValidador := aChaveAcessoValidador;
      IDFila               := aIDFila;
      CNPJ                 := aCNPJ;
    end;
    if ACBrSAT1.SAT is TACBrSATMFe_integrador_XML then
      Result := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).VerificarStatusValidador(VerificarStatusValidador);
    // else
    // Result := ACBrIntegrador1.VerificarStatusValidador(VerificarStatusValidador);
  finally
    VerificarStatusValidador.Free;
  end;
end;

procedure TFrmPDV_SAT.FormCreate(Sender: TObject);
begin
  goLog                         := TStringList.Create;
  ACBrSATExtratoFR1.FastExtrato := ExtractFilePath(application.ExeName) + 'Extrato SAT.fr3';

  // ACBrSATExtratoFR1.PictureLogo.LoadFromFile(ExtractFilePath(application.ExeName) + 'logomarca.bmp');
  ACBrSATExtratoFR1.LogoVisible  := true;
  ACBrSATExtratoFR1.LogoAutoSize := true;
  // ACBrSATExtratoFR1.LogoCenter   := true;
  ACBrSATExtratoFR1.LogoStretch := true;
end;

procedure TFrmPDV_SAT.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        goReturnPressed := true;
      end;
  end;
end;

procedure TFrmPDV_SAT.doKeyDown(var Key: Word; Shift: TShiftState);
begin

end;

procedure TFrmPDV_SAT.FormShow(Sender: TObject);
begin
  Timer1.Enabled      := true;
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
end;

procedure TFrmPDV_SAT.TimerPiscaTimer(Sender: TObject);
begin
  lblMensagemRodape.visible := not lblMensagemRodape.visible;
end;

end.
