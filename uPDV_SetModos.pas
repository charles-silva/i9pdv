unit uPDV_SetModos;

interface

uses
  Forms, Controls, Winapi.Windows, System.Classes, uGlobalLibPDV, Vcl.Graphics, FireDAC.Stan.Option,
  System.SysUtils;

procedure doSetModoCancela;
procedure doSetModoNormal(const AClear: Boolean = true);
procedure doSetRotuloPrincipal(aCaption: String);
procedure doSetModoConsultaPreco(const aDisable: Boolean = false);
procedure doSetModoCancelaItem(const aDisable: Boolean = false; const ATipoMsg: Integer = MB_YESNOCANCEL);

implementation

{ M�todos Set }

uses uFrmPDV, uPDV_SetValores, uPDV_NF, uPDVLib, uFrmPDV_Autorizacao, uFrmPDV_DModule_DS, uFrmPDV_DModule,
  Vcl.Dialogs;

procedure doSetModoConsultaPreco(const aDisable: Boolean = false);
var
  I: Integer;
begin
  with FrmPDV do
  begin
    if not aDisable then
    begin
      doSetRotuloPrincipal('');
      VisibleComponentes(FrmPDV, 99, true);
      shp1.Brush.Color     := FrmPDV.CordoMes.Color; // $000068FA;
      shp2.Brush.Color     := FrmPDV.CordoMes.Color; // $000068FA;
      lblMsgRapida.Caption := 'Pressione [ESC] para sair da consulta';
      lblMsgRapida.Visible := true;
      pnItens.Visible      := false;

      shpFotoBack.left := 473;
      shpFotoBack.Top  := 78;
      shpFoto.left     := 538;
      shpFoto.Top      := 117;
      imgProduto.left  := 553;
      imgProduto.Top   := 139;

    end
    else
    begin
      shp1.Brush.Color := FrmPDV.CordoMes.Color; // $005B5909;
      shp2.Brush.Color := FrmPDV.CordoMes.Color; // $005B5909;
      doClearItem;
      doSetRotuloPrincipal('');
      VisibleComponentes(FrmPDV, 99, true);
      lblMsgRapida.Visible := false;
      pnItens.Visible      := true;

      shpFotoBack.left := 5;
      shpFotoBack.Top  := 154;
      shpFoto.left     := 70;
      shpFoto.Top      := 193;
      imgProduto.left  := 85;
      imgProduto.Top   := 215;

      for I := 0 to ComponentCount - 1 do
        if Components[I].Tag = 98 then
          TControl(Components[I]).Visible := false;
    end;

    goQueryPriceMode := not aDisable;

    shp3.Visible        := aDisable;
    lblQtd.Visible      := aDisable;
    shpFotoBack.Visible := aDisable;
    // shpFoto.Visible     := aDisable;
    imgProduto.Visible := aDisable;

    lblQuantProd.Visible := aDisable;
    doSetMsgEstado;
  end;
end;

procedure doSetModoCancelaItem(const aDisable: Boolean = false; const ATipoMsg: Integer = MB_YESNOCANCEL);
var
  loResultMsg: Integer;
  loProduto  : TProduto;
  loNF       : TNF;
begin
  with FrmPDV do
  begin
    if not aDisable then
    begin
      FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(FrmPDV);
      try
        FrmPDV_Autorizacao.lblTitle.Caption := 'Cancelamento de item';
        FrmPDV_Autorizacao.goParamId        := 294;
        if FrmPDV_Autorizacao.ShowModal <> mrOK then
          exit;
      finally
        Setfocus;
        FrmPDV_Autorizacao.Destroy;
        FrmPDV_Autorizacao := nil;
      end;

      FrmPDV.goIdxCancel := 21;
      doSetRotuloPrincipal('');
      VisibleComponentes(FrmPDV, 99, true);
      shp1.Brush.Color     := clRed;
      shp2.Brush.Color     := clRed;
      lblMsgRapida.Caption := 'Pressione ESC para concluir o cancelamento';
      lblMsgRapida.Visible := true;

      FrmPDV_DModule_DS.dsItensDelete.close;
      FrmPDV_DModule_DS.dsItensDelete.ParamByName('pnf_id').AsInteger := goPnf_id;
      FrmPDV_DModule_DS.dsItensDelete.active                          := true;
    end
    else
    begin
      loResultMsg := idNO;
      if (goIdxCancel > 21) and goCancelItemMode then
        loResultMsg := MessageBox(handle, PChar('Confirmar exclus�o do iten(s) marcado(s) ?'), 'I9 PDV',
          MB_ICONQUESTION + ATipoMsg + MB_DEFBUTTON1);
      case loResultMsg of
        idNO:
          begin
            FrmPDV_DModule.ADConnection1.TxOptions.AutoCommit       := true;
            FrmPDV_DModule.ADConnection1.TxOptions.DisconnectAction := xdCommit;
            if FrmPDV_DModule.ADConnection1.InTransaction then
              FrmPDV_DModule.ADConnection1.Rollback;
          end;
        idYes:
          begin
            FrmPDV_DModule.ADConnection1.TxOptions.AutoCommit       := true;
            FrmPDV_DModule.ADConnection1.TxOptions.DisconnectAction := xdCommit;
            if FrmPDV_DModule.ADConnection1.InTransaction then
              FrmPDV_DModule.ADConnection1.Commit;
          end;
        idCancel:
          exit;
      end;
      goIdxCancel := 21;
      VisibleComponentes(FrmPDV, 21, true);
      VisibleComponentes(FrmPDV, 22, true);
      VisibleComponentes(FrmPDV, 23, true);
      VisibleComponentes(FrmPDV, 24, true);
      VisibleComponentes(FrmPDV, 25, true);
      VisibleComponentes(FrmPDV, 26, true);

      shp1.Brush.Color := FrmPDV.CordoMes.Color; // $005B5909;
      shp2.Brush.Color := FrmPDV.CordoMes.Color; // $005B5909;
      doClearItem;
      doSetRotuloPrincipal('');
      VisibleComponentes(FrmPDV, 99, true);
      lblMsgRapida.Visible := false;

      FrmPDV_DModule_DS.dsItensDelete.close;
      { Consulta se h� nota fiscal em andamento }
      loNF := goPDVClass.GetNF(goPterm_id, 0);

      try
        if loNF <> nil then
        begin
          doSetTotaisNF(loNF);
          doAddItensList(loNF.NFItens);
        end;
      finally
        if Assigned(loNF) then
          loNF.Destroy;
      end;
    end;

    goCancelItemMode    := not aDisable;
    shpFotoBack.Visible := aDisable;
    // shpFoto.Visible     := aDisable;
    imgProduto.Visible := aDisable;

    shp3.Visible         := aDisable;
    lblQtd.Visible       := aDisable;
    lblQuantProd.Visible := aDisable;

    doSetMsgEstado;
  end;
end;

procedure doSetModoCancela;
var
  loResult: Integer;
begin
  with FrmPDV do
  begin
    goCancelMode := true;
    doSetMsgEstado;
    shp1.Brush.Color  := clRed;
    shp2.Brush.Color  := clRed;
    shp3.Brush.Color  := clRed;
    shp6.Brush.Color  := clRed;
    shp7.Brush.Color  := clRed;
    shp8.Brush.Color  := clRed;
    lblMensagem.Color := clRed;
    lblVolumes.Color  := clRed;
    lblSubTotal.Color := clRed;
    loResult          := 0;

    try
      loResult           := 1;
      FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(FrmPDV);
      try
        FrmPDV_Autorizacao.lblTitle.Caption := 'Cancelando a venda';
        FrmPDV_Autorizacao.goParamId        := 287;
        if FrmPDV_Autorizacao.ShowModal <> mrOK then
          exit;
      finally
        Setfocus;
        FrmPDV_Autorizacao.Destroy;
        FrmPDV_Autorizacao := nil;
      end;
      try
        with FrmPDV_DModule do
        begin
          adStoreProc1.Connection     := ADConnection1;
          adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
          adStoreProc1.StoredProcName := 'proc_cancela_nf';
          adStoreProc1.SchemaName     := 'pdv';
          adStoreProc1.Prepare;
          // adStoreProc1.Params.ParamByName('@pterm_id').AsString := goPterm_id;
          adStoreProc1.Params.ParamByName('@pnf_id').AsInteger := goPnf_id;
          adStoreProc1.execProc;
          //  cancelamento de cupom Erimar

          if adStoreProc1.FindParam('@max') <> nil then
            loResult := adStoreProc1.ParamByName('@max').AsInteger;

          { venda cancelada (fun��o 202): desfaz a autoriza��o TEF ainda
            pendente, se houver -- ver goTEFPnfp_idPendente em uFrmPDV.pas }
          if goTEFPnfp_idPendente > 0 then
            DesfazerTransacaoTEF;
        end;
      except
        on E: Exception do
        begin
          loResult := -1;
          FrmPDV_DModule.cdsEmpresa.GetSysMessages(true, FrmPDV);
        end;
      end;
    finally
      goCancelMode := false;
      FrmPDV_DModule.cdsEmpresa.GetSysMessages(true, FrmPDV);
      doSetModoNormal(loResult = 0);
      Setfocus;
    end;
  end;
end;

procedure doSetModoNormal(const AClear: Boolean = true);
begin
  with FrmPDV do
  begin
    shp1.Brush.Color  := FrmPDV.CordoMes.Color; // $005B5909;
    shp2.Brush.Color  := FrmPDV.CordoMes.Color; // $005B5909;
    shp3.Brush.Color  := FrmPDV.CordoMes.Color; // $005B5909;
    shp6.Brush.Color  := FrmPDV.CordoMes.Color; // $005B5909;
    shp7.Brush.Color  := FrmPDV.CordoMes.Color; // $005B5909;
    shp8.Brush.Color  := FrmPDV.CordoMes.Color; // $005B5909;
    lblMensagem.Color := $005B5909;
    lblVolumes.Color  := $005B5909;
    lblSubTotal.Color := $005B5909;
    if AClear then
    begin
      doClearItem;
      doClearEncerra;
      doClear;
      goPnf_id := 0;
    end;
    doSetMsgEstado;
  end;
end;

procedure doSetRotuloPrincipal(aCaption: String);
begin
  FrmPDV.lblMainProdutoDescr.Caption := Copy(aCaption, 1, 60);
end;

end.
