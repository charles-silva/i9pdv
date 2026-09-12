library wlibsat;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  Windows,
  SysUtils,
  Classes,
  Forms,
  Menus,
  ACBrSATClass,
  pcnConversao,
  ACBrConsts,
  ACBRUtil,
  ACBrDevice,
  ACBrPosPrinter,
  ACBrSATMFe_integrador,
  uFrmSAT in 'uFrmSAT.pas' {FrmSAT} ,
  uFrmSATRetorno in 'uFrmSATRetorno.pas' {FrmSATRetorno} ,
  uPDVLib in '..\uPDVLib.pas',
  uFrmSATLog in 'uFrmSATLog.pas', pcnVFPe {FrmSATLog};

{$R *.res}

var
  goHandleMain: Cardinal;

procedure ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := goCodigoDeAtivacao;
end;

procedure ACBrSAT1GetsignAC(var Chave: AnsiString);
begin
  Chave := goSignAC;
end;

procedure SATStart(aHandle: Cardinal; aCodigoDeAtivacao, aSignAC: String; //
  aNumeroCaixa, aAmbiente: integer; //
  aSwHCNPJ, aEmitCNPJ, aEmitIE, aEmitIM: String;          //
  aEmitRegTrib, aEmitRegTribISSQN, aIndRatISSQN: integer; //
  aVersaoCFe: String;                                     //
  aSalvarCFe, aSalvarCFeCanc, aSalvarEnvio, aSepararPorCNPJ, aSepararPorMes: Boolean; //
  aPastaInput, aPastaOutput: String; //
  aTimeout: integer;                 //
  aPrinterModel: integer;            //
  aPrinterPort: string;              //
  aPrinterBaud: integer;             //
  aPrinterData: integer;             //
  aPrinterParity: integer;           //
  aPrinterStop: integer;             //
  aPrinterHandshake: integer;        //
  aPrinterHardflow: Boolean;         //
  aPrinterSoftflow: Boolean); stdcall;
begin
  goHandleMain := aHandle;
  if not Assigned(FrmSAT) then
    FrmSAT            := TFrmSAT.Create(nil);
  FrmSAT.ParentWindow := aHandle;
  goCodigoDeAtivacao  := aCodigoDeAtivacao;
  goSignAC            := aSignAC;
  ForceDirectories(ExtractFilePath(application.ExeName) + '\satlog\');
  with FrmSAT.ACBrSAT1 do
  begin
    Modelo                       := TACBrSATModelo(mfe_Integrador_XML);
    ArqLOG                       := ExtractFilePath(application.ExeName) + '\satlog\satlog.log';
    NomeDLL                      := '';
    Config.ide_numeroCaixa       := aNumeroCaixa;
    Config.ide_tpAmb             := TpcnTipoAmbiente(aAmbiente);
    Config.ide_CNPJ              := aSwHCNPJ;
    Config.emit_CNPJ             := aEmitCNPJ;
    Config.emit_IE               := aEmitIE;
    Config.emit_IM               := aEmitIM;
    Config.emit_cRegTrib         := TpcnRegTrib(aEmitRegTrib);
    Config.emit_cRegTribISSQN    := TpcnRegTribISSQN(aEmitRegTribISSQN);
    Config.emit_indRatISSQN      := TpcnindRatISSQN(aIndRatISSQN);
    Config.PaginaDeCodigo        := CUTF8CodPage;
    Config.EhUTF8                := true;
    Config.infCFe_versaoDadosEnt := StringToFloat(aVersaoCFe);

    ConfigArquivos.SalvarCFe      := aSalvarCFe;
    ConfigArquivos.SalvarCFeCanc  := aSalvarCFeCanc;
    ConfigArquivos.SalvarEnvio    := aSalvarEnvio;
    ConfigArquivos.SepararPorCNPJ := aSepararPorCNPJ;
    ConfigArquivos.SepararPorMes  := aSepararPorMes;

    TACBrSATMFe_integrador_XML(SAT).PastaInput  := aPastaInput;
    TACBrSATMFe_integrador_XML(SAT).PastaOutput := aPastaOutput;
    TACBrSATMFe_integrador_XML(SAT).Timeout     := aTimeout;

    FrmSAT.ACBrPosPrinter1.Desativar;
    FrmSAT.ACBrPosPrinter1.Modelo                  := TACBrPosPrinterModelo(aPrinterModel);
    FrmSAT.ACBrPosPrinter1.PaginaDeCodigo          := TACBrPosPaginaCodigo(pc860);
    FrmSAT.ACBrPosPrinter1.Porta                   := aPrinterPort;
    FrmSAT.ACBrPosPrinter1.ColunasFonteNormal      := 48;
    FrmSAT.ACBrPosPrinter1.LinhasEntreCupons       := 0;
    FrmSAT.ACBrPosPrinter1.EspacoEntreLinhas       := 0;
    FrmSAT.ACBrPosPrinter1.Device.Baud             := aPrinterBaud;
    FrmSAT.ACBrPosPrinter1.Device.Data             := aPrinterData;
    FrmSAT.ACBrPosPrinter1.Device.Parity           := TACBrSerialParity(aPrinterParity);
    FrmSAT.ACBrPosPrinter1.Device.Stop             := TACBrSerialStop(aPrinterStop);
    FrmSAT.ACBrPosPrinter1.Device.Handshake        := TACBrHandShake(aPrinterHandshake);
    FrmSAT.ACBrPosPrinter1.Device.HardFlow         := aPrinterHardflow;
    FrmSAT.ACBrPosPrinter1.Device.Softflow         := aPrinterSoftflow;
    FrmSAT.ACBrSATExtratoESCPOS1.ImprimeQRCode     := true;
    FrmSAT.ACBrSATExtratoESCPOS1.ImprimeEmUmaLinha := false;

    Inicializado := true;
  end
end;

procedure SATSetHeader(aIDNF, aIDSesssao: integer; //
  aDestCNPJCPF, aDestNome, aEntregLgr, aEntregNro, aEntregCpl, aEntregBairro, aEntregMun, aEntregUF: String; //
  aVlrDesconto, aVlrAcrescimo, aVlrLei12741: Double; //
  aObs: String; aAbrirGaveta: Boolean); stdcall;
begin
  if not Assigned(FrmSAT) then
    exit;
  FrmSAT.Show;
  application.ProcessMessages;
  FrmSAT.doSetHeaderCFe(aIDNF, aIDSesssao, aDestCNPJCPF, aDestNome, aEntregLgr, aEntregNro, aEntregCpl, aEntregBairro, aEntregMun, aEntregUF, aVlrDesconto, aVlrAcrescimo, aVlrLei12741, aObs, aAbrirGaveta);
end;

procedure SATSetDetails(aCodProd, aEAN, aNomeProd, aNCM, aCFOP, aUnidade: String; aQtd, aVlrUnit, aVlrDesc, aVlrLei12741: Double; //
  aOrigemMercadoria: integer; aCSTPis, aCSTCofins, aCSTCSOSNIcms, aCSTIcms: String; aICMSAliq, aICMS, aBCPis, aPisAliq, aPis, aBCCofins, aCofinsAliq, aCofins: Double; aObs: String); stdcall;
begin
  if not Assigned(FrmSAT) then
    exit;

  FrmSAT.doSetDetailCFe(aCodProd, aEAN, aNomeProd, aNCM, aCFOP, aUnidade, aQtd, aVlrUnit, aVlrDesc, aVlrLei12741, //
    aOrigemMercadoria, aCSTPis, aCSTCofins, aCSTCSOSNIcms, aCSTIcms, aICMSAliq, aICMS, aBCPis, aPisAliq, aPis, aBCCofins, aCofinsAliq, aCofins, aObs);
end;

procedure SATSetPays(aTipoMP: String; aVlrMP: Double); stdcall;
begin
  if not Assigned(FrmSAT) then
    exit;

  FrmSAT.doSetPaysCFe(aTipoMP, aVlrMP);
end;

function SATSendCFe: TSendRetorno; stdcall;
begin
  if not Assigned(FrmSAT) then
    exit;

  Result := FrmSAT.doSendCFe;
  FrmSAT.ACBrSAT1.CFe.Clear;
  FrmSAT.Close;
end;

function SATCancelCFe(aXML: String): TSendRetorno; stdcall;
begin
  if not Assigned(FrmSAT) then
    exit;

  FrmSAT.Show;
  Result := FrmSAT.doSetCancelCFe(aXML);
  FrmSAT.ACBrSAT1.CFe.Clear;
  FrmSAT.Close;
end;

function SATSendPayCFe(aChaveAcessoValidador, aChaveRequisicao, aMerchantID, aSerialPOS, aCNPJEmitente: String; aIcmsBase, aValorTotalVenda: Double; aHabilitarMultiplosPagamentos, aHabilitarControleAntiFraude: Boolean; const aCodigoMoeda: String = 'BRL'; const aEmitirCupomNFCE: Boolean = false;
  const aOrigemPagamento: String = ''): TWiBiRespostaValidador; stdcall;
begin
  if not Assigned(FrmSAT) then
    exit;

  FrmSAT.Show;
  Result := FrmSAT.doSendPayCFe(   //
    aChaveAcessoValidador,         //
    aChaveRequisicao,              //
    aMerchantID,                   //
    aSerialPOS,                    //
    aCNPJEmitente,                 //
    aIcmsBase,                     //
    aValorTotalVenda,              //
    aHabilitarMultiplosPagamentos, //
    aHabilitarControleAntiFraude,  //
    aCodigoMoeda,                  //
    aEmitirCupomNFCE,              //
    aOrigemPagamento);
end;

function SATSendFiscalResponseCFe(aChaveAcessoValidador, aChaveAcesso, aCNPJ, aNsu, aNumerodeAprovacao, aBandeira, aAdquirente, aImpressaoFiscal, aNumeroDocumento: String; aIDFila: integer): TRetornoRespostaFiscal; stdcall;
begin
  if not Assigned(FrmSAT) then
    exit;

  FrmSAT.Show;
  Result := FrmSAT.doSendFiscalResponseCFe( //
    aChaveAcessoValidador,                  //
    aChaveAcesso,                           //
    aCNPJ,                                  //
    aNsu,                                   //
    aNumerodeAprovacao,                     //
    aBandeira,                              //
    aAdquirente,                            //
    aImpressaoFiscal,                       //
    aNumeroDocumento,                       //
    aIDFila);
end;

function SATShowing: Boolean; stdcall;
begin
  Result := false;
  if Assigned(FrmSAT) then
    Result := FrmSAT.Showing;
end;

procedure SATSendKeyDown(var Key: Word; Shift: TShiftState); stdcall;
begin
  if not Assigned(FrmSAT) then
    exit;

  FrmSAT.doKeyDown(Key, Shift);

end;

exports SATStart, SATSetHeader, SATSetDetails, SATSetPays, SATSendCFe, SATCancelCFe, SATSendPayCFe, SATSendFiscalResponseCFe, SATSendKeyDown, SATShowing;

begin

end.
