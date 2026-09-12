unit Code64;

interface

Uses SysUtils, StrUtils, Classes, IdCoderMIME;

procedure SaveStringToFile(FileName, S: ANSIString);

function Encode64(const S: ANSIString): ANSIString;
function Decode64(const S: ANSIString): ANSIString;
function Encode64Stream(const S: TStream): ANSIString;
procedure Decode64Stream(const S: ANSIString; Res: TStream);
function Encode64File(const FileName: ANSIString;
  EncodeEXT: Boolean = False): ANSIString;
function Decode64File(const FileName: ANSIString; S: ANSIString;
  DecodeEXT: Boolean = False; ExtChange: Boolean = False): ANSIString;
{$IFNDEF VER130}
function Encode64ByteArray(const S: TArray<Byte>): ANSIString;
function Decode64ByteArray(const S: ANSIString): TBytes;
function Encode64Unicode(const S: WideString): ANSIString;
function Decode64Unicode(const S: ANSIString): WideString;
{$ENDIF}

implementation

const
  Codes64: ANSIString =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

procedure SaveStringToFile(FileName, S: ANSIString);
Var
  FS: TFileStream;
begin
  FS := TFileStream.Create(FileName, fmCreate);
  try
    FS.WriteBuffer(S[1], Length(S));
  finally
    FS.Free;
  end;
end;

function Encode64Stream(const S: TStream): ANSIString;
var
  x: Byte;
  i: Integer;
  a: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  S.Position := 0;
  for i := 1 to S.Size do
  begin
    S.ReadBuffer(x, 1);
    b := b * 256 + x;
    a := a + 8;
    while a >= 6 do
    begin
      a := a - 6;
      x := b SHR a; // div (1 shl a); 
      b := b AND ((1 SHL a) - 1); // mod (1 shl a); 
      Result := Result + Codes64[x + 1];
    end;
  end;
  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

procedure Decode64Stream(const S: ANSIString; Res: TStream);
var
  a: Byte;
  x: Byte;
  i: Cardinal;
  b: Cardinal;
begin
  Res.Size := 0;
  a := 0;
  b := 0;
  for i := 1 to Length(S) do
  begin
    x := Pos(S[i], Codes64) - 1;
    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;
      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b AND ((1 SHL a) - 1);
        Res.WriteBuffer(x, 1);
      end;
    end
    else
      Exit; // Raise Exception.CreateFmt('Invalid Code64 character at position %d : %2xx',[i,Byte(s[i])]); 
  end;
end;

function Encode64File(const FileName: ANSIString;
  EncodeEXT: Boolean = False): ANSIString;
Var
  FS: TFileStream;
  Ext: String;
begin
  if FileExists(FileName) then
  begin
    FS := TFileStream.Create(FileName, fmOpenRead);
    try
      Result := Encode64Stream(FS);
      if EncodeEXT then
      begin
        Ext := ExtractFileExt(FileName);
        Ext := Copy(Ext + '.', 2, Length(Ext)); // moves the '.' after, so that result => 'BMP.+/EnCoDeDbItMaP' 
        Result := Ext + Result;
      end;
    finally
      FS.Free;
    end;
  end
  Else
    Result := '';
end;

function Decode64File(const FileName: ANSIString; S: ANSIString;
  DecodeEXT: Boolean = False; ExtChange: Boolean = False): ANSIString;
Var
  FS: TFileStream;
  Ext: String;
  P: Integer;
  WantedExt: ANSIString;
begin
  Result := ExpandFileName(FileName);
  if DecodeEXT then
  begin
    WantedExt := ExtractFileExt(FileName);
    if WantedExt <> '' Then
    begin
      if WantedExt[1] = '.' then
        WantedExt := Copy(WantedExt, 2, Length(WantedExt));
      WantedExt := UpperCase(WantedExt);
    end;
  end;
  P := Pos('.', S);
  if P > 0 then
  begin
    if DecodeEXT Then
    begin
      Ext := Copy(S, 1, P - 1);
      if Ext <> WantedExt then
        if Not ExtChange // do not allow extension change 
          Then
          raise Exception.Create
            (Ext + ' is not the expected file type :' + WantedExt)
        Else
          Result := ChangeFileExt(Result, '.' + Ext);
    end;
    S := Copy(S, P + 1, Length(S));
  end;
  FS := TFileStream.Create(Result, fmCreate);
  try
    Decode64Stream(S, FS);
  finally
    FS.Free;
  end;
end;

function Encode64(const S: ANSIString): ANSIString;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(S) do
  begin
    x := Ord(S[i]);
    b := b * 256 + x;
    a := a + 8;
    while a >= 6 do
    begin
      a := a - 6;
      x := b SHR a; // div (1 shl a); 
      b := b AND ((1 SHL a) - 1); // mod (1 shl a); 
      Result := Result + Codes64[x + 1];
    end;
  end;
  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

function Decode64(const S: ANSIString): ANSIString;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(S) do
  begin
    x := Pos(S[i], Codes64) - 1;
    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;
      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b AND ((1 SHL a) - 1);
        Result := Result + ANSIChar(chr(x));
      end;
    end
    else
      Exit; // Raise Exception.CreateFmt('Invalid Code64 character at position %d : %2xx',[i,Byte(s[i])]); 
  end;
end;


{$IFNDEF VER130}

function Encode64ByteArray(const S: TArray<Byte>): ANSIString;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;

  for i in S do
  begin
    x := S[i];
    b := b * 256 + x;
    a := a + 8;
    while a >= 6 do
    begin
      a := a - 6;
      x := b SHR a; // div (1 shl a); 
      b := b AND ((1 SHL a) - 1); // mod (1 shl a); 
      Result := Result + Codes64[x + 1];
    end;
  end;
  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

function Decode64ByteArray(const S: ANSIString): TBytes;
var
  i, ix: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  SetLength(Result, Length(S) * 6 Div 8);
  a := 0;
  b := 0;
  ix := 0;
  for i := 1 to Length(S) do
  begin
    x := Pos(S[i], Codes64) - 1;
    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;
      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b AND ((1 SHL a) - 1);
        Result[ix] := x;
        Inc(ix);
      end;
    end
    else
      Exit; // Raise Exception.CreateFmt('Invalid Code64 character at position %d : %2xx',[i,Byte(s[i])]); 
  end;
end;
{$ENDIF}
{$IFNDEF VER130 }

function Encode64Unicode(const S: WideString): ANSIString;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
  P: pByte;
  l: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  l := Length(S) * SizeOf(WideChar);
  P := pByte(@S[1]);
  for i := 0 to l - 1 do
  begin
    x := P^;
    Inc(P);
    b := b * 256 + x;
    a := a + 8;
    while a >= 6 do
    begin
      a := a - 6;
      x := b SHR a; // div (1 shl a); 
      b := b AND ((1 SHL a) - 1); // mod (1 shl a); 
      Result := Result + Codes64[x + 1];
    end;
  end;
  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

function Decode64Unicode(const S: ANSIString): WideString;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
  P: pByte;
begin
  Result := '';
  a := 0;
  b := 0;
  SetLength(Result, (Length(S) + 2) div 3 * 4);
  P := pByte(@Result[1]);
  for i := 1 to Length(S) do
  begin
    x := Pos(S[i], Codes64) - 1;
    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;
      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b AND ((1 SHL a) - 1);
        P^ := x;
        Inc(P);
        // Result := Result + chr(x); 
      end;
    end
    else
      Exit; // Raise Exception.CreateFmt('Invalid Code64 character at position %d : %2xx',[i,Byte(s[i])]); 
  end;
end;
{$ENDIF}

end.
