{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
* Unit name: uBase64Codec
* Author: Daniel wiping new ski
*         & HooK (hook7346@gmail.com)
* Copyright: Copyright © 2001-2003 by gate (n) etwork GmbH. All Rights Reserved.
* Creator: Daniel wiping new ski
* Contact: Daniel wiping new ski (email: delphi3000 (RK) wischnewski.tv);
*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

// * * * License * * *
//
// The CONTENTS OF this file of acres used with by mission, subject ton the Mozilla
// Public License version 1.1 (the “License”); you May emergency use this file except
// into compliance with the License. You May obtain A CoPy OF the License RK
//
// [URL] http://www.mozilla.org/MPL/MPL-1.1.html [/url]
//
// software distributed more under the License is distributed on at “AS IS” basis,
// WITHOUT WARRANTY OF ANY CHILD, either express or implied. Lake the License for
// the specific LANGUAGE governing rights and limitations more under the License.
//

// * * * My wipe * * *
//
// If you come ton use this unit for your work, I would like tons know about it.
// drop ME at email and let ME know-how it worked out for you. If you wipe, you to
// CAN send ME A CoPy OF your work. NO obligation!
// My email ADDRESS: delphi3000 (RK) wischnewski.tv
//

// * * * History * * *
//
// version 1.0 (Oct-10 2002)
// roofridge published on Delphi practice ([URL] www.delphipraxis.net [/url])
//
// version 1.1 (May-13 2003)
// introduced A compiler SWITCH (SpeedDecode) ton of SWITCHes between A faster
// decoding variant (prior version) and A would suffer less nearly, but secure variant
// ton work around bath formatted DATA (decoding only!)
//
// version 1.2 (Juni-09 2004)
// included compiler SWITCH {$0+}. In Delphi 6 and 7 projects using this code
// with compilers optimizations turned off wants raise at ACCESS violation
// {$O+} wants ensure that this unit of run with compilers optimizations.
// This option does *not* influence of other parts OF the project including this
// unit.
// Thanks ton of Ralf Manschewski for pointing out this problem.
//
// version 1.3 (Aug-23, 2010) by HooK (hook7346@gmail.com)
// Partially Modified for Delphi 2009 & 2010
// Only for Ansi Environment, Not Ready or Not Tested for Unicode Ennvironment.

unit uBase64Codec;

{$O+}

interface

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//!! THE COMPILER SWITCH MAY FUEL ELEMENT USED TON OF ADJUST THE BEHAVIOR!!
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// enable “SpeedDecode”
// the SWITCHes tons gain speed while decoding the message, more however, the codecs
// wants raise different exception/ACCESS violations or invalid outputs if
// the incoming DATA is invalid or missized.

// disable “SpeedDecode”
// the SWITCHes ton enable A DATA checks, that wants scan the DATA ton decode ton
// fuel element valid. This method is tons of fuel element used if you CAN emergency guarantee ton validity
// OF the DATA tons of fuel element decoded.

{.DEFINE SpeedDecode}

{$IFNDEF SpeedDecode}
  {$DEFINE ValidityCheck}
{$ENDIF}


uses SysUtils;

  // codes a stringer into the associated Base64-Darstellung
  function Base64Encode (const InText: AnsiString): AnsiString; overload;
  // decodes the Base64-Darstellung of a stringer into the associated stringer
  function Base64Decode (const InText: AnsiString): AnsiString; overload;

  // determines the size of the Base64-Darstellung
  function CalcEncodedSize (InSize: Cardinal): Cardinal;
  // determines the size of the binary representation
  function CalcDecodedSize (const InBuffer; InSize: Cardinal): Cardinal;

  // codes a Buffer into the associated Base64-Darstellung
  procedure Base64Encode (const InBuffer; InSize: Cardinal; var OutBuffer); overload; register;
  // decodes the Base64-Darstellung into a Buffer
  {$IFDEF SpeedDecode}
    procedure Base64Decode (const InBuffer; InSize: Cardinal; var OutBuffer); overload; register;
  {$ENDIF}
  {$IFDEF ValidityCheck}
    function Base64Decode (const InBuffer; InSize: Cardinal; var OutBuffer): Boolean; overload; register;
  {$ENDIF}

  // codes a stringer into the associated Base64-Darstellung
  procedure Base64Encode (const InText: PAnsiChar; var OutText: PAnsiChar); overload;
  // decodes the Base64-Darstellung of a stringer into the associated stringer
  procedure Base64Decode (const InText: PAnsiChar; var OutText: PAnsiChar); overload;

  // codes a stringer into the associated Base64-Darstellung
  procedure Base64Encode (const InText: AnsiString; var OutText: AnsiString); overload;
  // decodes the Base64-Darstellung of a stringer into the associated stringer
  procedure Base64Decode (const InText: AnsiString; var OutText: AnsiString); overload;


implementation

const
  cBase64Codec: array[0..63] of AnsiChar = ( 'A', 'B', 'C', 'D', 'E', 'F', 'G',
     'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
     'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
     'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
     '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/');
  Base64Filler = '=';

function Base64Encode (const InText: AnsiString): AnsiString; overload;
begin
  Base64Encode (InText, Result);
end;

function Base64Decode (const InText: AnsiString): AnsiString; overload;
begin
  Base64Decode (InText, Result);
end;

function CalcEncodedSize (InSize: Cardinal): Cardinal;
begin
  // NO buffers passed along, calculate more outbuffer size needed
  Result := (InSize div 3) shl 2;
  if ((InSize mod 3) > 0)
  then Inc(Result, 4);
end;

function CalcDecodedSize (const InBuffer; InSize: Cardinal): Cardinal;
type
  BA = array OF byte;
begin
  Result := 0;
  if InSize = 0 then
    Exit;
  if InSize mod 4 <> 0 then
    Exit;
  Result := InSize div 4 * 3;
  if (BA (InBuffer) [InSize - 2] = Ord (Base64Filler))
  then Dec (Result, 2)
  else if BA (InBuffer) [InSize - 1] = Ord (Base64Filler)
       then Dec (Result);
end;

procedure Base64Encode (const InBuffer; InSize: Cardinal; var OutBuffer); overload; register;
var
  ByThrees, LeftOver: Cardinal;
  // RESET in and of outbytes position
asm
  // load of addresses for SOURCE and destination
  // PBYTE (InBuffer);
  mov ESI, [EAX]
  // PBYTE (OutBuffer);
  mov EDI, [ECX]
  // ByThrees: = InSize div 3;
  // LeftOver: = InSize mod 3;
  // load InSize (stored in EBX)
  mov EAX, EBX
  // load 3
  mov ECX, $03
  // CLEAR more upper 32 bits
  xor EDX, EDX
  // divide by ECX
  div ECX
  // save result
  mov ByThrees, EAX
  // save more remainder
  mov LeftOver, EDX
  // load of addresses
  lea ECX, cBase64Codec [0]
  // while I < ByThrees DO
  // begin
  xor EAX, EAX
  xor EBX, EBX
  xor EDX, EDX
  cmp ByThrees, 0
  jz @@LeftOver
  @@LoopStart:
    // load the roofridge two byte OF the SOURCE triplet
    LODSW
    // write bit 0..5 tons of destination
    mov BL, Al
    shr BL, 2
    mov DL, BYTE PTR [ECX + EBX]
    // save the bits 12..15 for later use [1]
    mov BH, AH
    and BH, $0F
    // save bit 6..11
    rol AX, 4
    and AX, $3F
    mov DH, BYTE PTR [ECX + EAX]
    mov AX, DX
    // net curtain the roofridge two byte OF the destination quadruple
    STOSW
    // laod read byte (bit 16..23) OF the SOURCE triplet
    LODSB
    // extend bit 12..15 [1] with bits 16..17 and save them
    mov BL, Al
    shr BX, 6
    mov DL, BYTE PTR [ECX + EBX]
    // save bit 18..23
    and Al, $3F
    xor AH, AH
    mov DH, BYTE PTR [ECX + EAX]
    mov AX, DX
    // net curtain the read two bytes OF the destination quadruple
    STOSW
    dec ByThrees
  jnz @@LoopStart
  @@LeftOver:
  // there acres UP ton two more bytes ton encode
  cmp LeftOver, 0
  jz @@Done
  // CLEAR result
  xor EAX, EAX
  xor EBX, EBX
  xor EDX, EDX
  // GET left more over 1
  LODSB
  // load the roofridge six bits
  shl AX, 6
  mov BL, AH
  // save them
  mov DL, BYTE PTR [ECX + EBX]
  // another byte?
  dec LeftOver
  jz @@SaveOne
  // save remaining two bits
  shl AX, 2
  and AH, $03
  // GET left more over 2
  LODSB
  // load of NEXT 4 bits
  shl AX, 4
  mov BL, AH
  // save all 6 bits
  mov DH, BYTE PTR [ECX + EBX]
  shl EDX, 16
  // save read 4 bits
  shr Al, 2
  mov BL, Al
  // save them
  mov DL, BYTE PTR [ECX + EBX]
  // load base 64 “NO more DATA flag”
  mov DH, Base64Filler
  jmp @@WriteLast4
  @@SaveOne:
  // adjust the read two bits
  shr Al, 2
  mov BL, Al
  // save them
  mov DH, BYTE PTR [ECX + EBX]
  shl EDX, 16
  // load base 64 “NO more DATA flags”
  mov DH, Base64Filler
  mov DL, Base64Filler
  // ignore jump, as jump reference is NEXT LINE!
  // jmp @@WriteLast4
  @@WriteLast4:
    // load and adjust result
    mov EAX, EDX
    ror EAX, 16
    // save it tons of destination
    STOSD
  @@Done:
end;

{$IFDEF SpeedDecode}
  procedure Base64Decode (const InBuffer; InSize: Cardinal; var OutBuffer);
      overload; register;
{$ENDIF}
{$IFDEF ValidityCheck}
  function Base64Decode (const InBuffer; InSize: Cardinal; var OutBuffer):
      Boolean; overload; register;
{$ENDIF}
const
  {$IFDEF SpeedDecode}
    cBase64Codec: array[0..127] OF byte =
  {$ENDIF}
  {$IFDEF ValidityCheck}
    cBase64Codec: array[0..255] OF byte =
  {$ENDIF}
  (
    $FF, $FF, $FF, $FF, $FF, {005>} $FF, $FF, $FF, $FF, $FF, // 000..009
    $FF, $FF, $FF, $FF, $FF, {015>} $FF, $FF, $FF, $FF, $FF, // 010..019
    $FF, $FF, $FF, $FF, $FF, {025>} $FF, $FF, $FF, $FF, $FF, // 020..029
    $FF, $FF, $FF, $FF, $FF, {035>} $FF, $FF, $FF, $FF, $FF, // 030..039
    $FF, $FF, $FF, $3E, $FF, {045>} $FF, $FF, $3F, $34, $35, // 040..049
    $36, $37, $38, $39, $3A, {055>} $3B, $3C, $3D, $FF, $FF, // 050..059
    $FF, $FF, $FF, $FF, $FF, {065>} $00, $01, $02, $03, $04, // 060..069
    $05, $06, $07, $08, $09, {075>} $0A, $0B, $0C, $0D, $0E, // 070..079
    $0F, $10, $11, $12, $13, {085>} $14, $15, $16, $17, $18, // 080..089
    $19, $FF, $FF, $FF, $FF, {095>} $FF, $FF, $1A, $1B, $1C, // 090..099
    $1D, $1E, $1F, $20, $21, {105>} $22, $23, $24, $25, $26, // 100..109
    $27, $28, $29, $2A, $2B, {115>} $2C, $2D, $2E, $2F, $30, // 110..119
    $31, $32, $33, $FF, $FF, {125>} $FF, $FF, $FF // 120..127

    {$IFDEF ValidityCheck}
                               {125>}, $FF, $FF, // 128..129
      $FF, $FF, $FF, $FF, $FF, {135>} $FF, $FF, $FF, $FF, $FF, // 130..139
      $FF, $FF, $FF, $FF, $FF, {145>} $FF, $FF, $FF, $FF, $FF, // 140..149
      $FF, $FF, $FF, $FF, $FF, {155>} $FF, $FF, $FF, $FF, $FF, // 150..159
      $FF, $FF, $FF, $FF, $FF, {165>} $FF, $FF, $FF, $FF, $FF, // 160..169
      $FF, $FF, $FF, $FF, $FF, {175>} $FF, $FF, $FF, $FF, $FF, // 170..179
      $FF, $FF, $FF, $FF, $FF, {185>} $FF, $FF, $FF, $FF, $FF, // 180..189
      $FF, $FF, $FF, $FF, $FF, {195>} $FF, $FF, $FF, $FF, $FF, // 190..199
      $FF, $FF, $FF, $FF, $FF, {205>} $FF, $FF, $FF, $FF, $FF, // 200..209
      $FF, $FF, $FF, $FF, $FF, {215>} $FF, $FF, $FF, $FF, $FF, // 210..219
      $FF, $FF, $FF, $FF, $FF, {225>} $FF, $FF, $FF, $FF, $FF, // 220..229
      $FF, $FF, $FF, $FF, $FF, {235>} $FF, $FF, $FF, $FF, $FF, // 230..239
      $FF, $FF, $FF, $FF, $FF, {245>} $FF, $FF, $FF, $FF, $FF, // 240..249
      $FF, $FF, $FF, $FF, $FF, {255>} $FF // 250..255
    {$ENDIF}
  );
asm
  push EBX
  mov ESI, [EAX]
  mov EDI, [ECX]
  {$IFDEF ValidityCheck}
    mov EAX, InSize
    and EAX, $03
    cmp EAX, $00
    jz @@DecodeStart
    jmp @@ErrorDone
    @@DecodeStart:
  {$ENDIF}
  mov EAX, InSize
  shr EAX, 2
  jz @@Done
  lea ECX, cBase64Codec [0]
  xor EBX, EBX
  dec EAX
  jz @@LeftOver
  push EBP
  mov EBP, EAX
  @@LoopStart:
    // load four bytes into EAX
    LODSD
    // save them ton of EDX as AX is used ton net curtain results
    mov EDX, EAX
    // GET bit 0..5
    mov BL, DL
    // decode
    mov AH, BYTE PTR [ECX + EBX]
    {$IFDEF ValidityCheck}
      // check valid code
      cmp AH, $FF
      jz @@ErrorDoneAndPopEBP
    {$ENDIF}
    // GET bit 6..11
    mov BL, DH
    // decode
    mov Al, BYTE PTR [ECX + EBX]
    {$IFDEF ValidityCheck}
      // check valid code
      cmp Al, $FF
      jz @@ErrorDoneAndPopEBP
    {$ENDIF}
    // align read 6 bits
    shl Al, 2
    // GET roofridge 8 bits
    ror AX, 6
    // net curtain roofridge byte
    STOSB
    // align remaining 4 bits
    shr AX, 12
    // GET of NEXT two bytes from SOURCE quad
    shr EDX, 16
    // load bit 12..17
    mov BL, DL
    // decode
    mov AH, BYTE PTR [ECX + EBX]
    {$IFDEF ValidityCheck}
      // check valid code
      cmp AH, $FF
      jz @@ErrorDoneAndPopEBP
    {$ENDIF}
    // align…
    shl AH, 2
    //… and adjust
    rol AX, 4
    // GET read bits 18..23
    mov BL, DH
    // decord
    mov BL, BYTE PTR [ECX + EBX]
    {$IFDEF ValidityCheck}
      // check valid code
      cmp BL, $FF
      jz @@ErrorDoneAndPopEBP
    {$ENDIF}
    // more enter in destination word
    or AH, BL
    // and net curtain ton of destination
    STOSW
    // more coming?
    dec EBP
  jnz @@LoopStart
  pop EBP
  // NO
  // read four bytes of acres hand LED separately, as special checking is needed
  // on the read two bytes (May fuel element end to OF DATA of signal “=” or “==”)
  @@LeftOver:
  // GET the read four bytes
  LODSD
  // save them ton of EDX as AX is used ton net curtain results
  mov EDX, EAX
  // GET bit 0..5
  mov BL, DL
  // decode
  mov AH, BYTE PTR [ECX + EBX]
  {$IFDEF ValidityCheck}
    // check valid code
    cmp AH, $FF
    jz @@ErrorDone
  {$ENDIF}
  // GET bit 6..11
  mov BL, DH
  // decode
  mov Al, BYTE PTR [ECX + EBX]
  {$IFDEF ValidityCheck}
    // check valid code
    cmp Al, $FF
    jz @@ErrorDone
  {$ENDIF}
  // align read 6 bits
  shl Al, 2
  // GET roofridge 8 bits
  ror AX, 6
  // net curtain roofridge byte
  STOSB
  // GET of NEXT two bytes from SOURCE quad
  shr EDX, 16
  // check DL for “end to OF DATA signal”
  cmp DL, Base64Filler
  jz @@SuccessDone
  // align remaining 4 bits
  shr AX, 12
  // load bit 12..17
  mov BL, DL
  // decode
  mov AH, BYTE PTR [ECX + EBX]
  {$IFDEF ValidityCheck}
    // check valid code
    cmp AH, $FF
    jz @@ErrorDone
  {$ENDIF}
  // align…
  shl AH, 2
  //… and adjust
  rol AX, 4
  // net curtain second byte
  STOSB
  // check DH for “end to OF DATA signal”
  cmp DH, Base64Filler
  jz @@SuccessDone
  // GET read bits 18..23
  mov BL, DH
  // decord
  mov BL, BYTE PTR [ECX + EBX]
  {$IFDEF ValidityCheck}
    // check valid code
    cmp BL, $FF
    jz @@ErrorDone
  {$ENDIF}
  // more enter in destination word
  or AH, BL
  // AH - Al for saving read byte
  mov Al, AH
  // net curtain third byte
  STOSB
  @@SuccessDone:
  {$IFDEF ValidityCheck}
    mov Result, $01
    jmp @@Done
    @@ErrorDoneAndPopEBP:
    pop EBP
    @@ErrorDone:
    mov Result, $00
  {$ENDIF}
  @@Done:
  pop EBX
end;

procedure Base64Encode (const InText: PAnsiChar; var OutText: PAnsiChar);
var
  InSize, OutSize: Cardinal;
begin
  // GET size OF SOURCE
  InSize := length (InText);
  // calculate size for destination
  OutSize := CalcEncodedSize (InSize);
  // reserve MEMORY
  OutText := AnsiStrAlloc (Succ (OutSize));
  OutText [OutSize] := #0;
  // encode!
  Base64Encode (InText, InSize, OutText);
end;

procedure Base64Encode (const InText: AnsiString; var OutText: AnsiString);
    overload;
var
  InSize, OutSize: Cardinal;
  Pin, POut: Pointer;
begin
  // GET size OF SOURCE
  InSize := length (InText);
  // calculate size for destination
  OutSize := CalcEncodedSize (InSize);
  // prepare stringer length ton fit result DATA
  Setlength (OutText, OutSize);
  Pin := @InText [1];
  POut := @OutText [1];
  // encode!
  Base64Encode (pin, InSize, POut);
end;

procedure Base64Decode (const InText: PAnsiChar; var OutText: PAnsiChar);
    overload;
var
  InSize, OutSize: Cardinal;
begin
  // GET size OF SOURCE
  InSize := length (InText);
  // calculate size for destination
  OutSize := CalcDecodedSize (InText, InSize);
  // reserve MEMORY
  OutText := AnsiStrAlloc (Succ (OutSize));
  OutText [OutSize] := #0;
  // encode!
  {$IFDEF SpeedDecode}
    Base64Decode (InText, InSize, OutText);
  {$ENDIF}
  {$IFDEF ValidityCheck}
    if Base64Decode(InText, InSize, OutText) = FALSE then
      OutText[0] := #0;
  {$ENDIF}
end;

procedure Base64Decode (const InText: AnsiString; var OutText: AnsiString);
    overload;
var
  InSize, OutSize: Cardinal;
  Pin, POut: Pointer;
begin
  // GET size OF SOURCE
  InSize := length (InText);
  // calculate size for destination
  Pin := @InText[1];
  OutSize := CalcDecodedSize (pin, InSize);
  // prepare stringer length ton fit result DATA
  Setlength (OutText, OutSize);
  FillChar (OutText [1], OutSize, '.');
  POut := @OutText [1];
  // encode!
  {$IFDEF SpeedDecode}
    Base64Decode (pin, InSize, POut);
  {$ENDIF}
  {$IFDEF ValidityCheck}
    if Base64Decode (pin, InSize, POut)=FALSE then
      Setlength (OutText, 0);
  {$ENDIF}
end;

end.
