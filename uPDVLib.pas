unit uPDVLib;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, dialogs,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Generics.Collections,
  pcnVFPe, Forms, clipbrd;

type

  TWiBiRespostaValidador = class(TPersistent)
  public
    IDLocal              : Integer;
    IDPagamento          : Integer;
    CodigoAutorizacao    : String;
    Bin                  : String;
    DonoCartao           : String;
    DataExpiracao        : String;
    InstituicaoFinanceira: String;
    Parcelas             : Integer;
    UltimosQuatroDigitos : Integer;
    CodigoPagamento      : String;
    ValorPagamento       : Double;
    IDFila               : Integer;
    Tipo                 : String;
    XML                  : AnsiString;
  end;

  TSendRetorno = record
    XMLString: AnsiString;
    CodigoErro: Integer;
    CodigoRetorno: Integer;
    MensagemRetorno: String;
    CodigoSefaz: Integer;
    MensagemSefaz: String;
    LogText: AnsiString;
    ChaveAcesso: String;
    Sessao: string;
    nCFe: Integer;
  end;

  TPrinterModel = (pmTexto, pmEscPosEpson, pmEscBematech, pmEscDaruma, pmEscElgin, pmEscDiebold);

  TSATStart = procedure(aHandle: Cardinal; aCodigoDeAtivacao, aSignAC: String; aNumeroCaixa, aAmbiente: Integer;
    aSwHCNPJ, aEmitCNPJ, aEmitIE, aEmitIM: String; aEmitRegTrib, aEmitRegTribISSQN, aIndRatISSQN: Integer;
    aVersaoCFe: String; aSalvarCFe, aSalvarCFeCanc, aSalvarEnvio, aSepararPorCNPJ, aSepararPorMes: Boolean;
    aPastaInput, aPastaOutput: String; aTimeout: Integer; aPrinterModel: Integer; aPrinterPort: string;
    aPrinterBaud: Integer; aPrinterData: Integer; aPrinterParity: Integer; aPrinterStop: Integer;
    aPrinterHandshake: Integer; aPrinterhardflow: Boolean; aPrinterSoftflow: Boolean); stdcall;

  // TSATSetHeader = procedure(aIDNF, aIDSesssao: Integer; aDestCNPJCPF, aDestNome, aEntregLgr, aEntregNro, aEntregCpl, aEntregBairro, aEntregMun, aEntregUF: String; aVlrDesconto, aVlrAcrescimo, aVlrLei12741: Double; aObs: String; aAbrirGaveta: Boolean); stdcall;
  //
  // TSATSetDetails = procedure(aCodProd, aEAN, aNomeProd, aNCM, aCFOP, aUnidade: String; aQtd, aVlrUnit, aVlrDesc, aVlrLei12741: Double; aOrigemMercadoria: Integer; aCSTPis, aCSTCofins, aCSTCSOSNIcms, aCSTIcms: String; aICMSAliq, aICMS, aBCPis, aPisAliq, aPis, aBCCofins, aCofinsAliq, aCofins: Double;
  // aObs: String); stdcall;
  //
  // TSATSetPays = procedure(aTipoMP: String; aVlrMP: Double); stdcall;
  //
  // TSATSendCFe = function(): TSendRetorno; stdcall;
  //
  // TSATCancelCFe = function(aXML: String): TSendRetorno; stdcall;
  //
  // TSATSendPayCFe = function(aChaveAcessoValidador, aChaveRequisicao, aMerchantID, aSerialPOS, aCNPJEmitente: String; aIcmsBase, aValorTotalVenda: Double; aHabilitarMultiplosPagamentos, aHabilitarControleAntiFraude: Boolean; const aCodigoMoeda: String = 'BRL'; const aEmitirCupomNFCE: Boolean = false;
  // const aOrigemPagamento: String = ''): TWiBiRespostaValidador; stdcall;
  //
  // TSATSendFiscalResponseCFe = function(aChaveAcessoValidador, aChaveAcesso, aCNPJ, aNsu, aNumerodeAprovacao, aBandeira, aAdquirente, aImpressaoFiscal, aNumeroDocumento: String; aIDFila: Integer): TRetornoRespostaFiscal; stdcall;
  //
  // TSATSendKeyDown = procedure(var Key: Word; Shift: TShiftState); stdcall;
  // TSATShowing     = function: Boolean; stdcall;
  //
  // TTEFStart = function(aHandle: Cardinal; AOperador: String): Boolean; stdcall;
  //
  // TTEFStop = function(var AComprovanteTEF1aVia, AComprovanteTEF2aVia, aNSU_SITEF, aNSU_HOSTTEF, aNSU_BANDEIRA, aPARCELAS: String): Boolean; stdcall;
  //
  // TTEFTransaction = function(ANumeroFiscal: AnsiString; AValor: Double; ACartaoDebito: Boolean; AData: TDate; AHora: TTime): Boolean; stdcall;

  TTipoUser = set of (tuOperador, tuSupervisor);

  TBalanca = class
  strict private
    Fpbal_data     : Integer;
    Fpbal_hardflow : Boolean;
    Fpbal_descricao: String;
    Fpbal_parity   : Integer;
    Fpbal_handshake: Integer;
    Fpbal_modelo   : Integer;
    Fpbal_port     : string;
    Fpbal_stop     : Integer;
    Fpbal_softflow : Boolean;
    Fpbal_baud     : Integer;
    procedure Setpbal_baud(const Value: Integer);
    procedure Setpbal_data(const Value: Integer);
    procedure Setpbal_descricao(const Value: String);
    procedure Setpbal_handshake(const Value: Integer);
    procedure Setpbal_hardflow(const Value: Boolean);
    procedure Setpbal_modelo(const Value: Integer);
    procedure Setpbal_parity(const Value: Integer);
    procedure Setpbal_port(const Value: string);
    procedure Setpbal_softflow(const Value: Boolean);
    procedure Setpbal_stop(const Value: Integer);
  public
    property pbal_descricao: String read Fpbal_descricao write Setpbal_descricao;
    property pbal_modelo   : Integer read Fpbal_modelo write Setpbal_modelo;
    property pbal_port     : string read Fpbal_port write Setpbal_port;
    property pbal_baud     : Integer read Fpbal_baud write Setpbal_baud;
    property pbal_data     : Integer read Fpbal_data write Setpbal_data;
    property pbal_parity   : Integer read Fpbal_parity write Setpbal_parity;
    property pbal_stop     : Integer read Fpbal_stop write Setpbal_stop;
    property pbal_handshake: Integer read Fpbal_handshake write Setpbal_handshake;
    property pbal_hardflow : Boolean read Fpbal_hardflow write Setpbal_hardflow;
    property pbal_softflow : Boolean read Fpbal_softflow write Setpbal_softflow;
  end;

  TImpressora = class
  Strict private
    Fpimp_stop      : Integer;
    Fpimp_softflow  : Boolean;
    Fpimp_baud      : Integer;
    Fpimp_data      : Integer;
    Fpimp_descricao : String;
    Fpimp_hardflow  : Boolean;
    Fpimp_parity    : Integer;
    Fpimp_handshake : Integer;
    Fpimp_modelo    : Integer;
    Fpimp_port      : string;
    Fpimp_impressora: String;
    procedure Setpimp_impressora(const Value: String);
    procedure Setpimp_baud(const Value: Integer);
    procedure Setpimp_data(const Value: Integer);
    procedure Setpimp_descricao(const Value: String);
    procedure Setpimp_hardflow(const Value: Boolean);
    procedure Setpimp_handshake(const Value: Integer);
    procedure Setpimp_modelo(const Value: Integer);
    procedure Setpimp_parity(const Value: Integer);
    procedure Setpimp_port(const Value: string);
    procedure Setpimp_softflow(const Value: Boolean);
    procedure Setpimp_stop(const Value: Integer);
  private
    Fpimp_colunas: Integer;
    Fpimp_espacos: Integer;
    Fpimp_linhas : Integer;
    procedure Setpimp_colunas(const Value: Integer);
    procedure Setpimp_espacos(const Value: Integer);
    procedure Setpimp_linhas(const Value: Integer);
  public
    property pimp_descricao : String read Fpimp_descricao write Setpimp_descricao;
    property pimp_modelo    : Integer read Fpimp_modelo write Setpimp_modelo;
    property pimp_port      : string read Fpimp_port write Setpimp_port;
    property pimp_baud      : Integer read Fpimp_baud write Setpimp_baud;
    property pimp_data      : Integer read Fpimp_data write Setpimp_data;
    property pimp_parity    : Integer read Fpimp_parity write Setpimp_parity;
    property pimp_stop      : Integer read Fpimp_stop write Setpimp_stop;
    property pimp_handshake : Integer read Fpimp_handshake write Setpimp_handshake;
    property pimp_hardflow  : Boolean read Fpimp_hardflow write Setpimp_hardflow;
    property pimp_softflow  : Boolean read Fpimp_softflow write Setpimp_softflow;
    property pimp_impressora: String read Fpimp_impressora write Setpimp_impressora;
    property pimp_linhas    : Integer read Fpimp_linhas write Setpimp_linhas;
    property pimp_colunas   : Integer read Fpimp_colunas write Setpimp_colunas;
    property pimp_espacos   : Integer read Fpimp_espacos write Setpimp_espacos;
  end;

  TFormaPag = class
  strict private
    Ffp_descricao       : string;
    Ffp_codigo          : Integer;
    Ffp_nota_promissoria: Boolean;
    Ffp_cartao          : Boolean;
    Ffp_dinheiro        : Boolean;
    Ffp_gaveta          : Boolean;
    procedure Setfp_gaveta(const Value: Boolean);
    procedure Setfp_cartao(const Value: Boolean);
    procedure Setfp_codigo(const Value: Integer);
    procedure Setfp_descricao(const Value: string);
    procedure Setfp_dinheiro(const Value: Boolean);
    procedure Setfp_nota_promissoria(const Value: Boolean);
  public
    property fp_codigo          : Integer read Ffp_codigo write Setfp_codigo;
    property fp_descricao       : string read Ffp_descricao write Setfp_descricao;
    property fp_cartao          : Boolean read Ffp_cartao write Setfp_cartao;
    property fp_dinheiro        : Boolean read Ffp_dinheiro write Setfp_dinheiro;
    property fp_nota_promissoria: Boolean read Ffp_nota_promissoria write Setfp_nota_promissoria;
    property fp_gaveta          : Boolean read Ffp_gaveta write Setfp_gaveta;
  end;

  TPOS = class
  private
    Fpos_cnpj    : string;
    Fpos_id      : Integer;
    Fpos_parcelas: Integer;
    procedure Setpos_cnpj(const Value: string);
    procedure Setpos_id(const Value: Integer);
    procedure Setpos_parcelas(const Value: Integer);
  public
    property pos_id      : Integer read Fpos_id write Setpos_id;
    property pos_cnpj    : string read Fpos_cnpj write Setpos_cnpj;
    property pos_parcelas: Integer read Fpos_parcelas write Setpos_parcelas;
  end;

  TCartaoPag = class
  private
    Fpos         : TPOS;
    Fautenticador: String;
    procedure Setpos(const Value: TPOS);
    procedure Setautenticador(const Value: String);
  public
    property pos         : TPOS read Fpos write Setpos;
    property autenticador: String read Fautenticador write Setautenticador;
    constructor Create;
  end;

  TUser = class
  strict private
    Fus_nome   : string;
    Fus_apelido: string;
    Fus_codigo : Integer;
    Fus_senha  : string;
    procedure Setus_apelido(const Value: string);
    procedure Setus_codigo(const Value: Integer);
    procedure Setus_nome(const Value: string);
    procedure Setus_senha(const Value: string);
  public
    property us_codigo : Integer read Fus_codigo write Setus_codigo;
    property us_apelido: string read Fus_apelido write Setus_apelido;
    property us_nome   : string read Fus_nome write Setus_nome;
    property us_senha  : string read Fus_senha write Setus_senha;
  end;

  TCaixa = class
  strict private
    Fpcx_saldo_atual  : Double;
    Fpcx_data_abertura: TDateTime;
    Fpcx_saldo_inicial: Double;
    Fpcx_id           : Integer;
    procedure Setpcx_data_abertura(const Value: TDateTime);
    procedure Setpcx_id(const Value: Integer);
    procedure Setpcx_saldo_atual(const Value: Double);
    procedure Setpcx_saldo_inicial(const Value: Double);
  private
    function GetPcx_data_abertura_str: String;
  public
    property pcx_id               : Integer read Fpcx_id write Setpcx_id;
    property pcx_data_abertura    : TDateTime read Fpcx_data_abertura write Setpcx_data_abertura;
    property pcx_data_abertura_str: String read GetPcx_data_abertura_str;
    property pcx_saldo_inicial    : Double read Fpcx_saldo_inicial write Setpcx_saldo_inicial;
    property pcx_saldo_atual      : Double read Fpcx_saldo_atual write Setpcx_saldo_atual;
  end;

  TCaixaOperador = class
  strict private
    Fpcxo_saldo_final  : Double;
    Fpcxo_data_abertura: TDateTime;
    Fpcx_id            : Integer;
    Fpcxo_saldo_inicial: Double;
    Fpcxo_id           : Integer;
    function GetPcxo_data_abertura_str: String;
    procedure Setpcx_id(const Value: Integer);
    procedure Setpcxo_data_abertura(const Value: TDateTime);
    procedure Setpcxo_id(const Value: Integer);
    procedure Setpcxo_saldo_final(const Value: Double);
    procedure Setpcxo_saldo_inicial(const Value: Double);
  private
    Fus_codigo : Integer;
    Fus_apelido: string;
    procedure Setus_codigo(const Value: Integer);
    procedure Setus_apelido(const Value: string);
  public
    property pcx_id                : Integer read Fpcx_id write Setpcx_id;
    property pcxo_id               : Integer read Fpcxo_id write Setpcxo_id;
    property pcxo_data_abertura    : TDateTime read Fpcxo_data_abertura write Setpcxo_data_abertura;
    property pcxo_data_abertura_str: String read GetPcxo_data_abertura_str;
    property pcxo_saldo_inicial    : Double read Fpcxo_saldo_inicial write Setpcxo_saldo_inicial;
    property pcxo_saldo_final      : Double read Fpcxo_saldo_final write Setpcxo_saldo_final;
    property us_codigo             : Integer read Fus_codigo write Setus_codigo;
    property us_apelido            : string read Fus_apelido write Setus_apelido;
  end;

  TTerminal = class
  strict private
    Fpterm_id                  : String;
    Fpterm_numero              : Integer;
    Fpterm_serie_fiscal        : Integer;
    Fpterm_sat                 : Boolean;
    Fpterm_nfce                : Boolean;
    Fpterm_descricao           : String;
    Fpterm_sat_assinatura      : String;
    Fpterm_sat_codigo_ativacao : String;
    Fpterm_sat_versao_cfe      : String;
    Fpterm_sat_timeout         : Integer;
    Fpterm_sat_output          : String;
    Fpterm_sat_input           : String;
    Fpimp_id                   : Integer;
    Fimpressora                : TImpressora;
    Fpterm_pos_chave_validador : string;
    Fpterm_pos_chave_requisicao: string;
    Fpterm_pos                 : Boolean;
    Fpterm_tef                 : Boolean;
    Fpterm_last_sync           : TDateTime;
    Fbalanca                   : TBalanca;
    Fpbal_id                   : Integer;
    Fpterm_nfce_offline        : Boolean;
    procedure Setbalanca(const Value: TBalanca);
    procedure Setpbal_id(const Value: Integer);
    procedure Setpterm_last_sync(const Value: TDateTime);
    procedure Setpterm_pos(const Value: Boolean);
    procedure Setpterm_tef(const Value: Boolean);
    procedure Setpterm_pos_chave_requisicao(const Value: string);
    procedure Setpterm_pos_chave_validador(const Value: string);
    procedure Setimpressora(const Value: TImpressora);
    procedure Setpimp_id(const Value: Integer);
    procedure Setpterm_sat_assinatura(const Value: String);
    procedure Setpterm_sat_codigo_ativacao(const Value: String);
    procedure Setpterm_sat_versao_cfe(const Value: String);
    procedure Setpterm_sat_input(const Value: String);
    procedure Setpterm_sat_output(const Value: String);
    procedure Setpterm_sat_timeout(const Value: Integer);
    procedure Setpterm_descricao(const Value: String);
    procedure Setpterm_id(const Value: String);
    procedure Setpterm_nfce(const Value: Boolean);
    procedure Setpterm_numero(const Value: Integer);
    procedure Setpterm_sat(const Value: Boolean);
    procedure Setpterm_serie_fiscal(const Value: Integer);
    function Getpterm_last_sync_str: String;
    procedure Setpterm_nfce_offline(const Value: Boolean);
  private
    Fpterm_tef_servidor       : string;
    Fpterm_tef_prestador      : String;
    Fpterm_tef_ambiente       : string;
    Fpterm_tef_mensagem_pinpad: string;
    Fpterm_sh_nome_aplicacao  : string;
    Fpterm_sh_cnpj            : string;
    Fpterm_sh_versao_aplicacao: string;
    Fpterm_sh_nome_soft_house : string;
    Fpterm_sh_cliente_cnpj    : string;
    Fpterm_sh_cliente_nome    : string;
    Fpterm_tef_qrcode         : string;
    procedure Setpterm_tef_ambiente(const Value: string);
    procedure Setpterm_tef_mensagem_pinpad(const Value: string);
    procedure Setpterm_tef_prestador(const Value: String);
    procedure Setpterm_tef_servidor(const Value: string);
    procedure Setpterm_sh_cnpj(const Value: string);
    procedure Setpterm_sh_nome_aplicacao(const Value: string);
    procedure Setpterm_sh_nome_soft_house(const Value: string);
    procedure Setpterm_sh_versao_aplicacao(const Value: string);
    procedure Setpterm_sh_cliente_cnpj(const Value: string);
    procedure Setpterm_sh_cliente_nome(const Value: string);
    procedure Setpterm_tef_qrcode(const Value: string);
  public
    destructor Destroy; override;
    property pterm_id: String read Fpterm_id write Setpterm_id;
    property pterm_numero: Integer read Fpterm_numero write Setpterm_numero;
    property pterm_descricao: String read Fpterm_descricao write Setpterm_descricao;
    property pterm_serie_fiscal: Integer read Fpterm_serie_fiscal write Setpterm_serie_fiscal;
    property pterm_sat: Boolean read Fpterm_sat write Setpterm_sat;
    property pterm_nfce: Boolean read Fpterm_nfce write Setpterm_nfce;
    property pterm_sat_codigo_ativacao: String read Fpterm_sat_codigo_ativacao write Setpterm_sat_codigo_ativacao;
    property pterm_sat_assinatura: String read Fpterm_sat_assinatura write Setpterm_sat_assinatura;
    property pterm_sat_versao_cfe: String read Fpterm_sat_versao_cfe write Setpterm_sat_versao_cfe;
    property pterm_sat_input: String read Fpterm_sat_input write Setpterm_sat_input;
    property pterm_sat_output: String read Fpterm_sat_output write Setpterm_sat_output;
    property pterm_sat_timeout: Integer read Fpterm_sat_timeout write Setpterm_sat_timeout;
    property pterm_pos_chave_validador: string read Fpterm_pos_chave_validador write Setpterm_pos_chave_validador;
    property pterm_pos_chave_requisicao: string read Fpterm_pos_chave_requisicao write Setpterm_pos_chave_requisicao;
    property pterm_tef: Boolean read Fpterm_tef write Setpterm_tef;
    property pterm_pos: Boolean read Fpterm_pos write Setpterm_pos;
    property pimp_id: Integer read Fpimp_id write Setpimp_id;
    property pbal_id: Integer read Fpbal_id write Setpbal_id;
    property pterm_last_sync: TDateTime read Fpterm_last_sync write Setpterm_last_sync;
    property impressora: TImpressora read Fimpressora write Setimpressora;
    property balanca: TBalanca read Fbalanca write Setbalanca;
    property pterm_last_sync_str: String read Getpterm_last_sync_str;
    property pterm_nfce_offline: Boolean read Fpterm_nfce_offline write Setpterm_nfce_offline;
    property pterm_tef_prestador: String read Fpterm_tef_prestador write Setpterm_tef_prestador;
    property pterm_tef_ambiente: string read Fpterm_tef_ambiente write Setpterm_tef_ambiente;
    property pterm_tef_mensagem_pinpad: string read Fpterm_tef_mensagem_pinpad write Setpterm_tef_mensagem_pinpad;
    property pterm_tef_servidor: string read Fpterm_tef_servidor write Setpterm_tef_servidor;
    // softhouse
    property sh_nome_soft_house: string read Fpterm_sh_nome_soft_house write Setpterm_sh_nome_soft_house;
    property sh_cnpj: string read Fpterm_sh_cnpj write Setpterm_sh_cnpj;
    property sh_nome_aplicacao: string read Fpterm_sh_nome_aplicacao write Setpterm_sh_nome_aplicacao;
    property sh_versao_aplicacao: string read Fpterm_sh_versao_aplicacao write Setpterm_sh_versao_aplicacao;
    // estabelecimento
    property sh_cliente_nome: string read Fpterm_sh_cliente_nome write Setpterm_sh_cliente_nome;
    property sh_cliente_cnpj: string read Fpterm_sh_cliente_cnpj write Setpterm_sh_cliente_cnpj;
    property pterm_tef_qrcode: string read Fpterm_tef_qrcode write Setpterm_tef_qrcode;
  end;

  TNFItem = class
  strict private
    FBCPis           : Double;
    FObs             : String;
    FBCCofins        : Double;
    FQtd             : Double;
    FOrigemMercadoria: Integer;
    FVlrLei12741     : Double;
    FCFOP            : String;
    FNCM             : String;
    FVlrDesc         : Double;
    FICMSAliq        : Double;
    FUnidade         : String;
    FVlrUnit         : Double;
    FCodProd         : String;
    FEAN             : String;
    FNomeProd        : String;
    FCSTPis          : string;
    FCSTCofins       : string;
    FCSTICMS         : string;
    FCSTCSOSN        : string;
    FICMS            : Double;
    FPis             : Double;
    FCofins          : Double;
    FPisAliq         : Double;
    FCofinsAliq      : Double;
    FItemSeq         : Integer;
    procedure SetCofins(const Value: Double);
    procedure SetCofinsAliq(const Value: Double);
    procedure SetICMS(const Value: Double);
    procedure SetPis(const Value: Double);
    procedure SetPisAliq(const Value: Double);
    procedure SetCSTCSOSN(const Value: string);
    procedure SetCSTICMS(const Value: string);
    procedure SetCSTCofins(const Value: string);
    procedure SetCSTPis(const Value: string);
    procedure SetBCCofins(const Value: Double);
    procedure SetBCPis(const Value: Double);
    procedure SetCFOP(const Value: String);
    procedure SetCodProd(const Value: String);
    procedure SetEAN(const Value: String);
    procedure SetICMSAliq(const Value: Double);
    procedure SetNCM(const Value: String);
    procedure SetNomeProd(const Value: String);
    procedure SetObs(const Value: String);
    procedure SetOrigemMercadoria(const Value: Integer);
    procedure SetQtd(const Value: Double);
    procedure SetUnidade(const Value: String);
    procedure SetVlrDesc(const Value: Double);
    procedure SetVlrLei12741(const Value: Double);
    procedure SetVlrUnit(const Value: Double);
    procedure SetItemSeq(const Value: Integer);
    function GetQtdStr: String;
    function GetVlrTotalStr: String;
    function GetVlrUnitStr: String;
  public
    property ItemSeq         : Integer read FItemSeq write SetItemSeq;
    property CodProd         : String read FCodProd write SetCodProd;
    property EAN             : String read FEAN write SetEAN;
    property NomeProd        : String read FNomeProd write SetNomeProd;
    property NCM             : String read FNCM write SetNCM;
    property CFOP            : String read FCFOP write SetCFOP;
    property Unidade         : String read FUnidade write SetUnidade;
    property Qtd             : Double read FQtd write SetQtd;
    property QtdStr          : String read GetQtdStr;
    property VlrUnit         : Double read FVlrUnit write SetVlrUnit;
    property VlrUnitStr      : String read GetVlrUnitStr;
    property VlrDesc         : Double read FVlrDesc write SetVlrDesc;
    property VlrLei12741     : Double read FVlrLei12741 write SetVlrLei12741;
    property VlrTotalStr     : String read GetVlrTotalStr;
    property OrigemMercadoria: Integer read FOrigemMercadoria write SetOrigemMercadoria;
    property CSTPis          : string read FCSTPis write SetCSTPis;
    property CSTCofins       : string read FCSTCofins write SetCSTCofins;
    property CSTICMS         : string read FCSTICMS write SetCSTICMS;
    property CSTCSOSN        : string read FCSTCSOSN write SetCSTCSOSN;
    property ICMSAliq        : Double read FICMSAliq write SetICMSAliq;
    property ICMS            : Double read FICMS write SetICMS;
    property BCPis           : Double read FBCPis write SetBCPis;
    property PisAliq         : Double read FPisAliq write SetPisAliq;
    property Pis             : Double read FPis write SetPis;
    property BCCofins        : Double read FBCCofins write SetBCCofins;
    property CofinsAliq      : Double read FCofinsAliq write SetCofinsAliq;
    property Cofins          : Double read FCofins write SetCofins;
    property Obs             : String read FObs write SetObs;
  end;

  TNFPag = class
  strict private
    FcMP        : String;
    FvMP        : Double;
    FPnfp_id    : Integer;
    FcMPDescr   : String;
    FAbrirGaveta: Boolean;
    procedure SetAbrirGaveta(const Value: Boolean);
    procedure SetcMPDescr(const Value: String);
    procedure SetPnfp_id(const Value: Integer);
    procedure SetcMP(const Value: String);
    procedure SetvMP(const Value: Double);
  public
    property Pnfp_id    : Integer read FPnfp_id write SetPnfp_id;
    property cMPDescr   : String read FcMPDescr write SetcMPDescr;
    property cMP        : String read FcMP write SetcMP;
    property vMP        : Double read FvMP write SetvMP;
    property AbrirGaveta: Boolean read FAbrirGaveta write SetAbrirGaveta;
  end;

  TNF = class
  strict private
    FItens        : Integer;
    FTotalProd    : Double;
    FTotalNF      : Double;
    FVolumes      : Integer;
    FIDNF         : Integer;
    FTotalPago    : Double;
    FTroco        : Double;
    FEntregBairro : String;
    FEntregCpl    : String;
    FEntregMun    : String;
    FEntregLgr    : String;
    FEntregUF     : String;
    FDestNome     : String;
    FEntregNro    : String;
    FDestCNPJCPF  : String;
    FAcrescimo    : Double;
    FDesconto     : Double;
    FTotalTributos: Double;
    FObs          : String;
    FNFItens      : TObjectList<TNFItem>;
    FNFPags       : TObjectList<TNFPag>;
    FICMS         : Double;
    FICMSBase     : Double;
    FNumeroFiscal : Integer;
    procedure SetNumeroFiscal(const Value: Integer);
    procedure SetICMSBase(const Value: Double);
    procedure SetNFPags(const Value: TObjectList<TNFPag>);
    procedure SetICMS(const Value: Double);
    procedure SetNFItens(const Value: TObjectList<TNFItem>);
    procedure SetObs(const Value: String);
    procedure SetTotalTributos(const Value: Double);
    procedure SetItens(const Value: Integer);
    procedure SetTotalNF(const Value: Double);
    procedure SetTotalProd(const Value: Double);
    function GetTotalNFStr: String;
    function GetTotalProdStr: String;
    procedure SetVolumes(const Value: Integer);
    procedure SetIDNF(const Value: Integer);
    procedure SetTotalPago(const Value: Double);
    function GetTotalPagoStr: String;
    function GetTotalAPagarStr: String;
    procedure SetTroco(const Value: Double);
    function GetTrocoStr: String;
    function GetTotalAPagar: Double;
    procedure SetDestCNPJCPF(const Value: String);
    procedure SetDestNome(const Value: String);
    procedure SetEntregBairro(const Value: String);
    procedure SetEntregCpl(const Value: String);
    procedure SetEntregLgr(const Value: String);
    procedure SetEntregMun(const Value: String);
    procedure SetEntregNro(const Value: String);
    procedure SetEntregUF(const Value: String);
    procedure SetAcrescimo(const Value: Double);
    procedure SetDesconto(const Value: Double);

  private
    FIDSessao: Integer;
    procedure SetIDSessao(const Value: Integer);
    function GetDescontoStr: String;
    function GetDescontoMinusStr: String;
    function GetAcrescimoPlusStr: string;
  public
    destructor Destroy; override;
    function doSATPrepareCFe: Boolean;
    function GetDescAcresStr: string;

    property NFItens: TObjectList<TNFItem> read FNFItens write SetNFItens;
    property NFPags: TObjectList<TNFPag> read FNFPags write SetNFPags;
    property Itens: Integer read FItens write SetItens;
    property Volumes: Integer read FVolumes write SetVolumes;
    property TotalProd: Double read FTotalProd write SetTotalProd;
    property TotalProdStr: String read GetTotalProdStr;
    property TotalNF: Double read FTotalNF write SetTotalNF;
    property Troco: Double read FTroco write SetTroco;
    property TotalNFStr: String read GetTotalNFStr;
    property TotalPago: Double read FTotalPago write SetTotalPago;
    property TotalPagoStr: String read GetTotalPagoStr;
    property TotalAPagar: Double read GetTotalAPagar;
    property TotalAPagarStr: String read GetTotalAPagarStr;
    property TrocoStr: String read GetTrocoStr;
    property Desconto: Double read FDesconto write SetDesconto;
    property DescontoStr: String read GetDescontoStr;
    property DescontoMinusStr: String read GetDescontoMinusStr;
    property Acrescimo: Double read FAcrescimo write SetAcrescimo;
    property AcrescimoPlusStr: string read GetAcrescimoPlusStr;
    property TotalTributos: Double read FTotalTributos write SetTotalTributos;
    property ICMS: Double read FICMS write SetICMS;
    property ICMSBase: Double read FICMSBase write SetICMSBase;
    property Obs: String read FObs write SetObs;
    property IDNF: Integer read FIDNF write SetIDNF;
    property IDSessao: Integer read FIDSessao write SetIDSessao;
    property NumeroFiscal: Integer read FNumeroFiscal write SetNumeroFiscal;
    property DestCNPJCPF: String read FDestCNPJCPF write SetDestCNPJCPF;
    property DestNome: String read FDestNome write SetDestNome;
    property EntregLgr: String read FEntregLgr write SetEntregLgr;
    property EntregNro: String read FEntregNro write SetEntregNro;
    property EntregCpl: String read FEntregCpl write SetEntregCpl;
    property EntregBairro: String read FEntregBairro write SetEntregBairro;
    property EntregMun: String read FEntregMun write SetEntregMun;
    property EntregUF: String read FEntregUF write SetEntregUF;
  end;

  TProduto = class
  strict private
    FValor      : Double;
    FDescricao  : String;
    FCodigo     : String;
    FQtdDef     : Double;
    FUnidade    : String;
    FEAN        : string;
    FEstoqueDisp: Double;
    Fbalanca    : Boolean;
    procedure Setbalanca(const Value: Boolean);
    procedure SetCodigo(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetValor(const Value: Double);
    function GetValor: String;
    procedure SetQtdDef(const Value: Double);
    function GetTotal: String;
    procedure SetUnidade(const Value: String);
    procedure SetEAN(const Value: string);
    function GetQuantidadeStr: String;
    procedure SetEstoqueDisp(const Value: Double);
    function GetEstoqueDispStr: String;
    function GetTemEstoqueDisp: Boolean;
    function GetTemEstoqueDispStr: String;
  public
    property EAN              : string read FEAN write SetEAN;
    property Codigo           : String read FCodigo write SetCodigo;
    property Descricao        : String read FDescricao write SetDescricao;
    property Unidade          : String read FUnidade write SetUnidade;
    property Valor            : Double read FValor write SetValor;
    property ValorStr         : String read GetValor;
    property TotalStr         : String read GetTotal;
    property Quantidade       : Double read FQtdDef write SetQtdDef;
    property QuantidadeStr    : String read GetQuantidadeStr;
    property EstoqueDisp      : Double read FEstoqueDisp write SetEstoqueDisp;
    property EstoqueDispStr   : String read GetEstoqueDispStr;
    property TemEstoqueDisp   : Boolean read GetTemEstoqueDisp;
    property TemEstoqueDispStr: String read GetTemEstoqueDispStr;
    property balanca          : Boolean read Fbalanca write Setbalanca;
  end;

type
  TPDVConnection = class
  strict private
    FGetQuery  : TFDQuery;
    FConnection: TFDConnection;
    procedure SetConnection(const Value: TFDConnection);
  public
    property Connection: TFDConnection read FConnection write SetConnection;
    property GetQuery  : TFDQuery read FGetQuery;
  end;

type
  TPDVClass = class
  private

    goem_codigo   : Integer;
    goMemProds    : TFDMemTable;
    goMemFormasPag: TFDMemTable;
    goMemUsers    : TFDMemTable;
    procedure doFillProds;
    procedure doFillUsers;
    procedure doFillFormasPag;
  public
    goPDVConnection: TPDVConnection;
    function GetFormaPag(afp_codigo: Integer): TFormaPag;
    function GetCaixa(aPterm_id: String): TCaixa;
    function GetCaixaOperador(aPcx_id: Integer): TCaixaOperador;
    function GetTerminal(aSerialHD: String): TTerminal;
    function GetProd(aQtd: Double; aCodigo: String): TProduto;
    function GetProdLive(aQtd: Double; aCodigo: String): TProduto;
    function GetTotaisNF(aPnf_id: Integer): TNF;
    function GetNF(aPterm_id: String; aPnf_id: Integer): TNF;
    function GetUser(aus_codigo: Integer): TUser;
    // function GetChaveRequisicao(cnpjempresa, cnpjoperadora: string): String;
    procedure Load(Aem_codigo: Integer; AConnection: TFDConnection);
    destructor Destroy; override;
  end;

implementation

{ TPDVConnection }

uses uFrmPDV_SAT, ufrmpdv;

procedure TPDVConnection.SetConnection(const Value: TFDConnection);
begin
  FConnection          := Value;
  FGetQuery            := TFDQuery.Create(nil);
  FGetQuery.Connection := Connection;
end;

{ TPDVClass }

procedure TPDVClass.Load(Aem_codigo: Integer; AConnection: TFDConnection);
begin
  goPDVConnection            := TPDVConnection.Create;
  goPDVConnection.Connection := AConnection;
  goem_codigo                := Aem_codigo;
  // doFillProds;
  doFillUsers;
  doFillFormasPag;
end;

function TPDVClass.GetTotaisNF(aPnf_id: Integer): TNF;
begin
  goPDVConnection.GetQuery.Open('SELECT pnf_numero_sessao,pnf_numero_fiscal,pnf_itens,pnf_volumes,pnf_total_prods,' +
    'pnf_total_nota,pnf_troco,pnfp_valor,pnf_desconto,pnf_outras_desp,pnf_total_tributos,pnf_id,pnf_icms,' +
    'pnf_icms_base FROM pdv.vw_nota_fiscal pnf WHERE pnf_id = ' + QuotedStr(IntToStr(aPnf_id)));
  if goPDVConnection.GetQuery.isEmpty then
  begin
    result := nil;
    exit;
  end;
  result               := TNF.Create;
  result.Itens         := goPDVConnection.GetQuery.FieldByName('pnf_itens').AsInteger;
  result.Volumes       := goPDVConnection.GetQuery.FieldByName('pnf_volumes').AsInteger;
  result.TotalProd     := goPDVConnection.GetQuery.FieldByName('pnf_total_prods').AsCurrency;
  result.TotalNF       := goPDVConnection.GetQuery.FieldByName('pnf_total_nota').AsCurrency;
  result.Troco         := goPDVConnection.GetQuery.FieldByName('pnf_troco').AsCurrency;
  result.TotalPago     := goPDVConnection.GetQuery.FieldByName('pnfp_valor').AsCurrency;
  result.Desconto      := goPDVConnection.GetQuery.FieldByName('pnf_desconto').AsCurrency;
  result.Acrescimo     := goPDVConnection.GetQuery.FieldByName('pnf_outras_desp').AsCurrency;
  result.TotalTributos := goPDVConnection.GetQuery.FieldByName('pnf_total_tributos').AsCurrency;
  result.ICMS          := goPDVConnection.GetQuery.FieldByName('pnf_icms').AsCurrency;
  result.ICMSBase      := goPDVConnection.GetQuery.FieldByName('pnf_icms_base').AsCurrency;
  result.IDNF          := goPDVConnection.GetQuery.FieldByName('pnf_id').AsInteger;
  result.IDSessao      := goPDVConnection.GetQuery.FieldByName('pnf_numero_sessao').AsInteger;
  result.NumeroFiscal  := goPDVConnection.GetQuery.FieldByName('pnf_numero_fiscal').AsInteger;
end;

function TPDVClass.GetNF(aPterm_id: String; aPnf_id: Integer): TNF;
var
  loNFItem: TNFItem;
  loNFPag : TNFPag;
begin
  if aPnf_id = 0 then
    goPDVConnection.GetQuery.Open('SELECT * FROM pdv.vw_nota_fiscal pnf WHERE em_codigo = ' + IntToStr(goem_codigo) +
      ' and pterm_id = ' + QuotedStr(aPterm_id) + ' and pnf_status = 1')
  else
    goPDVConnection.GetQuery.Open('SELECT * FROM pdv.vw_nota_fiscal pnf WHERE pnf_id = ' +
      QuotedStr(IntToStr(aPnf_id)));
  if goPDVConnection.GetQuery.isEmpty then
  begin
    result := nil;
    exit;
  end;
  result           := TNF.Create;
  result.Itens     := goPDVConnection.GetQuery.FieldByName('pnf_itens').AsInteger;
  result.Volumes   := goPDVConnection.GetQuery.FieldByName('pnf_volumes').AsInteger;
  result.TotalProd := goPDVConnection.GetQuery.FieldByName('pnf_total_prods').AsCurrency;
  result.TotalNF   := goPDVConnection.GetQuery.FieldByName('pnf_total_nota').AsCurrency;
  result.Troco     := goPDVConnection.GetQuery.FieldByName('pnf_troco').AsCurrency;
  result.TotalPago := goPDVConnection.GetQuery.FieldByName('pnfp_valor').AsCurrency;
  // result.Acrescimo     := 0;
  // result.Desconto      := 0;
  result.Acrescimo := goPDVConnection.GetQuery.FieldByName('pnf_outras_desp').AsCurrency;
  result.Desconto  := goPDVConnection.GetQuery.FieldByName('pnf_desconto').AsCurrency;
  // goPDVConnection.GetQuery.FieldByName('pnf_outras_desp').AsCurrency;
  result.TotalTributos := goPDVConnection.GetQuery.FieldByName('pnf_total_tributos').AsCurrency;
  result.Obs           := goPDVConnection.GetQuery.FieldByName('pnf_obs').Asstring;
  result.IDNF          := goPDVConnection.GetQuery.FieldByName('pnf_id').AsInteger;
  result.IDSessao      := goPDVConnection.GetQuery.FieldByName('pnf_numero_sessao').AsInteger;
  result.NumeroFiscal  := goPDVConnection.GetQuery.FieldByName('pnf_numero_fiscal').AsInteger;
  result.DestCNPJCPF   := goPDVConnection.GetQuery.FieldByName('pnf_cnpjcpf').Asstring;
  result.DestNome      := goPDVConnection.GetQuery.FieldByName('pnf_nome_cliente').Asstring;
  result.EntregLgr     := goPDVConnection.GetQuery.FieldByName('ed_logradouro').Asstring;
  result.EntregNro     := goPDVConnection.GetQuery.FieldByName('ed_numero').Asstring;
  result.EntregCpl     := goPDVConnection.GetQuery.FieldByName('ed_complemento').Asstring;
  result.EntregBairro  := goPDVConnection.GetQuery.FieldByName('br_descricao').Asstring;
  result.EntregMun     := goPDVConnection.GetQuery.FieldByName('cd_descricao').Asstring;
  result.EntregUF      := goPDVConnection.GetQuery.FieldByName('uf_id').Asstring;

  goPDVConnection.GetQuery.Open('SELECT * FROM pdv.vw_nota_fiscal_itens pnf WHERE pnfi_cancelado = 0 and pnf_id = ' +
    QuotedStr(IntToStr(result.IDNF)));
  if goPDVConnection.GetQuery.isEmpty then
  begin
    result.NFItens := nil;
    exit;
  end;
  result.NFItens := TObjectList<TNFItem>.Create();
  goPDVConnection.GetQuery.First;
  while not goPDVConnection.GetQuery.Eof do // MOSTRA OS ITENS NO PDV
  begin
    loNFItem                  := TNFItem.Create;
    loNFItem.ItemSeq          := goPDVConnection.GetQuery.FieldByName('ItemSeq').AsInteger;
    loNFItem.CodProd          := goPDVConnection.GetQuery.FieldByName('pr_codigo_fiscal').Asstring;
    loNFItem.EAN              := goPDVConnection.GetQuery.FieldByName('pu_ean').Asstring;
    loNFItem.NomeProd         := goPDVConnection.GetQuery.FieldByName('pr_descricao_fiscal').Asstring;
    loNFItem.NCM              := goPDVConnection.GetQuery.FieldByName('pnfi_ncm').Asstring;
    loNFItem.CFOP             := goPDVConnection.GetQuery.FieldByName('pnfi_cfop').Asstring;
    loNFItem.Unidade          := goPDVConnection.GetQuery.FieldByName('un_sigla').Asstring;
    loNFItem.Qtd              := goPDVConnection.GetQuery.FieldByName('pnfi_qtd').AsCurrency;
    loNFItem.VlrUnit          := goPDVConnection.GetQuery.FieldByName('pnfi_valor_unit').AsCurrency;
    loNFItem.VlrDesc          := goPDVConnection.GetQuery.FieldByName('pnfi_desconto').AsCurrency;
    loNFItem.VlrLei12741      := goPDVConnection.GetQuery.FieldByName('pnfi_total_tributos').AsCurrency;
    loNFItem.OrigemMercadoria := goPDVConnection.GetQuery.FieldByName('pnfi_origem_trib').AsInteger;

    loNFItem.CSTICMS  := goPDVConnection.GetQuery.FieldByName('stb_codigo').Asstring;
    loNFItem.CSTCSOSN := goPDVConnection.GetQuery.FieldByName('stb_codigo_sn').Asstring;
    loNFItem.ICMSAliq := goPDVConnection.GetQuery.FieldByName('pnfi_icms_aliq').AsCurrency;

    loNFItem.CSTPis  := goPDVConnection.GetQuery.FieldByName('stb_codigo_pis').Asstring;
    loNFItem.BCPis   := goPDVConnection.GetQuery.FieldByName('pnfi_pis_base').AsCurrency;
    loNFItem.PisAliq := goPDVConnection.GetQuery.FieldByName('pnfi_pis_aliq').AsCurrency;
    loNFItem.Pis     := goPDVConnection.GetQuery.FieldByName('pnfi_pis').AsCurrency;

    loNFItem.CSTCofins  := goPDVConnection.GetQuery.FieldByName('stb_codigo_cofins').Asstring;
    loNFItem.BCCofins   := goPDVConnection.GetQuery.FieldByName('pnfi_cofins_base').AsCurrency;
    loNFItem.CofinsAliq := goPDVConnection.GetQuery.FieldByName('pnfi_cofins_aliq').AsCurrency;
    loNFItem.Cofins     := goPDVConnection.GetQuery.FieldByName('pnfi_cofins').AsCurrency;

    loNFItem.Obs := '';
    result.NFItens.Add(loNFItem);
    goPDVConnection.GetQuery.Next;
  end;
  goPDVConnection.GetQuery.Open('SELECT * FROM pdv.vw_nota_fiscal_pag pnf WHERE pnf_id = ' +
    QuotedStr(IntToStr(result.IDNF)));
  if goPDVConnection.GetQuery.isEmpty then
  begin
    result.NFPags := nil;
    exit;
  end;

  result.NFPags := TObjectList<TNFPag>.Create();
  goPDVConnection.GetQuery.First;
  while not goPDVConnection.GetQuery.Eof do
  begin
    loNFPag             := TNFPag.Create;
    loNFPag.Pnfp_id     := goPDVConnection.GetQuery.FieldByName('Pnfp_id').AsInteger;
    loNFPag.cMPDescr    := goPDVConnection.GetQuery.FieldByName('fp_descricao').Asstring;
    loNFPag.cMP         := goPDVConnection.GetQuery.FieldByName('fp_indice_pdv').Asstring;
    loNFPag.vMP         := goPDVConnection.GetQuery.FieldByName('pnfp_valor').AsCurrency;
    loNFPag.AbrirGaveta := goPDVConnection.GetQuery.FieldByName('fp_gaveta').AsBoolean;
    result.NFPags.Add(loNFPag);
    goPDVConnection.GetQuery.Next;
  end;
end;

procedure TPDVClass.doFillFormasPag;
begin
  if not Assigned(goMemFormasPag) then
    goMemFormasPag := TFDMemTable.Create(nil);

  goPDVConnection.GetQuery.Open
    ('SELECT fp_codigo,fp_descricao,fp_cartao,fp_dinheiro,fp_nota_promissoria,fp_gaveta FROM t_formaspag WHERE fp_pdv = 1');
  if goMemFormasPag.Active then
    goMemFormasPag.EmptyDataSet;
  goMemFormasPag.Close;
  goMemFormasPag.Data := goPDVConnection.GetQuery.Data;
end;

function TPDVClass.GetFormaPag(afp_codigo: Integer): TFormaPag;
begin
  if not goMemFormasPag.Locate('fp_codigo', afp_codigo, [loCaseInsensitive]) then
  begin
    result := nil;
    exit;
  end;
  result                     := TFormaPag.Create;
  result.fp_codigo           := goMemFormasPag.FieldByName('fp_codigo').AsInteger;
  result.fp_descricao        := goMemFormasPag.FieldByName('fp_descricao').Asstring;
  result.fp_cartao           := (goMemFormasPag.FieldByName('fp_cartao').AsInteger = 1);
  result.fp_dinheiro         := (goMemFormasPag.FieldByName('fp_dinheiro').AsInteger = 1);
  result.fp_nota_promissoria := (goMemFormasPag.FieldByName('fp_nota_promissoria').AsInteger = 1);
  result.fp_gaveta           := goMemFormasPag.FieldByName('fp_gaveta').AsBoolean;
end;

function TPDVClass.GetUser(aus_codigo: Integer): TUser;
begin
  result := nil;
  if not goMemUsers.Locate('us_codigo', aus_codigo, [loCaseInsensitive]) then
    exit;
  // if (goMemUsers.FieldByName('us_operador').AsBoolean and ((tuOperador in aTipoUser))) or (goMemUsers.FieldByName('us_supervisor').AsBoolean and ((tuSupervisor in aTipoUser))) then
  begin
    result            := TUser.Create;
    result.us_codigo  := goMemUsers.FieldByName('us_codigo').AsInteger;
    result.us_apelido := goMemUsers.FieldByName('us_apelido').Asstring;
    result.us_nome    := goMemUsers.FieldByName('us_nome').Asstring;
    result.us_senha   := goMemUsers.FieldByName('us_senha').Asstring;
  end;
end;

destructor TPDVClass.Destroy;
begin
  if Assigned(goMemUsers) then
    goMemUsers.Destroy;

  if Assigned(goMemProds) then
    goMemProds.Destroy;

  if Assigned(goMemFormasPag) then
    goMemFormasPag.Destroy;

  if Assigned(goPDVConnection) then
    if Assigned(goPDVConnection.GetQuery) then
      goPDVConnection.GetQuery.Destroy;

  if Assigned(goPDVConnection) then
    goPDVConnection.Destroy;

  inherited;
end;

procedure TPDVClass.doFillProds;
begin
  if not Assigned(goMemProds) then
    goMemProds := TFDMemTable.Create(nil);

  goPDVConnection.GetQuery.Open
    ('select a.pr_codigo,a.pr_descricao,b.pr_un_sigla,pr_venda,b.pr_codigo_barras from t_produtos a inner join t_produtos_detalhes b on a.pr_codigo =b.pr_codigo where b.em_codigo = '
    + IntToStr(goem_codigo));
  if goMemProds.Active then
    goMemProds.EmptyDataSet;
  goMemProds.Close;
  goMemProds.Data := goPDVConnection.GetQuery.Data;
end;

procedure TPDVClass.doFillUsers;
begin
  if not Assigned(goMemUsers) then
    goMemUsers := TFDMemTable.Create(nil);

  goPDVConnection.GetQuery.Open
    ('SELECT a.us_codigo,us_apelido,us_nome,us_senha,cast((case when dbo.GetParamUser(61,a.us_codigo) = 1 then 1 else 0 end) as bit) as us_operador,cast((case when dbo.GetParamUser(72,a.us_codigo) = 1 then 1 else 0 end) as bit) as us_supervisor '
    + 'FROM dbo.t_users a INNER JOIN dbo.t_users_empresas b ON b.us_codigo = a.us_codigo WHERE a.us_ativo=1 and b.em_codigo = '
    + IntToStr(goem_codigo));
  if goMemUsers.Active then
    goMemUsers.EmptyDataSet;
  goMemUsers.Close;
  goMemUsers.Data := goPDVConnection.GetQuery.Data;
end;

function TPDVClass.GetCaixa(aPterm_id: String): TCaixa;
begin
  goPDVConnection.GetQuery.Open
    ('select pcx_id,pcx_data_abertura,pcx_saldo_inicial,pcx_saldo_atual from pdv.tb_caixa where em_codigo = ' +
    IntToStr(goem_codigo) + ' and pterm_id = ' + QuotedStr(aPterm_id) + ' and pcx_fechado = 0');
  if goPDVConnection.GetQuery.isEmpty then
  begin
    result := nil;
    exit;
  end;
  result                   := TCaixa.Create;
  result.pcx_id            := goPDVConnection.GetQuery.FieldByName('pcx_id').AsInteger;
  result.pcx_data_abertura := goPDVConnection.GetQuery.FieldByName('pcx_data_abertura').AsDateTime;
  result.pcx_saldo_inicial := goPDVConnection.GetQuery.FieldByName('pcx_saldo_inicial').AsCurrency;
  result.pcx_saldo_atual   := goPDVConnection.GetQuery.FieldByName('pcx_saldo_atual').AsCurrency;
end;

function TPDVClass.GetCaixaOperador(aPcx_id: Integer): TCaixaOperador;
begin
  goPDVConnection.GetQuery.Open
    ('select pcx_id,pcxo_id,pcxo_data_abertura,pcxo_saldo_inicial,pcxo_saldo_final,us_codigo,(select x.us_apelido from t_users x  where x.us_codigo = a.us_codigo) as us_apelido from pdv.tb_caixa_operador a where pcx_id = '
    + QuotedStr(IntToStr(aPcx_id)) + ' and pcxo_fechado = 0 and pcxo_autorizado = 1');
  if goPDVConnection.GetQuery.isEmpty then
  begin
    result := nil;
    exit;
  end;
  result                    := TCaixaOperador.Create;
  result.pcx_id             := goPDVConnection.GetQuery.FieldByName('pcx_id').AsInteger;
  result.pcxo_id            := goPDVConnection.GetQuery.FieldByName('pcxo_id').AsInteger;
  result.pcxo_data_abertura := goPDVConnection.GetQuery.FieldByName('pcxo_data_abertura').AsDateTime;
  result.pcxo_saldo_inicial := goPDVConnection.GetQuery.FieldByName('pcxo_saldo_inicial').AsCurrency;
  result.pcxo_saldo_final   := goPDVConnection.GetQuery.FieldByName('pcxo_saldo_final').AsCurrency;
  result.us_codigo          := goPDVConnection.GetQuery.FieldByName('us_codigo').AsInteger;
  result.us_apelido         := goPDVConnection.GetQuery.FieldByName('us_apelido').Asstring;
end;

// *****************
// PESQUIDA O PRODUTO NA TELA
// -*******************
function TPDVClass.GetProd(aQtd: Double; aCodigo: String): TProduto;
begin
  if aQtd <= 0 then
    aQtd := 1;
  {
    if Length(aCodigo) <= 7 then
    begin

    with FrmPDV.a1 do
    begin
    close;
    sql.Clear;
    SQL.Add('select PR_CODIGO,CP_QTD,pr_ligacao from basei9..produtos_composicao where altestoque='+QuotedStr('S')+
    ' and PR_CODIGO = '+aCodigo);
    Open;
    end;
    if FrmPDV.a1.RecordCount>0 then
    begin
    if aQtd <= 0 then aQtd :=FrmPDV.a1.FieldByName('CP_QTD').value else
    aQtd := aQtd * FrmPDV.a1.FieldByName('CP_QTD').value;
    end;


    //  goPDVConnection.GetQuery.Open(' SELECT * FROM V_PDVPESQUISAPRO WHERE codigo = '+QuotedStr(aCodigo));

    if goPDVConnection.GetQuery.isEmpty then
    begin
    result := nil;
    exit;
    end;
    end; }
  // Clipboard.AsText:='SELECT * FROM V_PDVPESQUISAPRO WHERE codigo = '+QuotedStr(aCodigo) +' or  pu_ean = '+QuotedStr(aCodigo);
  goPDVConnection.GetQuery.Open('SELECT * FROM V_PDVPESQUISAPRO WHERE codigo = ' + aCodigo + ' or  pu_ean = ' +
    QuotedStr(aCodigo));
  // showmessage('verifica');
  if goPDVConnection.GetQuery.RecordCount > 0 then
  begin
    with FrmPDV.a1 do
    begin
      Close;
      sql.Clear;
      sql.Add('select PR_CODIGO,CP_QTD,pr_ligacao from basei9..produtos_composicao where altestoque=' + QuotedStr('S') +
        ' and PR_CODIGO = ' + goPDVConnection.GetQuery.FieldByName('codigo').Asstring);
      Open;
    end;
    if FrmPDV.a1.RecordCount > 0 then
    begin
      if aQtd <= 0 then
        aQtd := FrmPDV.a1.FieldByName('CP_QTD').Value
      else
        aQtd := aQtd * FrmPDV.a1.FieldByName('CP_QTD').Value;
    end;
  end;

  if goPDVConnection.GetQuery.isEmpty then
  begin
    result := nil;
    exit;
  end;

  // if not goPDVConnection.GetQuery.Locate('pr_codigo_barras', aCodigo, [loCaseInsensitive]) then
  // begin
  // if not goPDVConnection.GetQuery.Locate('pr_codigo', aCodigo, [loCaseInsensitive]) then
  // begin
  // result := nil;
  // exit;
  // end;
  // end;
  result           := TProduto.Create;
  result.EAN       := goPDVConnection.GetQuery.FieldByName('pu_ean').Asstring;
  result.Codigo    := goPDVConnection.GetQuery.FieldByName('pr_codigo').Asstring;
  result.Descricao := goPDVConnection.GetQuery.FieldByName('pr_descricao').Asstring;
  result.Unidade   := goPDVConnection.GetQuery.FieldByName('un_sigla').Asstring;
  // ShowMessage('segunda qtd '+ FloatToStr(aQtd)+'  Quantidade ');
  if aQtd > 0 then
    result.Quantidade := aQtd
  else
    result.Quantidade := aQtd;
  result.Valor        := goPDVConnection.GetQuery.FieldByName('pr_venda').AsCurrency;
  result.balanca      := goPDVConnection.GetQuery.FieldByName('pr_balanca').AsBoolean;
end;

function TPDVClass.GetProdLive(aQtd: Double; aCodigo: String): TProduto;
begin
  // ShowMessage('passandodo aqui');
  goPDVConnection.GetQuery.Open
    ('select a.pr_codigo,a.pr_descricao,b.pr_un_sigla,pr_venda,b.pr_balanca,b.pr_codigo_barras,dbo.GetSaldoEstoqDisp(b.em_codigo,a.pr_codigo) as EstoqueDisp from t_produtos a inner join t_produtos_detalhes b on a.pr_codigo =b.pr_codigo where b.em_codigo = '
    + IntToStr(goem_codigo) + ' and ((b.pr_codigo_barras = ' + QuotedStr(aCodigo) + ') or (b.pr_codigo = ' +
    QuotedStr(aCodigo) + '))');
  if goPDVConnection.GetQuery.isEmpty then
  begin
    result := nil;
    exit;
  end;

  result             := TProduto.Create;
  result.EAN         := goPDVConnection.GetQuery.FieldByName('pr_codigo_barras').Asstring;
  result.Codigo      := goPDVConnection.GetQuery.FieldByName('pr_codigo').Asstring;
  result.Descricao   := goPDVConnection.GetQuery.FieldByName('pr_descricao').Asstring;
  result.Unidade     := goPDVConnection.GetQuery.FieldByName('pr_un_sigla').Asstring;
  result.EstoqueDisp := goPDVConnection.GetQuery.FieldByName('EstoqueDisp').AsCurrency;
  if aQtd > 0 then
    result.Quantidade := aQtd
  else
    result.Quantidade := 1;
  result.Valor        := goPDVConnection.GetQuery.FieldByName('pr_venda').AsCurrency;
  result.balanca      := goPDVConnection.GetQuery.FieldByName('pr_balanca').AsBoolean;
end;

{ TProduto }

procedure TProduto.Setbalanca(const Value: Boolean);
begin
  Fbalanca := Value;
end;

procedure TProduto.SetCodigo(const Value: String);
begin
  FCodigo := Value;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetEAN(const Value: string);
begin
  FEAN := Value;
end;

procedure TProduto.SetEstoqueDisp(const Value: Double);
begin
  FEstoqueDisp := Value;
end;

procedure TProduto.SetQtdDef(const Value: Double);
begin
  FQtdDef := Value;
end;

procedure TProduto.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

procedure TProduto.SetValor(const Value: Double);
begin
  FValor := Value;
end;

function TProduto.GetQuantidadeStr: String;
begin
  result := FormatCurr('#,###0.000', Quantidade);
end;

function TProduto.GetValor: String;
begin
  result := FormatCurr('#,##0.00', Valor);
end;

function TProduto.GetTotal: String;
begin
  result := FormatCurr('#,##0.00', Valor * Quantidade);
end;

function TProduto.GetEstoqueDispStr: String;
begin
  result := FormatCurr('#,##0.00', EstoqueDisp);
end;

function TProduto.GetTemEstoqueDisp: Boolean;
begin
  result := EstoqueDisp > 0;
end;

function TProduto.GetTemEstoqueDispStr: String;
begin
  if EstoqueDisp > 0 then
    result := 'SIM'
  else
    result := 'NÃO';
end;

{ TNF }

procedure TNF.SetAcrescimo(const Value: Double);
begin
  FAcrescimo := Value;
end;

procedure TNF.SetDesconto(const Value: Double);
begin
  FDesconto := Value;
end;

procedure TNF.SetDestCNPJCPF(const Value: String);
begin
  FDestCNPJCPF := Value;
end;

procedure TNF.SetDestNome(const Value: String);
begin
  FDestNome := Value;
end;

procedure TNF.SetEntregBairro(const Value: String);
begin
  FEntregBairro := Value;
end;

procedure TNF.SetEntregCpl(const Value: String);
begin
  FEntregCpl := Value;
end;

procedure TNF.SetEntregLgr(const Value: String);
begin
  FEntregLgr := Value;
end;

procedure TNF.SetEntregMun(const Value: String);
begin
  FEntregMun := Value;
end;

procedure TNF.SetEntregNro(const Value: String);
begin
  FEntregNro := Value;
end;

procedure TNF.SetEntregUF(const Value: String);
begin
  FEntregUF := Value;
end;

procedure TNF.SetICMS(const Value: Double);
begin
  FICMS := Value;
end;

procedure TNF.SetICMSBase(const Value: Double);
begin
  FICMSBase := Value;
end;

procedure TNF.SetIDNF(const Value: Integer);
begin
  FIDNF := Value;
end;

procedure TNF.SetIDSessao(const Value: Integer);
begin
  FIDSessao := Value;
end;

procedure TNF.SetItens(const Value: Integer);
begin
  FItens := Value;
end;

procedure TNF.SetNFItens(const Value: TObjectList<TNFItem>);
begin
  FNFItens := Value;
end;

procedure TNF.SetNFPags(const Value: TObjectList<TNFPag>);
begin
  FNFPags := Value;
end;

procedure TNF.SetNumeroFiscal(const Value: Integer);
begin
  FNumeroFiscal := Value;
end;

procedure TNF.SetObs(const Value: String);
begin
  FObs := Value;
end;

procedure TNF.SetTotalNF(const Value: Double);
begin
  FTotalNF := Value;
end;

procedure TNF.SetTotalPago(const Value: Double);
begin
  FTotalPago := Value;
end;

procedure TNF.SetTotalProd(const Value: Double);
begin
  FTotalProd := Value;
end;

procedure TNF.SetTotalTributos(const Value: Double);
begin
  FTotalTributos := Value;
end;

procedure TNF.SetTroco(const Value: Double);
begin
  FTroco := Value;
end;

procedure TNF.SetVolumes(const Value: Integer);
begin
  FVolumes := Value;
end;

function TNF.GetTotalProdStr: String;
begin
  result := FormatCurr('R$ #,##0.00', TotalProd);
end;

function TNF.GetTotalNFStr: String;
begin
  result := FormatCurr('R$ #,##0.00', TotalNF);
end;

function TNF.GetTotalPagoStr: String;
begin
  result := FormatCurr('R$ #,##0.00', TotalPago);
end;

function TNF.GetDescontoStr: String;
begin
  result := FormatCurr('R$ #,##0.00', Desconto);
end;

function TNF.GetAcrescimoPlusStr: string;
begin
  result := '+' + FormatCurr('R$ #,##0.00', Acrescimo);
end;

function TNF.GetDescAcresStr: string;
begin
  if Desconto > 0 then
    result := GetDescontoMinusStr
  else if Acrescimo > 0 then
    result := GetAcrescimoPlusStr;

end;

function TNF.GetDescontoMinusStr: String;
begin
  result := FormatCurr('R$ #,##0.00', -Desconto);
end;

function TNF.GetTotalAPagar: Double;
var
  loRestante: Double;
begin
  loRestante := (TotalNF - TotalPago);

  result := 0;
  if loRestante > 0 then
    result := loRestante;
end;

function TNF.GetTotalAPagarStr: String;
begin
  result := FormatCurr('R$ #,##0.00', GetTotalAPagar);
end;

function TNF.GetTrocoStr: String;
begin
  result := FormatCurr('R$ #,##0.00', Troco);
end;

destructor TNF.Destroy;
begin
  if Assigned(NFItens) then
    NFItens.Destroy;
  if Assigned(NFPags) then
    NFPags.Destroy;
  inherited;
end;

function TNF.doSATPrepareCFe: Boolean;
var
  I            : Integer;
  loAbrirGaveta: Boolean;
begin
  if FrmPDV_SAT = nil then
    exit;

  loAbrirGaveta := false;
  for I         := 0 to NFPags.Count - 1 do
    if NFPags.Items[I].AbrirGaveta then
      loAbrirGaveta := true;

  FrmPDV_SAT.doSetHeaderCFe(NumeroFiscal, //
    IDSessao,                             //
    DestCNPJCPF,                          //
    DestNome,                             //
    EntregLgr,                            //
    EntregNro,                            //
    EntregCpl,                            //
    EntregBairro,                         //
    EntregMun,                            //
    EntregUF,                             //
    Desconto,                             //
    Acrescimo,                            //
    TotalTributos,                        //
    Obs,                                  //
    loAbrirGaveta);

  for I := 0 to NFItens.Count - 1 do
  begin
    with NFItens.Items[I] do
    begin
      FrmPDV_SAT.doSetDetailCFe(CodProd, //
        EAN,                             //
        NomeProd,                        //
        NCM,                             //
        CFOP,                            //
        Unidade,                         //
        Qtd,                             //
        VlrUnit,                         //
        VlrDesc,                         //
        VlrLei12741,                     //
        OrigemMercadoria,                //
        CSTPis,                          //
        CSTCofins,                       //
        CSTCSOSN,                        //
        CSTICMS,                         //
        ICMSAliq,                        //
        ICMS,                            //
        BCPis,                           //
        PisAliq,                         //
        Pis,                             //
        BCCofins,                        //
        CofinsAliq,                      //
        Cofins,                          //
        Obs);
    end;
  end;
  for I := 0 to NFPags.Count - 1 do
    with NFPags.Items[I] do
      FrmPDV_SAT.doSetPaysCFe(cMP, vMP);

  result := true;
end;

{ TTerminal }

procedure TTerminal.Setpterm_sat_assinatura(const Value: String);
begin
  Fpterm_sat_assinatura := Value;
end;

procedure TTerminal.Setpterm_pos_chave_requisicao(const Value: string);
begin
  Fpterm_pos_chave_requisicao := Value;
end;

procedure TTerminal.Setpterm_pos_chave_validador(const Value: string);
begin
  Fpterm_pos_chave_validador := Value;
end;

procedure TTerminal.Setpterm_sat_codigo_ativacao(const Value: String);
begin
  Fpterm_sat_codigo_ativacao := Value;
end;

procedure TTerminal.Setbalanca(const Value: TBalanca);
begin
  Fbalanca := Value;
end;

procedure TTerminal.Setimpressora(const Value: TImpressora);
begin
  Fimpressora := Value;
end;

procedure TTerminal.Setpbal_id(const Value: Integer);
begin
  Fpbal_id := Value;
end;

procedure TTerminal.Setpimp_id(const Value: Integer);
begin
  Fpimp_id := Value;
end;

procedure TTerminal.Setpterm_descricao(const Value: String);
begin
  Fpterm_descricao := Value;
end;

procedure TTerminal.Setpterm_id(const Value: String);
begin
  Fpterm_id := Value;
end;

procedure TTerminal.Setpterm_last_sync(const Value: TDateTime);
begin
  Fpterm_last_sync := Value;
end;

procedure TTerminal.Setpterm_nfce(const Value: Boolean);
begin
  Fpterm_nfce := Value;
end;

procedure TTerminal.Setpterm_nfce_offline(const Value: Boolean);
begin
  Fpterm_nfce_offline := Value;
end;

procedure TTerminal.Setpterm_numero(const Value: Integer);
begin
  Fpterm_numero := Value;
end;

procedure TTerminal.Setpterm_pos(const Value: Boolean);
begin
  Fpterm_pos := Value;
end;

procedure TTerminal.Setpterm_sat(const Value: Boolean);
begin
  Fpterm_sat := Value;
end;

procedure TTerminal.Setpterm_sat_input(const Value: String);
begin
  Fpterm_sat_input := Value;
end;

procedure TTerminal.Setpterm_sat_output(const Value: String);
begin
  Fpterm_sat_output := Value;
end;

procedure TTerminal.Setpterm_sat_timeout(const Value: Integer);
begin
  Fpterm_sat_timeout := Value;
end;

procedure TTerminal.Setpterm_serie_fiscal(const Value: Integer);
begin
  Fpterm_serie_fiscal := Value;
end;

procedure TTerminal.Setpterm_sh_cliente_cnpj(const Value: string);
begin
  Fpterm_sh_cliente_cnpj := Value;
end;

procedure TTerminal.Setpterm_sh_cliente_nome(const Value: string);
begin
  Fpterm_sh_cliente_nome := Value;
end;

procedure TTerminal.Setpterm_sh_cnpj(const Value: string);
begin
  Fpterm_sh_cnpj := Value;
end;

procedure TTerminal.Setpterm_sh_nome_aplicacao(const Value: string);
begin
  Fpterm_sh_nome_aplicacao := Value;
end;

procedure TTerminal.Setpterm_sh_nome_soft_house(const Value: string);
begin
  Fpterm_sh_nome_soft_house := Value;
end;

procedure TTerminal.Setpterm_sh_versao_aplicacao(const Value: string);
begin
  Fpterm_sh_versao_aplicacao := Value;
end;

procedure TTerminal.Setpterm_tef(const Value: Boolean);
begin
  Fpterm_tef := Value;
end;

procedure TTerminal.Setpterm_tef_ambiente(const Value: string);
begin
  Fpterm_tef_ambiente := Value;
end;

procedure TTerminal.Setpterm_tef_mensagem_pinpad(const Value: string);
begin
  Fpterm_tef_mensagem_pinpad := Value;
end;

procedure TTerminal.Setpterm_tef_prestador(const Value: String);
begin
  Fpterm_tef_prestador := Value;
end;

procedure TTerminal.Setpterm_tef_qrcode(const Value: string);
begin
  Fpterm_tef_qrcode := Value;
end;

procedure TTerminal.Setpterm_tef_servidor(const Value: string);
begin
  Fpterm_tef_servidor := Value;
end;

procedure TTerminal.Setpterm_sat_versao_cfe(const Value: String);
begin
  Fpterm_sat_versao_cfe := Value;
end;

destructor TTerminal.Destroy;
begin
  if Assigned(impressora) then
    impressora.Destroy;
  if Assigned(balanca) then
    balanca.Destroy;
  inherited;
end;

function TTerminal.Getpterm_last_sync_str: String;
begin
  if FormatDateTime('dd/mm/yyyy', Fpterm_last_sync) = '30/12/1899' then
    result := 'Não realizado'
  else
    result := FormatDateTime('dd/mm/yyyy hh:nn:ss', Fpterm_last_sync);
end;

function TPDVClass.GetTerminal(aSerialHD: String): TTerminal;
begin
  goPDVConnection.GetQuery.Open('select * from pdv.v_terminais where em_codigo = ' + IntToStr(goem_codigo) +
    ' and pterm_serial_hd = ' + QuotedStr(aSerialHD));
  if goPDVConnection.GetQuery.isEmpty then
  begin
    result := nil;
    exit;
  end;
  result                            := TTerminal.Create;
  result.pterm_id                   := goPDVConnection.GetQuery.FieldByName('pterm_id').Asstring;
  result.pterm_numero               := goPDVConnection.GetQuery.FieldByName('pterm_numero').AsInteger;
  result.pterm_descricao            := goPDVConnection.GetQuery.FieldByName('pterm_descricao').Asstring;
  result.pterm_serie_fiscal         := goPDVConnection.GetQuery.FieldByName('pterm_serie_fiscal').AsInteger;
  result.pterm_sat                  := goPDVConnection.GetQuery.FieldByName('pterm_sat').AsBoolean;
  result.pterm_nfce                 := goPDVConnection.GetQuery.FieldByName('pterm_nfce').AsBoolean;
  result.pterm_nfce_offline         := goPDVConnection.GetQuery.FieldByName('pterm_nfce_offline').AsBoolean;
  result.pterm_sat_assinatura       := goPDVConnection.GetQuery.FieldByName('pterm_sat_assinatura').Asstring;
  result.pterm_sat_codigo_ativacao  := goPDVConnection.GetQuery.FieldByName('pterm_sat_codigo_ativacao').Asstring;
  result.pterm_sat_versao_cfe       := goPDVConnection.GetQuery.FieldByName('pterm_sat_versao_cfe').Asstring;
  result.pterm_sat_timeout          := goPDVConnection.GetQuery.FieldByName('pterm_sat_timeout').AsInteger;
  result.pterm_sat_output           := goPDVConnection.GetQuery.FieldByName('pterm_sat_output').Asstring;
  result.pterm_sat_input            := goPDVConnection.GetQuery.FieldByName('pterm_sat_input').Asstring;
  result.pterm_pos_chave_validador  := goPDVConnection.GetQuery.FieldByName('pterm_pos_chave_validador').Asstring;
  result.pterm_pos_chave_requisicao := goPDVConnection.GetQuery.FieldByName('pterm_pos_chave_requisicao').Asstring;
  result.pterm_tef                  := goPDVConnection.GetQuery.FieldByName('pterm_tef').AsBoolean;
  result.pterm_pos                  := goPDVConnection.GetQuery.FieldByName('pterm_pos').AsBoolean;
  result.pimp_id                    := goPDVConnection.GetQuery.FieldByName('pimp_id').AsInteger;
  result.pbal_id                    := goPDVConnection.GetQuery.FieldByName('pbal_id').AsInteger;
  result.pterm_last_sync            := goPDVConnection.GetQuery.FieldByName('pterm_last_sync').AsDateTime;
  { TEF }
  result.pterm_tef_prestador       := goPDVConnection.GetQuery.FieldByName('pterm_tef_prestador').Asstring;
  result.pterm_tef_ambiente        := goPDVConnection.GetQuery.FieldByName('pterm_tef_ambiente').Asstring;
  result.pterm_tef_mensagem_pinpad := goPDVConnection.GetQuery.FieldByName('pterm_tef_mensagem_pinpad').Asstring;
  result.pterm_tef_servidor        := goPDVConnection.GetQuery.FieldByName('pterm_tef_servidor').Asstring;
  result.pterm_tef_qrcode          := goPDVConnection.GetQuery.FieldByName('pterm_tef_qrcode').Asstring;
  { soft_house }
  result.sh_nome_soft_house  := goPDVConnection.GetQuery.FieldByName('sh_nome_soft_house').Asstring;
  result.sh_cnpj             := goPDVConnection.GetQuery.FieldByName('sh_cnpj').Asstring;
  result.sh_nome_aplicacao   := goPDVConnection.GetQuery.FieldByName('sh_nome_aplicacao').Asstring;
  result.sh_versao_aplicacao := goPDVConnection.GetQuery.FieldByName('sh_versao_aplicacao').Asstring;
  // estabelecimento
  result.sh_cliente_nome := goPDVConnection.GetQuery.FieldByName('sh_cliente_nome').Asstring;
  result.sh_cliente_cnpj := goPDVConnection.GetQuery.FieldByName('sh_cliente_cnpj').Asstring;

  goPDVConnection.GetQuery.Open('select * from pdv.tb_impressoras where pimp_id = ' + IntToStr(result.pimp_id));
  if not goPDVConnection.GetQuery.isEmpty then
  begin
    result.impressora                 := TImpressora.Create;
    result.impressora.pimp_descricao  := goPDVConnection.GetQuery.FieldByName('pimp_descricao').Asstring;
    result.impressora.pimp_modelo     := goPDVConnection.GetQuery.FieldByName('pimp_modelo').AsInteger;
    result.impressora.pimp_port       := goPDVConnection.GetQuery.FieldByName('pimp_port').Asstring;
    result.impressora.pimp_baud       := goPDVConnection.GetQuery.FieldByName('pimp_baud').AsInteger;
    result.impressora.pimp_data       := goPDVConnection.GetQuery.FieldByName('pimp_data').AsInteger;
    result.impressora.pimp_parity     := goPDVConnection.GetQuery.FieldByName('pimp_parity').AsInteger;
    result.impressora.pimp_stop       := goPDVConnection.GetQuery.FieldByName('pimp_stop').AsInteger;
    result.impressora.pimp_handshake  := goPDVConnection.GetQuery.FieldByName('pimp_handshake').AsInteger;
    result.impressora.pimp_hardflow   := goPDVConnection.GetQuery.FieldByName('pimp_hardflow').AsBoolean;
    result.impressora.pimp_softflow   := goPDVConnection.GetQuery.FieldByName('pimp_softflow').AsBoolean;
    result.impressora.pimp_impressora := goPDVConnection.GetQuery.FieldByName('pimp_impressora').Asstring;

    result.impressora.pimp_linhas  := goPDVConnection.GetQuery.FieldByName('pimp_linhas').AsInteger;
    result.impressora.pimp_colunas := goPDVConnection.GetQuery.FieldByName('pimp_colunas').AsInteger;
    result.impressora.pimp_espacos := goPDVConnection.GetQuery.FieldByName('pimp_espacos').AsInteger;
  end;

  goPDVConnection.GetQuery.Open('select * from pdv.tb_balancas where pbal_id = ' + IntToStr(result.pbal_id));
  if not goPDVConnection.GetQuery.isEmpty then
  begin
    result.balanca                := TBalanca.Create;
    result.balanca.pbal_descricao := goPDVConnection.GetQuery.FieldByName('pbal_descricao').Asstring;
    result.balanca.pbal_modelo    := goPDVConnection.GetQuery.FieldByName('pbal_modelo').AsInteger;
    result.balanca.pbal_port      := goPDVConnection.GetQuery.FieldByName('pbal_port').Asstring;
    result.balanca.pbal_baud      := goPDVConnection.GetQuery.FieldByName('pbal_baud').AsInteger;
    result.balanca.pbal_data      := goPDVConnection.GetQuery.FieldByName('pbal_data').AsInteger;
    result.balanca.pbal_parity    := goPDVConnection.GetQuery.FieldByName('pbal_parity').AsInteger;
    result.balanca.pbal_stop      := goPDVConnection.GetQuery.FieldByName('pbal_stop').AsInteger;
    result.balanca.pbal_handshake := goPDVConnection.GetQuery.FieldByName('pbal_handshake').AsInteger;
  end;

end;

{ TCaixa }

procedure TCaixa.Setpcx_data_abertura(const Value: TDateTime);
begin
  Fpcx_data_abertura := Value;
end;

function TCaixa.GetPcx_data_abertura_str: String;
begin
  result := FormatDateTime('dd/mm/yyyy hh:nn:ss', Fpcx_data_abertura);
end;

procedure TCaixa.Setpcx_id(const Value: Integer);
begin
  Fpcx_id := Value;
end;

procedure TCaixa.Setpcx_saldo_atual(const Value: Double);
begin
  Fpcx_saldo_atual := Value;
end;

procedure TCaixa.Setpcx_saldo_inicial(const Value: Double);
begin
  Fpcx_saldo_inicial := Value;
end;

{ TUser }

procedure TUser.Setus_apelido(const Value: string);
begin
  Fus_apelido := Value;
end;

procedure TUser.Setus_codigo(const Value: Integer);
begin
  Fus_codigo := Value;
end;

procedure TUser.Setus_nome(const Value: string);
begin
  Fus_nome := Value;
end;

procedure TUser.Setus_senha(const Value: string);
begin
  Fus_senha := Value;
end;

{ TFormaPag }

procedure TFormaPag.Setfp_cartao(const Value: Boolean);
begin
  Ffp_cartao := Value;
end;

procedure TFormaPag.Setfp_codigo(const Value: Integer);
begin
  Ffp_codigo := Value;
end;

procedure TFormaPag.Setfp_descricao(const Value: string);
begin
  Ffp_descricao := Value;
end;

procedure TFormaPag.Setfp_dinheiro(const Value: Boolean);
begin
  Ffp_dinheiro := Value;
end;

procedure TFormaPag.Setfp_gaveta(const Value: Boolean);
begin
  Ffp_gaveta := Value;
end;

procedure TFormaPag.Setfp_nota_promissoria(const Value: Boolean);
begin
  Ffp_nota_promissoria := Value;
end;

{ TCaixaOperador }

function TCaixaOperador.GetPcxo_data_abertura_str: String;
begin
  result := FormatDateTime('dd/mm/yyyy', Fpcxo_data_abertura);
end;

procedure TCaixaOperador.Setpcxo_data_abertura(const Value: TDateTime);
begin
  Fpcxo_data_abertura := Value;
end;

procedure TCaixaOperador.Setpcxo_id(const Value: Integer);
begin
  Fpcxo_id := Value;
end;

procedure TCaixaOperador.Setpcxo_saldo_final(const Value: Double);
begin
  Fpcxo_saldo_final := Value;
end;

procedure TCaixaOperador.Setpcxo_saldo_inicial(const Value: Double);
begin
  Fpcxo_saldo_inicial := Value;
end;

procedure TCaixaOperador.Setpcx_id(const Value: Integer);
begin
  Fpcx_id := Value;
end;

procedure TCaixaOperador.Setus_codigo(const Value: Integer);
begin
  Fus_codigo := Value;
end;

procedure TCaixaOperador.Setus_apelido(const Value: string);
begin
  Fus_apelido := Value;
end;

{ TNFItens }

function TNFItem.GetQtdStr: String;
begin
  result := FormatCurr('#,###0.000', Qtd);
end;

function TNFItem.GetVlrTotalStr: String;
begin
  result := FormatCurr('#,###0.00', Qtd * (VlrUnit - VlrDesc));

end;

function TNFItem.GetVlrUnitStr: String;
begin
  result := FormatCurr('#,###0.000', VlrUnit);
end;

procedure TNFItem.SetBCCofins(const Value: Double);
begin
  FBCCofins := Value;
end;

procedure TNFItem.SetBCPis(const Value: Double);
begin
  FBCPis := Value;
end;

procedure TNFItem.SetCFOP(const Value: String);
begin
  FCFOP := Value;
end;

procedure TNFItem.SetCodProd(const Value: String);
begin
  FCodProd := Value;
end;

procedure TNFItem.SetCofins(const Value: Double);
begin
  FCofins := Value;
end;

procedure TNFItem.SetCofinsAliq(const Value: Double);
begin
  FCofinsAliq := Value;
end;

procedure TNFItem.SetCSTCofins(const Value: string);
begin
  FCSTCofins := Value;
end;

procedure TNFItem.SetCSTCSOSN(const Value: string);
begin
  FCSTCSOSN := Value;
end;

procedure TNFItem.SetCSTICMS(const Value: string);
begin
  FCSTICMS := Value;
end;

procedure TNFItem.SetCSTPis(const Value: string);
begin
  FCSTPis := Value;
end;

procedure TNFItem.SetEAN(const Value: String);
begin
  FEAN := Value;
end;

procedure TNFItem.SetICMS(const Value: Double);
begin
  FICMS := Value;
end;

procedure TNFItem.SetICMSAliq(const Value: Double);
begin
  FICMSAliq := Value;
end;

procedure TNFItem.SetItemSeq(const Value: Integer);
begin
  FItemSeq := Value;
end;

procedure TNFItem.SetNCM(const Value: String);
begin
  FNCM := Value;
end;

procedure TNFItem.SetNomeProd(const Value: String);
begin
  FNomeProd := Value;
end;

procedure TNFItem.SetObs(const Value: String);
begin
  FObs := Value;
end;

procedure TNFItem.SetOrigemMercadoria(const Value: Integer);
begin
  FOrigemMercadoria := Value;
end;

procedure TNFItem.SetPis(const Value: Double);
begin
  FPis := Value;
end;

procedure TNFItem.SetPisAliq(const Value: Double);
begin
  FPisAliq := Value;
end;

procedure TNFItem.SetQtd(const Value: Double);
begin
  FQtd := Value;
end;

procedure TNFItem.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

procedure TNFItem.SetVlrDesc(const Value: Double);
begin
  FVlrDesc := Value;
end;

procedure TNFItem.SetVlrLei12741(const Value: Double);
begin
  FVlrLei12741 := Value;
end;

procedure TNFItem.SetVlrUnit(const Value: Double);
begin
  FVlrUnit := Value;
end;

{ TNFPag }

procedure TNFPag.SetAbrirGaveta(const Value: Boolean);
begin
  FAbrirGaveta := Value;
end;

procedure TNFPag.SetcMP(const Value: String);
begin
  FcMP := Value;
end;

procedure TNFPag.SetcMPDescr(const Value: String);
begin
  FcMPDescr := Value;
end;

procedure TNFPag.SetPnfp_id(const Value: Integer);
begin
  FPnfp_id := Value;
end;

procedure TNFPag.SetvMP(const Value: Double);
begin
  FvMP := Value;
end;

{ TImpressora }

procedure TImpressora.Setpimp_baud(const Value: Integer);
begin
  Fpimp_baud := Value;
end;

procedure TImpressora.Setpimp_colunas(const Value: Integer);
begin
  Fpimp_colunas := Value;
end;

procedure TImpressora.Setpimp_data(const Value: Integer);
begin
  Fpimp_data := Value;
end;

procedure TImpressora.Setpimp_descricao(const Value: String);
begin
  Fpimp_descricao := Value;
end;

procedure TImpressora.Setpimp_espacos(const Value: Integer);
begin
  Fpimp_espacos := Value;
end;

procedure TImpressora.Setpimp_hardflow(const Value: Boolean);
begin
  Fpimp_hardflow := Value;
end;

procedure TImpressora.Setpimp_impressora(const Value: String);
begin
  Fpimp_impressora := Value;
end;

procedure TImpressora.Setpimp_linhas(const Value: Integer);
begin
  Fpimp_linhas := Value;
end;

procedure TImpressora.Setpimp_handshake(const Value: Integer);
begin
  Fpimp_handshake := Value;
end;

procedure TImpressora.Setpimp_modelo(const Value: Integer);
begin
  Fpimp_modelo := Value;
end;

procedure TImpressora.Setpimp_parity(const Value: Integer);
begin
  Fpimp_parity := Value;
end;

procedure TImpressora.Setpimp_port(const Value: string);
begin
  Fpimp_port := Value;
end;

procedure TImpressora.Setpimp_softflow(const Value: Boolean);
begin
  Fpimp_softflow := Value;
end;

procedure TImpressora.Setpimp_stop(const Value: Integer);
begin
  Fpimp_stop := Value;
end;

// function TPDVClass.GetChaveRequisicao(cnpjempresa, cnpjoperadora: string): String;
//
// var
// I              : Integer;
// chaveRequisicao: String;
// sChave         : String;
//
// begin
// sChave          := cnpjempresa + cnpjoperadora;
// sChave          := MD5String(sChave);
// chaveRequisicao := Copy(sChave, 1, 8) + '-' + Copy(sChave, 9, 4) + '-' + Copy(sChave, 13, 4) + '-' + Copy(sChave, 17, 4) + '-' + Copy(sChave, 21, 12);
// result          := chaveRequisicao;
// end;

{ TBalanca }

procedure TBalanca.Setpbal_baud(const Value: Integer);
begin
  Fpbal_baud := Value;
end;

procedure TBalanca.Setpbal_data(const Value: Integer);
begin
  Fpbal_data := Value;
end;

procedure TBalanca.Setpbal_descricao(const Value: String);
begin
  Fpbal_descricao := Value;
end;

procedure TBalanca.Setpbal_handshake(const Value: Integer);
begin
  Fpbal_handshake := Value;
end;

procedure TBalanca.Setpbal_hardflow(const Value: Boolean);
begin
  Fpbal_hardflow := Value;
end;

procedure TBalanca.Setpbal_modelo(const Value: Integer);
begin
  Fpbal_modelo := Value;
end;

procedure TBalanca.Setpbal_parity(const Value: Integer);
begin
  Fpbal_parity := Value;
end;

procedure TBalanca.Setpbal_port(const Value: string);
begin
  Fpbal_port := Value;
end;

procedure TBalanca.Setpbal_softflow(const Value: Boolean);
begin
  Fpbal_softflow := Value;
end;

procedure TBalanca.Setpbal_stop(const Value: Integer);
begin
  Fpbal_stop := Value;
end;

{ TPOS }

procedure TPOS.Setpos_cnpj(const Value: string);
begin
  Fpos_cnpj := Value;
end;

procedure TPOS.Setpos_id(const Value: Integer);
begin
  Fpos_id := Value;
end;

procedure TPOS.Setpos_parcelas(const Value: Integer);
begin
  Fpos_parcelas := Value;
end;

{ TCartaoPag }

constructor TCartaoPag.Create;
begin
  Fpos := TPOS.Create;
end;

procedure TCartaoPag.Setautenticador(const Value: String);
begin
  Fautenticador := Value;
end;

procedure TCartaoPag.Setpos(const Value: TPOS);
begin

  Fpos := Value;
end;

end.
