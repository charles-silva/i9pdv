unit ufracionaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  Vcl.Menus, Vcl.StdCtrls, Data.Win.ADODB, cxButtons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, AdvGlowButton, FireDAC.UI.Intf, FireDAC.Stan.Async,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, cxContainer, cxTextEdit,
  cxCurrencyEdit, FireDAC.Stan.Intf, FireDAC.Comp.Script, uGlobalLibPDV,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxDateRanges, dxScrollbarAnnotations, Vcl.Mask;

type
  TfrmFracionaPedido = class(TForm)
    Panel1: TPanel;
    NumPedido: TLabeledEdit;
    Panel2: TPanel;
    ADOConnection1: TADOConnection;
    ds1: TDataSource;
    a1: TADOQuery;
    Memo3: TMemo;
    itens: TADOQuery;
    itensID: TAutoIncField;
    itensCodProduto: TIntegerField;
    itensDescricao: TStringField;
    itensUnidade: TStringField;
    itensQUANTI: TBCDField;
    itensTotal: TFMTBCDField;
    itensPreco: TBCDField;
    itensUSADO: TBCDField;
    itensPENDE: TBCDField;
    itensPRNOV: TBCDField;
    itensestoquef: TBCDField;
    itensTotal2: TFloatField;
    dsitens: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1CodProduto1: TcxGridDBColumn;
    cxGrid1DBTableView1QUANTI: TcxGridDBColumn;
    cxGrid1DBTableView1Unidade1: TcxGridDBColumn;
    cxGrid1DBTableView1Descricao1: TcxGridDBColumn;
    cxGrid1DBTableView1Total1: TcxGridDBColumn;
    cxGrid1DBTableView1Preco1: TcxGridDBColumn;
    cxGrid1DBTableView1USADO: TcxGridDBColumn;
    cxGrid1DBTableView1PENDE: TcxGridDBColumn;
    cxGrid1DBTableView1PRNOV: TcxGridDBColumn;
    cxGrid1DBTableView1estoquef1: TcxGridDBColumn;
    cxGrid1DBTableView1Total2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    alterar: TDBAdvGlowButton;
    DBADVGravar: TDBAdvGlowButton;
    FDScript1: TFDScript;
    Memo1: TMemo;
    cxvpedido: TcxCurrencyEdit;
    DBAdvGlowButton1: TDBAdvGlowButton;
    Label1: TLabel;
    itensclfiscal: TStringField;
    cxGrid1DBTableView1clfiscal: TcxGridDBColumn;
    DBAdvGlowButton5: TDBAdvGlowButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    DS2: TDataSource;
    A2: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure itensCalcFields(DataSet: TDataSet);
    procedure alterarClick(Sender: TObject);
    procedure Loopb();
    procedure DBADVGravarClick(Sender: TObject);
    procedure NumPedidoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Abrepedido();
    procedure DBAdvGlowButton5Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    gopnf_id: integer;
     gopterm_id: String;
  end;

var
  frmFracionaPedido: TfrmFracionaPedido;
  vtotal, vquant: real;

implementation

{$R *.dfm}

procedure TfrmFracionaPedido.Loopb();
begin
itens.First;
while not itens.eof do
begin
   if (itensQUANTI.Value - itensUSADO.Value) >= (itensPENDE.Value+1) then
   begin
     // vtotal:=vtotal + ((itensPENDE.Value+1) * itensPreco.Value );
     // memo2.Lines.Add('vtotal c '+itensCodProduto.AsString+' '+FloatToStr((vtotal)));
      if itensclfiscal.AsString<>'' then
      begin
        if itensestoquef.Value>=itensPENDE.value+1 then
        begin
          if (vtotal + ( itensPreco.Value ))<=cxvpedido.VALUE then
          begin
            vtotal:=vtotal + ((itensPENDE.Value+1) * itensPreco.Value );
            //ShowMessage('gravou');
            with A1 do
            begin
              close;
              sql.Clear;
              sql.Add('update IFISCALNFCE set pende = :V0 where id = :V2 ');
              Parameters[0].Value:=itensPENDE.Value+1;
              Parameters[1].Value:=itensID.AsString;
              ExecSQL;
            end;
          end;
        end;
      end;
   end;
   itens.Next;
   //cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[1]
end;
end;

procedure TfrmFracionaPedido.NumPedidoExit(Sender: TObject);
begin
if Trim(NumPedido.Text)='' then Exit;
with a1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from cnotasai where e_status=7 and pedido= '+NumPedido.Text);
  Open;
end;
if a1.RecordCount=0 then
begin
  ShowMessage('Não existe pedido com este numero');
  Exit;
end;
with a1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from IFISCALNFCE where IDpedi= '+NumPedido.Text);
  Open;
end;
if a1.RecordCount=0 then
begin
   with a1 do
   begin
     close;
     sql.Clear;
     sql.Add('insert into IFISCALNFCE (IDPEDI,IDPROD,QUANTI,PRECO,USADO,PENDE,PRNOV) '+
     'select pedido,produto,Qtd,PrecoReal/Qtd,0,0,0 from inotasai '+
     'where Pedido='+NumPedido.Text);
     ExecSQL;
   end;
end;
Abrepedido();
end;

procedure TfrmFracionaPedido.Abrepedido();
begin
with itens do
begin
   close;
   sql.Clear;
   sql.Add('select i.ID,  IDprod as CodProduto,p.Descricao,u.ABREDESCRICAO AS Unidade,I.QUANTI,I.QUANTI*I.PRECO as Total,'+
   'convert(decimal(18,2),i.preco) AS Preco,clfiscal,'+
   'i.USADO ,i.PENDE,I.PRNOV, e.estoquef '+
   'from IFISCALNFCE i '+
   'join produtos p on p.codigo=i.IDPROD  '+
   'join estoque e on e.e_produto=p.codigo  AND E.E_LOJA=1  '+
   'LEFT JOIN UNIVENDAS U ON U.CODIGO=P.E_UNIDADE  '+
   'where IDpedi= '+NumPedido.Text+
   ' ORDER BY NEWID()');
   Open;
end;
end;

procedure TfrmFracionaPedido.alterarClick(Sender: TObject);
begin

if NumPedido.Text='' then Exit;
if cxvpedido.Text='' then
begin
  ShowMessage('Digite um valor para o Pedido');
  Exit;
end;
Abrepedido();
if cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[1]>0 then
   vtotal:=cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[1]
else
   vtotal:=0;

Loopb();
Abrepedido();
Loopb();
Abrepedido();
Loopb();
Abrepedido();
end;

procedure TfrmFracionaPedido.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(sender).GetColumnByFieldName('clfiscal').Index] = '') then
      ACanvas.Font.Color:= clRed;
  if (AViewInfo.GridRecord.Values[TcxGridDBTableView(sender).GetColumnByFieldName('estoquef').Index] <
      AViewInfo.GridRecord.Values[TcxGridDBTableView(sender).GetColumnByFieldName('pende').Index]  ) then
      ACanvas.Font.Color:= clRed;
end;

procedure TfrmFracionaPedido.DBAdvGlowButton5Click(Sender: TObject);
begin
if NumPedido.Text='' then Exit;
with a1 do
begin
  close;
  sql.Clear;
  sql.Add('update IFISCALNFCE set PENDE= 0 where idpedi='+NumPedido.Text);
  ExecSQL;
end;
Abrepedido();

end;

procedure TfrmFracionaPedido.DBADVGravarClick(Sender: TObject);
var
  loSQL: string;
begin                 //  pega daqui
//ShowMessage('Veja '+Quotedstr(IntToStr(gopnf_id)));
   if itens.active=false  then Exit;
   if itens.RecordCount=0 then Exit;
  if cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[1]<=0 then
  begin
    ShowMessage('Não existe dados para o pedido');
    Exit;
  end;
  if StrToIntDef(numpedido.Text, 0) = 0 then
    exit;
  try
    with a1 do
    begin
        close;
        sql.Clear;
        sql.Add('update IFISCALNFCE set usado=usado+pende where idpedi='+NumPedido.Text);
        ExecSQL;
    end;
    with a1 do
    begin
        close;
        sql.Clear;
        sql.Add('update IFISCALNFCE set PENDE= 0 where idpedi='+NumPedido.Text);
        ExecSQL;
    end;
    with FDQuery1 do
    begin
      close;
      sql.Clear;
      sql.Text:='update pdv.tb_nota_fiscal set tipo = :v0, npedido = :v1 where pnf_id = :v2';
      Params[0].value:='AVU';
      Params[1].value:=numpedido.Text;
      Params[2].value:=IntToStr(gopnf_id);
      ExecSQL;
    end;
    FDScript1.SQLScripts[0].SQL.Clear;
    itens.First;
    while not itens.Eof do
    begin
      if itensPENDE.Value>0 then
      begin
        loSQL := Memo1.Text;
        loSQL := StringReplace(loSQL, '@pnf_id_in',Quotedstr(IntToStr(gopnf_id)),[rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pr_codigo_in', itens.FieldByName('CodProduto').asstring, [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@un_sigla_in', itens.FieldByName('Unidade').asstring, [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_qtd_in', SQLDouble(itens.FieldByName('PENDE').value), [rfReplaceAll]);  //  SQLDouble
        loSQL := StringReplace(loSQL, '@pnfi_valor_unit_in', SQLDouble(itens.FieldByName('Preco').value), [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_desconto_in', '0', [rfReplaceAll]);
        loSQL := StringReplace(loSQL, '@pnfi_id_comanda_in', numpedido.Text , [rfReplaceAll]);
        FDScript1.SQLScripts[0].SQL.Add(loSQL);
        FDScript1.SQLScripts[0].SQL.Add('GO');
      end;
     // ShowMessage(loSQL);
      itens.Next;
    end;
    //fdscript1.SQLScripts.Items
    FDScript1.ExecuteAll;

    with FDQuery1 do
    begin
      close;
      sql.Clear;
      sql.Text:='update pdv.tb_nota_fiscal_itens set tipo = :v0 where pnf_id = :v1';
      Params[0].value:='AVU';
      Params[1].value:=IntToStr(gopnf_id);
      ExecSQL;
    end;

    ModalResult := mrOK;
  except
    On E: Exception do
    begin
      MessageBox(handle, pChar(E.Message), 'I9 PDV', MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmFracionaPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then SelectNext(ActiveControl, true, true);

end;

procedure TfrmFracionaPedido.FormShow(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'I9PDVERP.EMS') THEN
     begin
       SHOWMESSAGE('Arquivo do SERVIDOR nao encontrado nao podera iniciar o servico I9PDVERP.EMS');
       CLOSE;
     end;
     MEMO3.Clear;
     MEMO3.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'I9PDVERP.EMS');
     ADOConnection1.Connected:=False;
     ADOConnection1.ConnectionString:=Trim(Memo3.Text);

     WITH FDQuery1 DO
     begin
       CLOSE;
       SQL.Clear;
       SQL.Add('select i.pnfi_id, i.pnf_id,i.pr_codigo,i.pnfi_qtd,c.pnf_numero_fiscal,i.tipo,I.DTCONTROLE  '+
               'from pdv.tb_nota_fiscal_itens i '+
               'JOIN  pdv.tb_nota_fiscal c ON c.pnf_id=i.pnf_id   '+
               'where dtcontrole is null AND c.pnf_status IN (4,2) AND i.pnfi_cancelado=0 and c.tipo='+QuotedStr('AVU')+
               ' AND C.NPEDIDO>0 order by i.pnf_id desc,pnfi_id desc');
       Open;
     end;
    { while not FDQuery1.Eof do
     begin
       WITH a1 do
       begin
         CLOSE;
         SQL.Clear;
         sql.Add('exec P_AlterarEstoqueF :_Controle,:_produto,:_quantidade, 2, 0, 1, 0');
         Parameters[0].Value:='MFE'+FDQuery1.FieldByName('pnf_numero_fiscal').AsString; // FDQuery1.FieldByName('pnf_numero_fiscal').AsString;
         Parameters[1].Value:=FDQuery1.FieldByName('pr_codigo').AsString;
         Parameters[2].Value:=-FDQuery1.FieldByName('pnfi_qtd').value;
         ExecSQL;
       end;
       with FDQuery2 do
       begin
         close;
         sql.Clear;
         sql.text:='update pdv.tb_nota_fiscal_itens set dtcontrole = getdate(),tipo = :v0  where pnfi_id = :idcontrole';
         Params[0].Value:='AVUV';
         Params[1].Value:=FDQuery1.FieldByName('pnfi_id').value;
         ExecSQL;
       end;
       FDQuery1.Next;
     end;    }
end;

procedure TfrmFracionaPedido.itensCalcFields(DataSet: TDataSet);
begin
itensTotal2.Value:=itensPENDE.Value*itensPreco.Value;
end;

end.
