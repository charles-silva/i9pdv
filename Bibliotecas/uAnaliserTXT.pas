unit uAnaliserTXT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IdGlobal, StdCtrls, Grids, ExtCtrls, Menus, DB, DBClient,
  uSCDSource, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uWiFDQuery;

type
  TRecord = record
    Value: string;
    Descr: string;
    Len: Integer;
  end;

  TFrmAnaliserTXT = class(TForm)
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    HeaderGrid: TStringGrid;
    ItensGrid: TStringGrid;
    cdsConfigTXT: TWiFDQuery;
    procedure ReadXT(FileName: string);
  private
    FCount: Integer;
    procedure LoadMatrix(aTableName: string; LinhaStr: string);
    function StrToCurrType(StrTXT: string): Currency;
    function StrToDateType(DateStrTXT: string): TDate;
    function StrToIntType(StrTXT: string): Integer;
    function StrToTimeType(TimeStrTXT: string): TTime;
    procedure MostraRegistros(aChar: Char);
    procedure ReadConfigFile;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAnaliserTXT: TFrmAnaliserTXT;

var
  sRecord: array of array of TRecord;

implementation

{$R *.dfm}

procedure TFrmAnaliserTXT.ReadConfigFile;
var
  F: TextFile;
  Context, Buffer: string;
begin
  AssignFile(F, 'StructBits.ini');
  Reset(F);

  while not Eof(F) do
  begin
    ReadLn(F, Buffer);
    Context := Context + Buffer;
  end;

  // pos:=Funcoes1.StrScanStrPosEnd(Context,'BitsOfReg0',1);

end;

function TFrmAnaliserTXT.StrToCurrType(StrTXT: string): Currency;
var
  i: Integer;
begin
  Result := 0;
  if length(Trim(StrTXT)) > 0 then
  begin
    for i := 1 to length(Trim(StrTXT)) do
      if (not IsNumeric(StrTXT[i])) and (Copy(StrTXT, i, 1) <> ' ') then
        Break;

    if i > length(Trim(StrTXT)) then
      Result := StrToCurr(Trim(StrTXT)) / 100
    else
      Result := 0;
  end;
end;

function TFrmAnaliserTXT.StrToDateType(DateStrTXT: string): TDate;
var
  Dia, Mes, Ano: Word;
  DateTmp: TDateTime;
begin
  Result := Date;
  if length(Trim(DateStrTXT)) = 0 then
    exit;

  Dia := StrToInt(Copy(DateStrTXT, 1, 2));
  Mes := StrToInt(Copy(DateStrTXT, 3, 2));
  Ano := StrToInt(Copy(DateStrTXT, 5, 4));

  // if not TryEncodeDate(Ano,Mes,Dia,DateTmp) then exit;

  Result := EncodeDate(Ano, Mes, Dia);
end;

function TFrmAnaliserTXT.StrToTimeType(TimeStrTXT: string): TTime;
var
  H, M: Word;
begin
  H := StrToInt(Copy(TimeStrTXT, 1, 2));
  M := StrToInt(Copy(TimeStrTXT, 3, 2));
  Result := EncodeTime(H, M, 0, 0);
end;

function TFrmAnaliserTXT.StrToIntType(StrTXT: string): Integer;
// var
// Funcoes2:TFuncoes;
begin
  Result := -1;

  // if Length(Trim(StrTXT)) = 0 then exit;
  // Funcoes2:= TFuncoes.Create(nil);
  // if Funcoes2.isInteiro(Trim(StrTXT)) then
  // result:=StrToInt(Trim(StrTXT))
  // else
  // result:=0;
  //
  // Funcoes2.Destroy;

end;

procedure TFrmAnaliserTXT.LoadMatrix(aTableName: string; LinhaStr: string);
var
  Indice, iPos: Integer;
  TipoRegCobr: Integer;
  i: Integer;
begin
  iPos := 1;
  cdsConfigTXT.CommandText := 'select * from t_config_txt where cex_table_name = ' + QuotedStr(aTableName)
    + ' order by cex_order';
  cdsConfigTXT.Close;
  cdsConfigTXT.Open;

  if FCount < cdsConfigTXT.RecordCount then
    FCount := cdsConfigTXT.RecordCount;

  if cdsConfigTXT.IsEmpty then
    exit;

  Indice := High(sRecord) + 1;
  SetLength(sRecord, Indice + 1);

  i := 0;
  while not cdsConfigTXT.Eof do
  begin
    SetLength(sRecord[Indice], i + 1);
    sRecord[Indice, i].Descr := cdsConfigTXT.FieldByName('cex_field_descr').AsString;
    sRecord[Indice, i].Value := Trim(Copy(LinhaStr, iPos, cdsConfigTXT.FieldByName('cex_field_size').AsInteger));
    sRecord[Indice, i].Len := cdsConfigTXT.FieldByName('cex_field_size').AsInteger;
    iPos := iPos + cdsConfigTXT.FieldByName('cex_field_size').AsInteger;
    inc(i);
    cdsConfigTXT.Next;
  end;
end;

procedure TFrmAnaliserTXT.ReadXT(FileName: string);
var
  F: TextFile;
  LinhaStr, FirstField: string;
  i: Integer;
  LChar: Char;
  LTableName: string;
begin
  FirstField := '';

  for i := 1 to 2 do
  begin
    FCount := 0;
    SetLength(sRecord, 0);
    case i of
      1:
        begin
          LChar := 'M';
          LTableName := 'TMOV';
        end;
      2:
        begin
          LChar := 'I';
          LTableName := 'TITMMOV';
        end;
    end;
    AssignFile(F, FileName);
    Reset(F);
    while not Eof(F) do
    begin
      ReadLn(F, LinhaStr);
      FirstField := Copy(LinhaStr, 1, 1);
      if FirstField = LChar then
        LoadMatrix(LTableName, LinhaStr);
    end;
    CloseFile(F);
    MostraRegistros(LChar);
  end;
end;

procedure TFrmAnaliserTXT.MostraRegistros(aChar: Char);
var
  x, y: Integer;
  Lcount: Integer;
  LGrid: TStringGrid;
begin

  if not cdsConfigTXT.Active then
    exit;

  if aChar = 'M' then
    LGrid := HeaderGrid
  else if aChar = 'I' then
    LGrid := ItensGrid
  else
    exit;

  LGrid.RowCount := High(sRecord) + 2;
  LGrid.ColCount := FCount;
  for y := Low(sRecord) to High(sRecord) do
  begin
    Lcount := 1;
    for x := Low(sRecord[y]) to High(sRecord[y]) do
    begin
      LGrid.Cells[x, 0] := IntToStr(Lcount) + ' a ' + IntToStr(Lcount + sRecord[y, x].Len - 1) + ' (' + IntToStr
        ((Lcount + sRecord[y, x].Len) - Lcount) + ')';
      LGrid.Cells[x, y + 1] := sRecord[y, x].Value;
      // if LGrid.ColWidths[x] < ((StrLen(pChar(sRecord[y, x].Value)) * 64) div 8) then
      LGrid.ColWidths[x] := (StrLen(pChar(LGrid.Cells[x, 0])) * 10);
      Lcount := Lcount + sRecord[y, x].Len;
    end;
  end;
end;

end.
