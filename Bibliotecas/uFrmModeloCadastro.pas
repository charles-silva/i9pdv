unit uFrmModeloCadastro;

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
  FMTBcd,
  DB,
  SqlExpr,
  DBClient,
  MConnect,
  Mask,
  StdCtrls,
  ExtCtrls,
  Buttons,
  ComCtrls,
  jpeg,
  ToolWin,
  Dialogs,
  DBCtrls,
  ButtonGroup,
  cxGraphics,
  cxControls,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxDBEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  ActnList,
  DBActns,
  uSCDSource,
  cxPropertiesStore,
  Grids,
  DBGrids,
  cxCheckComboBox,
  cxDBCheckComboBox,
  uGlobalLibWiBi,
  ACBrBase,
  ACBrValidador,
  cxCurrencyEdit,
  Menus,
  cxLookAndFeelPainters,
  cxButtons,
  cxGroupBox,
  cxRadioGroup,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxDBData,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  ImgList,
  cxCheckBox,
  cxImageComboBox,
  cxLookAndFeels,
  dxSkinsCore,
  dxSkinBlue,
  dxSkinscxPCPainter, dxSkinMoneyTwins, uSimThread, uFrmContatosForn,
  dxSkinWhiteprint, cxNavigator, dxSkiniMaginary, 
  dxSkinOffice2010Silver, dxSkinCaramel, dxSkinDevExpressStyle, System.Actions,
  System.ImageList;

type
  TFrmModeloCadastro = class(TForm)
    pnTopTitle: TPanel;
    Label14: TLabel;
    lblTitleTop: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edfo_codigoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnAddEnderecoClick(Sender: TObject);
    procedure btnEditaEnderecoClick(Sender: TObject);
    procedure btnDelEnderecoClick(Sender: TObject);
    procedure btnPesqFornClick(Sender: TObject);
    procedure btnAddContatoClick(Sender: TObject);
    procedure rgen_pessoaPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eden_cnpjcpfExit(Sender: TObject);
    procedure btnEditContatoClick(Sender: TObject);
    procedure ToolButton42Click(Sender: TObject);
    procedure cxGridEnderecosEnter(Sender: TObject);
    procedure cxGridEnderecosExit(Sender: TObject);
    procedure cxGridFonesEnter(Sender: TObject);
    procedure cxGridFonesExit(Sender: TObject);
    procedure cxGridContatosEnter(Sender: TObject);
    procedure cxGridContatosExit(Sender: TObject);
    procedure cxGridEnderecoscxGridDBTableView1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SimThread1Load(Sender: TObject);
    procedure ExecuteLookup(var Msg: TMessage); message SIM_EXEMENU_IN;
  private
    procedure LoadContas;

    {Private declarations}
  public
    Ffo_codigo_public_lookup: integer;
    TipoEntidade: Char;
  end;

var
  FrmModeloCadastro: TFrmModeloCadastro;

implementation

uses
  uFrmPesquisaEntidades,
  uFrmDModule,
  uDMCadastroFornecedores,
  uFrmEnderecos,
  uFrmPesquisaFornecedores,
  uFrmEntidades;
{$R *.dfm}

procedure TFrmModeloCadastro.ExecuteLookup(var Msg: TMessage);
begin
  edfo_codigo.EditValue := Msg.WParam;
  edfo_codigo.OnExit(edfo_codigo);
end;

procedure TFrmModeloCadastro.eden_cnpjcpfExit(Sender: TObject);
var
  LCNPJCPF: string;
  LPessoa: integer;
begin
  eden_cnpjcpf.Style.Color := clWhite;

  if (Trim(eden_cnpjcpf.Text) = '') then
    exit;

  ACBrValidador1.Documento := AnsiString(eden_cnpjcpf.Text);

  if (not ACBrValidador1.Validar){and (LDMCadastroCliente.cdsEntidades.State = dsInsert)} then
  begin
    MessageBox(Handle, pChar(ACBrValidador1.MsgErro), 'i9 Mobile', MB_ICONEXCLAMATION);
    eden_cnpjcpf.SetFocus;
    eden_cnpjcpf.Clear;
    exit;
  end;

  with DmFornecedores do
  begin
    if (eden_cnpjcpf.Text = cdsFornecedores.FieldByName('en_cnpjcpf').AsString) then
      exit;

    cdsPesquisa.Close;
    cdsPesquisa.CommandText := 'Select E.*, F.* from t_entidades E ' + ' inner join t_fornecedores F on (E.en_Codigo = F.en_codigo)' + ' where E.en_cnpjcpf = ' + QuotedStr(eden_cnpjcpf.Text);
    cdsPesquisa.Open;

    if cdsPesquisa.IsEmpty then
    begin
      cdsCPFCNPJ.Close;
      cdsCPFCNPJ.CommandText := 'Select * from t_entidades ' + ' where en_cnpjcpf = ' + QuotedStr(eden_cnpjcpf.Text);
      cdsCPFCNPJ.Open;
      if cdsCPFCNPJ.IsEmpty then
      begin
        // eden_cnpjcpf.Enabled := false;
        LCNPJCPF := eden_cnpjcpf.Text;
        LPessoa := rgen_pessoa.ItemIndex;
        {Insere novo Fornecedore}
        if not(cdsFornecedores.State in [dsInsert, dsEdit]) then
          cdsFornecedores.Append;

        rgen_pessoa.ItemIndex := LPessoa;
        eden_cnpjcpf.Text := LCNPJCPF;
        eden_razaosocial.SetFocus;
      end
      else
      begin
        if MessageBox(Handle, 'Entidade já cadastrada! Deseja torná-la Fornecedor?', 'i9 Mobile', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        begin
          with FrmDModule do
          begin
            adStoreProc1.Connection := ADConnection1;
            adStoreProc1.CatalogName := ADConnection1.Params.Values['DataBase'];
            adStoreProc1.StoredProcName := 'proc_input_fornecedores_only';
            adStoreProc1.SchemaName := 'dbo';
            adStoreProc1.Prepare;
            adStoreProc1.Params.ParamByName('@en_codigo').AsInteger := cdsCPFCNPJ.FieldByName('en_codigo').AsInteger;
            adStoreProc1.execProc;

            // if adStoreProc1.FindParam('@max') <> nil then
            // LReturn := adStoreProc1.ParamByName('@max').AsInteger;
          end;

          cdsFornecedores.Close;
          cdsFornecedores.CommandText := 'Select E.*, F.* from t_Entidades E ' + ' inner join t_Fornecedores F on (E.en_Codigo = F.en_codigo)' + ' where E.en_codigo = ' + QuotedStr
            (cdsCPFCNPJ.FieldByName('en_codigo').AsString);

          cdsFornecedores.Open;

        end
        else
          eden_cnpjcpf.SetFocus;
      end;
    end
    else
    begin
      cdsFornecedores.Close;
      cdsFornecedores.CommandText := 'Select E.*, C.* from t_entidades E ' + ' inner join t_fornecedores C on (E.en_Codigo = C.en_codigo)' + ' where E.en_codigo = ' + QuotedStr
        (cdsPesquisa.FieldByName('en_codigo').AsString);
      cdsFornecedores.Open;
      edfo_codigo.Enabled := true;
    end;
  end;

end;

procedure TFrmModeloCadastro.edfo_codigoExit(Sender: TObject);
begin
  if StrToInt(edfo_codigo.Text) <= 0 then
    exit;
  DmFornecedores.cdsFornecedores.Close;
  DmFornecedores.cdsFornecedores.CommandText := 'select a.fo_codigo,a.tp_status,a.fo_transportador,a.fo_pl_id_def,b.* from t_fornecedores a, t_entidades b ' +
    'where a.en_codigo = b.en_codigo and a.fo_codigo = ' + QuotedStr(edfo_codigo.Text);
  DmFornecedores.cdsFornecedores.Open;
  // eden_cnpjcpf.Text := DMFornecedores.cdsFornecedores.FieldByName('en_cnpjcpf').AsString;

  if DmFornecedores.cdsFornecedores.IsEmpty then
  begin
    Application.MessageBox('Fornecedor não encontrado!', 'i9 Mobile', MB_ICONEXCLAMATION);
    DmFornecedores.cdsTelefones.Close;
    DmFornecedores.cdsEnderecos.Close;
    DmFornecedores.cdsContatos.Close;
    edfo_codigo.SetFocus;
  end;

end;

procedure TFrmModeloCadastro.FormActivate(Sender: TObject);
begin
  SendMessage(MainHandle, SIM_MENU, 100, integer(DmFornecedores.doFornecedores));
  SendMessage(MainHandle, SIM_MENU, MSG_NONE, 0);

end;

procedure TFrmModeloCadastro.FormCreate(Sender: TObject);
begin
  FrmFornecedores := Self;
  DmFornecedores := TDMFornecedores.Create(Self);
  DmFornecedores.LFrmFornecedores := Self;
end;

procedure TFrmModeloCadastro.FormDestroy(Sender: TObject);
begin
  DmFornecedores.cdsFornecedores.Close;
  DmFornecedores.cdsTelefones.Close;
  DmFornecedores.cdsContatos.Close;
  DmFornecedores.cdsEnderecos.Close;
  DmFornecedores.cdsTiposCargos.Close;

  if Assigned(FrmPesquisaFornecedores) then
  begin
    FrmPesquisaFornecedores.Release;
    FrmPesquisaFornecedores := nil;
  end;
end;

procedure TFrmModeloCadastro.FormKeyDown(Sender: TObject;

  var Key: Word; Shift: TShiftState);
var
  LFocusComp: TComponent;
begin
  LFocusComp := GetFocusedComponent(Self);

  case Key of
    VK_INSERT:
      begin
        {Endereços}
        if (ActiveControl.Parent = cxGridEnderecos) then
        begin
          Key := 0;
          btnAddEndereco.Click;
          exit;
        end;
        {Fones}
        if (ActiveControl.Parent = cxGridFones) then
        begin
          Key := 0;
          btnAddFones.Click;
          exit;
        end;
        {Cargos/Empresas}
        if (ActiveControl.Parent = cxGridContatos) then
        begin
          Key := 0;
          btnAddContato.Click;
          exit;
        end;
        if ssctrl in Shift then
          SendMessage(MainHandle, SIM_COMDATASET, MSG_NEW, 0);
      end;
    VK_DELETE:
      begin
        {Endereços}
        if (ActiveControl.Parent = cxGridEnderecos) then
        begin
          Key := 0;
          btnDelEndereco.Click;
          exit;
        end;
        {Fones}
        if (ActiveControl.Parent = cxGridFones) then
        begin
          Key := 0;
          btnDelFones.Click;
          exit;
        end;
        {Cargos/Empresas}
        if (ActiveControl.Parent = cxGridContatos) then
        begin
          Key := 0;
          btnDelContato.Click;
          exit;
        end;

        if ssctrl in Shift then
          SendMessage(MainHandle, SIM_COMDATASET, MSG_DELETE, 0);
      end;
    VK_BACK:
      if ssctrl in Shift then
        SendMessage(MainHandle, SIM_COMDATASET, MSG_CANCEL, 0);
    VK_F5:
      SendMessage(MainHandle, SIM_COMDATASET, MSG_REFRESH, 0);
    83: {S}
      if ssctrl in Shift then
        SendMessage(MainHandle, SIM_COMDATASET, MSG_POST, 0);
    69: {E}
      begin
        {Endereços}
        if (ActiveControl.Parent = cxGridEnderecos) then
        begin
          Key := 0;
          btnEditaEndereco.Click;
          exit;
        end;
        {Fones}
        if (ActiveControl.Parent = cxGridFones) then
        begin
          Key := 0;
          btnEditaFones.Click;
          exit;
        end;
        {Cargos/Empresas}
        if (ActiveControl.Parent = cxGridContatos) then
        begin
          Key := 0;
          btnEditContato.Click;
          exit;
        end;

        if ssctrl in Shift then
          SendMessage(MainHandle, SIM_COMDATASET, MSG_EDIT, 0);
      end;
    VK_RETURN:
      begin
        if (LFocusComp is TcxCustomLookupComboBox) then
          if TcxCustomLookupComboBox(LFocusComp).DroppedDown then
            exit;

        {telefones}
        if (ActiveControl.Parent = cxGridFones)
          or cxGrid1DBTableViewDDI.Editing or cxGridFonesDBTableView1DDD.Editing or cxGridFonesDBTableView1Numero.Editing or cxGridFonesDBTableView1Tipo.Editing then
        begin
          // Key := 0;
          exit;
        end;

        if not(ssctrl in Shift) then
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_UP:
      begin
        if (ActiveControl.Parent = cxGridFones) or (ActiveControl.Parent = cxGridEnderecos) or (ActiveControl.Parent = cxGridContatos) then
          exit;

        if (LFocusComp is TcxCustomLookupComboBox) then
          if TcxCustomLookupComboBox(LFocusComp).DroppedDown then
            exit;
        if not(ssctrl in Shift) then
          Perform(WM_NEXTDLGCTL, 1, 1);
      end;
    VK_ESCAPE:
      edfo_codigo.SetFocus;
    VK_SPACE:
      begin
        Key := 0;
        if (LFocusComp = edfo_codigo) then
          btnPesqForn.Click;
      end;
  end;
end;

procedure TFrmModeloCadastro.FormKeyPress(Sender: TObject;

  var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TFrmModeloCadastro.FormShow(Sender: TObject);
begin
  SendMessage(MainHandle, SIM_MENU, 100, integer(DmFornecedores.doFornecedores));
  SendMessage(MainHandle, SIM_MENU, MSG_NONE, 0);

  DmFornecedores.cdsFornecedores.CommandText :=
    'select a.fo_codigo, a.tp_status,a.fo_transportador,a.fo_pl_id_def, b.* from t_fornecedores a, t_entidades b ' + ' where a.en_codigo = b.en_codigo and 1 = 0';
  DmFornecedores.cdsFornecedores.Open;
  edfo_codigo.SetFocus;
  SendMessage(MainHandle, SIM_MENU, 100, integer(DmFornecedores.doFornecedores));

  {Tipo de Telefone}
  LoadLookUpComboBox(Self, FrmDModule.ADConnection1, cxGridFonesDBTableView1Tipo, 'Select * from t_tipos where tg_id = 4 and tp_ativo = 1', 'tp_descricao', 'tp_id');

  {Tipo de Operadora}
  LoadLookUpComboBox(Self, FrmDModule.ADConnection1, cxGridFonesDBTableView1tp_descricao_1, 'Select * from t_tipos where tg_id = 69 and tp_ativo = 1', 'tp_descricao', 'tp_id');

  {Tipo de Cargos}
  LoadLookUpComboBox(Self, FrmDModule.ADConnection1, cxGridContatoscxGridDBTableView2tp_cargo, 'Select * from t_tipos where tg_id = 3 and tp_ativo = 1', 'tp_descricao', 'tp_id');

  DmFornecedores.cdsTiposCargos.Open;
  LoadContas;

end;

procedure TFrmModeloCadastro.rgen_pessoaPropertiesChange(Sender: TObject);
begin
  eden_sexo.Enabled := (rgen_pessoa.ItemIndex = 0);
  eden_rg.Enabled := (rgen_pessoa.ItemIndex = 0);
  eden_rg_organ.Enabled := (rgen_pessoa.ItemIndex = 0);
  eden_inscestad.Enabled := (rgen_pessoa.ItemIndex = 1);
  eden_inscmun.Enabled := (rgen_pessoa.ItemIndex = 1);
  case rgen_pessoa.ItemIndex of
    0:
      begin
        ACBrValidador1.TipoDocto := docCPF;
        eden_cnpjcpf.Properties.EditMask := '999.999.999-99;0;_';
      end;
    1:
      begin
        ACBrValidador1.TipoDocto := docCNPJ;
        eden_cnpjcpf.Properties.EditMask := '99.999.999/9999-99;0;_';
      end;
  end;
  eden_cnpjcpf.SetFocus;
end;

procedure TFrmModeloCadastro.SimThread1Load(Sender: TObject);
begin
  if Ffo_codigo_public_lookup > 0 then
  begin
    edfo_codigo.EditValue := Ffo_codigo_public_lookup;
    eden_razaosocial.SetFocus;
    Ffo_codigo_public_lookup := 0;
  end;

end;

procedure TFrmModeloCadastro.btnAddContatoClick(Sender: TObject);
begin
  if (DmFornecedores.cdsFornecedores.State in [dsInsert, dsEdit]) then
    DmFornecedores.cdsFornecedores.Post;
  if DmFornecedores.cdsFornecedores.FieldByName('en_codigo').AsInteger = 0 then
  begin
    Application.MessageBox('Grave os dados do fornecedor antes de inserir um contato.', 'i9 Mobile', MB_ICONEXCLAMATION);
  end
  else
  begin
    FrmContatosForn := TFrmContatosForn.Create(Self);
    try
      FrmContatosForn.Ffo_codigo := DmFornecedores.cdsFornecedores.FieldByName('fo_codigo').AsString;
      FrmContatosForn.Ffn_codigo := '0';
      if FrmContatosForn.ShowModal = mrOk then
        SetFocus;
    finally
      DmFornecedores.cdsContatos.Refresh;
    end;
  end;
end;

procedure TFrmModeloCadastro.ToolButton42Click(Sender: TObject);
begin
  DmFornecedores.cdsContatos.Delete;
end;

procedure TFrmModeloCadastro.btnAddEnderecoClick(Sender: TObject);
begin
  if (DmFornecedores.cdsFornecedores.State in [dsInsert, dsEdit]) then
    DmFornecedores.cdsFornecedores.Post;
  if DmFornecedores.cdsFornecedores.FieldByName('en_codigo').AsString = '' then
  begin
    Application.MessageBox('Grave os dados do Fornecedor antes de inserir um Endereço.', 'i9 Mobile', MB_ICONEXCLAMATION);
  end
  else
  begin
    FrmEnderecos := TfrmEnderecos.Create(Self);
    FrmEnderecos.FEndereco := nil;
    FrmEnderecos.ckCorres.EditValue := 0;
    if FrmEnderecos.ShowModal = mrOk then
    begin

      with FrmDModule do
      begin
        adStoreProc1.Connection := ADConnection1;
        adStoreProc1.CatalogName := ADConnection1.Params.Values['DataBase'];
        adStoreProc1.StoredProcName := 'proc_input_enderecos';
        adStoreProc1.SchemaName := 'dbo';
        adStoreProc1.Prepare;
        adStoreProc1.Params.ParamByName('@ed_id').AsInteger := 0;
        adStoreProc1.Params.ParamByName('@lo_id').AsInteger := 0;
        adStoreProc1.Params.ParamByName('@br_id').AsInteger := FrmEnderecos.edbr_id.EditValue;
        adStoreProc1.Params.ParamByName('@cd_id').AsInteger := FrmEnderecos.edcd_id.EditValue;
        adStoreProc1.Params.ParamByName('@ed_cep').AsString := FrmEnderecos.eden_cep.Text;
        adStoreProc1.Params.ParamByName('@ed_complemento').AsString := FrmEnderecos.eden_complemento.Text;
        adStoreProc1.Params.ParamByName('@ed_correspondencia').AsSmallint := FrmEnderecos.ckCorres.EditValue;
        adStoreProc1.Params.ParamByName('@ed_logradouro').AsString := FrmEnderecos.eded_logradouro.Text;
        adStoreProc1.Params.ParamByName('@ed_numero').AsString := FrmEnderecos.eden_numero.Text;
        adStoreProc1.Params.ParamByName('@ed_ponto_ref').AsString := FrmEnderecos.eden_ponto_Ref.Text;
        adStoreProc1.Params.ParamByName('@en_codigo').AsInteger := DmFornecedores.cdsFornecedores.FieldByName('en_codigo').AsInteger;
        adStoreProc1.Params.ParamByName('@tp_id').AsInteger := FrmEnderecos.edtp_id.EditValue;
        adStoreProc1.Params.ParamByName('@uf_id').AsString := FrmEnderecos.eduf_id.Text;
        adStoreProc1.Params.ParamByName('@tlo_id').AsInteger := FrmEnderecos.edtlo_id.EditValue;
        adStoreProc1.Params.ParamByName('@pa_id').AsInteger := FrmEnderecos.cbpa_id.EditValue;
        adStoreProc1.Params.ParamByName('@ed_descricao_completa').AsString := FrmEnderecos.eded_descricao_completa.Text;
        adStoreProc1.Params.ParamByName('@ed_descricao_reduzida').AsString := FrmEnderecos.eded_descricao_reduzida.Text;
        adStoreProc1.execProc;

        // if adStoreProc1.FindParam('@max') <> nil then
        // LReturn := adStoreProc1.ParamByName('@max').AsInteger;
      end;

          FrmDModule.doGetSysMessages;
      // DmFornecedores.cdsFornecedores.GetSysMessages(true, Self);
      DmFornecedores.LoadDetail;
    end;
    cxGridEnderecos.SetFocus;
  end;
end;

procedure TFrmModeloCadastro.btnDelEnderecoClick(Sender: TObject);
begin
  if DmFornecedores.cdsEnderecos.IsEmpty then
    exit;
  DmFornecedores.cdsEnderecos.Delete;
end;

procedure TFrmModeloCadastro.btnEditaEnderecoClick(Sender: TObject);
var
  LReturn: OleVariant;
begin
  if not TWinControl(Sender).Enabled then
    exit;

  if DmFornecedores.cdsFornecedores.IsEmpty then
    exit;
  if (DmFornecedores.cdsFornecedores.State in [dsInsert, dsEdit]) then
    DmFornecedores.cdsFornecedores.Post;

  if DmFornecedores.cdsEnderecos.FieldByName('ed_id').AsString = '' then
    exit;

  try
    FrmEnderecos := TfrmEnderecos.Create(Self);
    FrmEnderecos.FOpenMode := eomStandardEdit;
    {Dados do Endereço}
    FrmEnderecos.FEndereco := TEndereco.Create;
    FrmEnderecos.FEndereco.pa_id := DmFornecedores.cdsEnderecos.FieldByName('pa_id').AsString;
    FrmEnderecos.FEndereco.cd_id := DmFornecedores.cdsEnderecos.FieldByName('cd_id').AsString;
    FrmEnderecos.FEndereco.br_id := DmFornecedores.cdsEnderecos.FieldByName('br_id').AsString;
    FrmEnderecos.FEndereco.uf_id := DmFornecedores.cdsEnderecos.FieldByName('uf_id').AsString;
    FrmEnderecos.FEndereco.tlo_id := DmFornecedores.cdsEnderecos.FieldByName('tlo_id').AsString;
    FrmEnderecos.FEndereco.ed_cep := DmFornecedores.cdsEnderecos.FieldByName('ed_cep').AsString;
    FrmEnderecos.FEndereco.ed_logradouro := DmFornecedores.cdsEnderecos.FieldByName('ed_logradouro').AsString;
    FrmEnderecos.FEndereco.ed_complemento := DmFornecedores.cdsEnderecos.FieldByName('ed_complemento').AsString;
    FrmEnderecos.FEndereco.ed_numero := DmFornecedores.cdsEnderecos.FieldByName('ed_numero').AsString;
    FrmEnderecos.FEndereco.ed_correspondencia := DmFornecedores.cdsEnderecos.FieldByName('ed_correspondencia').AsString;
    FrmEnderecos.FEndereco.ed_ponto_ref := DmFornecedores.cdsEnderecos.FieldByName('ed_ponto_ref').AsString;
    FrmEnderecos.FEndereco.tp_id := DmFornecedores.cdsEnderecos.FieldByName('tp_id').AsString;

    // FrmEnderecos.Fen_codigo := DMFornecedores.cdsFornecedores.FieldByName('en_codigo').AsString;
    // FrmEnderecos.Fed_id := DMFornecedores.cdsFEndereco.FieldByName('ed_id').AsString;
    if FrmEnderecos.ShowModal = mrOk then
    begin
      with FrmDModule do
      begin
        adStoreProc1.Connection := ADConnection1;
        adStoreProc1.CatalogName := ADConnection1.Params.Values['DataBase'];
        adStoreProc1.StoredProcName := 'proc_input_enderecos';
        adStoreProc1.SchemaName := 'dbo';
        adStoreProc1.Prepare;
        adStoreProc1.Params.ParamByName('@ed_id').AsInteger := DmFornecedores.cdsEnderecos.FieldByName('ed_id').AsInteger;
        adStoreProc1.Params.ParamByName('@lo_id').AsInteger := 0;
        adStoreProc1.Params.ParamByName('@br_id').AsInteger := FrmEnderecos.edbr_id.EditValue;
        adStoreProc1.Params.ParamByName('@cd_id').AsInteger := FrmEnderecos.edcd_id.EditValue;
        adStoreProc1.Params.ParamByName('@ed_cep').AsString := FrmEnderecos.eden_cep.Text;
        adStoreProc1.Params.ParamByName('@ed_complemento').AsString := FrmEnderecos.eden_complemento.Text;
        adStoreProc1.Params.ParamByName('@ed_correspondencia').AsSmallint := FrmEnderecos.ckCorres.EditValue;
        adStoreProc1.Params.ParamByName('@ed_logradouro').AsString := FrmEnderecos.eded_logradouro.Text;
        adStoreProc1.Params.ParamByName('@ed_numero').AsString := FrmEnderecos.eden_numero.Text;
        adStoreProc1.Params.ParamByName('@ed_ponto_ref').AsString := FrmEnderecos.eden_ponto_Ref.Text;
        adStoreProc1.Params.ParamByName('@en_codigo').AsInteger := DmFornecedores.cdsFornecedores.FieldByName('en_codigo').AsInteger;
        adStoreProc1.Params.ParamByName('@tp_id').AsInteger := FrmEnderecos.edtp_id.EditValue;
        adStoreProc1.Params.ParamByName('@uf_id').AsString := FrmEnderecos.eduf_id.Text;
        adStoreProc1.Params.ParamByName('@tlo_id').AsInteger := FrmEnderecos.edtlo_id.EditValue;
        adStoreProc1.Params.ParamByName('@pa_id').AsInteger := FrmEnderecos.cbpa_id.EditValue;
        adStoreProc1.Params.ParamByName('@ed_descricao_completa').AsString := FrmEnderecos.eded_descricao_completa.Text;
        adStoreProc1.Params.ParamByName('@ed_descricao_reduzida').AsString := FrmEnderecos.eded_descricao_reduzida.Text;
        adStoreProc1.execProc;

        if adStoreProc1.FindParam('@max') <> nil then
          LReturn := adStoreProc1.ParamByName('@max').AsInteger;
      end;

          FrmDModule.doGetSysMessages;
      // DmFornecedores.cdsFornecedores.GetSysMessages(true, Self);
      DmFornecedores.LoadDetail;
    end;
    cxGridEnderecos.SetFocus;
  finally
    FrmEnderecos.FEndereco.Free;
  end;
end;

procedure TFrmModeloCadastro.btnEditContatoClick(Sender: TObject);
begin
  if not TWinControl(Sender).Enabled then
    exit;
  if (DmFornecedores.cdsFornecedores.State in [dsInsert, dsEdit]) then
    DmFornecedores.cdsFornecedores.Post;
  FrmContatosForn := TFrmContatosForn.Create(Self);
  try
    FrmContatosForn.Ffo_codigo := DmFornecedores.cdsFornecedores.FieldByName('fo_codigo').AsString;
    FrmContatosForn.Ffn_codigo := DmFornecedores.cdsContatos.FieldByName('fn_codigo').AsString;
    if FrmContatosForn.ShowModal = mrOk then
      SetFocus;
  finally
    DmFornecedores.cdsContatos.Refresh;
  end;
end;

procedure TFrmModeloCadastro.btnPesqFornClick(Sender: TObject);
begin
  if not Assigned(FrmPesquisaFornecedores) then
    FrmPesquisaFornecedores := TFrmPesquisaFornecedores.Create(Self);
  try
    if FrmPesquisaFornecedores.ShowModal = mrOk then
    begin
      edfo_codigo.EditValue := FrmPesquisaFornecedores.adPesquisa.FieldByName('fo_codigo').AsString;
      eden_cnpjcpf.EditValue := FrmPesquisaFornecedores.adPesquisa.FieldByName('en_cnpjcpf').AsString;
      DmFornecedores.cdsFornecedores.Close;
      DmFornecedores.cdsFornecedores.CommandText :=
        'select e.*,f.fo_codigo, f.tp_status,f.fo_transportador,f.fo_pl_id_def from t_Fornecedores f, t_entidades e where f.en_codigo = e.en_codigo ' + 'and f.fo_codigo =' + QuotedStr
        (FrmPesquisaFornecedores.adPesquisa.FieldByName('fo_codigo').AsString);
      DmFornecedores.cdsFornecedores.Open;
    end;
  finally
    SetFocus;
  end;
end;

procedure TFrmModeloCadastro.cxGridContatosEnter(Sender: TObject);
begin
  cxStyleContatos.Color := $00B7FFFF;
end;

procedure TFrmModeloCadastro.cxGridContatosExit(Sender: TObject);
begin
  cxStyleContatos.Color := clWhite;
end;

procedure TFrmModeloCadastro.cxGridEnderecoscxGridDBTableView1DblClick(Sender: TObject);
begin
  btnEditaEndereco.Click;
end;

procedure TFrmModeloCadastro.cxGridEnderecosEnter(Sender: TObject);
begin
  cxStyleEndereco.Color := $00B7FFFF;
end;

procedure TFrmModeloCadastro.cxGridEnderecosExit(Sender: TObject);
begin
  cxStyleEndereco.Color := clWhite;
end;

procedure TFrmModeloCadastro.cxGridFonesEnter(Sender: TObject);
begin
  cxStyleFones.Color := $00B7FFFF;
end;

procedure TFrmModeloCadastro.cxGridFonesExit(Sender: TObject);
begin
  cxStyleFones.Color := clWhite;
end;

procedure TFrmModeloCadastro.LoadContas;
var
  LSQL: String;
begin
  LSQL := StringReplace(mem_sql_contas.Text, '@em_codigo', IntToStr(ServerEmpresa), [rfReplaceAll]);
  LoadLookUpComboBox(Self, FrmDModule.ADConnection1, cbfo_pl_id_def, LSQL, 'pl_codigo_abrev;pl_codigo;pl_nome;pl_descricao;', 'pl_id', '', '', true, 4, 'Cód.Reduzido;Código;Nome;Descrição da Conta;',
    '200;200');
end;

end.
