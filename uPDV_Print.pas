unit uPDV_Print;

interface

uses System.SysUtils, Vcl.Forms;

{ Rotinas de Impressão }
procedure doPrintResumoCaixa;
procedure doPrintNFCe;
procedure doPrintVenda;
procedure doPrintTEF(apnf_id: Integer);
procedure doPrintSangria(apcxo_id, apcxov_trans_id: Integer; a2via: Boolean);



implementation

uses uFrmPDV, uFrmPDV_DModule_DS, uFrmPDV_NFCe;

procedure doPrintResumoCaixa;
begin
  try
    with FrmPDV, FrmPDV_DModule_DS do
    begin
      ppResumoCaixa.DeviceType                := 'Printer';
      ppResumoCaixa.ShowPrintDialog           := false;
      ppResumoCaixa.PrinterSetup.PrinterName  := goTerminal.Impressora.pimp_impressora;
      ppResumoCaixa.PrinterSetup.DocumentName := 'Resumo Caixa ' + dsResumoCaixa.FieldByName('pcxo_id').AsString;
      ppResumoCaixa.PrinterSetup.PaperHeight  := (ppHeaderResumoVenda.Height + ppFooterBandResumoVendas.Height + ppSummaryBandResumoVenda.Height) + (ppTitleBandResumoFormas.Height + ppSummaryBandResumoFormas.Height) + (ppDetailBandResumoVenda.Height * (dsResumoVenda.RecordCount)) +
        (ppDetailBandResumoFormas.Height * (dsResumoFormasPag.RecordCount));
      ppResumoCaixa.PrinterSetup.PaperHeight := ppResumoCaixa.PrinterSetup.PaperHeight + (ppResumoCaixa.PrinterSetup.PaperHeight * 0.02);
      ppResumoCaixa.Print;
    end;
  except
  end;
end;

procedure doPrintNFCe;
begin
  try
    if Assigned(FrmPDV_NFCe) then
      if FrmPDV_NFCe.ACBrNFe.NotasFiscais.Count > 0 then
        FrmPDV_NFCe.ACBrNFe.NotasFiscais.Imprimir;
  except
  end;
end;

procedure doPrintVenda;
begin
  try
    with FrmPDV, FrmPDV_DModule_DS do
    begin
      if dsVendas.FieldByName('pnf_status').AsInteger = 6 then
        lblTitleVenda.Caption := 'Comprovante de Cancelamento'
      else
        lblTitleVenda.Caption := 'Documento Sem Valor Fiscal';
      if FileExists(ExtractFilePath(Application.ExeName) + 'logo_print.png') then
        ppImage1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo_print.png');
      ppVenda.DeviceType                := 'Printer';
      ppVenda.ShowPrintDialog           := false;
      ppVenda.PrinterSetup.PrinterName  := goTerminal.Impressora.pimp_impressora;
      ppVenda.PrinterSetup.DocumentName := 'Venda ' + dsVendas.FieldByName('pnf_id').AsString;
      ppVenda.PrinterSetup.PaperHeight  := (ppHeaderBand3.Height + ppFooterBand3.Height + ppSummaryBand2.Height) + (ppDetailBand2.Height * (dsVendasItens.RecordCount)) + (ppDetailBand1.Height * (dsVendasPags.RecordCount));
      ppVenda.PrinterSetup.PaperHeight  := ppVenda.PrinterSetup.PaperHeight + (ppVenda.PrinterSetup.PaperHeight * 0.02);
      ppVenda.Print;
    end;
  except
  end;
end;

procedure doPrintTEF(apnf_id: Integer);
begin
  try
    with FrmPDV, FrmPDV_DModule_DS do
    begin
      dsComprovTEF.close;
      dsComprovTEF.ParamByName('pnf_id').AsInteger := apnf_id;
      dsComprovTEF.active                          := true;
      if not dsComprovTEF.isEmpty then
      begin
        ppComprovTEF.DeviceType               := 'Printer';
        ppComprovTEF.ShowPrintDialog          := false;
        ppComprovTEF.PrinterSetup.PrinterName := goTerminal.Impressora.pimp_impressora;

        ppDBRichText1.DataField                := 'pnfp_comprovante_1';
        ppComprovTEF.PrinterSetup.DocumentName := 'TEF 1. Via';
        ppComprovTEF.Print;
        sleep(500);

        ppDBRichText1.DataField                := 'pnfp_comprovante_2';
        ppComprovTEF.PrinterSetup.DocumentName := 'TEF 2. Via';
        ppComprovTEF.Print;
      end;
    end;
  except
  end;
end;

procedure doPrintSangria(apcxo_id, apcxov_trans_id: Integer; a2via: Boolean);
begin
  try
    with FrmPDV, FrmPDV_DModule_DS do
    begin
      dsSangria.close;
      dsSangria.ParamByName('pcxo_id').AsInteger        := apcxo_id;
      dsSangria.ParamByName('pcxov_trans_id').AsInteger := apcxov_trans_id;
      dsSangria.active                                  := true;
      ppSangria.DeviceType                              := 'Printer';
      ppSangria.ShowPrintDialog                         := false;
      ppSangria.PrinterSetup.PrinterName                := goTerminal.Impressora.pimp_impressora;
      ppSangria.PrinterSetup.PrinterName                := goTerminal.Impressora.pimp_impressora;
      ppSangria.PrinterSetup.DocumentName               := 'Sangria ' + dsSangria.FieldByName('pcxov_trans_id').AsString;
      ppSangria.PrinterSetup.PaperHeight                := (ppHeaderSangria.Height + ppFooterSangria.Height + ppSummarySangria.Height) + (ppDetailSangria.Height * (dsSangria.RecordCount));
      ppSangria.PrinterSetup.PaperHeight                := ppSangria.PrinterSetup.PaperHeight + (ppSangria.PrinterSetup.PaperHeight * 0.05);
      ppLabel2ViaSangria.Visible                        := a2via;
      ppSangria.Print;
    end;
  except
  end;
end;

end.
