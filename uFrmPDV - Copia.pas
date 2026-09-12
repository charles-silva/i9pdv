unit uFrmPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uWiEventsForm, dxGDIPlusClasses, Vcl.ExtCtrls,
  System.AnsiStrings, uFrmConfig_Terminais, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver, dxSkinWhiteprint, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, cxContainer, cxEdit, Vcl.ComCtrls, cxListView, cxTextEdit, cxCurrencyEdit, uFrmOperacao_EncerraCaixaOperador,
  uFrmOperacao_AbreCaixaOperador, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FmtBcd, uPDVLib, WibiSkins,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uWiFDQuery, dxLayoutContainer, cxGridViewLayoutContainer, cxGridLayoutView,
  cxGridDBLayoutView, cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView, cxGridBandedTableView, cxGridDBBandedTableView,
  System.Generics.Collections;

type
  TListItemPag = record
    Pnfp_id: Integer;
  end;

  TTipoCancelaItem = (tciPorCodigo, tciPorSeq);

  TFrmPDV = class(TForm)
    imgLogo: TImage;
    Label1: TLabel;
    lblOperador: TLabel;
    lblDataHora: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Shape12: TShape;
    lblTerminal: TLabel;
    Label6: TLabel;
    lblCaixa: TLabel;
    Label8: TLabel;
    lblDataAbertura: TLabel;
    Label14: TLabel;
    lblSequencial: TLabel;
    Label16: TLabel;
    TimerShow: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Shape13: TShape;
    imgProduto: TImage;
    lblMainProdutoDescr: TLabel;
    lblCodigo: TLabel;
    lblQuantProd: TLabel;
    lblVrUnitProd: TLabel;
    lblVrTotalProd: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Shape14: TShape;
    Label7: TLabel;
    shp6: TShape;
    lblVolumes: TLabel;
    lblSubTotal: TLabel;
    shp7: TShape;
    lblLabelSubTotal: TLabel;
    Label9: TLabel;
    lblMensagem: TLabel;
    shp8: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Label15: TLabel;
    lblTotalCompraEncerra: TLabel;
    Label18: TLabel;
    lblVolumesEncerra: TLabel;
    Shape19: TShape;
    Label28: TLabel;
    lblTotalPagoEncerra: TLabel;
    shpValorAPagar: TShape;
    lblValoraPagarTitle: TLabel;
    lblValorAPagarEncerra: TLabel;
    Shape20: TShape;
    Label29: TLabel;
    Shape21: TShape;
    lblDescricaoForma: TLabel;
    Shape22: TShape;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Label35: TLabel;
    Bevel1: TBevel;
    Shape26: TShape;
    Label36: TLabel;
    lblMensagemEncerra: TLabel;
    edCodigoForma: TcxCurrencyEdit;
    edValorForma: TcxCurrencyEdit;
    lstListFormas: TcxListView;
    Shape16: TShape;
    Label38: TLabel;
    Shape27: TShape;
    Label5: TLabel;
    lblCaixaOperador: TLabel;
    Label19: TLabel;
    WiEventsForm1: TWiEventsForm;
    cxTabSheet3: TcxTabSheet;
    Shape1: TShape;
    lblSequencialOuCodigo: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    edItemCodigoCancel: TcxCurrencyEdit;
    dsItensDelete: TWiFDQuery;
    doItensDelete: TDataSource;
    cxGrid1DBTableView1pnfi_ean: TcxGridDBColumn;
    cxGrid1DBTableView1pnfi_produto_descr: TcxGridDBColumn;
    cxGrid1DBTableView1un_sigla: TcxGridDBColumn;
    cxGrid1DBTableView1pnfi_qtd: TcxGridDBColumn;
    cxGrid1DBTableView1pnfi_valor_unit: TcxGridDBColumn;
    cxGrid1DBTableView1pnfi_valor_total: TcxGridDBColumn;
    cxGrid1DBTableView1item: TcxGridDBColumn;
    Shape3: TShape;
    Label34: TLabel;
    Shape4: TShape;
    Label37: TLabel;
    Label39: TLabel;
    Shape5: TShape;
    lblVolumesCancelItem: TLabel;
    Label41: TLabel;
    lblSubTotalCancelItem: TLabel;
    Shape7: TShape;
    cxStyleRepository1: TcxStyleRepository;
    srCancelItemDef: TcxStyle;
    WiEventsForm2: TWiEventsForm;
    srCancelItemStrike: TcxStyle;
    cxGrid1DBTableView1pr_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1pnfi_cancelado: TcxGridDBColumn;
    lblItem1: TLabel;
    lblCodigo1: TLabel;
    lblDescricao1: TLabel;
    lblUnidade1: TLabel;
    lblQtd1: TLabel;
    lblVrUnitario1: TLabel;
    lblVrTotal1: TLabel;
    lblItem2: TLabel;
    lblCodigo2: TLabel;
    lblDescricao2: TLabel;
    lblVrUnitario2: TLabel;
    lblVrTotal2: TLabel;
    lblUnidade2: TLabel;
    lblQtd2: TLabel;
    lblItem3: TLabel;
    lblCodigo3: TLabel;
    lblDescricao3: TLabel;
    lblVrUnitario3: TLabel;
    lblVrTotal3: TLabel;
    lblUnidade3: TLabel;
    lblQtd3: TLabel;
    lblitem4: TLabel;
    lblCodigo4: TLabel;
    lblDescricao4: TLabel;
    lblVrUnitario4: TLabel;
    lblVrTotal4: TLabel;
    lblUnidade4: TLabel;
    lblQtd4: TLabel;
    lblItem5: TLabel;
    lblCodigo5: TLabel;
    lblDescricao5: TLabel;
    lblVrUnitario5: TLabel;
    lblVrTotal5: TLabel;
    lblUnidade5: TLabel;
    lblQtd5: TLabel;
    lblItem6: TLabel;
    lblCodigo6: TLabel;
    lblDescricao6: TLabel;
    lblVrUnitario6: TLabel;
    lblVrTotal6: TLabel;
    lblUnidade6: TLabel;
    lblQtd6: TLabel;
    lblItem7: TLabel;
    lblCodigo7: TLabel;
    lblDescricao7: TLabel;
    lblVrUnitario7: TLabel;
    lblVrTotal7: TLabel;
    lblUnidade7: TLabel;
    lblQtd7: TLabel;
    lblItem8: TLabel;
    lblCodigo8: TLabel;
    lblDescricao8: TLabel;
    lblVrUnitario8: TLabel;
    lblVrTotal8: TLabel;
    lblUnidade8: TLabel;
    lblQtd8: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape30: TShape;
    Image1: TImage;
    ImgServiceUP: TImage;
    ImgServiceDown: TImage;
    Label17: TLabel;
    lblCodigoBarrasG: TLabel;
    GridPanel1: TGridPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edValorFormaExit(Sender: TObject);
    procedure edCodigoFormaExit(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure cxPageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edItemCodigoCancelExit(Sender: TObject);
    procedure cxGrid1DBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    goTipoCancelaItem      : TTipoCancelaItem;
    goBuffer               : String;
    goQtdProdBuffer        : Double;
    goPterm_id             : Integer;
    goInserted             : Boolean;
    goTerminal             : TTerminal;
    goPcx_id               : Integer;
    goPcxo_id              : Integer;
    goOldApplicationMessage: TMessageEvent;
    goCaixa                : TCaixa;
    goCaixaOperador        : TCaixaOperador;
    goCancelMode           : Boolean;
    procedure doSetProduto(AProduto: TProduto);
    procedure doNewNF;
    procedure doExecCommand;
    procedure doAddProdNF(AProduto: TProduto);
    procedure doSetTotaisNF(aNF: TNF);
    function doExecFunction(ACode: String): Boolean;
    procedure doClearItem;
    procedure doSetTerminal;
    procedure doSetCaixa;
    function doOpenCloseCash(aus_codigo: Integer; aEncerra: Boolean): Boolean;
    procedure doSetTotaisNFEncerra(aNF: TNF);
    procedure doGetTotaisEncerra;
    procedure doClearEncerra;
    procedure doSetCancelMode;
    procedure doSetNormalMode(const AClear: Boolean = true);
    procedure doClear(const AClearLista: Boolean = true);
    procedure doSetStatusMsg;
    function doOpenCloseOperatorCash(aus_codigo: Integer; asaldo_inicial: Double; aEncerra: Boolean): Boolean;
    procedure doSetCaixaOperador;
    function doGetCaixa: Boolean;
    function doGetCaixaOperador: Boolean;
    procedure doAddFormaList(APnfp_id: Integer);
    function doAddFormaNF: Integer;
    function doEncerraNF: Boolean;
    procedure doGetTotaisCancelItem;
    procedure doSetTotaisNFCancelItem(aNF: TNF);
    procedure doAddItemCancelList(AItem: Integer; AValor: Double);
    procedure doAddItensList(AItens: TObjectList<TNFItem>);
    procedure doAddFormasList(APags: TObjectList<TNFPag>);
    { Private declarations }
  public
    goPnf_id: Integer;
    procedure ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
  end;

{$I WiBiPDVVersion.inc}

const
  cSwHCNPJ: String = '16716114000172';

var
  FrmPDV       : TFrmPDV;
  goPDVClass   : TPDVClass;
  goCNPJ       : String;
  HNDLibNFCe   : Integer;
  HNDLibSAT    : Integer;
  SATStart     : TSATStart;
  SATSetHeader : TSATSetHeader;
  SATSetDetails: TSATSetDetails;
  SATSetPays   : TSATSetPays;
  SATSendCFe   : TSATSendCFe;

implementation

{$R *.dfm}

uses uFrmPDV_DModule, uFrmPDV_Autorizacao, uGlobalLibPDV, uFrmPDV_Bloqueio, uFrmConfig_Impressoras;

{ Métodos do formulário }

procedure TFrmPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
  // KillProcess(Application.handle);
end;

procedure TFrmPDV.FormCreate(Sender: TObject);
begin
  FrmPDV     := self;
  goPDVClass := TPDVClass.Create;
  goPDVClass.Load(ServerEmpresa, FrmPDV_DModule.ADConnection1);
  goBuffer                           := '';
  goQtdProdBuffer                    := 0;
  cxPageControl1.Properties.HideTabs := true;
  lblOperador.Caption                := 'Sem Operador';
end;

procedure TFrmPDV.FormDestroy(Sender: TObject);
begin
  // Application.OnMessage := goOldApplicationMessage;
end;

procedure TFrmPDV.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  loPnfp_id: Integer;
  loResult : Integer;
  loNF     : TNF;
begin

  loResult := 0;
  case Key of
    VK_F2:
      begin
        if cxPageControl1.ActivePageIndex = 1 then
        begin
          if not doEncerraNF then
            exit;
        end;
      end;
    VK_DELETE:
      begin
        try
          if cxPageControl1.ActivePageIndex = 1 then
          begin
            if not lstListFormas.Focused then
            begin
              lstListFormas.Setfocus;
              if lstListFormas.Items.Count > 0 then
              begin
                lstListFormas.Items.Item[0].Focused  := true;
                lstListFormas.Items.Item[0].Selected := true;
              end;
            end
            else
            begin
              if lstListFormas.ItemFocused = nil then
                exit;
              if MessageBox(handle, 'Confirmar exclusão do pagamento ?', 'WiBi PDV', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
                exit;

              loPnfp_id := TListItemPag(lstListFormas.ItemFocused.Data).Pnfp_id;
              with FrmPDV_DModule do
              begin
                adStoreProc1.Connection     := ADConnection1;
                adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
                adStoreProc1.StoredProcName := 'proc_del_pag_nf';
                adStoreProc1.SchemaName     := 'pdv';
                adStoreProc1.Prepare;
                adStoreProc1.Params.ParamByName('@pnfp_id').AsInteger := loPnfp_id;
                adStoreProc1.execProc;

                if adStoreProc1.FindParam('@max') <> nil then
                  loResult := adStoreProc1.ParamByName('@max').AsInteger;
                if loResult > 0 then
                  lstListFormas.ItemFocused.Delete;

                loNF := goPDVClass.GetTotaisNF(goPnf_id);
                doSetTotaisNF(loNF);
                doSetTotaisNFEncerra(loNF);
              end;
            end;
          end;
        finally
          if lstListFormas.Items.Count > 0 then
          begin
            lstListFormas.Items.Item[0].Focused  := true;
            lstListFormas.Items.Item[0].Selected := true;
          end;
          Setfocus;
        end;
      end;
  end;

end;

procedure TFrmPDV.FormShow(Sender: TObject);
begin
  BringToFront;
  TimerShow.Enabled := true;
end;

procedure TFrmPDV.Timer1Timer(Sender: TObject);
begin
  lblDataHora.Caption := FormatDateTime('dd/mm/yyyy hh:nn', ServerDateTime);
end;

procedure TFrmPDV.TimerShowTimer(Sender: TObject);
var
  loEmitRegTrib: Integer;
  loNF         : TNF;
begin
  TimerShow.Enabled := false;
  goTerminal        := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
  if goTerminal = nil then
  begin
    try
      FrmConfig_Terminais := TFrmConfig_Terminais.Create(self);
      if FrmConfig_Terminais.ShowModal = mrOK then
        goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
    finally
      FrmConfig_Terminais.Destroy;
      FrmConfig_Terminais := nil;
    end;
  end;
  if goTerminal = nil then
  begin
    MessageBox(handle, 'Este terminal não está autorizado para utilização do PDV', 'WiBi PDV', MB_ICONEXCLAMATION);
    Close;
    exit;
  end;
  doSetTerminal;
  goOldApplicationMessage := Application.OnMessage;
  Application.OnMessage   := ApplicationMessage;
  if not doGetCaixa then
  begin
    if doExecFunction('101') then
      if not doGetCaixaOperador then
        doExecFunction('103');
  end
  else if not doGetCaixaOperador then
    doExecFunction('103');

  doSetStatusMsg;
  if FrmPDV_DModule.cdsEmpresa.FieldByName('em_simples_nacional').AsInteger = 1 then
    loEmitRegTrib := 0
  else
    loEmitRegTrib := 1;

  SATStart(goTerminal.pterm_sat_codigo_ativacao, //
    goTerminal.pterm_sat_assinatura,             //
    goTerminal.pterm_id,                         //
    1,                                           // 0-taProducao;1-taHomologacao
    cSwHCNPJ,                                    //
    '08723218000186',                            // FrmPDV_DModule.cdsEmpresa.FieldByName('em_cnpj').AsString
    '562377111111',                              // FrmPDV_DModule.cdsEmpresa.FieldByName('em_ie').AsString
    '',                                          // FrmPDV_DModule.cdsEmpresa.FieldByName('em_inscmunicipal').AsString
    loEmitRegTrib,                               //
    6,                                           //
    1,                                           //
    goTerminal.pterm_sat_versao_cfe,             //
    true,                                        //
    true,                                        //
    true,                                        //
    true,                                        //
    true,                                        //
    goTerminal.pterm_sat_input,                  //
    goTerminal.pterm_sat_output,                 //
    goTerminal.pterm_sat_timeout,                //
    goTerminal.impressora.pimp_modelo,           //
    goTerminal.impressora.pimp_port,             //
    goTerminal.impressora.pimp_baud,             //
    goTerminal.impressora.pimp_data,             //
    goTerminal.impressora.pimp_parity,           //
    goTerminal.impressora.pimp_stop,             //
    goTerminal.impressora.pimp_handshake,        //
    goTerminal.impressora.pimp_hardflow,         //
    goTerminal.impressora.pimp_softflow);

  { Consulta se há nota fiscal em andamento }
  loNF := goPDVClass.GetNF(goPterm_id, 0);
  if loNF = nil then
    exit;
  goPnf_id := loNF.IDNF;
  // loProduto := TProduto.Create;
  try
    if loNF.NFItens = nil then
      exit;
    doAddItensList(loNF.NFItens);
    doAddFormasList(loNF.NFPags);
    // for I := 0 to loNF.NFItens.Count - 1 do
    // begin
    // with loNF.NFItens.Items[I] do
    // begin
    // loProduto.EAN        := loNF.NFItens.Items[I].EAN;
    // loProduto.Codigo     := loNF.NFItens.Items[I].CodProd;
    // loProduto.Descricao  := loNF.NFItens.Items[I].NomeProd;
    // loProduto.Unidade    := loNF.NFItens.Items[I].Unidade;
    // loProduto.Valor      := loNF.NFItens.Items[I].VlrUnit;
    // loProduto.Quantidade := loNF.NFItens.Items[I].Qtd;
    // doAddProdList(loProduto);
    // end;
    // end;
  finally
    doSetTotaisNF(loNF);
    // loProduto.Destroy;
    doSetStatusMsg;
  end;
end;

procedure TFrmPDV.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 1 then
    cxPageControl1.ActivePageIndex := 0;

  if cxPageControl1.ActivePageIndex = 2 then
  begin
    if MessageBox(handle, pChar('Confirmar exclusão do(s) item(s) marcado(s) ?'), 'WiBi PDV', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
    begin
      if FrmPDV_DModule.ADConnection1.InTransaction then
        FrmPDV_DModule.ADConnection1.Rollback;
    end
    else
    begin
      if FrmPDV_DModule.ADConnection1.InTransaction then
        FrmPDV_DModule.ADConnection1.Commit;
    end;
    cxPageControl1.ActivePageIndex := 0;
  end;

end;

procedure TFrmPDV.ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
var
  ActiveControl: TWinControl;
  Form         : TCustomForm;
  ShiftState   : TShiftState;
  KeyState     : TKeyboardState;
begin
  case Msg.Message of
    WM_KEYDOWN, WM_KEYUP:
      begin
        case Msg.wParam of
          VK_RETURN:
            // Replaces ENTER with TAB, and CTRL+ENTER with ENTER...
            begin
              GetKeyboardState(KeyState);
              ShiftState := KeyboardStateToShiftState(KeyState);
              if (ShiftState = []) or (ShiftState = [ssCtrl]) then
              begin
                ActiveControl := Screen.ActiveControl;
                if (ActiveControl is TCustomComboBox) and (TCustomComboBox(ActiveControl).DroppedDown) then
                begin
                  if ShiftState = [ssCtrl] then
                  begin
                    KeyState[VK_LCONTROL] := KeyState[VK_LCONTROL] and $7F;
                    KeyState[VK_RCONTROL] := KeyState[VK_RCONTROL] and $7F;
                    KeyState[VK_CONTROL]  := KeyState[VK_CONTROL] and $7F;
                    SetKeyboardState(KeyState);
                  end;
                end
                else if (ActiveControl is TCustomEdit) and not(ActiveControl is TCustomMemo) or (ActiveControl is TCustomCheckbox) or (ActiveControl is TRadioButton) or (ActiveControl is TCustomListBox) or (ActiveControl is TCustomComboBox)
                { // You can add more controls to the list with "or" } then
                  if ShiftState = [] then
                  begin
                    Msg.wParam := VK_TAB
                  end
                  else
                  begin              // ShiftState = [ssCtrl]
                    Msg.wParam := 0; // Discard the key
                    if Msg.Message = WM_KEYDOWN then
                    begin
                      Form := GetParentForm(ActiveControl);
                      if (Form <> nil) and (ActiveControl.Perform(CM_WANTSPECIALKEY, VK_RETURN, 0) = 0) and (ActiveControl.Perform(WM_GETDLGCODE, 0, 0) and DLGC_WANTALLKEYS = 0) then
                      begin
                        KeyState[VK_LCONTROL] := KeyState[VK_LCONTROL] and $7F;
                        KeyState[VK_RCONTROL] := KeyState[VK_RCONTROL] and $7F;
                        KeyState[VK_CONTROL]  := KeyState[VK_CONTROL] and $7F;
                        SetKeyboardState(KeyState);
                        Form.Perform(CM_DIALOGKEY, VK_RETURN, Msg.lParam);
                      end;
                    end;
                  end;
              end;
              if Msg.Message = WM_KEYDOWN then
                doExecCommand;
            end;
          VK_DOWN:
            begin
              GetKeyboardState(KeyState);
              if KeyboardStateToShiftState(KeyState) = [] then
              begin
                ActiveControl := Screen.ActiveControl;
                if (ActiveControl is TCustomEdit) and not(ActiveControl is TCustomMemo)
                { // You can add more controls to the list with "or" } then
                  Msg.wParam := VK_TAB;
              end;
            end;
          VK_UP:
            begin
              GetKeyboardState(KeyState);
              if KeyboardStateToShiftState(KeyState) = [] then
              begin
                ActiveControl := Screen.ActiveControl;
                if (ActiveControl is TCustomEdit) and not(ActiveControl is TCustomMemo)
                { // You can add more controls to the list with "or" } then
                begin
                  Msg.wParam := 0; // Discard the key
                  if Msg.Message = WM_KEYDOWN then
                  begin
                    Form := GetParentForm(ActiveControl);
                    if Form <> nil then // Move to previous control
                      Form.Perform(WM_NEXTDLGCTL, 1, 0);
                  end;
                end;
              end;

            end;
          VK_BACK:
            begin
              case Msg.Message of
                WM_KEYDOWN:
                  begin
                    goBuffer          := Copy(goBuffer, 1, Length(goBuffer) - 1);
                    lblCodigo.Caption := goBuffer;
                  end;
              end;
            end;
          VK_NUMPAD0 .. VK_NUMPAD9, VK_DECIMAL, VK_DIVIDE:
            begin
              case Msg.Message of
                WM_KEYDOWN:
                  begin
                    if goInserted then
                      doClearItem;
                    case Msg.wParam of
                      VK_DECIMAL:
                        begin
                          if AnsiPos('.', goBuffer) = 0 then
                            goBuffer := goBuffer + ',';
                        end;
                      VK_DIVIDE:
                        begin
                          if goBuffer <> '' then
                          begin
                            goBuffer := goBuffer + '/';
                            doExecCommand;
                          end;
                        end;
                    else
                      goBuffer := goBuffer + IntToStr(Msg.wParam - 96)
                    end;
                    lblCodigo.Caption := goBuffer;
                  end;
              end;
            end;
          VK_MULTIPLY:
            begin
              case Msg.Message of
                WM_KEYDOWN:
                  begin
                    goQtdProdBuffer        := StrToFloatDef(goBuffer, 1);
                    lblQuantProd.Caption   := FormatCurr('#,###0.000', goQtdProdBuffer);
                    lblCodigo.Caption      := '0';
                    lblVrUnitProd.Caption  := FormatCurr('#,##0.00', 0);
                    lblVrTotalProd.Caption := FormatCurr('#,##0.00', 0);
                    goBuffer               := '';
                  end;
              end;
            end;
        end;
      end;
  end;
end;

{ Métodos básicos }

function TFrmPDV.doExecFunction(ACode: String): Boolean;
var
  loCode: Integer;
begin
  result := true;
  loCode := StrToIntDef(uGlobalLibPDV.OnlyNumbers(ACode), 0);
  case loCode of
    101:
      begin
        if goPcx_id > 0 then
        begin
          MessageBox(handle, 'Caixa já aberto', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
        try
          FrmPDV_Autorizacao.lblTitle.Caption := 'Abertura de caixa';
          FrmPDV_Autorizacao.lblUser.Caption  := 'Supervisor';
          FrmPDV_Autorizacao.goTipoUser       := [tuSupervisor];
          if FrmPDV_Autorizacao.ShowModal = mrOK then
          begin
            if doOpenCloseCash(StrToIntDef(FrmPDV_Autorizacao.edUsuario.Text, 0), false) then
              exit;
          end;
        finally
          FrmPDV_Autorizacao.Destroy;
          FrmPDV_Autorizacao := nil;
        end;

      end;
    102: { Encerramento geral do caixa }
      begin
        if goPcx_id = 0 then
        begin
          MessageBox(handle, 'Caixa fechado', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        if goPcxo_id > 0 then
        begin
          // Encerra caixa do operador
          if not doExecFunction('104') then
            exit;
        end;

        FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
        try
          FrmPDV_Autorizacao.lblTitle.Caption := 'Fechamento de caixa';
          FrmPDV_Autorizacao.lblUser.Caption  := 'Supervisor';
          FrmPDV_Autorizacao.goTipoUser       := [tuSupervisor];
          if FrmPDV_Autorizacao.ShowModal = mrOK then
            if doOpenCloseCash(StrToIntDef(FrmPDV_Autorizacao.edUsuario.Text, 0), true) then
              exit;
        finally
          FrmPDV_Autorizacao.Destroy;
          FrmPDV_Autorizacao := nil;
        end;
      end;
    103: { Abertura caixa do operador }
      begin
        if goPcxo_id > 0 then
        begin
          MessageBox(handle, 'Caixa do operador já aberto', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        FrmOperacao_AbreCaixaOperador := TFrmOperacao_AbreCaixaOperador.Create(self);
        try
          if FrmOperacao_AbreCaixaOperador.ShowModal = mrOK then
            if doOpenCloseOperatorCash(StrToIntDef(FrmOperacao_AbreCaixaOperador.edOperador.Text, 0), FrmOperacao_AbreCaixaOperador.edSaldoInicial.Value, false) then
              exit;
        finally
          FrmOperacao_AbreCaixaOperador.Destroy;
          FrmOperacao_AbreCaixaOperador := nil;
        end;
      end;
    104: { Encerra caixa do operador }
      begin
        if goPcx_id = 0 then
        begin
          MessageBox(handle, 'Caixa fechado', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        if goPcxo_id = 0 then
        begin
          MessageBox(handle, 'Caixa do operador fechado', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        if goPnf_id > 0 then
        begin
          MessageBox(handle, 'Venda em andamento', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        FrmOperacao_EncerraCaixaOperador := TFrmOperacao_EncerraCaixaOperador.Create(self);
        try
          FrmOperacao_EncerraCaixaOperador.goPcxo_id := goPcxo_id;
          if FrmOperacao_EncerraCaixaOperador.ShowModal = mrOK then
            if doOpenCloseOperatorCash(StrToIntDef(FrmOperacao_EncerraCaixaOperador.edSupervisor.Text, 0), 0, true) then
              exit;
        finally
          FrmOperacao_EncerraCaixaOperador.Destroy;
          FrmOperacao_EncerraCaixaOperador := nil;
        end;
      end;
    106:
      begin
        try
          FrmConfig_Terminais := TFrmConfig_Terminais.Create(self);
          if FrmConfig_Terminais.ShowModal = mrOK then
            goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
          exit;
        finally
          FrmConfig_Terminais.Destroy;
          FrmConfig_Terminais := nil;
        end;
      end;
    107:
      begin
        try
          FrmConfig_Impressoras := TFrmConfig_Impressoras.Create(self);
          if FrmConfig_Impressoras.ShowModal = mrOK then
            goTerminal := goPDVClass.GetTerminal(uGlobalLibPDV.GetSerialHD);
          exit;
        finally
          FrmConfig_Impressoras.Destroy;
          FrmConfig_Impressoras := nil;
        end;
      end;
    112:
      begin
        try
          FrmPDV_Bloqueio                     := TFrmPDV_Bloqueio.Create(self);
          FrmPDV_Bloqueio.edUsuario.EditValue := goCaixaOperador.us_codigo;
          FrmPDV_Bloqueio.goTipoUser          := [tuOperador, tuSupervisor];
          FrmPDV_Bloqueio.ShowModal;
          exit;
        finally
          FrmPDV_Bloqueio.Destroy;
          FrmPDV_Bloqueio := nil;
        end;
      end;
    201: { Encerramento da nota }
      begin
        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda não iniciada', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        cxPageControl1.ActivePageIndex := 1;
        exit;
      end;
    202: { cancelamento da nota }
      begin
        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda não iniciada', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        doSetCancelMode;
        exit;
      end;
    204: { Cancelamento do item por código }
      begin
        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda não iniciada', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        goTipoCancelaItem              := tciPorCodigo;
        cxPageControl1.ActivePageIndex := 2;
        exit;
      end;
    205: { Cancelamento do item por sequencial }
      begin
        if goPnf_id = 0 then
        begin
          MessageBox(handle, 'Venda não iniciada', 'WiBi PDV', MB_ICONEXCLAMATION);
          exit;
        end;
        goTipoCancelaItem              := tciPorSeq;
        cxPageControl1.ActivePageIndex := 2;
        exit;
      end;
    152:
      begin
        showmessage('ABONO DO ACRÉSCIMO FICHA/MESA');
        exit;
      end;
    520:
      begin
        showmessage('ABRE GAVETA');
        exit;
      end;
    160:
      begin
        showmessage('ACRÉSCIMO PERCENTUAL');
        exit;
      end;
    161:
      begin
        showmessage('ACRÉSCIMO VALOR');
        exit;
      end;
    637:
      begin
        showmessage('ACÚMULO PONTOS DOTZ');
        exit;
      end;
    710:
      begin
        showmessage('ADM. CRÉDITO DIGITAL(PHOEBUS)');
        exit;
      end;
    600:
      begin
        showmessage('ADM. TEF (SOFTWARE EXPRESS)');
        exit;
      end;
    605:
      begin
        showmessage('ADM. TEF DISCADO (CREDI-SHOP)');
        exit;
      end;
    603:
      begin
        showmessage('ADM. TEF DISCADO (HIPERCARD)');
        exit;
      end;
    601:
      begin
        showmessage('ADM. TEF DISCADO (TECBAN)');
        exit;
      end;
    188:
      begin
        showmessage('ANTECIPAÇÃO DE ENCOMENDA');
        exit;
      end;
    646:
      begin
        showmessage('ATIVAÇÃO GIFTCARD');
        exit;
      end;
    206:
      begin
        showmessage('ATO COTEPE 17/04');
        exit;
      end;
    830:
      begin
        showmessage('ATUALIZA APLICATIVOS');
        exit;
      end;
    902:
      begin
        showmessage('AUTORIZA ALTERAÇÃO NA DATA DO PLANO');
        exit;
      end;
    901:
      begin
        showmessage('AUTORIZA CANC. IMP. COMP. VINCULADO');
        exit;
      end;
    906:
      begin
        showmessage('AUTORIZA CLIENTE NÃO CADASTRADO');
        exit;
      end;
    900:
      begin
        showmessage('AUTORIZA CLIENTE/LIMITE CRÉDITO');
        exit;
      end;
    903:
      begin
        showmessage('AUTORIZA DESCONTO CONTAS A RECEBER');
        exit;
      end;
    912:
      begin
        showmessage('AUTORIZA DIGITAÇÃO DO CARTÃO PRIVATE LABEL');
        exit;
      end;
    913:
      begin
        showmessage('AUTORIZA FECHAMENTO DA FICHA');
        exit;
      end;
    905:
      begin
        showmessage('AUTORIZA FECHAMENTO DE CUPOM FORÇADO');
        exit;
      end;
    909:
      begin
        showmessage('AUTORIZA LEITURA Z COM REGISTROS À TRANSMITIR');
        exit;
      end;
    910:
      begin
        showmessage('AUTORIZA LIMITE CRÉDITO CLIENTE COM RETAGUARDA OFF-LINE');
        exit;
      end;
    911:
      begin
        showmessage('AUTORIZA PLANO DE PAGAMENTO');
        exit;
      end;
    908:
      begin
        showmessage('AUTORIZA QUANTIDADE MAIOR QUE O PERMITIDO');
        exit;
      end;
    914:
      begin
        showmessage('AUTORIZA REABERTURA DA FICHA');
        exit;
      end;
    916:
      begin
        showmessage('AUTORIZA SOMAR MAIS UM AO NUMERO DA NFC-e');
        exit;
      end;
    904:
      begin
        showmessage('AUTORIZA VALOR A MAIOR NO REC. CARTÃO PRÓPRIO (141)');
        exit;
      end;
    907:
      begin
        showmessage('AUTORIZA VALOR A MAIOR QUE O MÁXIMO PERMITIDO NA FINALIZADOR');
        exit;
      end;
    917:
      begin
        showmessage('AUTORIZA VENDA POR QUANTIDADE PARA PRODUTOS VENDA UNITÁRIA');
        exit;
      end;
    915:
      begin
        showmessage('AUTORIZA VENDAS COM PONTO DE SANGRIA ATINGIDO');
        exit;
      end;
    400:
      begin
        showmessage('CADASTRO CLIENTE');
        exit;
      end;
    390:
      begin
        showmessage('CALCULADORA');
        exit;
      end;
    125:
      begin
        showmessage('CANCELA CUPOM');
        exit;
      end;
    126:
      begin
        showmessage('CANCELA CUPOM ABERTO');
        exit;
      end;
    124:
      begin
        showmessage('CANCELA PRÉ-VENDA');
        exit;
      end;
    741:
      begin
        showmessage('CANCELAMENTO CARTÃO PRÓPRIO');
        exit;
      end;
    116:
      begin
        showmessage('CANCELAMENTO DE ITEM (CÓDIGO)');
        exit;
      end;
    115:
      begin
        showmessage('CANCELAMENTO DE ITEM (REGISTRO)');
        exit;
      end;
    625:
      begin
        showmessage('CANCELAMENTO TEF (SOFTWARE EXPRESS)');
        exit;
      end;
    176:
      begin
        showmessage('CARTÃO FIDELIDADE');
        exit;
      end;
    177:
      begin
        showmessage('CARTÃO FIDELIDADE PRIVATE LABEL PRIMEIRA COMPRA');
        exit;
      end;
    622:
      begin
        showmessage('COMUNICAÇÃO PINPAD (SOFTWARE EXPRESS)');
        exit;
      end;
    510:
      begin
        showmessage('CONFIGURA BALANÇA');
        exit;
      end;
    540:
      begin
        showmessage('CONFIGURA COMPROVANTE NÃO FISCAL');
        exit;
      end;
    535:
      begin
        showmessage('CONFIGURA CONTINGÊNCIA NFC-e');
        exit;
      end;
    700:
      begin
        showmessage('CONFIGURA CRÉDITO DIGITAL(PHOEBUS)');
        exit;
      end;
    515:
      begin
        showmessage('CONFIGURA GAVETA');
        exit;
      end;
    500:
      begin
        showmessage('CONFIGURA IMPRESSORA');
        exit;
      end;
    507:
      begin
        showmessage('CONFIGURA IMPRESSORA DE CHEQUE');
        exit;
      end;
    506:
      begin
        showmessage('CONFIGURA LEITOR DOCUMENTOS E CMC-7');
        exit;
      end;
    538:
      begin
        showmessage('CONFIGURA PARÂMETRO');
        exit;
      end;
    505:
      begin
        showmessage('CONFIGURA SCANNER');
        exit;
      end;
    590:
      begin
        showmessage('CONFIGURA SYSPDV-SERVER');
        exit;
      end;
    530:
      begin
        showmessage('CONFIGURA TECLADO');
        exit;
      end;
    315:
      begin
        showmessage('CONSULTA CLIENTE');
        exit;
      end;
    347:
      begin
        showmessage('CONSULTA CONVENIO');
        exit;
      end;
    324:
      begin
        showmessage('CONSULTA ENVELOPE');
        exit;
      end;
    310:
      begin
        showmessage('CONSULTA FINALIZADORA');
        exit;
      end;
    342:
      begin
        showmessage('CONSULTA LIMITE DE CRÉDITO');
        exit;
      end;
    335:
      begin
        showmessage('CONSULTA PAGAMENTO');
        exit;
      end;
    330:
      begin
        showmessage('CONSULTA PLANO DE PAGAMENTO');
        exit;
      end;
    365:
      begin
        showmessage('CONSULTA PRÉ-VENDA');
        exit;
      end;
    307:
      begin
        showmessage('CONSULTA PREVISÃO DE ESTOQUE NAS LOJAS');
        exit;
      end;
    306:
      begin
        showmessage('CONSULTA PRODUTO AVULSA');
        exit;
      end;
    3061:
      begin
        showmessage('CONSULTA PRODUTO AVULSA TABELA 1');
        exit;
      end;
    3062:
      begin
        showmessage('CONSULTA PRODUTO AVULSA TABELA 2');
        exit;
      end;
    3063:
      begin
        showmessage('CONSULTA PRODUTO AVULSA TABELA 3');
        exit;
      end;
    300:
      begin
        showmessage('CONSULTA PRODUTO POR CÓDIGO');
        exit;
      end;
    3001:
      begin
        showmessage('CONSULTA PRODUTO POR CÓDIGO TABELA 1');
        exit;
      end;
    3002:
      begin
        showmessage('CONSULTA PRODUTO POR CÓDIGO TABELA 2');
        exit;
      end;
    3003:
      begin
        showmessage('CONSULTA PRODUTO POR CÓDIGO TABELA 3');
        exit;
      end;
    305:
      begin
        showmessage('CONSULTA PRODUTO POR DESCRIÇÃO');
        exit;
      end;
    3051:
      begin
        showmessage('CONSULTA PRODUTO POR DESCRIÇÃO TABELA 1');
        exit;
      end;
    3052:
      begin
        showmessage('CONSULTA PRODUTO POR DESCRIÇÃO TABELA 2');
        exit;
      end;
    3053:
      begin
        showmessage('CONSULTA PRODUTO POR DESCRIÇÃO TABELA 3');
        exit;
      end;
    345:
      begin
        showmessage('CONSULTA PRODUTOS FRENTE DE LOJA');
        exit;
      end;
    349:
      begin
        showmessage('CONSULTA RECEBIMENTO');
        exit;
      end;
    647:
      begin
        showmessage('CONSULTA SALDO GIFTCARD');
        exit;
      end;
    610:
      begin
        showmessage('CONSULTA SERASA (SOFTWARE EXPRESS)');
        exit;
      end;
    628:
      begin
        showmessage('CONSULTA SÕCIO TORCEDOR');
        exit;
      end;
    340:
      begin
        showmessage('CONSULTA SYSERRO.ERR');
        exit;
      end;
    320:
      begin
        showmessage('CONSULTA VENDEDOR');
        exit;
      end;
    640:
      begin
        showmessage('CORRESPONDENTE BANCÁRIO (SOFTWARE EXPRESS)');
        exit;
      end;
    155:
      begin
        showmessage('DESCONTO PERCENTUAL');
        exit;
      end;
    158:
      begin
        showmessage('DESCONTO PROMOÇÃO ASSISTIDA');
        exit;
      end;
    156:
      begin
        showmessage('DESCONTO VALOR');
        exit;
      end;
    146:
      begin
        showmessage('EMPRÉSTIMO');
        exit;
      end;
    110:
      begin
        showmessage('ENTRADA DE OPERADOR');
        exit;
      end;
    175:
      begin
        showmessage('ENTREGA DOMICÍLIO');
        exit;
      end;
    501:
      begin
        showmessage('ENVIAR COMANDO PARA IMPRESSORA FISCAL');
        exit;
      end;
    189:
      begin
        showmessage('ESTORNO DE ANTECIPAÇÃO DE ENCOMENDA');
        exit;
      end;
    503:
      begin
        showmessage('EXPORTA CONFIGURAÇÃO');
        exit;
      end;
    195:
      begin
        showmessage('FECHAMENTO DE CAIXA COM REDUÇÃO(Z)');
        exit;
      end;
    197:
      begin
        showmessage('FECHAMENTO DE CAIXA SEM REDUÇÃO(Z)');
        exit;
      end;
    810:
      begin
        showmessage('FORÇA ENVIO DAS TRANSAÇÕES PARA O SERVIDOR');
        exit;
      end;
    185:
      begin
        showmessage('IDENTIFICAÇÃO DO CONSUMIDOR');
        exit;
      end;
    504:
      begin
        showmessage('IMPORTA CONFIGURAÇÃO');
        exit;
      end;
    262:
      begin
        showmessage('IMPRESSÃO CONFERÊNCIA FICHA/MESA');
        exit;
      end;
    560:
      begin
        showmessage('IMPRESSÃO DE CHEQUE AVULSO');
        exit;
      end;
    268:
      begin
        showmessage('IMPRESSÃO DE DAV');
        exit;
      end;
    235:
      begin
        showmessage('INICIALIZA VENDA BRUTA');
        exit;
      end;
    166:
      begin
        showmessage('JUNÇÃO FICHA/MESA');
        exit;
      end;
    153:
      begin
        showmessage('LANÇAMENTO CONSUMO FICHA/MESA');
        exit;
      end;
    396:
      begin
        showmessage('LEITURA DO CODIGO DE BARRAS');
        exit;
      end;
    200:
      begin
        showmessage('LEITURA X (LX)');
        exit;
      end;
    395:
      begin
        showmessage('LIMPA TELA');
        exit;
      end;
    142:
      begin
        showmessage('LIQUIDAÇÃO CONTA A RECEBER');
        exit;
      end;
    // 205:
    // begin
    // showmessage('MENU FISCAL <F12>');
    // exit;
    // end;
    207:
      begin
        showmessage('MENU SAT');
        exit;
      end;
    999:
      begin
        showmessage('MODO TÉCNICO');
        exit;
      end;
    145:
      begin
        showmessage('PAGAMENTO');
        exit;
      end;
    147:
      begin
        showmessage('PAGAMENTO DEVOLUÇÃO DE MERCADORIA');
        exit;
      end;
    181:
      begin
        showmessage('PREÇO TABELA 1');
        exit;
      end;
    182:
      begin
        showmessage('PREÇO TABELA 2');
        exit;
      end;
    183:
      begin
        showmessage('PREÇO TABELA 3');
        exit;
      end;
    545:
      begin
        showmessage('PROGRAMA ALÍQUOTA TRIBUTÁRIA');
        exit;
      end;
    555:
      begin
        showmessage('PROGRAMA FINALIZADORA');
        exit;
      end;
    525:
      begin
        showmessage('PROGRAMA HORÁRIO DE VERÃO');
        exit;
      end;
    550:
      begin
        showmessage('PROGRAMA TRUNCAMENTO/ARREDONDAMENTO');
        exit;
      end;
    800:
      begin
        showmessage('PUXA ÚLTIMA CARGA DO SYSPDV-SERVIDOR');
        exit;
      end;
    630:
      begin
        showmessage('RECARGA DE PRÉ-PAGO(SOFTWARE EXPRESS)');
        exit;
      end;
    645:
      begin
        showmessage('RECARGA GIFTCARD');
        exit;
      end;
    140:
      begin
        showmessage('RECEBIMENTO');
        exit;
      end;
    141:
      begin
        showmessage('RECEBIMENTO CARTÃO PRÓPRIO');
        exit;
      end;
    144:
      begin
        showmessage('RECEBIMENTO COBRANÇA');
        exit;
      end;
    143:
      begin
        showmessage('RECEBIMENTO CRÉDIARIO');
        exit;
      end;
    148:
      begin
        showmessage('RECEBIMENTO DE VENDA ASSISTIDA');
        exit;
      end;
    173:
      begin
        showmessage('RECEBIMENTO VALOR FIXO VINCULADO A VENDA');
        exit;
      end;
    820:
      begin
        showmessage('REENVIO DAS TRANSAÇÕES PARA O SERVIDOR');
        exit;
      end;
    111:
      begin
        showmessage('REFORÇO FUNDO DE CAIXA');
        exit;
      end;
    621:
      begin
        showmessage('REIMPRESSÃO (SOFTWARE EXPRESS)');
        exit;
      end;
    127:
      begin
        showmessage('REIMPRESSÃO CUPOM CANCELADO PELO SISTEMA');
        exit;
      end;
    129:
      begin
        showmessage('REIMPRESSÃO CUPOM SALVO');
        exit;
      end;
    122:
      begin
        showmessage('REIMPRESSÃO DANFE');
        exit;
      end;
    210:
      begin
        showmessage('RELATORIO GERENCIAL FLASH DE CAIXA');
        exit;
      end;
    230:
      begin
        showmessage('RELATORIO GERENCIAL VENDA GARÇOM');
        exit;
      end;
    150:
      begin
        showmessage('SAíDA DE OPERADOR');
        exit;
      end;
    100:
      begin
        showmessage('SAIR DO SISTEMA PARA O WINDOWS');
        exit;
      end;
    128:
      begin
        showmessage('SALVA CUPOM PARA REIMPRESSÃO');
        exit;
      end;
    136:
      begin
        showmessage('SANGRIA AUTOMÁTICA');
        exit;
      end;
    138:
      begin
        showmessage('SANGRIA AUTOMÁTICA DE CORRESPONDENTE BANCÁRIO');
        exit;
      end;
    137:
      begin
        showmessage('SANGRIA AUTOMÁTICA DE RECEBIMENTO');
        exit;
      end;
    135:
      begin
        showmessage('SANGRIA MANUAL');
        exit;
      end;
    119:
      begin
        showmessage('SUB-TOTAL');
        exit;
      end;
    620:
      begin
        showmessage('TESTE DE COMUNICAÇÃO (SOFTWARE EXPRESS)');
        exit;
      end;
    149:
      begin
        showmessage('TRAVA OPERAÇÃO');
        exit;
      end;
    134:
      begin
        showmessage('TROCA DE BOBINA');
        exit;
      end;
    133:
      begin
        showmessage('TROCA DE FINALIZADORA (AVULSA)');
        exit;
      end;
    132:
      begin
        showmessage('TROCA DE FINALIZADORA (CUPOM)');
        exit;
      end;
    131:
      begin
        showmessage('TROCA DE PRODUTO');
        exit;
      end;
    130:
      begin
        showmessage('TROCA DE VENDEDOR NOS PROXIMOS ITENS VENDIDOS');
        exit;
      end;
    635:
      begin
        showmessage('VALEGÁS(SOFTWARE EXPRESS)');
        exit;
      end;
    163:
      begin
        showmessage('VENDA ASSISTIDA');
        exit;
      end;
    172:
      begin
        showmessage('VENDA COMBUSTÍVEL MANUAL POR LITRO');
        exit;
      end;
    171:
      begin
        showmessage('VENDA COMBUSTÍVEL MANUAL POR VALOR');
        exit;
      end;
    730:
      begin
        showmessage('VENDA CRÉDITO DIGITAL(PHOEBUS)');
        exit;
      end;
    187:
      begin
        showmessage('VENDA DE ENCOMENDA');
        exit;
      end;
    178:
      begin
        showmessage('VENDA DE PRODUTO POR PREÇO');
        exit;
      end;
    179:
      begin
        showmessage('VENDA DO ÚLTIMO PRODUTO');
        exit;
      end;
    162:
      begin
        showmessage('VENDA FICHA/MESA');
        exit;
      end;
    168:
      begin
        showmessage('VENDA POR DAV');
        exit;
      end;
    169:
      begin
        showmessage('VENDA POR DAV COM CONFERÊNCIA DE ITENS');
        exit;
      end;
    165:
      begin
        showmessage('VENDA POR PRÉ-VENDA');
        exit;
      end;
    174:
      begin
        showmessage('VENDA TROCO PREMIADO');
        exit;
      end;
  end;
  result := false;
end;

procedure TFrmPDV.doExecCommand;
var
  loProduto: TProduto;
begin
  if goBuffer = '' then
    exit;
  if goBuffer.CountChar('/') > 0 then
  begin
    if not doExecFunction(goBuffer) then
      MessageBox(handle, 'Código de função não identificado', 'WiBi PDV', MB_ICONEXCLAMATION);
    goBuffer          := '';
    lblCodigo.Caption := '';
    exit;
  end;
  if goPcx_id = 0 then
  begin
    MessageBox(handle, 'Caixa fechado, venda não permitida.', 'WiBi PDV', MB_ICONEXCLAMATION);
    doClearItem;
    exit;
  end;
  if goPcxo_id = 0 then
  begin
    MessageBox(handle, 'Caixa do operador fechado, venda não permitida', 'WiBi PDV', MB_ICONEXCLAMATION);
    doClearItem;
    exit;
  end;
  loProduto := goPDVClass.GetProd(goQtdProdBuffer, goBuffer);
  doSetProduto(loProduto);
  goBuffer := '';
end;

{ Métodos Set }

procedure TFrmPDV.doSetStatusMsg;
begin
  shp8.Brush.Color := $005B5909;
  if goPcx_id = 0 then
  begin
    lblMensagem.Caption := 'CAIXA FECHADO';
    shp8.Brush.Color    := clBlack;
  end
  else
  begin
    if goPcxo_id = 0 then
      lblMensagem.Caption := 'SEM OPERADOR'
    else
      lblMensagem.Caption := 'CAIXA ABERTO';
    if goPnf_id > 0 then
      lblMensagem.Caption := 'EM ANDAMENTO';

    if goCancelMode then
      lblMensagem.Caption := 'CANCELAMENTO DA NF';
  end;
end;

procedure TFrmPDV.doSetProduto(AProduto: TProduto);
var
  loNF: TNF;
begin
  if AProduto = nil then
  begin
    MessageBox(handle, 'Produto não encontrado.', 'WiBi - PDV', MB_ICONEXCLAMATION);
    lblMainProdutoDescr.Caption := '';
    doClearItem;
    exit;
  end;
  doNewNF;
  if goQtdProdBuffer = 0 then
    AProduto.Quantidade       := 1;
  lblCodigo.Caption           := AProduto.EAN;
  lblVrUnitProd.Caption       := AProduto.ValorStr;
  lblQuantProd.Caption        := FormatCurr('#,###0.000', AProduto.Quantidade);
  lblVrTotalProd.Caption      := AProduto.TotalStr;
  lblMainProdutoDescr.Caption := FloatTostr(AProduto.Quantidade) + ' x ' + AProduto.Descricao;
  doAddProdNF(AProduto);
  { Consulta se há nota fiscal em andamento }
  loNF := goPDVClass.GetNF(goPterm_id, 0);
  if loNF <> nil then
    if loNF.NFItens <> nil then
      doAddItensList(loNF.NFItens);

  loNF := goPDVClass.GetTotaisNF(goPnf_id);
  doSetTotaisNF(loNF);
  goBuffer        := '';
  goQtdProdBuffer := 0;
  goInserted      := true;
end;

procedure TFrmPDV.doSetTotaisNF(aNF: TNF);
begin
  lblVolumes.Caption    := FormatCurr('000', aNF.Volumes);
  lblSubTotal.Caption   := aNF.TotalProdStr;
  lblSequencial.Caption := FormatCurr('000000', aNF.IDNF);
end;

procedure TFrmPDV.doSetTotaisNFEncerra(aNF: TNF);
begin
  lblVolumesEncerra.Caption     := FormatCurr('000', aNF.Volumes);
  lblTotalCompraEncerra.Caption := aNF.TotalProdStr;
  lblTotalPagoEncerra.Caption   := aNF.TotalPagoStr;
  lblValorAPagarEncerra.Caption := aNF.TotalAPagarStr;
  lblValoraPagarTitle.Caption   := 'Valor a Pagar';
  shpValorAPagar.Brush.Color    := $005B5909;
end;

procedure TFrmPDV.doSetTotaisNFCancelItem(aNF: TNF);
begin
  lblVolumesCancelItem.Caption  := FormatCurr('000', aNF.Volumes);
  lblSubTotalCancelItem.Caption := aNF.TotalProdStr;
end;

procedure TFrmPDV.doSetTerminal;
begin
  lblTerminal.Caption := FormatFloat('000', goTerminal.pterm_numero);
  goPterm_id          := goTerminal.pterm_id;
end;

procedure TFrmPDV.doSetCaixa;
begin
  lblCaixa.Caption        := FormatFloat('000', goCaixa.pcx_id);
  lblDataAbertura.Caption := goCaixa.pcx_data_abertura_str;
  goPcx_id                := goCaixa.pcx_id;
  doSetStatusMsg;
end;

procedure TFrmPDV.doSetCaixaOperador;
begin
  lblCaixaOperador.Caption := FormatFloat('000', goCaixaOperador.pcxo_id);
  lblOperador.Caption      := goCaixaOperador.us_apelido;
  goPcxo_id                := goCaixaOperador.pcxo_id;
  doSetStatusMsg;
end;

procedure TFrmPDV.doSetCancelMode;
var
  loResult: Integer;
begin
  goCancelMode := true;
  doSetStatusMsg;
  shp1.Brush.Color := clRed;
  shp2.Brush.Color := clRed;
  shp3.Brush.Color := clRed;
  // shp4.Brush.Color := clRed;
  // shp5.Brush.Color := clRed;
  shp6.Brush.Color := clRed;
  shp7.Brush.Color := clRed;
  shp8.Brush.Color := clRed;
  loResult         := 0;

  if MessageBox(handle, 'Confirmar cancelamento da nota fiscal?', 'WiBi PDV', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
  begin
    Setfocus;
    exit;
  end;
  FrmPDV_Autorizacao := TFrmPDV_Autorizacao.Create(self);
  try
    if FrmPDV_Autorizacao.ShowModal <> mrOK then
      exit;
  finally
    Setfocus;
    FrmPDV_Autorizacao.Destroy;
    FrmPDV_Autorizacao := nil;
  end;

  try
    try
      with FrmPDV_DModule do
      begin
        adStoreProc1.Connection     := ADConnection1;
        adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
        adStoreProc1.StoredProcName := 'proc_cancela_nf';
        adStoreProc1.SchemaName     := 'pdv';
        adStoreProc1.Prepare;
        adStoreProc1.Params.ParamByName('@pnf_id').AsInteger := goPnf_id;
        adStoreProc1.execProc;

        if adStoreProc1.FindParam('@max') <> nil then
          loResult := adStoreProc1.ParamByName('@max').AsInteger;
      end;
    except
      on E: exception do
      begin
        loResult := -1;
        FrmPDV_DModule.cdsEmpresa.GetSysMessages(true, self);
      end;
    end;
  finally
    goCancelMode := false;
    FrmPDV_DModule.cdsEmpresa.GetSysMessages(true, self);
    doSetNormalMode(loResult = 0);
    Setfocus;
  end;
end;

procedure TFrmPDV.doSetNormalMode(const AClear: Boolean = true);
begin
  shp1.Brush.Color := $005B5909;
  shp2.Brush.Color := $005B5909;
  shp3.Brush.Color := $005B5909;
  // shp4.Brush.Color := $005B5909;
  // shp5.Brush.Color := $005B5909;
  shp6.Brush.Color := $005B5909;
  shp7.Brush.Color := $005B5909;
  shp8.Brush.Color := $005B5909;
  if AClear then
  begin
    doClearItem;
    doClearEncerra;
    doClear;
    goPnf_id := 0;
  end;
  doSetStatusMsg;
end;

{ Métodos Get }

function TFrmPDV.doGetCaixaOperador: Boolean;
begin
  goCaixaOperador := goPDVClass.GetCaixaOperador(goPcx_id);
  if goCaixaOperador <> nil then
    doSetCaixaOperador;
  result := (goCaixaOperador <> nil);
end;

function TFrmPDV.doGetCaixa: Boolean;
begin
  goCaixa := goPDVClass.GetCaixa(goPterm_id);
  if goCaixa <> nil then
    doSetCaixa;
  result := (goCaixa <> nil);
end;

procedure TFrmPDV.doGetTotaisEncerra;
var
  loNF: TNF;
begin
  loNF := goPDVClass.GetTotaisNF(FrmPDV.goPnf_id);
  doSetTotaisNFEncerra(loNF);
end;

procedure TFrmPDV.doGetTotaisCancelItem;
var
  loNF: TNF;
begin
  loNF := goPDVClass.GetTotaisNF(FrmPDV.goPnf_id);
  doSetTotaisNFCancelItem(loNF);
end;

{ Eventos de componentes }

procedure TFrmPDV.cxGrid1DBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  if ARecord = nil then
    exit;

  try
    AStyle := srCancelItemDef;
    if ARecord.Values[cxGrid1DBTableView1pnfi_cancelado.index] = true then
      AStyle := srCancelItemStrike;

  except

  end;

end;

procedure TFrmPDV.cxPageControl1Change(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 1 then
    WiEventsForm1.Open(handle);
  if cxPageControl1.ActivePageIndex = 2 then
  begin
    case goTipoCancelaItem of
      tciPorCodigo:
        lblSequencialOuCodigo.Caption := 'Código do produto';
      tciPorSeq:
        lblSequencialOuCodigo.Caption := 'Sequencial do item';
    end;
    FrmPDV_DModule.ADConnection1.StartTransaction;
    WiEventsForm2.Open(handle);
  end;
end;

procedure TFrmPDV.cxPageControl1PageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage.PageIndex = 1 then
    doGetTotaisEncerra;

  if NewPage.PageIndex = 2 then
  begin
    dsItensDelete.Close;
    dsItensDelete.ParamByName('pnf_id').AsInteger := goPnf_id;
    dsItensDelete.Active                          := true;
    doGetTotaisCancelItem;
  end;

  if NewPage.PageIndex > 0 then
  begin
    goOldApplicationMessage := Application.OnMessage;
    Application.OnMessage   := nil;
  end
  else
  begin
    WiEventsForm1.Close;
    WiEventsForm2.Close;
    Application.OnMessage := goOldApplicationMessage;
  end;

end;

procedure TFrmPDV.edCodigoFormaExit(Sender: TObject);
var
  loFormaPag: TFormaPag;
begin
  try
    if StrToIntDef(edCodigoForma.Text, 0) = 0 then
      exit;
    loFormaPag := goPDVClass.GetFormaPag(StrToIntDef(edCodigoForma.Text, 0));
    if loFormaPag = nil then
    begin
      MessageBox(handle, 'Forma de pagamento não encontrada', 'WiBi PDV', MB_ICONEXCLAMATION);
      edCodigoForma.Setfocus;
      exit;
    end;
    lblDescricaoForma.Caption := loFormaPag.fp_descricao;
  except
    edCodigoForma.Clear;
    edCodigoForma.Setfocus;
  end;
end;

procedure TFrmPDV.edItemCodigoCancelExit(Sender: TObject);
var
  loResult     : Integer;
  loNF         : TNF;
  loFieldLocate: string;
begin
  if cxPageControl1.ActivePageIndex <> 2 then
    exit;
  if edItemCodigoCancel.Value = 0 then
    exit;
  case goTipoCancelaItem of
    tciPorCodigo:
      begin
        if Length(edItemCodigoCancel.Text) = 13 then
          loFieldLocate := 'pnfi_ean'
        else
          loFieldLocate := 'pr_codigo';
      end;
    tciPorSeq:
      loFieldLocate := 'item';
  end;

  if not dsItensDelete.Locate(loFieldLocate + ';pnfi_cancelado', VarArrayOf([edItemCodigoCancel.Text, 0]), [loCaseInsensitive]) then
  begin
    MessageBox(handle, 'Produto não encontrado!', 'WiBi PDV', MB_ICONEXCLAMATION);
    edItemCodigoCancel.Setfocus;
  end
  else
  begin
    with FrmPDV_DModule do
    begin
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_cancela_item_nf';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      adStoreProc1.Params.ParamByName('@pnfi_id').AsInteger := dsItensDelete.FieldByName('pnfi_id').AsInteger;
      adStoreProc1.execProc;

      if adStoreProc1.FindParam('@max') <> nil then
        loResult := adStoreProc1.ParamByName('@max').AsInteger;
      if loResult > 0 then
      begin
        dsItensDelete.Refresh;
        doGetTotaisCancelItem;
        loNF := goPDVClass.GetTotaisNF(goPnf_id);
        doSetTotaisNF(loNF);
        edItemCodigoCancel.Clear;
        edItemCodigoCancel.Setfocus;
        // doAddItemCancelList(dsItensDelete.FieldByName('item').AsInteger, dsItensDelete.FieldByName('pnfi_valor_total').AsCurrency);
      end;
    end;
  end;
end;

function TFrmPDV.doEncerraNF: Boolean;
var
  loNF    : TNF;
  loResult: Integer;
begin
  result := false;
  loNF   := goPDVClass.GetTotaisNF(FrmPDV.goPnf_id);
  if loNF.TotalAPagar > 0 then
    exit;

  if MessageBox(handle, 'Confirmar encerramento da nota fiscal?', 'WiBi PDV', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = idNO then
  begin
    Setfocus;
    exit;
  end;
  loResult := 0;
  try
    FrmPDV_DModule.ADConnection1.StartTransaction;
    try
      with FrmPDV_DModule do
      begin
        adStoreProc1.Connection     := ADConnection1;
        adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
        adStoreProc1.StoredProcName := 'proc_finaliza_nf';
        adStoreProc1.SchemaName     := 'pdv';
        adStoreProc1.Prepare;
        adStoreProc1.Params.ParamByName('@pnf_id').AsInteger := goPnf_id;
        adStoreProc1.execProc;

        if adStoreProc1.FindParam('@max') <> nil then
          loResult := adStoreProc1.ParamByName('@max').AsInteger;
      end;
      if loResult <= 0 then
      begin
        if FrmPDV_DModule.ADConnection1.InTransaction then
          FrmPDV_DModule.ADConnection1.Rollback;
        MessageBox(handle, 'Problemas ao finalizar nota fiscal.', 'WiBi PDV', MB_ICONEXCLAMATION);
        exit;
      end;
    except
      on E: exception do
      begin
        if FrmPDV_DModule.ADConnection1.InTransaction then
          FrmPDV_DModule.ADConnection1.Rollback;
        FrmPDV_DModule.cdsEmpresa.GetSysMessages(true, self);
        exit;
      end;
    end;
    try
      loNF := goPDVClass.GetNF(goPterm_id, FrmPDV.goPnf_id);
      if goTerminal.pterm_nfce then
      begin
        if loNF.doPrepareCFe(SATSetHeader, SATSetDetails, SATSetPays) then
          SATSendCFe;
      end;
      if goTerminal.pterm_sat then
      begin
        if loNF.doPrepareCFe(SATSetHeader, SATSetDetails, SATSetPays) then
          SATSendCFe;
      end;
    except
      on E: exception do
      begin
        if FrmPDV_DModule.ADConnection1.InTransaction then
          FrmPDV_DModule.ADConnection1.Rollback;
        MessageBox(handle, pChar(E.Message), 'WiBi PDV', MB_ICONEXCLAMATION);
        exit;
      end;
    end;
  finally
    if FrmPDV_DModule.ADConnection1.InTransaction then
      FrmPDV_DModule.ADConnection1.Commit;
  end;
  result := true;
end;

procedure TFrmPDV.edValorFormaExit(Sender: TObject);
var
  loPnfp_id: Integer;
  loNF     : TNF;
  I        : Integer;
begin
  if StrToIntDef(edCodigoForma.Text, 0) = 0 then
    exit;
  if edValorForma.Value = 0 then
    exit;
  loPnfp_id := doAddFormaNF;
  if loPnfp_id = 0 then
    exit;
  doAddFormaList(loPnfp_id);

  if not doEncerraNF then
    exit;

  loNF                           := goPDVClass.GetTotaisNF(goPnf_id);
  cxPageControl1.ActivePageIndex := 0;
  goPnf_id                       := 0;
  doClearItem;
  for I := lstListFormas.Items.Count - 1 to 0 do
    lstListFormas.Items.Delete(I);
  if loNF.Troco > 0 then
  begin
    lblLabelSubTotal.Caption := 'Troco';
    lblSubTotal.Caption      := loNF.TrocoStr;
    shp7.Brush.Color         := clGreen;
  end
  else
  begin
    doClearEncerra;
    doClear(true);
  end;
  doSetStatusMsg;
end;

{ Métodos de limpeza }

procedure TFrmPDV.doClearItem;
begin
  lblCodigo.Caption      := '0';
  lblVrUnitProd.Caption  := FormatCurr('#,##0.00', 0);
  lblQuantProd.Caption   := FormatCurr('#,###0.000', 1);
  lblVrTotalProd.Caption := FormatCurr('#,##0.00', 0);
  goBuffer               := '';
  goQtdProdBuffer        := 1;
  goInserted             := false;
end;

procedure TFrmPDV.doClear(const AClearLista: Boolean = true);
begin
  lblMainProdutoDescr.Caption := '';
  lblVolumes.Caption          := FormatCurr('000', 0);
  lblSubTotal.Caption         := FormatCurr('#,##0.00', 0);
  lblLabelSubTotal.Caption    := 'SubTotal';
  shp7.Brush.Color            := $005B5909;
  if AClearLista then
  begin
    VisibleComponentes(self, 1, true);
    VisibleComponentes(self, 2, true);
    VisibleComponentes(self, 3, true);
    VisibleComponentes(self, 4, true);
    VisibleComponentes(self, 5, true);
    VisibleComponentes(self, 6, true);
    VisibleComponentes(self, 7, true);
    VisibleComponentes(self, 8, true);
  end;
end;

procedure TFrmPDV.doClearEncerra;
var
  loNF: TNF;
begin
  edCodigoForma.Clear;
  lblDescricaoForma.Caption := '';
  loNF                      := goPDVClass.GetTotaisNF(goPnf_id);
  if loNF <> nil then
    edValorForma.Value := loNF.TotalAPagar;
end;

{ Métodos da nota fiscal }

function TFrmPDV.doOpenCloseCash(aus_codigo: Integer; aEncerra: Boolean): Boolean;
begin
  result := true;
  if goPnf_id > 0 then
    exit;
  with FrmPDV_DModule do
  begin
    adStoreProc1.Connection     := ADConnection1;
    adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
    adStoreProc1.StoredProcName := 'proc_abre_fecha_caixa';
    adStoreProc1.SchemaName     := 'pdv';
    adStoreProc1.Prepare;
    adStoreProc1.Params.ParamByName('@em_codigo').AsInteger := ServerEmpresa;
    adStoreProc1.Params.ParamByName('@us_codigo').AsInteger := aus_codigo;
    adStoreProc1.Params.ParamByName('@pterm_id').AsInteger := goPterm_id;
    adStoreProc1.Params.ParamByName('@encerra').AsBoolean  := aEncerra;
    adStoreProc1.execProc;
    if adStoreProc1.FindParam('@max') <> nil then
      if adStoreProc1.ParamByName('@max').AsInteger > 0 then
      begin
        lblCaixa.Caption := FormatFloat('000', 0);
        goPcx_id         := 0;
        doSetStatusMsg;
        if aEncerra then
        begin
          result := true;
          exit;
        end;
      end;
  end;
  result := doGetCaixa;
end;

function TFrmPDV.doOpenCloseOperatorCash(aus_codigo: Integer; asaldo_inicial: Double; aEncerra: Boolean): Boolean;
begin
  result := true;
  if goPnf_id > 0 then
    exit;
  with FrmPDV_DModule do
  begin
    adStoreProc1.Connection     := ADConnection1;
    adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
    adStoreProc1.StoredProcName := 'proc_abre_fecha_caixa_operador';
    adStoreProc1.SchemaName     := 'pdv';
    adStoreProc1.Prepare;
    adStoreProc1.Params.ParamByName('@pcx_id').AsInteger := goPcx_id;
    adStoreProc1.Params.ParamByName('@us_codigo').AsInteger := aus_codigo;
    if not aEncerra then
      adStoreProc1.Params.ParamByName('@pcxo_saldo_inicial').AsBCD := asaldo_inicial;
    adStoreProc1.Params.ParamByName('@encerra').AsBoolean := aEncerra;
    adStoreProc1.execProc;
    if adStoreProc1.FindParam('@max') <> nil then
      if adStoreProc1.ParamByName('@max').AsInteger > 0 then
      begin
        lblCaixaOperador.Caption := FormatFloat('000', 0);
        goPcxo_id                := 0;
        doSetStatusMsg;
        if aEncerra then
        begin
          result := true;
          exit;
        end;
      end;
  end;
  result := doGetCaixaOperador;
end;

procedure TFrmPDV.doNewNF;
begin
  if goPnf_id > 0 then
    exit;
  doClearEncerra;
  doClear(true);
  with FrmPDV_DModule do
  begin
    adStoreProc1.Connection     := ADConnection1;
    adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
    adStoreProc1.StoredProcName := 'proc_gera_nf';
    adStoreProc1.SchemaName     := 'pdv';
    adStoreProc1.Prepare;
    adStoreProc1.Params.ParamByName('@em_codigo').AsInteger := ServerEmpresa;
    adStoreProc1.Params.ParamByName('@pterm_id').AsInteger := goPterm_id;
    adStoreProc1.Params.ParamByName('@pvd_id').AsInteger := 0;
    adStoreProc1.Params.ParamByName('@cl_codigo').AsInteger := 0;
    adStoreProc1.Params.ParamByName('@pnf_scan').AsBoolean := false;
    adStoreProc1.execProc;

    if adStoreProc1.FindParam('@max') <> nil then
      goPnf_id := adStoreProc1.ParamByName('@max').AsInteger;
  end;
  doSetStatusMsg;
end;

procedure TFrmPDV.doAddProdNF(AProduto: TProduto);
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
    adStoreProc1.Params.ParamByName('@pnf_id').AsInteger := goPnf_id;
    adStoreProc1.Params.ParamByName('@pr_codigo').AsInteger := StrToIntDef(AProduto.Codigo, 0);
    adStoreProc1.Params.ParamByName('@pnfi_qtd').AsBCD := AProduto.Quantidade;
    adStoreProc1.Params.ParamByName('@pnfi_valor_unit').AsFmtBCD := AProduto.Valor;
    adStoreProc1.Params.ParamByName('@pnfi_desconto').AsFmtBCD := 0;
    adStoreProc1.Params.ParamByName('@nop_id').AsInteger := 1;
    adStoreProc1.execProc;
  end;
end;

function TFrmPDV.doAddFormaNF: Integer;
begin
  result := 0;
  try
    with FrmPDV_DModule do
    begin
      adStoreProc1.Connection     := ADConnection1;
      adStoreProc1.CatalogName    := ADConnection1.Params.Values['DataBase'];
      adStoreProc1.StoredProcName := 'proc_add_pag_nf';
      adStoreProc1.SchemaName     := 'pdv';
      adStoreProc1.Prepare;
      adStoreProc1.Params.ParamByName('@pnf_id').AsInteger := FrmPDV.goPnf_id;
      adStoreProc1.Params.ParamByName('@fp_codigo').AsInteger := StrToIntDef(edCodigoForma.Text, 0);
      adStoreProc1.Params.ParamByName('@pnfp_valor').AsBCD := edValorForma.Value;
      adStoreProc1.execProc;
      if adStoreProc1.FindParam('@max') <> nil then
        result := adStoreProc1.ParamByName('@max').AsInteger;
    end;
  finally
    doGetTotaisEncerra;
    edCodigoForma.Setfocus;
  end;
end;

procedure TFrmPDV.doAddFormaList(APnfp_id: Integer);
var
  loListItem   : TListItem;
  loListItemPag: TListItemPag;
begin
  loListItemPag.Pnfp_id := APnfp_id;
  loListItem            := lstListFormas.Items.Add;
  loListItem.Data       := Pointer(loListItemPag);
  loListItem.Caption    := StrZero(edCodigoForma.Text, 3);
  loListItem.SubItems.Add(lblDescricaoForma.Caption);
  loListItem.SubItems.Add(FormatCurr('#,##0.00', edValorForma.Value));
  doClearEncerra;
end;

procedure TFrmPDV.doAddFormasList(APags: TObjectList<TNFPag>);
var
  loListItem   : TListItem;
  loListItemPag: TListItemPag;
  I            : Integer;
begin
  if APags = nil then
    exit;
  for I := 0 to APags.Count - 1 do
  begin
    loListItemPag.Pnfp_id := APags.Items[I].Pnfp_id;
    loListItem            := lstListFormas.Items.Add;
    loListItem.Data       := Pointer(loListItemPag);
    loListItem.Caption    := APags.Items[I].cMP;
    loListItem.SubItems.Add(APags.Items[I].cMPDescr);
    loListItem.SubItems.Add(FormatCurr('#,##0.00', APags.Items[I].vMP));
  end;
  doClearEncerra;
end;

procedure TFrmPDV.doAddItensList(AItens: TObjectList<TNFItem>);
var
  I, X: Integer;
begin
  // for I := 0 to self.ComponentCount - 1 do
  // if self.Components[I] is TLabel then
  // if (self.Components[I] as TLabel).tag = 10 then
  // (self.Components[I] as TLabel).Visible := false;
  //
  // X     := 1;
  // for I := 0 to self.ComponentCount - 1 do
  // begin
  // if self.Components[I] is TLabel then
  // if (self.Components[I] as TLabel).tag = 10 then
  // begin
  // if X > AItens.Count then
  // break;
  // (self.Components[I] as TLabel).Visible := true;
  // inc(X);
  // end;
  // end;
  VisibleComponentes(self, 1, true);
  VisibleComponentes(self, 2, true);
  VisibleComponentes(self, 3, true);
  VisibleComponentes(self, 4, true);
  VisibleComponentes(self, 5, true);
  VisibleComponentes(self, 6, true);
  VisibleComponentes(self, 7, true);
  VisibleComponentes(self, 8, true);
  X     := 1;
  for I := 0 to AItens.Count - 1 do
  begin
    if (AItens.Count - I) > 8 then
      continue;

    VisibleComponentes(self, X);
    case X of
      1:
        begin
          lblItem1.Caption       := StrZero(IntToStr(AItens.Items[I].ItemSeq), 3);
          lblCodigo1.Caption     := AItens.Items[I].EAN;
          lblDescricao1.Caption  := AItens.Items[I].NomeProd;
          lblQtd1.Caption        := AItens.Items[I].QtdStr;
          lblUnidade1.Caption    := AItens.Items[I].Unidade;
          lblVrUnitario1.Caption := AItens.Items[I].VlrUnitStr;
          lblVrTotal1.Caption    := AItens.Items[I].VlrTotalStr;
        end;
      2:
        begin
          lblItem2.Caption       := StrZero(IntToStr(AItens.Items[I].ItemSeq), 3);
          lblCodigo2.Caption     := AItens.Items[I].EAN;
          lblDescricao2.Caption  := AItens.Items[I].NomeProd;
          lblQtd2.Caption        := AItens.Items[I].QtdStr;
          lblUnidade2.Caption    := AItens.Items[I].Unidade;
          lblVrUnitario2.Caption := AItens.Items[I].VlrUnitStr;
          lblVrTotal2.Caption    := AItens.Items[I].VlrTotalStr;
        end;
      3:
        begin
          lblItem3.Caption       := StrZero(IntToStr(AItens.Items[I].ItemSeq), 3);
          lblCodigo3.Caption     := AItens.Items[I].EAN;
          lblDescricao3.Caption  := AItens.Items[I].NomeProd;
          lblQtd3.Caption        := AItens.Items[I].QtdStr;
          lblUnidade3.Caption    := AItens.Items[I].Unidade;
          lblVrUnitario3.Caption := AItens.Items[I].VlrUnitStr;
          lblVrTotal3.Caption    := AItens.Items[I].VlrTotalStr;
        end;
      4:
        begin
          lblitem4.Caption       := StrZero(IntToStr(AItens.Items[I].ItemSeq), 3);
          lblCodigo4.Caption     := AItens.Items[I].EAN;
          lblDescricao4.Caption  := AItens.Items[I].NomeProd;
          lblQtd4.Caption        := AItens.Items[I].QtdStr;
          lblUnidade4.Caption    := AItens.Items[I].Unidade;
          lblVrUnitario4.Caption := AItens.Items[I].VlrUnitStr;
          lblVrTotal4.Caption    := AItens.Items[I].VlrTotalStr;
        end;
      5:
        begin
          lblItem5.Caption       := StrZero(IntToStr(AItens.Items[I].ItemSeq), 3);
          lblCodigo5.Caption     := AItens.Items[I].EAN;
          lblDescricao5.Caption  := AItens.Items[I].NomeProd;
          lblQtd5.Caption        := AItens.Items[I].QtdStr;
          lblUnidade5.Caption    := AItens.Items[I].Unidade;
          lblVrUnitario5.Caption := AItens.Items[I].VlrUnitStr;
          lblVrTotal5.Caption    := AItens.Items[I].VlrTotalStr;
        end;
      6:
        begin
          lblItem6.Caption       := StrZero(IntToStr(AItens.Items[I].ItemSeq), 3);
          lblCodigo6.Caption     := AItens.Items[I].EAN;
          lblDescricao6.Caption  := AItens.Items[I].NomeProd;
          lblQtd6.Caption        := AItens.Items[I].QtdStr;
          lblUnidade6.Caption    := AItens.Items[I].Unidade;
          lblVrUnitario6.Caption := AItens.Items[I].VlrUnitStr;
          lblVrTotal6.Caption    := AItens.Items[I].VlrTotalStr;
        end;
      7:
        begin
          lblItem7.Caption       := StrZero(IntToStr(AItens.Items[I].ItemSeq), 3);
          lblCodigo7.Caption     := AItens.Items[I].EAN;
          lblDescricao7.Caption  := AItens.Items[I].NomeProd;
          lblQtd7.Caption        := AItens.Items[I].QtdStr;
          lblUnidade7.Caption    := AItens.Items[I].Unidade;
          lblVrUnitario7.Caption := AItens.Items[I].VlrUnitStr;
          lblVrTotal7.Caption    := AItens.Items[I].VlrTotalStr;
        end;
      8:
        begin
          lblItem8.Caption       := StrZero(IntToStr(AItens.Items[I].ItemSeq), 3);
          lblCodigo8.Caption     := AItens.Items[I].EAN;
          lblDescricao8.Caption  := AItens.Items[I].NomeProd;
          lblQtd8.Caption        := AItens.Items[I].QtdStr;
          lblUnidade8.Caption    := AItens.Items[I].Unidade;
          lblVrUnitario8.Caption := AItens.Items[I].VlrUnitStr;
          lblVrTotal8.Caption    := AItens.Items[I].VlrTotalStr;
        end;
    end;
    inc(X);
  end;

end;

// procedure TFrmPDV.doAddProdList(AProduto: TProduto);
// var
// loItemIdx: Integer;
// begin
// if lstItensNF.Lines.Count = 0 then
// loItemIdx := 1
// else if lstItensNF.Lines.Count = 2 then
// loItemIdx := 2
// else
// loItemIdx := lstItensNF.Lines.Count - (lstItensNF.Lines.Count div 2);
// lstItensNF.Lines.Add(StrZero(IntToStr(loItemIdx), 3) + '    ' + AProduto.EAN + '    ' + AProduto.Descricao);
// lstItensNF.Lines.Add(                      //
// AlignRight(AProduto.QuantidadeStr, 15) + //
// AlignRight(AProduto.Unidade, 9) +        //
// AlignRight(AProduto.ValorStr, 45) +      //
// AlignRight(AProduto.TotalStr, 20));
// lstItensNF.Lines.Add('');
// // lstItensNF.ItemIndex := lstItensNF.Count - 1;
// end;

procedure TFrmPDV.doAddItemCancelList(AItem: Integer; AValor: Double);
begin
  // lstItensNF.Lines.Add(StrZero(IntToStr(AItem), 3) + '    ' + AlignRight('-' + FormatFloat('#,##0.00', AValor), 15));
  // lstItensNF.ItemIndex := lstItensNF.Count - 1;
end;

initialization

ReportMemoryLeaksOnShutdown := true;

end.
