unit uPDV_NF;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.Graphics, Vcl.Controls, Winapi.Windows,
  uPDVLib, pcnVFPe, uFrmConfig_Adquirentes, uPDV_SetModos, ACBrUtil;

procedure doNovaNF(const aIdentificaCliente: Boolean = true);

procedure doAdicProdNF(AProduto: TProduto);

function doAdicFormaNF(afp_codigo: Integer; aOp_codigo: Integer; aWiBiRespostaValidador: TWiBiRespostaValidador;
  aPosManual: Boolean; Aadq_id, Apos_id: Integer; aNSU_SITEF, aNSU_HOSTTEF, aNSU_BANDEIRA, aPARCELAS, AComprovante1aVia,
  AComprovante2aVia: string): Integer;

function doAbreFechaCaixaGeral(aus_codigo: Integer; aEncerra: Boolean): Boolean;

function doAbreFechaCaixaOperador(aus_codigo: Integer; aEncerra: Boolean; aAutorizado: Boolean): Boolean;

procedure doNFSituacaoFechamento;

function doNFFechamento: Boolean;

procedure doAplicarDesconto;

procedure doCancelaVenda;

procedure doConfirmaPagamento;

procedure doLog(Msg: string);

implementation

{ M�todos da nota fiscal }

uses
  uFrmPDV, uFrmPDV_DModule, uPDV_SetValores, uFrmPDV_POS_Manual,
  uFrmPDV_DModule_DS, uPDV_Print, uFrmPDV_NFCe, uFrmPDV_SAT,
  uFrmPDV_ImportaComanda, uFrmPDV_ImportaPreVenda, uFrmPDV_Autorizacao,
  uFrmPDV_Desconto, uFrmPDV_FormasPag, uFrmPDV_POS, uimpDados,
  Vcl.Dialogs, System.Classes;

procedure doLog(Msg: string);
var
  loLista: TStringList;
begin
  try
    loLista := TStringList.Create;
    try
      if FileExists('logfilanfe.log') then
        loLista.LoadFromFile('logfilanfe.log');
      loLista.add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) + ' - ' + Msg);
    except
      on e: exception do
        loLista.add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) + ' - ' + Msg);
    end
  finally
    loLista.SaveToFile('logfilanfe.log');
    loLista.Free;
  end;
end;

procedure doNovaNF(const aIdentificaCliente: Boolean = true);
begin
  with FrmPDV do
  begin
    if goPnf_id > 0 then
      exit;
    doSetModoNormal(true);
    with FrmPDV_DModule do
    begin
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_gera_nf';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      adStoreProc1.Params.ParamByName('@em_codigo').AsInteger := ServerEmpresa;
      adStoreProc1.Params.ParamByName('@pterm_id').AsString   := goPterm_id;
      adStoreProc1.Params.ParamByName('@pvd_id').AsInteger    := 0;
      adStoreProc1.Params.ParamByName('@cl_codigo').AsInteger := 0;
      adStoreProc1.Params.ParamByName('@pnf_scan').AsBoolean  := false;
      adStoreProc1.execProc;

      if adStoreProc1.FindParam('@max') <> nil then
      begin
        goPnf_id      := adStoreProc1.ParamByName('@max').AsInteger;
        goPnf_id_last := goPnf_id;
      end;
    end;
    doSetMsgEstado;
    // if aIdentificaCliente then
    // if not((not goTerminal.pterm_nfce) and (not goTerminal.pterm_nfce_offline) and (not goTerminal.pterm_sat)) then
    // doExecFunction('214');
  end;
end;

procedure doAdicProdNF(AProduto: TProduto); // erimar adiciona produto
begin
  with FrmPDV do
  begin

    if goPnf_id = 0 then
      exit;
    with FrmPDV_DModule do
    begin
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_add_item_nf';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      // adStoreProc1.Params.ParamByName('@pterm_id').AsString := goPterm_id;
      adStoreProc1.Params.ParamByName('@pnf_id').AsInteger         := goPnf_id;
      adStoreProc1.Params.ParamByName('@pr_codigo').AsInteger      := StrToIntDef(AProduto.Codigo, 0);
      adStoreProc1.Params.ParamByName('@pnfi_qtd').AsFmtBCD        := RoundABNT(AProduto.Quantidade, 4);
      adStoreProc1.Params.ParamByName('@pnfi_valor_unit').AsFmtBCD := RoundABNT(AProduto.Valor, 2);
      adStoreProc1.Params.ParamByName('@pnfi_desconto').AsFmtBCD   := 0;
      adStoreProc1.Params.ParamByName('@nop_id').AsInteger         := 1;
      adStoreProc1.execProc;
    end;
  end;
end;

function doAdicFormaNF(afp_codigo: Integer; aOp_codigo: Integer; aWiBiRespostaValidador: TWiBiRespostaValidador;
  aPosManual: Boolean; Aadq_id, Apos_id: Integer; aNSU_SITEF, aNSU_HOSTTEF, aNSU_BANDEIRA, aPARCELAS, AComprovante1aVia,
  AComprovante2aVia: string): Integer;
var
  valorPago: real;
begin
  result := 0;
  with FrmPDV, FrmPDV_DModule do
  begin
    try
      valorPago                   := edValorForma.Value;
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_add_pag_nf';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      // adStoreProc1.Params.ParamByName('@pterm_id').AsString := goPterm_id;
      adStoreProc1.Params.ParamByName('@pnf_id').AsInteger            := FrmPDV.goPnf_id;
      adStoreProc1.Params.ParamByName('@fp_codigo').AsInteger         := afp_codigo;
      adStoreProc1.Params.ParamByName('@op_codigo').AsInteger         := aOp_codigo;
      adStoreProc1.Params.ParamByName('@pnfp_valor').AsFmtBCD         := RoundABNT(valorPago, 2);
      adStoreProc1.Params.ParamByName('@pos_id').AsInteger            := Apos_id;
      adStoreProc1.Params.ParamByName('@pnfp_nsu_sitef').AsString     := aNSU_SITEF;
      adStoreProc1.Params.ParamByName('@pnfp_nsu_host').AsString      := aNSU_HOSTTEF;
      adStoreProc1.Params.ParamByName('@pnfp_bandeira').AsString      := aNSU_BANDEIRA;
      adStoreProc1.Params.ParamByName('@pnfp_pos_parcelas').AsInteger := StrToIntDef(aPARCELAS, 0);
      adStoreProc1.Params.ParamByName('@pnfp_comprovante_1').AsMemo   := AComprovante1aVia;
      adStoreProc1.Params.ParamByName('@pnfp_comprovante_2').AsMemo   := AComprovante2aVia;
      { configurando o pagamento quando caart�o }
      if goTerminal.pterm_pos then
      begin
        // adStoreProc1.Params.ParamByName('@pnfp_pos_tipo').AsString := FrmPDV_POS_Manual.edpnfp_pos_tipo.Text;
        // // bandeira do cart�o
        // adStoreProc1.Params.ParamByName('@pnfp_pos_inst_financeira').AsString :=
        // // FrmPDV_POS_Manual.edpnfp_pos_inst_financeira.Text;    //adquirente
        // adStoreProc1.Params.ParamByName('@pnfp_pos_codigo_aut').AsString :=
        // // FrmPDV_POS_Manual.edpnfp_pos_codigo_aut.Text;
      end;

      { Dados do POS }
      // if aPosManual then
      // begin
      // FrmPDV_POS_Manual := TFrmPDV_POS_Manual.Create(FrmPDV);
      // try
      // FrmPDV_POS_Manual.edpnfp_pos_valor.Value               := edValorForma.Value;
      // FrmPDV_POS_Manual.edpnfp_pos_parcelas.Value            := 1;
      // FrmPDV_POS_Manual.edpnfp_pos_inst_financeira.EditValue := Aadq_id;
      // if FrmPDV_POS_Manual.ShowModal <> mrOK then
      // exit;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_codigo_aut').AsString :=
      // FrmPDV_POS_Manual.edpnfp_pos_codigo_aut.Text;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_bin').AsString         := FrmPDV_POS_Manual.edpnfp_pos_bin.Text;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_dono_cartao').AsString :=
      // FrmPDV_POS_Manual.edpnfp_pos_dono_cartao.Text;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_data_expiracao').AsString :=
      // FrmPDV_POS_Manual.edpnfp_pos_data_expiracao.Text;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_inst_financeira').AsString :=
      // FrmPDV_POS_Manual.edpnfp_pos_inst_financeira.Text;    //adquirente
      // adStoreProc1.Params.ParamByName('@pnfp_pos_parcelas').AsInteger :=
      // StrToIntDef(FrmPDV_POS_Manual.edpnfp_pos_parcelas.Text, 0);
      // adStoreProc1.Params.ParamByName('@pnfp_pos_ult_quatro_dig').AsInteger :=
      // StrToIntDef(FrmPDV_POS_Manual.edpnfp_pos_ult_quatro_dig.Text, 0);
      // adStoreProc1.Params.ParamByName('@pnfp_pos_cod_pagamento').AsString :=
      // FrmPDV_POS_Manual.edpnfp_pos_id_fila.Text;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_valor').AsFmtBCD    := FrmPDV_POS_Manual.edpnfp_pos_valor.Value;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_id_fila').AsInteger :=
      // StrToIntDef(FrmPDV_POS_Manual.edpnfp_pos_id_fila.Text, 0);
      // adStoreProc1.Params.ParamByName('@pnfp_pos_tipo').AsString      := FrmPDV_POS_Manual.edpnfp_pos_tipo.Text;  //bandeira do cart�o
      // adStoreProc1.Params.ParamByName('@pnfp_pos_id_local').AsInteger := aWiBiRespostaValidador.IDLocal;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_id_pagamento').AsInteger := aWiBiRespostaValidador.IDPagamento;
      // finally
      // FrmPDV_POS_Manual.Destroy;
      // end;
      // end
      // else
      // begin
      // if goTerminal.pterm_pos then
      // begin
      // adStoreProc1.Params.ParamByName('@pnfp_pos_codigo_aut').AsString := aWiBiRespostaValidador.CodigoAutorizacao;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_bin').AsString        := aWiBiRespostaValidador.Bin;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_dono_cartao').AsString := aWiBiRespostaValidador.DonoCartao;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_data_expiracao').AsString := aWiBiRespostaValidador.DataExpiracao;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_inst_financeira').AsString :=
      // aWiBiRespostaValidador.InstituicaoFinanceira;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_parcelas').AsInteger       := aWiBiRespostaValidador.Parcelas;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_ult_quatro_dig').AsInteger :=
      // aWiBiRespostaValidador.UltimosQuatroDigitos;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_cod_pagamento').AsString := aWiBiRespostaValidador.CodigoPagamento;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_valor').AsFmtBCD :=
      // RoundABNT(aWiBiRespostaValidador.ValorPagamento, 2);
      // adStoreProc1.Params.ParamByName('@pnfp_pos_id_fila').AsInteger      := aWiBiRespostaValidador.IDFila;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_tipo').AsString          := aWiBiRespostaValidador.Tipo;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_id_local').AsInteger     := aWiBiRespostaValidador.IDLocal;
      // adStoreProc1.Params.ParamByName('@pnfp_pos_id_pagamento').AsInteger := aWiBiRespostaValidador.IDPagamento;
      // end;
      // end;
      adStoreProc1.execProc;
      if adStoreProc1.FindParam('@max') <> nil then
        result := adStoreProc1.ParamByName('@max').AsInteger;
    finally
      doGetTotaisEncerra;
    end;
  end;
end;

function doAbreFechaCaixaGeral(aus_codigo: Integer; aEncerra: Boolean): Boolean;
begin
  result := true;
  with FrmPDV, FrmPDV_DModule do
  begin
    if goPnf_id > 0 then
      exit;

    adStoreProc1.Connection     := ADConnection1;
    adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
    adStoreProc1.StoredProcName := 'proc_abre_fecha_caixa';
    adStoreProc1.SchemaName     := 'pdv';
    adStoreProc1.Prepare;
    adStoreProc1.Params.ParamByName('@em_codigo').AsInteger := ServerEmpresa;
    adStoreProc1.Params.ParamByName('@us_codigo').AsInteger := aus_codigo;
    adStoreProc1.Params.ParamByName('@pterm_id').AsString   := goPterm_id;
    adStoreProc1.Params.ParamByName('@encerra').AsBoolean   := aEncerra;
    adStoreProc1.execProc;
    if adStoreProc1.FindParam('@max') <> nil then
      if adStoreProc1.ParamByName('@max').AsInteger > 0 then
      begin
        lblCaixa.Caption := FormatFloat('000', 0);
        goPcx_id         := 0;
        doSetMsgEstado;
        if aEncerra then
        begin
          result := true;
          exit;
        end;
      end;
    result := doGetCaixa;
  end;
end;

function doAbreFechaCaixaOperador(aus_codigo: Integer; aEncerra: Boolean; aAutorizado: Boolean): Boolean;
begin
  result := true;
  with FrmPDV, FrmPDV_DModule do
  begin
    if goPnf_id > 0 then
      exit;
    adStoreProc1.Connection     := ADConnection1;
    adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
    adStoreProc1.StoredProcName := 'proc_abre_fecha_caixa_operador';
    adStoreProc1.SchemaName     := 'pdv';
    adStoreProc1.Prepare;
    adStoreProc1.Params.ParamByName('@pterm_id').AsString         := goPterm_id;
    adStoreProc1.Params.ParamByName('@pcx_id').AsInteger          := goPcx_id;
    adStoreProc1.Params.ParamByName('@us_codigo').AsInteger       := aus_codigo;
    adStoreProc1.Params.ParamByName('@encerra').AsBoolean         := aEncerra;
    adStoreProc1.Params.ParamByName('@pcxo_autorizado').AsBoolean := aAutorizado;
    adStoreProc1.execProc;
    goPcxo_id_temp := adStoreProc1.ParamByName('@max').AsInteger;
    if adStoreProc1.FindParam('@max') <> nil then
      if adStoreProc1.ParamByName('@max').AsInteger > 0 then
      begin
        lblCaixaOperador.Caption := FormatFloat('000', 0);
        goPcxo_id                := 0;
        doSetMsgEstado;
        if aEncerra then
        begin
          result := true;
          exit;
        end;
      end;
    result := doGetCaixaOperador;
  end;
end;

procedure doNFSituacaoFechamento;
var
  loNF: TNF;
begin
  with FrmPDV do
  begin
    loNF := goPDVClass.GetTotaisNF(goPnf_id);
    try
      cxPageControl1.ActivePageIndex := 0;
      goPnf_id                       := 0;
      doClear(true);
      doSetMsgEstado;
      if loNF.Troco > 0 then
      begin
        lblLabelSubTotal.Caption := 'Troco';
        lblStatusTotal.Caption   := loNF.TrocoStr;
        lblStatusTotal.Color     := clGreen;
        shp7.Brush.Color         := clGreen;
      end;
    finally
      if Assigned(loNF) then
        loNF.Destroy;
    end;
  end;
end;

procedure updateEstoqueFical(Pedido: Integer; Chave: string; Sessao: string; isContigencia: Boolean);
begin
  if (not isContigencia) then
    FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set  pnf_status = 4 where pnf_id = ' +
      IntToStr(Pedido));
  // FrmPDV_DModule.ADConnection1.ExecSQL('exec P_AlteraEF '+IntToStr(FrmPDV.goPnf_id));

  { FrmPDV_DModule.ADConnection1.ExecSQL('INSERT INTO basei9..Kardexf ( Controle, Produto, Quantidade, tipo, Saldo, data ) '+
    'select '+QuotedStr('MFE')+'+convert(varchar(10),i.pnf_id), i.pr_codigo,-i.pnfi_qtd,2, estoquef,GETDATE()  '+
    'from pdv.tb_nota_fiscal_itens i '+
    'join basei9..estoque e on e.e_produto=i.pr_codigo '+
    'where i.pnf_id = '+ IntToStr(Pedido) +' and i.pnfi_cancelado=0 ');

    FrmPDV_DModule.ADConnection1.ExecSQL('UPDATE basei9..Estoque SET usaida = Convert(date,getdate(),100),'+
    'estoquef = estoquef - i.pnfi_qtd '+
    'from basei9..Estoque e '+
    'join (select pnf_id, pr_codigo, pnfi_cancelado, sum(pnfi_qtd) pnfi_qtd from '+
    'pdv.tb_nota_fiscal_itens group by pnf_id, pr_codigo, pnfi_cancelado) i on e.E_PRODUTO = i.pr_codigo '+
    'and i.pnf_id = '+IntToStr(Pedido) +' and i.pnfi_cancelado=0'); }

  FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal_itens set dtcontrole = getdate() ' +
    'where pnfi_id = ' + IntToStr(Pedido));
end;

function doNFFechamento: Boolean;
var
  loNF                   : TNF;
  loResult               : Integer;
  loSendCFe              : TSendRetorno;
  loID                   : string;
  loSendFiscalResponseCFe: TRetornoRespostaFiscal;
begin
  result := false;
  // verificando status modulo
  // FrmPDV_SAT.ACBrSAT1.ConsultarStatusOperacional;

  with FrmPDV do
  begin
    if not Assigned(goPDVClass) then
      goPDVClass := TPDVClass.Create;

    loNF := goPDVClass.GetTotaisNF(FrmPDV.goPnf_id);
    try
      if loNF.TotalAPagar > 0 then
        exit;
    finally
      if Assigned(loNF) then
        loNF.Destroy;
    end;
    loResult := 0;

    FrmPDV_DModule.ADConnection1.StartTransaction;
    doLog('INICIANDO TRANSACAO DA VENDA');
{$REGION 'Finaliza nota fiscal'}
    try
      with FrmPDV, FrmPDV_DModule do
      begin
        adStoreProc1.Connection     := ADConnection1;
        adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
        adStoreProc1.StoredProcName := 'proc_finaliza_nf';
        adStoreProc1.SchemaName     := 'pdv';
        adStoreProc1.Prepare;
        adStoreProc1.Params.ParamByName('@pterm_id').AsString := goPterm_id;
        adStoreProc1.Params.ParamByName('@pnf_id').AsInteger  := goPnf_id;
        adStoreProc1.Params.ParamByName('@pcxo_id').AsInteger := goPcxo_id;
        adStoreProc1.execProc;
        if adStoreProc1.FindParam('@max') <> nil then
          loResult := adStoreProc1.ParamByName('@max').AsInteger;
      end;

      if loResult <= 0 then
      begin
        if FrmPDV_DModule.ADConnection1.InTransaction then
          FrmPDV_DModule.ADConnection1.Rollback;
        MessageBox(FrmPDV.handle, 'Problemas ao finalizar nota fiscal.', 'I9 PDV', MB_ICONEXCLAMATION);
        exit;
      end;

{$ENDREGION}
{$REGION 'Envio para Sefaz ou Imprimir'}
      try
{$REGION 'Modo n�o fiscal'}
        if (not goTerminal.pterm_nfce) and (not goTerminal.pterm_nfce_offline) and (not goTerminal.pterm_sat) then
        begin
          FrmPDV_DModule.ADConnection1.ExecSQL
            ('INSERT INTO basei9..Kardexf ( Controle, Produto, Quantidade, tipo, Saldo, data ) ' + 'select ' +
            QuotedStr('MFE') + '+convert(varchar(10),i.pnf_id), i.pr_codigo,-i.pnfi_qtd,2, estoquef,GETDATE()  ' +
            'from pdv.tb_nota_fiscal_itens i ' + 'join basei9..estoque e on e.e_produto=i.pr_codigo ' +
            'where i.pnf_id = ' + IntToStr(FrmPDV.goPnf_id) + ' and i.pnfi_cancelado=0 ');

          FrmPDV_DModule.ADConnection1.ExecSQL('UPDATE basei9..Estoque SET usaida = Convert(date,getdate(),100),' +
            'estoquef = estoquef - i.pnfi_qtd ' + 'from basei9..Estoque e ' +
            'join (select pnf_id, pr_codigo, pnfi_cancelado, sum(pnfi_qtd) pnfi_qtd from ' +
            'pdv.tb_nota_fiscal_itens group by pnf_id, pr_codigo, pnfi_cancelado) i on e.E_PRODUTO = i.pr_codigo ' +
            'and i.pnf_id = ' + IntToStr(FrmPDV.goPnf_id) + ' and i.pnfi_cancelado=0');

          FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal_itens set dtcontrole = getdate() ' +
            'where pnfi_id = ' + IntToStr(FrmPDV.goPnf_id));

          with FrmPDV_DModule_DS do
          begin
            dsVendas.close;
            dsVendas.ParamByName('pnf_id').AsInteger := goPnf_id;
            dsVendas.active                          := true;
            dsVendasItens.close;
            dsVendasItens.active := true;
            dsVendasPags.close;
            dsVendasPags.active := true;
            doPrintVenda;
          end;
        end;
{$ENDREGION}
{$REGION 'NFCe - Nota fiscal eletronica ao consumidor'}
        if goTerminal.pterm_nfce or goTerminal.pterm_nfce_offline then
        begin
          try
            if Assigned(FrmPDV_NFCe) then
              FrmPDV_NFCe.Free;
            FrmPDV_NFCe              := TFrmPDV_NFCe.Create(FrmPDV);
            FrmPDV_NFCe.goOffline    := goTerminal.pterm_nfce_offline;
            FrmPDV_NFCe.goPnf_id     := FrmPDV.goPnf_id;
            FrmPDV_NFCe.goPathNFe    := ExtractFilePath(Application.ExeName);
            FrmPDV_NFCe.goImpressora := goTerminal.Impressora.pimp_impressora;
            FrmPDV_NFCe.goTerminal   := goTerminal.pterm_id;
            if FrmPDV_NFCe.ShowModal = mrCancel then
            begin
              if FrmPDV_DModule.ADConnection1.InTransaction then
                FrmPDV_DModule.ADConnection1.Rollback;
              exit;
            end;
            doPrintNFCe;
            doPrintTEF(goPnf_id);
            existNotasContigencia;

            // updateEstoqueFical(goPnf_id, QuotedStr(loSendCFe.ChaveAcesso), loSendCFe.Sessao,
            // goTerminal.pterm_nfce_offline);

          finally
          end;
        end;
{$ENDREGION}
{$REGION 'MFE-CE - Modulo fiscal eletronico do estado do Cear�'}
        if goTerminal.pterm_sat then
        begin
          loNF := goPDVClass.GetNF(goPterm_id, FrmPDV.goPnf_id);
          try
            if not Assigned(FrmPDV_SAT) then
              FrmPDV_SAT := TFrmPDV_SAT.Create(FrmPDV);
            // carregando sessao
            goPDVClass.goPDVConnection.GetQuery.Open('SELECT pnf_numero_sessao FROM pdv.vw_nota_fiscal where pnf_id = '
              + goPnf_id.ToString);
            if goPDVClass.goPDVConnection.GetQuery.RecordCount > 0 then
              FrmPDV_SAT.goIDSesssaoAtual := goPDVClass.goPDVConnection.GetQuery.FieldByName('pnf_numero_sessao').Value;

            FrmPDV_SAT.Show;
            if loNF.doSATPrepareCFe then
            begin
              loSendCFe := FrmPDV_SAT.doSendCFe;
              if not(loSendCFe.CodigoRetorno = 6000) then
              begin
                // if FrmPDV_DModule.ADConnection1.InTransaction then
                // FrmPDV_DModule.ADConnection1.Rollback;
                FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_numero_sessao = ' +
                  loSendCFe.Sessao + ', pnf_status=1 where pnf_id=' + FrmPDV.goPnf_id.ToString);

                MessageBox(FrmPDV_SAT.handle,
                  PChar('Falha ao enviar nota fiscal, verifique o integrador e tente novamente.' + #13 +
                  loSendCFe.MensagemRetorno), 'I9 PDV', MB_ICONEXCLAMATION);
                exit;
              end
              else
              begin

                FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal set pnf_chave = ' +
                  QuotedStr(loSendCFe.ChaveAcesso) + ', pnf_numero_sessao = ' + loSendCFe.Sessao +
                  ', pnf_data_autorizacao = getdate(), pnf_status = 4 where pnf_id = ' + IntToStr(FrmPDV.goPnf_id));
                // FrmPDV_DModule.ADConnection1.ExecSQL('exec P_AlteraEF '+IntToStr(FrmPDV.goPnf_id));

                {
                  FrmPDV_DModule.ADConnection1.ExecSQL('INSERT INTO basei9..Kardexf ( Controle, Produto, Quantidade, tipo, Saldo, data ) '+
                  'select '+QuotedStr('MFE')+'+convert(varchar(10),i.pnf_id), i.pr_codigo,-i.pnfi_qtd,2, estoquef,GETDATE()  '+
                  'from pdv.tb_nota_fiscal_itens i '+
                  'join basei9..estoque e on e.e_produto=i.pr_codigo '+
                  'where i.pnf_id = '+ IntToStr(FrmPDV.goPnf_id) +' and i.pnfi_cancelado=0 ');

                  FrmPDV_DModule.ADConnection1.ExecSQL('UPDATE basei9..Estoque SET usaida = Convert(date,getdate(),100),'+
                  'estoquef = estoquef - i.pnfi_qtd '+
                  'from basei9..Estoque e '+
                  'join (select pnf_id, pr_codigo, pnfi_cancelado, sum(pnfi_qtd) pnfi_qtd from '+
                  'pdv.tb_nota_fiscal_itens group by pnf_id, pr_codigo, pnfi_cancelado) i on e.E_PRODUTO = i.pr_codigo '+
                  'and i.pnf_id = '+IntToStr(FrmPDV.goPnf_id) +' and i.pnfi_cancelado=0'); }

                FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal_itens set dtcontrole = getdate() ' +
                  'where pnfi_id = ' + IntToStr(FrmPDV.goPnf_id));

                StoreXML(loSendCFe.XMLString, FrmPDV.goPnf_id, loSendCFe.nCFe);
                if FrmPDV_DModule.ADConnection1.InTransaction then
                begin
                  FrmPDV_DModule.ADConnection1.Commit;
                  doLog('FINALIZANDO TRANSACAO DA VENDA');
                end;
                with FrmPDV_DModule_DS do
                begin
                  fdPagamentos.close;
                  fdPagamentos.ParamByName('pnf_id').AsInteger := loNF.IDNF;
                  fdPagamentos.active                          := true;
                  doLog('INICIANDO PAGAMENTOS');
                  { while not fdPagamentos.eof do
                    begin
                    loSendFiscalResponseCFe := FrmPDV_SAT.doSendFiscalResponseCFe( //
                    goTerminal.pterm_pos_chave_validador,                        //
                    loSendCFe.ChaveAcesso,                                       //
                    FrmPDV_DModule.cdsEmpresa.FieldByName('em_cnpj').AsString,
                    //
                    fdPagamentos.FieldByName('pnfp_pos_id_fila').AsString, //
                    fdPagamentos.FieldByName('pnfp_pos_codigo_aut').AsString,
                    //
                    fdPagamentos.FieldByName('pnfp_pos_tipo').AsString,            //
                    fdPagamentos.FieldByName('pnfp_pos_inst_financeira').AsString, //
                    '',                                                            //
                    IntToStr(loNF.NumeroFiscal),                                   //
                    fdPagamentos.FieldByName('pnfp_pos_id_fila').AsInteger);
                    loID := fdPagamentos.FieldByName('pnfp_id').AsString;

                    FrmPDV_DModule.ADConnection1.ExecSQL('update pdv.tb_nota_fiscal_pag set pnfp_id_resposta_fiscal = ' +
                    QuotedStr(loSendFiscalResponseCFe.IdRespostaFiscal) + ' where pnfp_id = ' + loID);
                    fdPagamentos.next;
                    end;
                    doLog('FINALIZANDO PAGAMENTOS');
                    //fimportacao.cxButton2.Click;
                  }
                end;
              end;
            end;
          finally
            FrmPDV_SAT.close;
            if Assigned(loNF) then
              loNF.Destroy;
            doLog('VENDA FINALIZADA COM SUCESSO!');
          end;
        end;

{$ENDREGION}
{$REGION 'Finaliza Comandas'}
        FrmPDV_ImportaComanda := TFrmPDV_ImportaComanda.Create(FrmPDV);
        try
          with FrmPDV_DModule_DS do
          begin
            dsVendasItensConsumo.close;
            dsVendasItensConsumo.ParamByName('pnf_id').AsInteger := FrmPDV.goPnf_id;
            dsVendasItensConsumo.active                          := true;
            while not dsVendasItensConsumo.eof do
            begin
              try
                FrmPDV_ImportaComanda.doFinalizar(dsVendasItensConsumo.FieldByName('pnfi_id_comanda').AsString);
              except
              end;
              dsVendasItensConsumo.next;
            end;
          end;
        finally
          FrmPDV_ImportaComanda.Destroy;
          FrmPDV_ImportaComanda := nil;
        end;
        FrmPDV_ImportaPreVenda := TFrmPDV_ImportaPreVenda.Create(FrmPDV);
        try
          with FrmPDV_DModule_DS do
          begin
            dsVendasItensConsumo.close;
            dsVendasItensConsumo.ParamByName('pnf_id').AsInteger := FrmPDV.goPnf_id;
            dsVendasItensConsumo.active                          := true;
            while not dsVendasItensConsumo.eof do
            begin
              try
                FrmPDV_ImportaPreVenda.doFinalizar(dsVendasItensConsumo.FieldByName('pnfi_id_comanda').AsString);
              except
              end;
              dsVendasItensConsumo.next;
            end;
          end;
        finally
          FrmPDV_ImportaPreVenda.Destroy;
          FrmPDV_ImportaPreVenda := nil;
        end;
{$ENDREGION}
      except
        on e: exception do
        begin
          if FrmPDV_DModule.ADConnection1.InTransaction then
            FrmPDV_DModule.ADConnection1.Rollback;
          MessageBox(handle, PChar(e.message), 'I9 PDV', MB_ICONEXCLAMATION);
          exit;
        end;
      end;
      /// // pode
{$ENDREGION}
    finally
      if FrmPDV_DModule.ADConnection1.InTransaction then
      begin
        FrmPDV_DModule.ADConnection1.Commit;
        doLog('FINALIZANDO TRANSACAO DA VENDA');
      end;

      { with FrmPDV.a1 do
        begin
        close;
        sql.Clear;
        sql.Add('select * from CONFIGURACAO where CONTROLE=' + QuotedStr('PDVBFiscReal'));
        open;
        end;
        if FrmPDV.a1.FieldByName('valor').AsString = '�' then
        FrmPDV.ProcessaPedido(goPnf_id);    //  erimar   Tira o estoque real
      }
    end;
    result := true;
  end;
end;

procedure doAplicarDesconto;
var
  loNF: TNF;
  // loResult: Integer;
begin
  with FrmPDV do
  begin
    // FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(FrmPDV);
    try
      // FrmPDV_Autorizacao.lblTitle.Caption := 'Desconto';
      // FrmPDV_Autorizacao.goParamId        := 292;
      // if FrmPDV_Autorizacao.ShowModal <> mrOK then
      // exit;

      FrmPDV_Desconto := TFrmPDV_Desconto.Create(FrmPDV);
      try
        loNF := goPDVClass.GetTotaisNF(goPnf_id);
        try
          FrmPDV_Desconto.goUserId    := 1;
          FrmPDV_Desconto.goTotal     := loNF.TotalProd;
          FrmPDV_Desconto.goDesconto  := loNF.Desconto;
          FrmPDV_Desconto.goAcrescimo := loNF.Acrescimo;
        finally
          if Assigned(loNF) then
            loNF.Destroy;
        end;
        if FrmPDV_Desconto.ShowModal = mrOK then
        begin
          with FrmPDV_DModule do
          begin
            adStoreProc1.Connection     := ADConnection1;
            adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
            adStoreProc1.StoredProcName := 'proc_aplica_desconto_nf';
            adStoreProc1.SchemaName     := 'pdv';
            adStoreProc1.Prepare;
            // adStoreProc1.Params.ParamByName('@pterm_id').AsString := goPterm_id;
            adStoreProc1.Params.ParamByName('@pnf_id').AsInteger           := goPnf_id;
            adStoreProc1.Params.ParamByName('@pnf_desconto_perc').AsFmtBCD := FrmPDV_Desconto.edDescPerc.Value;
            adStoreProc1.Params.ParamByName('@pnf_desconto').AsFmtBCD      := FrmPDV_Desconto.edDescValor.Value;
            adStoreProc1.Params.ParamByName('@pnf_tipo').AsInteger         := FrmPDV_Desconto.goTipo;
            adStoreProc1.execProc;

            // if adStoreProc1.FindParam('@max') <> nil then
            // loResult := adStoreProc1.ParamByName('@max').AsInteger;

            loNF := goPDVClass.GetTotaisNF(goPnf_id);
            try
              doSetTotaisNF(loNF);
              doSetTotaisNFEncerra(loNF);
              edValorForma.Value := loNF.TotalAPagar;
            finally
              if Assigned(loNF) then
                loNF.Destroy;
            end;
          end;
        end;
      finally
        FrmPDV_Desconto.Destroy;
        FrmPDV_Desconto := nil;
      end;
    finally
      Setfocus;
      // FrmPDV_Autorizacao.Destroy;
      // FrmPDV_Autorizacao := nil;
    end;
  end;
end;

procedure doCancelaVenda;
// var
// loResult: Integer;
begin
  try
    with FrmPDV, FrmPDV_DModule do
    begin
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_cancela_nf';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      // adStoreProc1.Params.ParamByName('@pterm_id').As      String := goPterm_id;
      // cancela a Nota Fiscal Erimar
      adStoreProc1.Params.ParamByName('@pnf_id').AsInteger := FrmPDV_DModule_DS.fdNotas.FieldByName('pnf_id').AsInteger;
      adStoreProc1.execProc;

      // if adStoreProc1.FindParam('@max') <> nil then
      // loResult := adStoreProc1.ParamByName('@max').AsInteger;
    end;
  except
    on e: exception do
    begin
      // loResult := -1;
      FrmPDV_DModule.cdsEmpresa.GetSysMessages(true, FrmPDV);
    end;
  end;
end;

procedure doConfirmaPagamento;
var
  loPnfp_id, lofp_codigo : Integer;
  lofp_descricao         : string;
  loWiBiRespostaValidador: TWiBiRespostaValidador;
  loPOSManual            : Boolean;
  loNF                   : TNF;
  loadq_id               : Integer;
  lopos_id               : Integer;
  loNSU_SITEF            : string;
  loNSU_HOSTTEF          : string;
  loNSU_BANDEIRA         : string;
  loParcelas             : string;
  loComprovante1aVia     : string;
  loComprovante2aVia     : string;
  vValor                 : Currency;
  vValorTotal            : Currency;
  // campos do cart�o
  loCodOperadora: Integer;
  // dados da resposta TEF, guardados s� para um eventual estorno
  loCodigoAutorizacaoTEF    : string;
  loDataHoraTransacaoHostTEF: TDateTime;
  loFinalizacaoTEF          : string;
  loValorTotalTEF           : Double;
begin

  with FrmPDV do
  begin
    loadq_id := 0;
    lopos_id := 0;

    edValorForma.ValidateEdit(false);
    if edValorForma.Value <= 0 then
      exit;

    loPOSManual             := false;
    loWiBiRespostaValidador := nil;

    loNF             := goPDVClass.GetTotaisNF(goPnf_id);
    FrmPDV_FormasPag := TFrmPDV_FormasPag.Create(FrmPDV);
    try
      vValor                             := edValorForma.Value;
      vValorTotal                        := (loNF.TotalProd + loNF.Acrescimo);
      FrmPDV_FormasPag.goSomenteDinheiro := vValor > vValorTotal;
      if FrmPDV_FormasPag.ShowModal = mrOK then
      begin
        lofp_codigo    := FrmPDV_FormasPag.gofp_codigo;
        lofp_descricao := FrmPDV_FormasPag.gofp_descricao;

        { Recebimento no TEF - Cart�o de Crédito e Débito }
        if (goTerminal.pterm_tef) and (FrmPDV_FormasPag.gofp_cartao) then
        begin
          if FrmPDV.EfetuarPagamentoTEF(loNF.NumeroFiscal.ToString, edValorForma.Value, FrmPDV_FormasPag.gofp_debito)
          then
          begin
            with FrmPDV.ACBrTEFAPI1.UltimaRespostaTEF do
            begin
              loNSU_SITEF                := NSU_TEF;
              loNSU_HOSTTEF              := NSU;
              loNSU_BANDEIRA             := Rede;
              loParcelas                 := QtdParcelas.ToString;
              loComprovante1aVia         := ImagemComprovante1aVia.Text;
              loComprovante2aVia         := ImagemComprovante2aVia.Text;
              loCodigoAutorizacaoTEF     := CodigoAutorizacaoTransacao;
              loDataHoraTransacaoHostTEF := DataHoraTransacaoHost;
              loFinalizacaoTEF           := Finalizacao;
              loValorTotalTEF            := ValorTotal;
            end;

            loPnfp_id := doAdicFormaNF(lofp_codigo, 0, loWiBiRespostaValidador, loPOSManual, loadq_id, lopos_id,
              loNSU_SITEF, loNSU_HOSTTEF, loNSU_BANDEIRA, loParcelas, loComprovante1aVia, loComprovante2aVia);
            if loPnfp_id = 0 then
            begin
              { pagamento j� aprovado no cart�o, mas falhou ao gravar localmente -> estornar }
              FrmPDV.EstornarTransacaoTEF(loNSU_HOSTTEF, loCodigoAutorizacaoTEF, loNSU_BANDEIRA, loFinalizacaoTEF,
                loDataHoraTransacaoHostTEF, loValorTotalTEF);
              exit;
            end;
            doAddFormaList(lofp_codigo, loPnfp_id, lofp_descricao);

            if not doNFFechamento then
            begin
              { nota n�o finalizada (SEFAZ/SAT/impress�o) ap�s d�bito aprovado -> estornar }
              FrmPDV.EstornarTransacaoTEF(loNSU_HOSTTEF, loCodigoAutorizacaoTEF, loNSU_BANDEIRA, loFinalizacaoTEF,
                loDataHoraTransacaoHostTEF, loValorTotalTEF);
              exit;
            end;
            doNFSituacaoFechamento;
          end
          else
            exit; { pagamento negado ou falhou -- nada a persistir, volta pra tela de formas de pagamento }
        end;

        { Recebimento no TEF - Pix (QR Code) }
        if (goTerminal.pterm_tef) and (FrmPDV_FormasPag.gofp_pix) then
        begin
          if FrmPDV.EfetuarPagamentoTEFPix(loNF.NumeroFiscal.ToString, edValorForma.Value) then
          begin
            with FrmPDV.ACBrTEFAPI1.UltimaRespostaTEF do
            begin
              loNSU_SITEF                := NSU_TEF;
              loNSU_HOSTTEF              := NSU;
              loNSU_BANDEIRA             := Rede;
              loParcelas                 := QtdParcelas.ToString;
              loComprovante1aVia         := ImagemComprovante1aVia.Text;
              loComprovante2aVia         := ImagemComprovante2aVia.Text;
              loCodigoAutorizacaoTEF     := CodigoAutorizacaoTransacao;
              loDataHoraTransacaoHostTEF := DataHoraTransacaoHost;
              loFinalizacaoTEF           := Finalizacao;
              loValorTotalTEF            := ValorTotal;
            end;

            loPnfp_id := doAdicFormaNF(lofp_codigo, 0, loWiBiRespostaValidador, loPOSManual, loadq_id, lopos_id,
              loNSU_SITEF, loNSU_HOSTTEF, loNSU_BANDEIRA, loParcelas, loComprovante1aVia, loComprovante2aVia);
            if loPnfp_id = 0 then
            begin
              { pagamento j� aprovado no Pix, mas falhou ao gravar localmente -> estornar }
              FrmPDV.EstornarTransacaoTEF(loNSU_HOSTTEF, loCodigoAutorizacaoTEF, loNSU_BANDEIRA, loFinalizacaoTEF,
                loDataHoraTransacaoHostTEF, loValorTotalTEF);
              exit;
            end;
            doAddFormaList(lofp_codigo, loPnfp_id, lofp_descricao);

            if not doNFFechamento then
            begin
              { nota n�o finalizada (SEFAZ/SAT/impress�o) ap�s Pix aprovado -> estornar }
              FrmPDV.EstornarTransacaoTEF(loNSU_HOSTTEF, loCodigoAutorizacaoTEF, loNSU_BANDEIRA, loFinalizacaoTEF,
                loDataHoraTransacaoHostTEF, loValorTotalTEF);
              exit;
            end;
            doNFSituacaoFechamento;
          end
          else
            exit; { pagamento negado, cancelado ou falhou -- nada a persistir, volta pra tela de formas de pagamento }
        end;
{$REGION 'Recebimento no POS - Cart�o de Cr�dito e D�bito'}
        if (goTerminal.pterm_pos) and (FrmPDV_FormasPag.gofp_cartao) then
        begin
          FrmPDV_POS := TFrmPDV_POS.Create(FrmPDV);
          try
            FrmPDV_POS.ShowModal;
            if (not FrmPDV_POS.gWizardFinished) then
              exit;
            loadq_id            := FrmPDV_POS.goadq_id;
            lopos_id            := FrmPDV_POS.gopos_id;
            loCodOperadora      := FrmPDV_POS.goop_codigo;
            cxTabSheet2.Enabled := false;

            // pos manaul novo menu wizard
            loNSU_SITEF    := 'I9MOBILE';
            loNSU_HOSTTEF  := FrmPDV_POS.goAutorizacao;
            loParcelas     := FrmPDV_POS.goParcela.ToString;
            loNSU_BANDEIRA := FrmPDV_POS.goOp_descricao;

            loPnfp_id := doAdicFormaNF(lofp_codigo, loCodOperadora, loWiBiRespostaValidador, loPOSManual, loadq_id,
              lopos_id, loNSU_SITEF, loNSU_HOSTTEF, loNSU_BANDEIRA, loParcelas, loComprovante1aVia, loComprovante2aVia);
            if loPnfp_id = 0 then
              exit;
            doAddFormaList(lofp_codigo, loPnfp_id, lofp_descricao);

            if not doNFFechamento then
              exit;
            doNFSituacaoFechamento;

          finally
            FrmPDV_POS.Destroy;
            cxTabSheet2.Enabled := true;
          end;
        end;
{$ENDREGION}
        if not (FrmPDV_FormasPag.gofp_cartao or (goTerminal.pterm_tef and FrmPDV_FormasPag.gofp_pix)) then
        begin
          if loWiBiRespostaValidador = nil then
            loWiBiRespostaValidador := TWiBiRespostaValidador.Create;

          loPnfp_id := doAdicFormaNF(lofp_codigo, loCodOperadora, loWiBiRespostaValidador, loPOSManual, loadq_id,
            lopos_id, loNSU_SITEF, loNSU_HOSTTEF, loNSU_BANDEIRA, loParcelas, loComprovante1aVia, loComprovante2aVia);
          if loPnfp_id = 0 then
            exit;
          doAddFormaList(lofp_codigo, loPnfp_id, lofp_descricao);

          if not doNFFechamento then
            exit;
          doNFSituacaoFechamento;
        end;

      end;
    finally
      FrmPDV_FormasPag.Destroy;
      FrmPDV_FormasPag := nil;
      if cxPageControl1.ActivePageIndex = 1 then
      begin
        edValorForma.Setfocus;
        edValorForma.SelectAll;
      end;
      if Assigned(loNF) then
        loNF.Destroy;
      if Assigned(loWiBiRespostaValidador) then
        loWiBiRespostaValidador.Destroy;
    end;
  end;
end;

end.
