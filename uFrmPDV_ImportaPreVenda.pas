unit uFrmPDV_ImportaPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlue, dxSkinCaramel, dxSkinOffice2010Silver,
  dxSkinWhiteprint, WibiSkins,
  cxTextEdit, cxCurrencyEdit, uWiEventsForm, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script, Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, cxStyles,
  dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxDataControllerConditionalFormattingRulesManagerDialog, Vcl.Menus, cxButtons,
  Data.Win.ADODB, dxDateRanges, dxScrollbarAnnotations, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle;

type
  TFrmPDV_ImportaPreVenda = class(TForm)
    Shape16: TShape;
    Label38: TLabel;
    lblUser: TLabel;
    edFichaMesa: TcxCurrencyEdit;
    Shape27: TShape;
    WiEventsForm1: TWiEventsForm;
    FDServerSyncDB: TFDConnection;
    FDScript1: TFDScript;
    fdtensSource: TFDQuery;
    Memo1: TMemo;
    dsConfigSyncServer: TFDQuery;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    fdVendas: TFDQuery;
    doVendas: TDataSource;
    cxGrid1DBTableView1vd_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1vd_data_venda: TcxGridDBColumn;
    cxGrid1DBTableView1vd_valortotal: TcxGridDBColumn;
    Memo2: TMemo;
    ds1: TDataSource;
    a1: TADOQuery;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    a1Controle: TAutoIncField;
    a1Preco: TFMTBCDField;
    a1CodProduto: TIntegerField;
    a1Descricao: TStringField;
    a1Unidade: TStringField;
    a1qtd: TBCDField;
    a1Total: TBCDField;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1Controle: TcxGridDBColumn;
    cxGrid2DBTableView1Preco: TcxGridDBColumn;
    cxGrid2DBTableView1CodProduto: TcxGridDBColumn;
    cxGrid2DBTableView1Descricao: TcxGridDBColumn;
    cxGrid2DBTableView1Unidade: TcxGridDBColumn;
    cxGrid2DBTableView1qtd: TcxGridDBColumn;
    cxGrid2DBTableView1Total: TcxGridDBColumn;
    Memo3: TMemo;
    a1estoquef: TBCDField;
    cxGrid2DBTableView1estoquef: TcxGridDBColumn;
    a1Ncm: TStringField;
    cxGrid2DBTableView1Ncm: TcxGridDBColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WiEventsForm1KeyDownEscape(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure edFichaMesaExit(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGrid2DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    procedure doImport;
    // procedure doConfigSyncServer;

    { Private declarations }
  public
    gopnf_id:   Integer;
    gopterm_id: String;
    procedure doFinalizar(aVD_CODIGO: String);
  end;

var
  FrmPDV_ImportaPreVenda: TFrmPDV_ImportaPreVenda;

implementation

{$R *.dfm}

uses uFrmPDV_DModule, uGlobalLibPDV, uFrmPDV;

procedure TFrmPDV_ImportaPreVenda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  { case Key of
    VK_RETURN:
    doImport;
    end; }
end;

procedure TFrmPDV_ImportaPreVenda.FormShow(Sender: TObject);
begin
  WiEventsForm1.Open(handle);
  fdVendas.Active     := true;
  Shape16.Brush.Color := FrmPDV.CordoMes.Color;
  // doConfigSyncServer;

  if not FileExists(ExtractFilePath(Application.ExeName) + 'I9PDVERP.EMS') THEN
  begin
    SHOWMESSAGE('Arquivo do SERVIDOR nao encontrado nao podera iniciar o servico I9PDVERP.EMS');
    CLOSE;
  end;
  Memo3.Clear;
  Memo3.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'I9PDVERP.EMS');
 // ADOConnection1.Connected        := False;
 // ADOConnection1.ConnectionString := Trim(Memo3.Text);

end;

procedure TFrmPDV_ImportaPreVenda.WiEventsForm1KeyDownEscape(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrmPDV_ImportaPreVenda.cxButton1Click(Sender: TObject);
begin
a1.First;
while not a1.eof do
begin
   if (a1.FieldByName('ncm').asstring='') or (Length(a1.FieldByName('ncm').asstring)<8) then
   begin
      showmessage('NCM invalido do produto '+a1.FieldByName('descricao').asstring+' não é possivel emitir a nota' );
      exit;
   end;
   a1.Next;
end;
  doImport();

  EXIT;

  with a1 do
  begin
    CLOSE;
    sql.Clear;
    sql.Add('select i.Controle,  PrecoReal/qtd as Preco, produto as CodProduto,p.Descricao,u.ABREDESCRICAO AS Unidade,'
      + 'qtd,precoreal as Total from inotasai i ' + 'join produtos p on p.codigo=i.produto ' +
      'join estoque e on e.e_produto=p.codigo  AND E.E_LOJA=1 ' + 'LEFT JOIN UNIVENDAS U ON U.CODIGO=P.E_UNIDADE ' +
      'where pedido = :v0 AND I.E_LOJA=1 ' + 'order by p.descricao');
    Parameters[0].Value := edFichaMesa.Text;
    Open;
  end;
  CLOSE;
  {
    select TOP 3 cp.Pedido,emissao,CONVERT(VARCHAR(10),CP.Cliente)+'-'+c.Cliente AS Cliente,sum((i.venda-i.desconto)*qtd) as Totall,sum((i.venda)*qtd) as TotalB
    from cnotasai cp
    left join clientes    c on c.codigo=cp.Cliente
    left join inotasai    i on i.pedido=cp.pedido
    left join produtos    p on p.codigo=i.produto
    join ESTOQUE es on p.codigo= es.E_PRODUTO AND ES.E_LOJA=1
    -- where cp.pedido=@Pedido and cp.e_loja=@Loja
    group by cp.Pedido,cp.Cliente,emissao,cp.Vendedor,c.Cliente,cp.tdesconto, PER_DESCONTO ORDER BY PEDIDO DESC
  }
end;

procedure TFrmPDV_ImportaPreVenda.cxButton2Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrmPDV_ImportaPreVenda.cxGrid2DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('qtd').Index] >
    AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('estoquef').Index]) then
    ACanvas.Font.Color := clRed;
end;

procedure TFrmPDV_ImportaPreVenda.doFinalizar(aVD_CODIGO: String);
begin
  FrmPDV_DModule.ADConnection1.ExecSQL('update erp.t_vendas set pnf_id = ' + gopnf_id.ToString + ' where vd_codigo = ' +
    Quotedstr(aVD_CODIGO));
end;

{
  SELECT  b.vd_codigo ,
  b.vd_data_venda ,
  b.vd_valortotal
  FROM    pdv.vw_import_prevenda a
  INNER JOIN erp.t_vendas b ON b.vd_codigo = a.vd_codigo
  WHERE   YEAR(b.vd_data_venda) = YEAR(GETDATE()) AND
  MONTH(b.vd_data_venda) = MONTH(GETDATE())
  GROUP BY b.vd_codigo ,
  b.vd_data_venda ,
  b.vd_valortotal
  ORDER BY vd_codigo DESC;

}
// procedure TFrmPDV_ImportaPreVenda.doConfigSyncServer;
// begin
// dsConfigSyncServer.Open('select * from pdv.tb_config_syncserver');
// with FDServerSyncDB do
// begin
// Params.Clear;
// Params.Add('DriverID=MSSQL');
// Params.Add('Server=' + dsConfigSyncServer.FieldByName('psync_servidor').AsString + ',' + dsConfigSyncServer.FieldByName('psync_port').AsString);
// Params.Add('Database=' + dsConfigSyncServer.FieldByName('psync_database').AsString);
// Params.Add('User_Name=' + dsConfigSyncServer.FieldByName('psync_user').AsString);
// Params.Add('Password=' + Decrypt(dsConfigSyncServer.FieldByName('psync_password').AsString));
// Params.Add('ExtendedMetaData=True');
// Connected := true;
// end;
// end;

procedure TFrmPDV_ImportaPreVenda.doImport;
var
  loSQL: string;
begin // pega daqui
  if StrToIntDef(edFichaMesa.Text, 0) = 0 then
    EXIT;
  try
    FDScript1.SQLScripts[0].sql.Clear;
    a1.First;
    while not a1.Eof do
    begin
      if FrmPDV.vcestoque = 'N' then
      begin
        if a1qtd.Value <= a1estoquef.Value then
        begin
          loSQL := Memo1.Text;
          // loSQL := StringReplace(loSQL, '@pterm_id_in', Quotedstr(gopterm_id), [rfReplaceAll]);
          loSQL := StringReplace(loSQL, '@pnf_id_in', Quotedstr(IntToStr(gopnf_id)), [rfReplaceAll]);
          loSQL := StringReplace(loSQL, '@pr_codigo_in', a1.FieldByName('CodProduto').asstring, [rfReplaceAll]);
          loSQL := StringReplace(loSQL, '@un_sigla_in', 'UN', [rfReplaceAll]);
          loSQL := StringReplace(loSQL, '@pnfi_qtd_in', SQLDouble(a1.FieldByName('qtd').Value), [rfReplaceAll]);
          loSQL := StringReplace(loSQL, '@pnfi_valor_unit_in', SQLDouble(a1.FieldByName('preco').Value),
            [rfReplaceAll]);
          loSQL := StringReplace(loSQL, '@pnfi_desconto_in', '0', [rfReplaceAll]);
          loSQL := StringReplace(loSQL, '@pnfi_id_comanda_in', edFichaMesa.Text, [rfReplaceAll]);
          FDScript1.SQLScripts[0].sql.Add(loSQL);
          FDScript1.SQLScripts[0].sql.Add('GO');
        end;
      end
      else
      begin
        loSQL := Memo1.Text;
        // loSQL := StringReplace(loSQL, '@pterm_id_in', Quotedstr(gopterm_id), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnf_id_in', Quotedstr(IntToStr(gopnf_id)), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pr_codigo_in', a1.FieldByName('CodProduto').asstring, [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@un_sigla_in', 'UN', [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_qtd_in', SQLDouble(a1.FieldByName('qtd').Value), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_valor_unit_in', SQLDouble(a1.FieldByName('preco').Value), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_desconto_in', '0', [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_id_comanda_in', edFichaMesa.Text, [rfReplaceAll]);
        FDScript1.SQLScripts[0].sql.Add(loSQL);
        FDScript1.SQLScripts[0].sql.Add('GO');
      end;
      a1.Next;
    end;
    // fdscript1.SQLScripts.Items
    FDScript1.ExecuteAll;
    with fdvendas do
    begin
      close;
      sql.Clear;
      sql.Add('update pdv.tb_nota_fiscal set npedido = '+edFichaMesa.Text +'  where pnf_id = '+ IntToStr(gopnf_id)  );
     // ShowMessage('update pdv.tb_nota_fiscal set npedido = '+edFichaMesa.Text +'  where pnf_id = '+ IntToStr(gopnf_id) );
      ExecSQL;
    end;
    ModalResult := mrOK;
  except
    On E: Exception do
    begin
      MessageBox(handle, pChar(E.Message), 'I9 PDV', MB_ICONINFORMATION);
      edFichaMesa.SetFocus;
    end;
  end;
end;

procedure TFrmPDV_ImportaPreVenda.edFichaMesaExit(Sender: TObject);
begin
  if edFichaMesa.Text = '' then
    EXIT;

  with a1 do
  begin
    CLOSE;
    sql.Clear;
    sql.Add('EXEC P_IMPORTAR_PRE_VENDA :v0 ');
    Parameters[0].Value := edFichaMesa.Text;
    Open;
  end;
end;

end.
