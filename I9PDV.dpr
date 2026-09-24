program I9PDV;
{$IMPORTEDDATA ON}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  Windows,
  ShellApi,
  Vcl.Themes,
  Vcl.Styles,
  uFrmPDV_Splash in 'uFrmPDV_Splash.pas' {FrmPDV_Splash},
  uFrmPDV_Login in 'uFrmPDV_Login.pas' {FrmPDV_Login},
  uFrmPDV in 'uFrmPDV.pas' {FrmPDV},
  uFrmPDV_DModule in 'uFrmPDV_DModule.pas' {FrmPDV_DModule: TDataModule},
  uPDVLib in 'uPDVLib.pas',
  uFrmConfig_Terminais in 'uFrmConfig_Terminais.pas' {FrmConfig_Terminais},
  uFrmPDV_Autorizacao in 'uFrmPDV_Autorizacao.pas' {FrmPDV_Autorizacao},
  uGlobalLibPDV in 'uGlobalLibPDV.pas',
  uFrmConfig_Connection in 'uFrmConfig_Connection.pas' {FrmConfig_Connection},
  uFrmPDV_Login_DefineSenha in 'uFrmPDV_Login_DefineSenha.pas' {FrmPDV_Login_DefineSenha},
  uFrmOperacao_EncerraCaixaOperador in 'uFrmOperacao_EncerraCaixaOperador.pas' {FrmOperacao_EncerraCaixaOperador},
  uFrmOperacao_AbreCaixaOperador in 'uFrmOperacao_AbreCaixaOperador.pas' {FrmOperacao_AbreCaixaOperador},
  uFrmPDV_Bloqueio in 'uFrmPDV_Bloqueio.pas' {FrmPDV_Bloqueio},
  uFrmConfig_Impressoras in 'uFrmConfig_Impressoras.pas' {FrmConfig_Impressoras},
  uFrmConfig_Adquirentes in 'uFrmConfig_Adquirentes.pas' {FrmConfig_Adquirentes},
  uFrmConfig_POS in 'uFrmConfig_POS.pas' {FrmConfig_POS},
  uFrmPDV_FormasPag in 'uFrmPDV_FormasPag.pas' {FrmPDV_FormasPag},
  uFrmPDV_POS in 'uFrmPDV_POS.pas' {FrmPDV_POS},
  uFrmPDV_POS_Manual in 'uFrmPDV_POS_Manual.pas' {FrmPDV_POS_Manual},
  uFrmPDV_PesqProds in 'uFrmPDV_PesqProds.pas' {FrmPDV_PesqProds},
  uFrmPDV_NFCe in 'uFrmPDV_NFCe.pas' {FrmPDV_NFCe},
  uFrmConfig_NFCe in 'uFrmConfig_NFCe.pas' {FrmConfig_NFCe},
  uFrmPDV_Funcoes in 'uFrmPDV_Funcoes.pas' {FrmPDV_Funcoes},
  uFrmConfig_Balanca in 'uFrmConfig_Balanca.pas' {FrmConfig_Balanca},
  uFrmPDV_ImportaComanda in 'uFrmPDV_ImportaComanda.pas' {FrmPDV_ImportaComanda},
  uFrmConfig_Connection_Manual in 'uFrmConfig_Connection_Manual.pas' {FrmConfig_Connection_Manual},
  uFrmPDV_DModule_DS in 'uFrmPDV_DModule_DS.pas' {FrmPDV_DModule_DS: TDataModule},
  uFrmPDV_Desconto in 'uFrmPDV_Desconto.pas' {FrmPDV_Desconto},
  uFrmPDV_Balanca in 'uFrmPDV_Balanca.pas' {FrmPDV_Balanca},
  uFrmPDV_IdentificaCliente in 'uFrmPDV_IdentificaCliente.pas' {FrmPDV_IdentificaCliente},
  uFrmPDV_Sync in 'uFrmPDV_Sync.pas' {FrmPDV_Sync},
  uFrmConfig_SyncServer in 'uFrmConfig_SyncServer.pas' {FrmConfig_SyncServer},
  uFrmOperacao_Sangria in 'uFrmOperacao_Sangria.pas' {FrmOperacao_Sangria},
  uFrmPDV_ImportaPreVenda in 'uFrmPDV_ImportaPreVenda.pas' {FrmPDV_ImportaPreVenda},
  uFrmPDV_SAT in 'uFrmPDV_SAT.pas' {FrmPDV_SAT},
  uFrmPDV_TEF in 'uFrmPDV_TEF.pas' {FrmPDV_TEF},
  uFrmPDV_TEF_Operacoes in 'uFrmPDV_TEF_Operacoes.pas' {FrmPDV_TEF_Operacoes},
  uFrmPDV_TEF_Parcelas in 'uFrmPDV_TEF_Parcelas.pas' {FrmPDV_TEF_Parcelas},
  uFrmPDV_TEF_QRCode in 'uFrmPDV_TEF_QRCode.pas' {FrmPDV_TEF_QRCode},
  uFrmPDV_TEF_Campo in 'uFrmPDV_TEF_Campo.pas' {FrmPDV_TEF_Campo},
  uPDV_Print in 'uPDV_Print.pas',
  uPDV_SetValores in 'uPDV_SetValores.pas',
  uPDV_NF in 'uPDV_NF.pas',
  uPDV_SetModos in 'uPDV_SetModos.pas',
  uimpDados in 'uimpDados.pas' {fimportacao},
  ucadastrasenha in 'ucadastrasenha.pas' {FCadUsuario},
  uvendas in 'uvendas.pas' {fvendas},
  ufracionaPedido in 'ufracionaPedido.pas' {frmFracionaPedido},
  uFrmPDV_Promocoes in 'uFrmPDV_Promocoes.pas' {FrmPDV_Promocoes},
  uFrmResumoCaixa in 'uFrmResumoCaixa.pas' {frmResumo},
  uFrmOpcoesTEF in 'uFrmOpcoesTEF.pas' {frmOpcoesTEF};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'I9 PDV';
  Application.CreateForm(TFrmPDV_DModule_DS, FrmPDV_DModule_DS);
  Application.CreateForm(TFrmPDV_Splash, FrmPDV_Splash);
  Application.CreateForm(Tfimportacao, fimportacao);
  Application.CreateForm(TFCadUsuario, FCadUsuario);
  Application.CreateForm(Tfvendas, fvendas);
  Application.CreateForm(TfrmFracionaPedido, frmFracionaPedido);
  Application.CreateForm(TfrmResumo, frmResumo);
  Application.CreateForm(TfrmOpcoesTEF, frmOpcoesTEF);
  //  Application.CreateForm(Tfrmbaseexterna, frmbaseexterna);
  Application.ShowMainForm := true;
  Application.Run;

end.
