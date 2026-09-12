unit uimpDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, clipbrd;

type
  Tfimportacao = class(TForm)
    ds1: TDataSource;
    a1: TADOQuery;
    cxButton1: TcxButton;
    pb: TProgressBar;
    ds2: TDataSource;
    a2: TADOQuery;
    Memo1: TMemo;
    cxButton2: TcxButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    procedure cxButton1Click(Sender: TObject);
//    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fimportacao: Tfimportacao;
  i          : Integer;

implementation

uses uFrmPDV_DModule, ufrmpdv;

{$R *.dfm}

procedure Tfimportacao.cxButton1Click(Sender: TObject);
begin
  { Abre_Select( A1,'select * from i9pdv..t_users');
    if A1.RecordCount=0 then
    begin
    with  A1 do
    begin
    Close;
    sql.Clear;
    sql.Add('insert into i9pdv..t_users (us_nome,us_apelido,us_senha,pf_codigo,gu_codigo,fu_codigo,us_config_usuarios,us_ativo,mnp_id, '+
    'us_full_access,us_email,us_ddd,us_telefone,ps_id) values '+
    '(:v0, :v1, :v2, 0, 10,	1, 1, 1, 1,	1, :v3 ,0,0,1)');
    Parameters[0].Value:='I9PDV';
    Parameters[1].Value:='I9PDV';
    Parameters[2].Value:='a5e0ff62be0b08456fc7f1e88812af3d';
    Parameters[3].Value:='I9PD@I9MOBILE.COM.BR';
    ExecSQL;
    end;
    end;
  }
  with a1 do
  begin
    Close;
    sql.clear;
    sql.add('SELECT DISTINCT SUBSTRING(ABREDESCRICAO,1,3) AS UNIDADE FROM UNIVENDAS');
    open;
  end;
  while not a1.Eof do
  begin
    with a2 do
    begin
      Close;
      sql.clear;
      sql.add('select * from I9PDV..t_unidades where un_sigla = ' + QuotedStr(Copy(a1.FieldByName('UNIDADE').AsString, 1, 3)));
      open;
    end;
    if a2.RecordCount = 0 then
    begin
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('  INSERT INTO I9PDV..t_unidades (un_sigla,un_descricao,un_status,un_padrao) ' + 'values (:cod0, :cod1, 1,1 ) ');
        Parameters[0].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        Parameters[1].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        ExecSQL;
      end;
    end
    else
    begin
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('update i9pdv..t_unidades set un_descricao = :v0 where un_sigla = :v1  ');
        Parameters[0].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        Parameters[1].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        ExecSQL;
      end;
      // ShowMessage( A1.FieldByName('descricao').AsString);
    end;
    a1.Next;
  end;

  with a1 do
  begin
    Close;
    sql.clear;
    sql.add(' EXEC P_MFE_PDV_PRODUTO ');
    open;
  end;
  // ShowMessage('TESTE');
  pb.Max      := a1.RecordCount;
  pb.Position := 0;
  while not a1.Eof do
  begin
    with a2 do
    begin
      Close;
      sql.clear;
      sql.add('select pc_codigo,pr_ativo,tp_produto,pr_codigo,pr_codigo_fiscal_compra,pr_codigo_fiscal,' +
        'pr_referencia,pr_descricao, pr_descricao_fiscal,pr_descricao_fiscal_compra  ' + 'from i9pdv..t_produtos where pr_codigo = ' +
        a1.FieldByName('codigo').AsString);
      open;
    end;
    if a2.RecordCount = 0 then
    begin
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('insert into i9pdv..t_produtos (pc_codigo,pr_ativo,tp_produto,pr_codigo,pr_codigo_fiscal_compra,' +
          'pr_codigo_fiscal,pr_referencia,pr_descricao, pr_descricao_fiscal,pr_descricao_fiscal_compra)' +
          'values (1,1,201, :cod0, :cod1, :cod2, :cod3, :des4, :des5, :des6  ) ');
        Parameters[0].Value := a1.FieldByName('codigo').AsString;
        Parameters[1].Value := a1.FieldByName('codigo').AsString;
        Parameters[2].Value := a1.FieldByName('codigo').AsString;
        Parameters[3].Value := a1.FieldByName('codigo').AsString;
        Parameters[4].Value := a1.FieldByName('descricao').AsString;
        Parameters[5].Value := a1.FieldByName('descricao').AsString;
        Parameters[6].Value := a1.FieldByName('descricao').AsString;
        ExecSQL;
      end;
    end
    else
    begin
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('update i9pdv..t_produtos set pr_descricao = :v0, pr_descricao_fiscal = :v1 ,' +
          'pr_descricao_fiscal_compra = :v2 where pr_codigo = :v3  ');
        Parameters[0].Value := a1.FieldByName('descricao').AsString;
        Parameters[1].Value := a1.FieldByName('descricao').AsString;
        Parameters[2].Value := a1.FieldByName('descricao').AsString;
        Parameters[3].Value := a1.FieldByName('codigo').AsString;
        ExecSQL;
      end;
      // ShowMessage( A1.FieldByName('descricao').AsString);
    end;
    // estoque
    with a2 do
    begin
      Close;
      sql.clear;
      sql.add('select * from i9pdv..t_produtos_estoques where pr_codigo = ' + a1.FieldByName('codigo').AsString);
      open;
    end;
    if a2.RecordCount = 0 then
    begin
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('insert into i9pdv..t_produtos_estoques (pr_codigo,eqt_codigo,pr_qtd,pr_qtddisponivel,pr_qtdcomprada,' +
          'pr_qtdreservada,pr_qtdReservEntreg,pr_qtd_anegociar)  values ' + ' (:cod0, 1, :cod1, :cod2, 0, 0, 0, 0  ) ');
        Parameters[0].Value := a1.FieldByName('codigo').AsString;
        Parameters[1].Value := a1.FieldByName('estoquer').Value;
        Parameters[2].Value := a1.FieldByName('estoquer').Value;
        ExecSQL;
      end;
    end;
    i := 0;
    with a2 do
    begin
      Close;
      sql.clear;
      sql.add('select *  from I9PDV..t_produtos_detalhes WHERE PR_CODIGO = ' + a1.FieldByName('codigo').AsString);
      open;
    end;
    if a2.RecordCount = 0 then
    begin
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('INSERT INTO I9PDV..t_produtos_detalhes (pr_codigo,un_sigla_compra,un_sigla_venda,pr_venda,pr_codigo_barras,' +
          'pr_compra,pr_ipi,pr_margem,pr_outrasdesp,pr_ativo,em_codigo,tp_produto,pr_cest,pr_qtdund_venda,pr_peso, PR_NCM, ' +
          'CSTPIS, CSTCOF ) ' + 'values ( :cod0, :UNID, :UNID, :VENDA, :CBARR, 0,0,0,0,1,1,201,:vcest,1,1, :vncm, :_CSTPIS, :_CSTCOD ) ');
        Parameters[0].Value := a1.FieldByName('codigo').AsString;
        Parameters[1].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        Parameters[2].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        Parameters[3].Value := a1.FieldByName('PRECO').Value;
        Parameters[4].Value := a1.FieldByName('CEAN').AsString;
        Parameters[5].Value := Copy(a1.FieldByName('CEST').AsString, 1, 7);
        Parameters[6].Value := a1.FieldByName('NCM').AsString;
        Parameters[7].Value := a1.FieldByName('cstpissa').AsString;
        Parameters[8].Value := a1.FieldByName('cstCOFSA').AsString;
        ExecSQL;
      end;
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('select PRD_ID from I9PDV..t_produtos_detalhes WHERE PR_CODIGO = ' + a1.FieldByName('codigo').AsString);
        open;
      end;
      i := a2.FieldByName('PRD_ID').Value;
    end
    else
    begin
      i := a2.FieldByName('PRD_ID').Value;
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('update i9pdv..t_produtos_detalhes SET un_sigla_compra = :V0, un_sigla_venda = :V1,pr_venda = :V2,' +
          ' pr_codigo_barras = :v3, PR_CEST = :V4, PR_NCM = :V5, pr_frete = :v6, CSTPIS = :_CSTPSA , CSTCOF = :VCSTCF ' +
          ' where pr_codigo = :v7  ');
        Parameters[0].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        Parameters[1].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        Parameters[2].Value := a1.FieldByName('PRECO').Value;
        Parameters[3].Value := a1.FieldByName('CEAN').AsString;
        Parameters[4].Value := a1.FieldByName('CEST').AsString;
        Parameters[5].Value := a1.FieldByName('NCM').AsString;
        Parameters[6].Value := a1.FieldByName('iAproximado').Value;
        Parameters[7].Value := a1.FieldByName('cstpissa').AsString;
        Parameters[8].Value := a1.FieldByName('cstCOFSA').AsString;
        Parameters[9].Value := a1.FieldByName('codigo').AsString;
        ExecSQL;
      end;
    end;
    /// //// INICIO DETALHUECONT
    /// ///  INSERT INTO I9PDV..t_produtos_detalhes_cont (PRD_ID, PR_ICMS_ALIQ,PR_PIS_ALIQ,PR_COFINS_ALIQ)
    with a2 do
    begin
      Close;
      sql.clear;
      sql.add('select *  from I9PDV..t_produtos_detalhes_cont WHERE PRD_ID = ' + inttostr(i));
      open;
    end;
    if a2.RecordCount = 0 then
    begin
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('INSERT INTO I9PDV..t_produtos_detalhes_cont (PRD_ID, PR_ICMS_ALIQ, PR_PIS_ALIQ, PR_COFINS_ALIQ, pr_valor_ref_fiscal ) ' +
          'values ( :VO, :V1, :V2, :V3, :v4  ) ');
        Parameters[0].Value := i;
        Parameters[1].Value := a1.FieldByName('ICMS').AsString;
        Parameters[2].Value := a1.FieldByName('PIS').AsString;
        Parameters[3].Value := a1.FieldByName('COFINS').Value;
        Parameters[4].Value := a1.FieldByName('iAproximado').Value;
        ExecSQL;
      end;
      { with A2 do
        begin
        close;
        sql.Clear;
        sql.Add('select PRD_ID from I9PDV..t_produtos_detalhes_cont WHERE PRD_ID = '+ IntToStr(I));
        Open;
        end;
        I:= A2.FieldByName('PRD_ID').VAlue; }
    end
    else
    begin
      // I:= A2.FieldByName('PRD_ID').VALUE;
      // Memo2.Lines.Add('i '+inttostr(i)+'  '+A1.FieldByName('iAproximado').asstring);
      // ShowMessage('teste');
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('update i9pdv..t_produtos_detalhes_cont SET PR_ICMS_ALIQ = :V0, PR_PIS_ALIQ = :V1, ' +
          'PR_COFINS_ALIQ = :V2, pr_valor_ref_fiscal = :v3, pr_valor_ultima_entrada = :v4   where prd_ID = :v5  ');
        Parameters[0].Value := a1.FieldByName('icms').Value;
        Parameters[1].Value := a1.FieldByName('pis').Value;
        Parameters[2].Value := a1.FieldByName('cofins').Value;
        Parameters[3].Value := a1.FieldByName('iAproximado').Value;
        Parameters[4].Value := a1.FieldByName('iAproximado').Value;
        Parameters[5].Value := i;
        ExecSQL;
      end;
    end;
    /// //  FINAL DETALHE CONT

    with a2 do
    begin
      Close;
      sql.clear;
      sql.add('select *  from I9PDV..t_produtos_unidades WHERE PRD_ID = ' + inttostr(i));
      open;
    end;
    if a2.RecordCount = 0 then
    begin

      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('INSERT INTO I9PDV..t_produtos_unidades (prd_id,un_sigla,pu_ean,pu_fatorUnidade,pu_peso,pu_default,pu_fatorVenda,' +
          'pu_ativo,pu_compra,pu_qtdporunid,pu_metrocubico,pu_default_fiscal,pu_venda ) ' +
          'VALUES ( :CODID, :UNID, :EAN,1,1,1,1,1,1,1,0,1,1) ');
        Parameters[0].Value := i;
        Parameters[1].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        Parameters[2].Value := a1.FieldByName('CEAN').AsString;
        ExecSQL;
      end;
    end
    else
    begin
      with a2 do
      begin
        Close;
        sql.clear;
        sql.add('update i9pdv..t_produtos_unidades SET un_sigla = :V0, pu_ean = :V1  ' + ' where prd_id = :v3  ');
        Parameters[0].Value := Copy(a1.FieldByName('UNIDADE').AsString, 1, 3);
        Parameters[1].Value := a1.FieldByName('CEAN').AsString;
        Parameters[2].Value := i;
        ExecSQL;
      end;
    end;
    a1.Next;
    pb.Position := pb.Position + 1;
  end;

  with a2 do
  begin
    Close;
    sql.clear;
    sql.add('EXEC i9pdv..P_PDV_IMPOSTOS');
    ExecSQL;
  end;
  with a2 do
  begin
    Close;
    sql.clear;
    sql.add('select * from i9pdv..T_EMPRESA');
    open;
  end;
  {
    if  A1.RecordCount=0 then
    begin
    if (Trim(Fantasia.Text)='') or (Trim(RazaoSocial.Text)='') or (Trim(CNPJ.Text)='') or (Trim(IE.Text)='') then
    begin
    MensagemMelhor('Aviso','Os campos da Empresa sao obrigatorios');
    Exit;
    end;
    with  A1 do
    begin
    Close;
    sql.Clear;
    sql.Add('insert into i9pdv..T_EMPRESA (em_razaosocial,em_fantasia,em_cnpj,em_ie,em_default,em_status,em_email) values '+
    '(:v0, :v1, :v2, :v3, 0,	1, 1)');
    Parameters[0].Value := RazaoSocial.Text;
    Parameters[1].Value := Fantasia.Text;
    Parameters[2].Value := CNPJ.Text;
    Parameters[3].Value := IE.Text;
    ExecSQL;
    end;
    end
    else
    begin
    with  A1 do
    begin
    Close;
    sql.Clear;
    sql.Add('update i9pdv..T_EMPRESA set em_razaosocial = :v0,em_fantasia= :v1, em_cnpj= :v2 ,em_ie= :v3');
    Parameters[0].Value := RazaoSocial.Text;
    Parameters[1].Value := Fantasia.Text;
    Parameters[2].Value := CNPJ.Text;
    Parameters[3].Value := IE.Text;
    ExecSQL;
    end;
    end;
  }
  ShowMessage('Importação concluida');
end;

//procedure Tfimportacao.cxButton2Click(Sender: TObject);
//begin
//  with FDQuery1 do
//  begin
//    Close;
//    sql.clear;
//    sql.text := 'select i.pnfi_id, i.pnf_id,i.pr_codigo,i.pnfi_qtd,c.pnf_numero_fiscal from pdv.tb_nota_fiscal_itens i ' +
//      'JOIN  pdv.tb_nota_fiscal c ON c.pnf_id=i.pnf_id ' + 'join pdv.tb_caixa_operador o on o.pcxo_id=c.pcxo_id ' +
//      'left JOIN t_users U ON U.us_codigo=O.us_codigo ' + 'where o.us_codigo = ' + frmpdv.edtcodusuario.text + ' and ' +
//    // IntToStr(FrmPDV_DModule.Tag) +' and '+
//      'dtcontrole is null AND c.pnf_status IN (4,2) AND i.pnfi_cancelado=0 and c.pnf_data_autorizacao is not null';
//    // Clipboard.AsText:=SQL.Text;
//    // Params[0].Value:=FDQuery1.FieldByName('pnfi_id').AsString;
//    open;
//  end;
//
//  if FDQuery1.RecordCount = 0 then
//  begin
//    // ShowMessage('Não exite dados para importar');
//    Exit;
//  end;
//  pb.Position := 0;
//  pb.Max      := FDQuery1.RecordCount;
//  while not FDQuery1.Eof do
//  begin
//    with a1 do
//    begin
//      Close;
//      sql.clear;
//      sql.add('exec P_AlterarEstoqueF :_Controle,:_produto,:_quantidade, 2, 0, 1, 0');
//      Parameters[0].Value := 'MFE' + FDQuery1.FieldByName('pnf_numero_fiscal').AsString;
//      Parameters[1].Value := FDQuery1.FieldByName('pr_codigo').AsString;
//      Parameters[2].Value := -FDQuery1.FieldByName('pnfi_qtd').Value;
//      ExecSQL;
//    end;
//    with FDQuery2 do
//    begin
//      Close;
//      sql.clear;
//      sql.text        := 'update pdv.tb_nota_fiscal_itens set dtcontrole = getdate() where pnfi_id = :idcontrole';
//      Params[0].Value := FDQuery1.FieldByName('pnfi_id').AsString;
//      ExecSQL;
//    end;
//    pb.Position := pb.Position + 1;
//    FDQuery1.Next;
//  end;
//  // ShowMessage('Importação concluida com sucesso');
//
//end;

end.
