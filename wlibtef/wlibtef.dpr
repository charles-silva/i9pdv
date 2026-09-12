library wlibtef;

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
  ACBrTEFDClass,
  uFrmTEF in 'uFrmTEF.pas' {FrmTEF} ,
  uFrmTEF_Operacoes in 'uFrmTEF_Operacoes.pas', TiposCliSiTef {FrmTEF_Operacoes};

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

function TEFStart(aHandle: Cardinal; ANumeroFiscal: AnsiString; AValor: Double): Boolean; stdcall;
var
  data   : TDate;
  hora   : TTime;
  msgErro: AnsiString;
begin
  data := now;
  hora := now;

  goHandleMain := aHandle;
  if not Assigned(FrmTEF) then
    FrmTEF            := TFrmTEF.Create(nil);
  FrmTEF.ParentWindow := aHandle;

  if FrmTEF.EasyTEF.verificarPresencaPinpad(msgErro) then
  begin
    FrmTEF.EasyTEF.iniciarTransacaoTEF;
    FrmTEF.EasyTEF.numeroDeCartoes := 1;
    FrmTEF.EasyTEF.executarFuncaoSiTef(fcsCredito, AValor, ANumeroFiscal, data, hora, '{TipoTratamento=4}', 'TEF', msgErro);
  end;
end;

exports
  TEFStart;

end.
