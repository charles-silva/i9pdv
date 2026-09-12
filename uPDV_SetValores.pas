unit uPDV_SetValores;

interface

uses System.SysUtils, System.Math, Vcl.Graphics, Vcl.Controls, Winapi.Windows, uPDVLib, uPDV_SetModos, Clipbrd;

procedure doSetMsgEstado;
procedure doSetProduto;
procedure doSetTerminal;
procedure doSetCaixa;
procedure doSetCaixaOperador;
procedure doSetTotaisNF(aNF: TNF);
procedure doSetTotaisNFEncerra(aNF: TNF);

var
  vCEstoque, vqtd: string;

implementation

uses uFrmPDV, uGlobalLibPDV, uFrmPDV_DModule, uFrmPDV_DModule_DS, uPDV_NF,
  Vcl.Dialogs;

procedure doSetMsgEstado;
begin
  with FrmPDV do
  begin
    lblSequencial.Caption := FormatCurr('000000', goPnf_id);
    shp8.Brush.Color      := FrmPDV.CordoMes.Color; // $005B5909;
    // lblMensagem.Color      := $005B5909;
    lblMensagem.font.Color := clWhite;
    if goPcx_id = 0 then
    begin
      lblMensagem.Caption    := 'Caixa Fechado';
      shp7.Brush.Color       := clBlack;
      shp8.Brush.Color       := clBlack;
      lblMensagem.Color      := clBlack;
      lblStatusTotal.Caption := FormatCurr('#,##0.00', 0);
    end
    else
    begin
      if goPcxo_id = 0 then
        lblMensagem.Caption := 'Sem Operador'
      else if goPnf_id = 0 then
      begin
        // lblMensagem.Font.Color := clYellow;
        lblMensagem.Caption := 'Caixa Livre';
      end;
      if goPnf_id > 0 then
        lblMensagem.Caption := 'Em Andamento';

      if goCancelMode then
        lblMensagem.Caption := 'Cancelamento do Cupom';

      if goQueryPriceMode then
        lblMensagem.Caption := 'Consultando Preço';

      if goCancelItemMode then
      begin
        case goTipoCancelaItem of
          tciPorCodigo:
            lblMensagem.Caption := 'Cancelamento por Código';
          tciPorSeq:
            lblMensagem.Caption := 'Cnncelamento por Registro';
        end;
      end;
    end;
  end;
end;

procedure doSetProduto;
var
  loNF              : TNF;
  loProduto         : TProduto;
  I                 : Integer;
  loPeso            : Double;
  loTipoEtiquetaUnit: Boolean;
  loBufferQtd       : String;
  lofracionado      : Double;
  vValorEtiqueta    : Double;
begin
  with FrmPDV do
  begin
    if goQueryPriceMode then
    begin
      loProduto := goPDVClass.GetProd(goQtdProdBuffer, goBuffer);
      try
        if loProduto <> nil then
        begin
          goCurrentProdCod              := loProduto.EAN;
          lblCodigo.Caption             := loProduto.EAN;
          lblQueryPriceValor.Caption    := loProduto.ValorStr;
          lblQueryPriceUnit.Caption     := loProduto.Unidade;
          lblQueryCodigoInterno.Caption := loProduto.Codigo;
          lblQueryPriceStock.Caption    := loProduto.TemEstoqueDispStr;
          doSetRotuloPrincipal(FloatToStr(loProduto.Quantidade) + ' x ' + loProduto.Descricao);
          VisibleComponentes(FrmPDV, 99, true);
          shpFotoBack.Visible := true;
          imgProduto.Visible  := true;

          for I := 0 to FrmPDV.ComponentCount - 1 do
            if Components[I].Tag = 98 then
            begin
              TControl(Components[I]).Parent  := cxTabSheet1;
              TControl(Components[I]).Visible := true;
            end;
        end
        else
          MessageBox(handle, 'Produto não Cadastrado.', 'I9 - PDV', MB_ICONEXCLAMATION);
      finally
        if Assigned(loProduto) then
          loProduto.Destroy;
      end;
      Exit;
    end;

    if goCancelItemMode then
    begin
      try
        if doFindItemCancel(StrToInt(goBuffer), loProduto) then
        begin
          doSetRotuloPrincipal(FloatToStr(loProduto.Quantidade) + ' x ' + loProduto.Descricao);
          VisibleComponentes(FrmPDV, 99);
        end
        else
          lblCodigo.Caption := goCurrentProdCod;
      finally
        if Assigned(loProduto) then
          loProduto.Destroy;
      end;
      Exit;
    end;

    loTipoEtiquetaUnit := False;
    vValorEtiqueta     := 0;

    if (Copy(goBuffer, 1, 1) = '2') and (Length(goBuffer) = 13) then
    begin
      loBufferQtd        := Copy(goBuffer, 6, 7);
      vValorEtiqueta     := StrToFloat(Copy(loBufferQtd, 1, 5) + ',' + Copy(loBufferQtd, 6, 2));
      goBuffer           := Copy(goBuffer, 2, 4);
      loTipoEtiquetaUnit := true;
      loProduto          := goPDVClass.GetProd(0, goBuffer);
    end
    else
      loProduto := goPDVClass.GetProd(goQtdProdBuffer, goBuffer);

    try
      if loProduto = nil then
      begin
        MessageBox(handle, 'Produto não Cadastrado.', 'I9 - PDV', MB_ICONEXCLAMATION);
        doSetRotuloPrincipal('');
        VisibleComponentes(FrmPDV, 99, true);
        doClearItem;
        Exit;
      end;

      doNovaNF;

      if (loTipoEtiquetaUnit) and (vValorEtiqueta = 0) and (not loProduto.balanca) then
      begin
        goQtdProdBuffer      := 1;
        loProduto.Quantidade := 1;
      end;

      if loProduto.EAN <> '' then
      begin
        goCurrentProdCod  := loProduto.EAN;
        lblCodigo.Caption := loProduto.EAN;
      end
      else
      begin
        goCurrentProdCod  := loProduto.Codigo;
        lblCodigo.Caption := loProduto.Codigo;
      end;

      vqtd := StringReplace(FloatToStr(loProduto.Quantidade), ',', '.', [rfReplaceAll, rfIgnoreCase]);

      with FrmPDV.a1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select p.Codigo,e.EstoqueR,E.EstoqueF,E.MultVendad as Mvenda,clfiscal,' +
          'isnull((select top 1 pp_preco from PRODUTOS_PRECOS where PP_CODIGO=' + loProduto.Codigo + ' and ' + vqtd +
          ' between  PP_QTD_DE and PP_QTDATE  ),0) as PrecoQ ' + 'from Produtos p ' +
          'join estoque e on e.e_produto=p.Codigo  and e.e_loja= 1 ' + 'where p.codigo =' + loProduto.Codigo);
        Open;
      end;

      if FrmPDV.a1.RecordCount > 0 then
      begin
        if FrmPDV.a1.FieldByName('clfiscal').AsString = '' then
        begin
          ShowMessage('Produto sem o NCM ');
          Exit;
        end;

        if FrmPDV.a1.FieldByName('PrecoQ').Value > 0 then
          loProduto.Valor := FrmPDV.a1.FieldByName('PrecoQ').Value;

        if loTipoEtiquetaUnit then
        begin
          if loProduto.Valor > 0 then
          begin
            loProduto.Quantidade := RoundTo(vValorEtiqueta / loProduto.Valor, -3); // vValorEtiqueta / loProduto.Valor;
            goQtdProdBuffer      := loProduto.Quantidade;                          // 3 casas decimais
          end
          else
          begin
            ShowMessage('Produto sem preço de venda para calcular o peso.');
            Exit;
          end;
        end;

        { lofracionado := loProduto.Quantidade / FrmPDV.a1.FieldByName('Mvenda').Value;      geovana
          if Copy(FormatFloat('00000000.000', lofracionado), 10, 3) <> '000' then
          begin
          ShowMessage('Produto com multiplo de ' + FrmPDV.a1.FieldByName('Mvenda').AsString + #13 +
          'So é permitida a venda com multiplo de venda');
          Exit;
          end; }
        if not loTipoEtiquetaUnit then
        begin
          lofracionado := loProduto.Quantidade / FrmPDV.a1.FieldByName('Mvenda').Value;
          if Copy(FormatFloat('00000000.000', lofracionado), 10, 3) <> '000' then
          begin
            ShowMessage('Produto com multiplo de ' + FrmPDV.a1.FieldByName('Mvenda').AsString + #13 +
              'So é permitida a venda com multiplo de venda');
            Exit;
          end;
        end;
      end;

      if FrmPDV.vCEstoque = 'N' then
      begin
        if FrmPDV.a1.FieldByName('EstoqueF').Value < loProduto.Quantidade then
        begin
          ShowMessage('Produto sem Estoque. Não é possivel a venda');
          Exit;
        end;
      end;

      lblUnidadeProd.Caption := loProduto.Unidade;
      lblVrUnitProd.Caption  := loProduto.ValorStr;

      if loProduto.balanca and (goTerminal.balanca <> nil) and (goQtdProdBuffer = 0) then
      begin
        try
          if doGetPesoBalanca(loPeso) then
          begin
            lblQuantProd.Caption := FormatCurr('#,###0.000', loPeso);
            goQtdProdBuffer      := loPeso;
            loProduto.Quantidade := loPeso;
          end
          else
          begin
            raise Exception.Create('');
            Exit;
          end;
        except
          MessageBox(handle,
            'Não foi possivel ler o peso na balança, digite o peso e pressione * antes de informar o produto.',
            'I9 PDV', MB_ICONINFORMATION);
          doClearItem;
          Exit;
        end;
      end
      else
        lblQuantProd.Caption := FormatCurr('#,###0.000', loProduto.Quantidade);

      lblVrTotalProd.Caption := loProduto.TotalStr;
      doSetRotuloPrincipal(FloatToStr(loProduto.Quantidade) + ' x ' + loProduto.Descricao);
      VisibleComponentes(FrmPDV, 99);

      doAdicProdNF(loProduto);
    finally
      if Assigned(loProduto) then
        loProduto.Destroy;
    end;

    loNF := goPDVClass.GetNF(goPterm_id, 0);
    try
      if loNF <> nil then
        doAddItensList(loNF.NFItens);
    finally
      if Assigned(loNF) then
        loNF.Destroy;
    end;

    loNF := goPDVClass.GetTotaisNF(goPnf_id);
    try
      doSetTotaisNF(loNF);
      goBuffer        := '';
      goQtdProdBuffer := 0;
      goInserted      := true;
    finally
      if Assigned(loNF) then
        loNF.Destroy;
    end;
  end;
end;

procedure doSetTotaisNF(aNF: TNF);
begin
  with FrmPDV do
  begin
    lblVolumes.Caption       := FormatCurr('000', aNF.Volumes);
    lblSubTotal.Caption      := aNF.TotalProdStr;
    lblLabelSubTotal.Caption := 'SubTotal';
    lblStatusTotal.Caption   := 'R$ ' + FormatFloat('0,.00', aNF.TotalProd);
    if aNF.Desconto > 0 then
    begin
      lblLabelSubTotal.Caption := 'DESCONTO';
      lblStatusTotal.Caption   := 'R$ ' + FormatFloat('0,.00', aNF.TotalProd - aNF.Desconto);
    end
    else if aNF.Acrescimo > 0 then
    begin
      lblLabelSubTotal.Caption := 'ACRÉSCIMO';
      lblStatusTotal.Caption   := 'R$ ' + FormatFloat('0,.00', aNF.TotalProd + aNF.Acrescimo);
    end;
    lblAcreDesc.Caption   := aNF.GetDescAcresStr;
    lblAcreDesc.Visible   := (aNF.Desconto > 0) or (aNF.Acrescimo > 0);
    lblSequencial.Caption := FormatCurr('000000', aNF.IDNF);
  end;
end;

procedure doSetTotaisNFEncerra(aNF: TNF);
begin
  with FrmPDV do
  begin
    lblVolumesEncerra.Caption     := FormatCurr('000', aNF.Volumes);
    lblTotalCompraEncerra.Caption := aNF.TotalProdStr;
    lblTotalPagoEncerra.Caption   := aNF.TotalPagoStr;
    lblDescontoAcrescimo.Caption  := aNF.GetDescAcresStr;
    lblValorAPagarEncerra.Caption := aNF.TotalAPagarStr;
    lblValoraPagarTitle.Caption   := 'Restante a Pagar';
  end;
end;

procedure doSetTerminal;
begin
  with FrmPDV do
  begin
    // lblTerminal.Caption := goTerminal.pterm_id;
    lblLastSync.Caption := goTerminal.pterm_last_sync_str;
    // lblServidor.Caption := GetFieldInString(FrmPDV_DModule.ADConnection1.Params.Values['Server'] + ',', 1, ',') + ' (' +
    // FrmPDV_DModule.ADConnection1.Params.Values['Database'] + ')';
    // lblServidorCaption.left := lblServidor.left - (lblServidorCaption.width + 5);
    goPterm_id := goTerminal.pterm_id;
    FrmPDV_DModule_DS.dsTeclas.Close;
    FrmPDV_DModule_DS.dsTeclas.ParamByName('em_codigo').AsInteger := ServerEmpresa;
    FrmPDV_DModule_DS.dsTeclas.active                             := true;
  end;
end;

procedure doSetCaixa;
begin
  with FrmPDV do
  begin
    lblCaixa.Caption        := FormatFloat('000', goCaixa.pcx_id);
    lblDataAbertura.Caption := goCaixa.pcx_data_abertura_str;
    goPcx_id                := goCaixa.pcx_id;
    doSetMsgEstado;
  end;
end;

procedure doSetCaixaOperador;
begin
  with FrmPDV do
  begin
    lblCaixaOperador.Caption := goCaixaOperador.us_apelido;
    // lblCaixaOperador.Caption := FormatFloat('000', goCaixaOperador.pcxo_id);
    // lblOperador.Caption      := goCaixaOperador.us_apelido;
    goPcxo_id := goCaixaOperador.pcxo_id;
    doSetMsgEstado;
  end;
end;

end.
