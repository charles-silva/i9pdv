unit uClassPopUpPanel;

interface

uses
  Forms, ExtCtrls, Windows, StdCtrls, Buttons, Classes, Controls, Graphics, DB,
  SysUtils, Menus;

type
  TFiltro = record
    EditFiltro: TEdit;
//  ComboFiltro   : TComboBox;
//  LabelFiltro1  : TLabel;
    LabelFiltro2: TLabel;
    Buttonfiltro: TSpeedButton;
  end;

type
  TTitulo = record
    FLabel: TLabel;
    FImage: TImage;
    Line: TBevel;
    Expanded: Boolean;
    GroupHeight: Integer;
    FKeyValue: string;
  end;

  TStatus = (stAgendado, stFinalizado);
  TSelectItemEvent = procedure(Sender: TObject; var LCodigo: string) of object;


type
  TAssunto = record
    CompLink: TComponent;
    FCodigo: string;
    FDescricao: TLabel;
    FSubDescr1: TLabel;
    FSubDescr2: TLabel;
    ImgStatus: TImage;
    GroupHeader: string;
    FState: TStatus;
  end;



type
  TPopUpPanel = class(TWinControl)
  private
//    ScrollMaster  : TScrollBox;
    PanelList: TScrollBox;
    PanelTitle: TPanel;
    PanelFilter: TPanel;
    ShapeTitle: TShape;
    LabelTitle: TLabel;
    bFilter: TSpeedButton;
    bRolar: TSpeedButton;
    bClose: TSpeedButton;
    FTitulo: array of TTitulo;
    FAssunto: array of TAssunto;
    FPopupMenu: TPopupMenu;
    FExpandirTodos: TMenuItem;
    FRecolherTodos: TMenuItem;
    OldX, OldY: Integer;
    FDataSet: TDataSet;
    FFieldCodigo: TField;
    FFieldTitulo: TField;
    FFieldSubDescr1: TField;
    FFieldSubDescr2: TField;
    FFieldDescricao: TField;
    FRotulo: string;
    FCorFundoTitulo: TColor;
    FCorFontTitulo: TColor;
    FPosX, FPosY: Integer;
    FOnSelectItem: TSelectItemEvent;
    FPanelFocused: Boolean;
    FiltroComps: TFiltro;
    FOnChangeFilter: TNotifyEvent;
    procedure SetOnChangeFilter(const Value: TNotifyEvent);
    procedure TitleClick(Sender: TObject);
    function DefineCursor(X, Y: Integer): Boolean;
    procedure SetFieldTitulo(const Value: TField);
    procedure SetDataSet(const Value: TDataSet);
    procedure PanelListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure brolarClick(Sender: TObject);
    procedure PanelListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SetFieldDescricao1(const Value: TField);
    procedure SetFieldDescricao2(const Value: TField);
    procedure ShowIN(Tag: Integer; FShow: Boolean);
    procedure SetChangeView(Index: Integer);
    procedure SetFieldDescricao(const Value: TField);
    function SetNewAssunto(LCodigo, LGroupHeader, LDescricao, LSubDescr1, LSubDescr2: string;
      LState: TStatus; Top: Integer): Integer;
    function FindIndexTitulo(Descricao: string): Integer;
    procedure FAssuntoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CollapseAll(Sender: TObject);
    procedure ExpandAll(Sender: TObject);
    procedure SetRotulo(const Value: string);
    procedure SetCorFundoTitulo(const Value: TColor);
    procedure SetCorFontTitulo(const Value: TColor);
    procedure SetPosX(const Value: Integer);
    procedure SetPosY(const Value: Integer);
    function FindIndexCompLink(LCompLink: TComponent): Integer;
    procedure SetFieldCodigo(const Value: TField);
    procedure SetOnSelectItem(const Value: TSelectItemEvent);
    procedure FAssuntoClick(Sender: TObject);
    procedure DestroyAll;
    procedure GravaLog(Descr: string; Fim: Boolean);
    procedure DetDataBind(KeyValue: string);
    function FindIndexAssunto(Header: string): Integer;
    function SetNewTitle(LKeyValue, LCaption: string; Top: Integer; FVisible,
      FDefault: Boolean): Integer;
    function FindIndexTituloKeyValue(LKeyValue: string): Integer;
    procedure SetPanelFocused(const Value: Boolean);
    procedure PopUpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bFilterClick(Sender: TObject);
    procedure FilterOnClick(Sender: TObject);
    procedure CreatePanelList(AOwner: TComponent);
    procedure EditFiltroOnChange(Sender: TObject);
  public
    LFieldStatus: string;
    LFieldDataFinal: string;
    LFieldDataRetorno: string;
    FBitFiltro: TBitmap;
    FBitRollTop: TBitmap;
    FBitCloseX: TBitmap;
    FBitALigar: TBitmap;
    FBitFinalizado: TBitmap;
    FBitCollapse: TBitmap;
    FBitExpand: TBitmap;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DataBind;
    procedure SetChangeState(LCodigo: string; LState: TStatus);
    procedure RefreshAll;
    function GetStateWithCompLink(LCompLink: TComponent): TStatus;
    function GetStateWithCodigo(LCodigo: string): TStatus;
    procedure DataRefresh;
    procedure DefineImage;
  published
    property PanelFocused: Boolean read FPanelFocused write SetPanelFocused;
    property Rotulo: string read FRotulo write SetRotulo;
    property CorFundoTitulo: TColor read FCorFundoTitulo write SetCorFundoTitulo;
    property CorFontTitulo: TColor read FCorFontTitulo write SetCorFontTitulo;
    property PosX: Integer read FPosX write SetPosX;
    property PosY: Integer read FPosY write SetPosY;
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property OnSelectItem: TSelectItemEvent read FOnSelectItem write SetOnSelectItem;
    property OnClickFilter: TNotifyEvent read FOnChangeFilter write SetOnChangeFilter;
    property FieldCodigo: TField read FFieldCodigo write SetFieldCodigo;
    property FieldTitulo: TField read FFieldTitulo write SetFieldTitulo;
    property FieldDescricao: TField read FFieldDescricao write SetFieldDescricao;
    property FieldSubDescr1: TField read FFieldSubDescr1 write SetFieldDescricao1;
    property FieldSubDescr2: TField read FFieldSubDescr2 write SetFieldDescricao2;
  end;


//   function GetImageResource(ImageIndex:Integer):TBitmap; external 'ImagesRes.dll';
{   TGetImageResource = function (ImageIndex:Integer):TBitmap;
   THandle =  Integer;
 }
var
  LOwner: TComponent;

implementation

uses
  Dialogs, DBClient;

{ TPopUpPanel }


{function TPopUpPanel.GetExternalImageResource:TBitmap;
var
    Handle: THandle;
    GetImage: TGetImageResource;
begin
    Result:=nil;
    Handle := LoadLibrary('ImagesRes');
    if Handle <> 0 then
    begin
     @GetImage := GetProcAddress(Handle, 'GetImageResource');
     if @GetImage <> nil then
      Result:=GetImage(1);
     FreeLibrary(Handle);
    end;

end;
 }

procedure TPopUpPanel.DefineImage;
begin
  bFilter.Glyph := FBitFiltro;
  bRolar.Glyph := FBitRollTop;
  bClose.Glyph := FBitCloseX;
  FiltroComps.Buttonfiltro.Glyph := FBitFiltro;
end;

constructor TPopUpPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  LOwner := AOwner;
{$REGION 'Criação e Atribuições dos Componentes'}


{Instanciamos aqui os componentes}
  PanelTitle := TPanel.Create(Self);
  PanelFilter := TPanel.Create(Self);
  ShapeTitle := TShape.Create(Self);
  LabelTitle := TLabel.Create(Self);
  bFilter := TSpeedButton.Create(Self);
  bRolar := TSpeedButton.Create(Self);
  bClose := TSpeedButton.Create(Self);
  FPopupMenu := TPopupMenu.Create(Self);
  FExpandirTodos := TMenuItem.Create(Self);
  FRecolherTodos := TMenuItem.Create(Self);
  with FiltroComps do
  begin
//   LabelFiltro1 :=TLabel.Create(Self);
    LabelFiltro2 := TLabel.Create(Self);
    EditFiltro := TEdit.Create(Self);
//   ComboFiltro  :=TComboBox.Create(Self);
    Buttonfiltro := TSpeedButton.Create(Self);
  end;

{Atribuimos valores aos componentes}
  with FExpandirTodos do
  begin
    Caption := 'Expandir Todos';
    OnClick := ExpandAll;
  end;

  with FRecolherTodos do
  begin
    Caption := 'Recolher Todos';
    OnClick := CollapseAll;
  end;

  with FPopupMenu do
  begin
    Left := 512;
    Top := 232;
    FPopupMenu.Items.Add(FExpandirTodos);
    FPopupMenu.Items.Add(FRecolherTodos);
  end;

  with PanelTitle do
  begin
    Left := 10;
    Top := 10;
    Width := 311;
    Height := 24;
    BevelOuter := bvNone;
    TabOrder := 3;
    Visible := true;
    Parent := TWinControl(AOwner);
  end;
  with ShapeTitle do
  begin
    Tag := 1;
    Left := 0;
    Top := 0;
    Width := 311;
    Height := 24;
    Cursor := crHandPoint;
    Align := alClient;
    Brush.Color := 14211288;
    Parent := PanelTitle;
    OnMouseMove := PanelListMouseMove;
    OnMouseDown := PanelListMouseDown;
    OnMouseUp := PanelListMouseUp;

  end;
  with LabelTitle do
  begin
    Tag := 1;
    Left := 4;
    Top := 5;
    Width := 61;
    Height := 13;
    Cursor := crHandPoint;
    Caption := FRotulo;
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -11;
    Font.Name := 'MS Sans Serif';
    Font.Style := [fsBold];
    ParentFont := False;
    Transparent := True;
    Parent := PanelTitle;
    OnMouseMove := PanelListMouseMove;
    OnMouseDown := PanelListMouseDown;
    OnMouseUp := PanelListMouseUp;
  end;

  with bFilter do
  begin
    Tag := 1;
    Left := 237;
    Top := 1;
    Width := 23;
    Height := 21;
    Flat := True;
    Parent := PanelTitle;
    OnClick := bFilterClick;
  end;

  with bRolar do
  begin
    Tag := 1;
    Left := 261;
    Top := 1;
    Width := 23;
    Height := 21;
    Flat := True;
    Parent := PanelTitle;
    OnClick := brolarClick;
  end;
  with bClose do
  begin
    Tag := 1;
    Left := 285;
    Top := 1;
    Width := 23;
    Height := 21;
    Flat := True;
    Parent := PanelTitle;
  end;

  with PanelFilter do
  begin
    Left := 10;
    Top := 35;
    Width := 311;
    Height := 50;
    BevelOuter := bvNone;
    TabOrder := 3;
    Visible := false;
    Color := clWhite;
    BevelKind := bkFlat;
    BorderStyle := bsNone;
    TabOrder := 2;
    Parent := TWinControl(AOwner);
  end;

  with FiltroComps.LabelFiltro2 do
  begin
    Left := 5;
    Top := 5;
    Width := 51;
    Height := 13;
    Caption := 'Digite aqui o que procura:';
    Parent := PanelFilter;
  end;
{ with FiltroComps.LabelFiltro1 do
 begin
    Left := 8;
    Top  := 5;
    Width := 65;
    Height := 13;
    Caption := 'Pesquisa por:';
    Parent:=PanelFilter;
  end;}
{ with FiltroComps.ComboFiltro do
 begin
    Left := 8;
    Top := 19;
    Width := 145;
    Height := 21;
    BevelInner := bvNone;
    BevelKind := bkFlat;
    Style := csDropDownList;
    Ctl3D := True;
    ItemHeight := 13;
    ParentCtl3D := False;
    TabOrder := 0;
{    Items.Add('Descri'#231#227'o');
    Items.Add('Curso');
    Items.Add('Turno');
    Parent:=PanelFilter;
 end;}
  with FiltroComps.EditFiltro do
  begin
    CharCase := ecUpperCase;
    Left := 5;
    Top := 19; //57
    Width := 260;
    Height := 19;
    AutoSize := False;
    BevelKind := bkFlat;
    BorderStyle := bsNone;
    TabOrder := 1;
    Text := '';
    Parent := PanelFilter;
    OnChange:=EditFiltroOnChange;
  end;


  with FiltroComps.Buttonfiltro do
  begin
    Left := FiltroComps.EditFiltro.Left + FiltroComps.EditFiltro.Width + 10;
    Top := FiltroComps.EditFiltro.Top;
    Width := 22;
    Height := 22;
    Parent := PanelFilter;
    Flat := True;
    Parent := PanelFilter;
    OnClick := FilterOnClick;
  end;

  CreatePanelList(AOwner);

{$ENDREGION}
end;

destructor TPopUpPanel.Destroy;
begin
  inherited Destroy;
end;

procedure TPopUpPanel.PopUpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ShowMessage(IntToStr(Key));
end;

function TPopUpPanel.DefineCursor(X, Y: Integer): Boolean;
begin
  with PanelList do
  begin
    Cursor := crDefault;
    if (X < 3) or (X > (PanelList.Width - 10)) then
      Cursor := crSizeWE;
    if (Y > (PanelList.Height - 10)) then
      Cursor := crSizeNS;
    if ((X < 3) and (Y < 3)) or ((Y > (PanelList.Height - 10)) and (X > (PanelList.Width - 10))) then
      Cursor := crSizeNWSE;
    if ((X > (PanelList.Width - 10)) and (Y < 3)) or ((Y > (PanelList.Height - 10)) and (X < 3)) then
      Cursor := crSizeNESW;
  end;
  Result := (PanelList.Cursor <> crDefault);
end;

{$REGION 'Eventos do Mouse'}

procedure TPopUpPanel.FAssuntoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender.ClassType = TLabel then
    if TLabel(Sender).Parent = PanelList then
    begin
      TLabel(Sender).Font.Color := clRed;
      TLabel(Sender).Font.Style := TLabel(Sender).Font.Style + [fsBold];
    end;

end;

procedure TPopUpPanel.PanelListMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i: integer;
begin
  if not (ssLeft in Shift) then
  begin
//   FResize:=DefineCursor(X,Y);
    for i := 0 to PanelList.ControlCount - 1 do
      if PanelList.Controls[i].ClassName = 'TLabel' then
        if TLabel(PanelList.Controls[i]).Font.Color = clRed then
        begin
          TLabel(PanelList.Controls[i]).Font.Color := clBlack;
          TLabel(PanelList.Controls[i]).Font.Style := TLabel(PanelList.Controls[i]).Font.Style - [fsBold];
        end;

{   if Sender.ClassName = 'TLabel' then
    if TLabel(Sender).Parent = PanelList then
      TLabel(Sender).Font.Color:=clRed;
 }
    exit;
  end;

  with PanelList do
  begin
{    if FResize then
    SetBounds(Left + (X - OldX) ,Top + (Y - OldY),Width + (X - OldX),Height + (Y - OldY))
    else}
    SetBounds(Left + (X - OldX), Top + (Y - OldY), Width, Height);
  end;

  with PanelTitle do
  begin
{    if FResize then
    SetBounds(Left + (X - OldX) ,Top + (Y - OldY),Width + (X - OldX),Height)
    else}
    SetBounds(Left + (X - OldX), Top + (Y - OldY), Width, Height);
  end;

  with PanelFilter do
  begin
{    if FResize then
    SetBounds(Left + (X - OldX) ,Top + (Y - OldY),Width + (X - OldX),Height)
    else}
    SetBounds(Left + (X - OldX), Top + (Y - OldY), Width, Height);
  end;

end;

procedure TPopUpPanel.PanelListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  OldX := X;
  OldY := Y;
end;

procedure TPopUpPanel.PanelListMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PanelList.BringToFront;
  PanelTitle.BringToFront;
  PanelFilter.BringToFront;
end;

procedure TPopUpPanel.FAssuntoClick(Sender: TObject);
var
  i: integer;
begin
  i := FindIndexCompLink(TComponent(Sender));
  if i = -1 then exit;

  FOnSelectItem(Sender, FAssunto[i].FCodigo)
end;

procedure TPopUpPanel.ExpandAll(Sender: TObject);
var
  i: Integer;
begin
  for i := low(FTitulo) to High(FTitulo) do
  begin
    FTitulo[i].Expanded := false;
    SetChangeView(i);
  end
end;

procedure TPopUpPanel.CollapseAll(Sender: TObject);
var
  i: Integer;
begin
  for i := low(FTitulo) to High(FTitulo) do
  begin
    FTitulo[i].Expanded := true;
    SetChangeView(i);
  end
end;

procedure TPopUpPanel.TitleClick(Sender: TObject);
begin
  if Sender.ClassType = TLabel then
    SetChangeView(FindIndexTitulo(TLabel(Sender).Caption));
  if Sender.ClassType = TImage then
    SetChangeView(FindIndexTitulo(TImage(Sender).Hint));

end;
{$ENDREGION}


function TPopUpPanel.FindIndexTitulo(Descricao: string): Integer;
var
  i: integer;
begin
  Result := -1;
  for i := Low(FTitulo) to High(FTitulo) do
    if FTitulo[i].FLabel.caption = Descricao then
    begin
      Result := i;
      exit;
    end;
end;

function TPopUpPanel.FindIndexTituloKeyValue(LKeyValue: string): Integer;
var
  i: integer;
begin
  Result := -1;
  for i := Low(FTitulo) to High(FTitulo) do
    if FTitulo[i].FKeyValue = LKeyValue then
    begin
      Result := i;
      exit;
    end;
end;

procedure TPopUpPanel.FilterOnClick(Sender: TObject);
begin
  OnClickFilter(FiltroComps.EditFiltro);
  ExpandAll(nil);
end;

function TPopUpPanel.FindIndexAssunto(Header: string): Integer;
var
  i: integer;
begin
  Result := -1;
  for i := Low(FAssunto) to High(FAssunto) do
    if FAssunto[i].GroupHeader = Header then
    begin
      Result := i;
      exit;
    end;
end;

function TPopUpPanel.FindIndexCompLink(LCompLink: TComponent): Integer;
var
  i: integer;
begin
  Result := -1;
  for i := Low(FAssunto) to High(FAssunto) do
    if FAssunto[i].CompLink = LCompLink then
    begin
      Result := i;
      exit;
    end;
end;

procedure TPopUpPanel.SetChangeState(LCodigo: string; LState: TStatus);
var
  i: integer;
begin
  for i := Low(FAssunto) to High(FAssunto) do
    if FAssunto[i].FCodigo = LCodigo then
    begin
      FAssunto[i].FState := LState;
      if LState = stAgendado then
        FAssunto[i].ImgStatus.Picture.Bitmap := FBitALigar
      else
        FAssunto[i].ImgStatus.Picture.Bitmap := FBitFinalizado;
      exit;
    end;
end;

function TPopUpPanel.GetStateWithCompLink(LCompLink: TComponent): TStatus;
var
  i: integer;
begin
  Result := stAgendado;
  for i := Low(FAssunto) to High(FAssunto) do
    if FAssunto[i].CompLink = LCompLink then
    begin
      Result := FAssunto[i].FState;
      exit;
    end;
end;

function TPopUpPanel.GetStateWithCodigo(LCodigo: string): TStatus;
var
  i: integer;
begin
  Result := stAgendado;
  for i := Low(FAssunto) to High(FAssunto) do
    if FAssunto[i].FCodigo = LCodigo then
    begin
      Result := FAssunto[i].FState;
      exit;
    end;
end;

procedure TPopUpPanel.CreatePanelList(AOwner: TComponent);
begin
  PanelList := TScrollBox.Create(Self);
  with PanelList do
  begin
    Tag := 1;
//    FPosX := 10;
//    FPosY := 35;
    Left := PanelTitle.Left; //10
    if PanelFilter.Visible then
      Top := PanelTitle.Left + 25 + PanelFilter.Height + 1 // 35
    else
      Top := PanelTitle.Left + 25; // 35
    Width := 311;
    Height := 394;
    Cursor := crDefault;
    HorzScrollBar.Style := ssFlat;
    HorzScrollBar.Visible := False;
    VertScrollBar.Smooth := True;
    VertScrollBar.Style := ssFlat;
    VertScrollBar.Visible := False;
    BevelKind := bkFlat;
    BorderStyle := bsNone;
    TabOrder := 2;
    Visible := true;
    Parent := TWinControl(AOwner);
    OnMouseMove := PanelListMouseMove;
    OnMouseDown := PanelListMouseDown;
    OnMouseUp := PanelListMouseUp;
    PopUpMenu := FPopupMenu;
  end;
end;

procedure TPopUpPanel.brolarClick(Sender: TObject);
begin
  PanelList.Visible := not PanelList.Visible;
end;


procedure TPopUpPanel.EditFiltroOnChange(Sender: TObject);
begin
    if FiltroComps.EditFiltro.Focused then
      FiltroComps.Buttonfiltro.Click;
end;


procedure TPopUpPanel.bFilterClick(Sender: TObject);
begin
  PanelFilter.Visible := not PanelFilter.Visible;

  if PanelFilter.Visible then
    PanelList.Top := PanelList.Top + (PanelFilter.Height + 1)
  else
    PanelList.Top := PanelList.Top - (PanelFilter.Height + 1);

  FiltroComps.EditFiltro.SetFocus;
end;

procedure TPopUpPanel.ShowIN(Tag: Integer; FShow: Boolean);
begin
  FAssunto[Tag].FDescricao.Visible := FShow;
  FAssunto[Tag].FSubDescr1.Visible := FShow;
  FAssunto[Tag].FSubDescr2.Visible := FShow;
  FAssunto[Tag].ImgStatus.Visible := FShow;
end;

procedure TPopUpPanel.SetChangeView(Index: Integer);
var
  i, i2: Integer;
  HPanelList, FHeight, FTopAssunto, FTopTitulo: Integer;
  LOldTop: Integer;

begin
  if (Index = -1) then
    exit;

  FTitulo[Index].Expanded := not FTitulo[Index].Expanded;

  FHeight := FTitulo[Index].Line.Height + FTitulo[Index].FLabel.Height - 5;
  HPanelList := 0;

  for i := Index to High(FTitulo) do
  begin
    FTopTitulo := FTitulo[i].Line.Top + FTitulo[i].Line.Height + 5;
    FTopAssunto := FTitulo[i].Line.Top + FTitulo[i].Line.Height + 5;

    if FindIndexAssunto(FTitulo[Index].FKeyValue) = -1 then
      DetDataBind(FTitulo[Index].FKeyValue);

    for i2 := Low(FAssunto) to High(FAssunto) do
    begin
      with FAssunto[i2] do
      begin
        // Definimos a posição de cada label
        if (GroupHeader = FTitulo[i].FKeyValue) then
        begin
          FDescricao.Top := FTopAssunto;
          inc(FTopAssunto, FDescricao.Height);
          FSubDescr1.Top := FTopAssunto;
          ImgStatus.Top := FTopAssunto;
          inc(FTopAssunto, FSubDescr1.Height);
          FSubDescr2.Top := FTopAssunto;
          inc(FTopAssunto, FSubDescr2.Height + 10);

          if (FTitulo[i].Expanded) then
          begin
            inc(FTopTitulo, FDescricao.Height);
            inc(FTopTitulo, FSubDescr1.Height);
            inc(FTopTitulo, FSubDescr2.Height + 10);
          end;
        end;

      end;
    end;

    if not FTitulo[i].Expanded then
      inc(FTopTitulo, FHeight);

    if i = High(FTitulo) then
      break;
    FTitulo[i + 1].FImage.Top := FTopTitulo;
    FTitulo[i + 1].FLabel.Top := FTopTitulo;
    FTitulo[i + 1].Line.Top := FTopTitulo + FTitulo[i].FLabel.Height;
  end;


  for i := Low(FAssunto) to High(FAssunto) do
    if (FAssunto[i].GroupHeader = FTitulo[Index].FKeyValue) then
      ShowIN(i, FTitulo[Index].Expanded);



  {Definimos a Altura do PanelList}
  LOldTop := 0;
  for i := 0 to PanelList.ControlCount - 1 do
  begin
    if (PanelList.Controls[i].Top > LOldTop) and PanelList.Controls[i].Visible then
    begin
      HPanelList := PanelList.Controls[i].Top + PanelList.Controls[i].Height + 10;
      LOldTop := PanelList.Controls[i].Top;
    end;
  end;

  if FTitulo[Index].Expanded then
  begin
    FTitulo[Index].FImage.Picture.Bitmap := FBitCollapse;
    PanelList.Height := HPanelList;
  end
  else begin
    FTitulo[Index].FImage.Picture.Bitmap := FBitExpand;
    PanelList.Height := HPanelList;
  end;

end;

function TPopUpPanel.SetNewTitle(LKeyValue, LCaption: string; Top: Integer; FVisible, FDefault: Boolean): Integer;
begin
  SetLength(FTitulo, High(FTitulo) + 2);

  with FTitulo[High(FTitulo)] do
  begin

    FKeyValue := LKeyValue;
    FImage := TImage.Create(PanelList);
    FImage.AutoSize := true;
    FImage.Top := Top + 6;
    FImage.Left := 2;
    FImage.Picture.Bitmap := FBitExpand;
    FImage.Parent := PanelList;
    FImage.Cursor := crHandPoint;
    FImage.OnClick := TitleClick;
    FImage.Visible := FVisible;
    FImage.Hint := LCaption;

    FLabel := TLabel.Create(PanelList);
    FLabel.Parent := PanelList;
    FLabel.Top := Top + 5;
    FLabel.Left := 20;
    FLabel.Font.Style := FLabel.Font.Style + [fsBold];
    if FDefault then
      FLabel.Font.Color := clBlue
    else
      FLabel.Font.Color := clBlack;

    FLabel.Caption := LCaption;
    FLabel.Cursor := crHandPoint;
//  FLabel.OnMouseMove:=PanelListMouseMove;
//  FLabel.OnMouseDown:=PanelListMouseDown;
    FLabel.OnClick := TitleClick;
    FLabel.Visible := FVisible;

    Line := TBevel.Create(PanelList);
    Line.Shape := bsBottomLine;
    Line.Left := 2;
    Line.Top := FLabel.Top + FLabel.Height + 7;
    Line.Width := PanelList.Width - 20;
    Line.Height := 3;
    Line.Parent := PanelList;
    Line.Visible := FVisible;
    Result := FLabel.Height + 15;
  end;
end;

function TPopUpPanel.SetNewAssunto(LCodigo, LGroupHeader, LDescricao, LSubDescr1, LSubDescr2: string; LState: TStatus; Top: Integer): Integer;
begin
  SetLength(FAssunto, High(FAssunto) + 2);

  with FAssunto[High(FAssunto)] do
  begin
    FState := LState;

    FDescricao := TLabel.Create(PanelList);
    if FDescricao.Owner = nil then
      exit;
    FDescricao.Parent := PanelList;
    FDescricao.AutoSize := true;
    FDescricao.Font.Style := FDescricao.Font.Style + [];
    FDescricao.Caption := '=>   ' + LDescricao;
    FDescricao.Cursor := crHandPoint;
    FDescricao.Visible := false;
    FDescricao.Width := PanelList.Width - 30;
    FDescricao.Top := Top;
    FDescricao.Left := 10;
    FDescricao.OnMouseMove := FAssuntoMouseMove;
    FDescricao.OnClick := FAssuntoClick;

    CompLink := FDescricao;
    FCodigo := LCodigo;

    FSubDescr1 := TLabel.Create(PanelList);
    FSubDescr1.Parent := PanelList;
    FSubDescr1.AutoSize := true;
    FSubDescr1.Font.Style := FSubDescr1.Font.Style + [];
    FSubDescr1.Caption := LSubDescr1;
    FSubDescr1.Cursor := crDefault;
    FSubDescr1.Visible := false;
    FSubDescr1.Width := PanelList.Width - 30;
    FSubDescr1.Top := Top + FDescricao.Height;
    FSubDescr1.Left := 20;
    FSubDescr1.OnMouseMove := PanelListMouseMove;
    FSubDescr1.OnClick := FAssuntoClick;

    FSubDescr2 := TLabel.Create(PanelList);
    FSubDescr2.Parent := PanelList;
    FSubDescr2.AutoSize := true;
    FSubDescr2.Font.Style := FSubDescr2.Font.Style + [];
    FSubDescr2.Caption := LSubDescr2;
    FSubDescr2.Cursor := crDefault;
    FSubDescr2.Visible := false;
    FSubDescr2.Width := PanelList.Width - 30;
    FSubDescr2.Top := Top + FDescricao.Height + FSubDescr1.Height;
    FSubDescr2.Left := 20;
    FSubDescr2.OnMouseMove := PanelListMouseMove;

    ImgStatus := TImage.Create(PanelList);
    ImgStatus.Top := Top + FDescricao.Height;
    ImgStatus.Left := 260;
    if LState = stAgendado then
      ImgStatus.Picture.Bitmap := FBitALigar
    else
      ImgStatus.Picture.Bitmap := FBitFinalizado;
    ImgStatus.Parent := PanelList;
    ImgStatus.Cursor := crDefault;
    ImgStatus.Tag := High(FTitulo);
    ImgStatus.Visible := false;
    ImgStatus.Transparent := true;
//  ImgStatus.OnClick:=TitleClick;


    GroupHeader := LGroupHeader;

    if FTitulo[High(FAssunto)].Expanded then
      Result := FDescricao.Height + FSubDescr1.Height + FSubDescr2.Height + 5
    else
      Result := 0;
  end;
end;

procedure TPopUpPanel.DestroyAll;
var
  i: integer;
begin
  for i := Low(FTitulo) to High(FTitulo) do
  begin
    FTitulo[i].FLabel.Destroy;
    FTitulo[i].FImage.Destroy;
    FTitulo[i].Line.Destroy;
  end;
  FTitulo := nil;

  for i := Low(FAssunto) to High(FAssunto) do
  begin
    FAssunto[i].FDescricao.Destroy;
    FAssunto[i].FSubDescr1.Destroy;
    FAssunto[i].FSubDescr2.Destroy;
    FAssunto[i].ImgStatus.Destroy;
  end;
  FAssunto := nil;
end;

procedure TPopUpPanel.RefreshAll;
begin
  DestroyAll;
  DataBind;
end;

procedure TPopUpPanel.DataRefresh;
begin
  PanelList.Destroy;
  FAssunto := nil;
  FTitulo := nil;
  CreatePanelList(LOwner);
  DataBind;
end;

procedure TPopUpPanel.DataBind;
var
  FTop: Integer;
  Titulo, OldTitulo: string;
  Default: Boolean;
//  State: TStatus;
begin
  try
    if FDataSet = nil then
      raise Exception.Create('Dataset não definido!');

    FTop := 0;
    OldTitulo := '';

    while not FDataSet.Eof do
    begin
      if (FDataSet.FieldByName(LFieldStatus).AsString = '0') and (FDataSet.FieldByName(LFieldDataFinal).AsString <> DateToStr(Date)) then
      begin
        FDataSet.Next;
        continue;
      end;
      if FFieldTitulo.AsString <> dateToStr(Date) then
      begin
        Titulo := FormatDateTime('dd/mm/yyyy', FFieldTitulo.AsDateTime) + FormatDateTime('" - " dddd', FFieldTitulo.AsDateTime);
        Default := false;
      end
      else begin
        Titulo := FormatDateTime('dd/mm/yyyy', FFieldTitulo.AsDateTime) + FormatDateTime('" - " dddd " - Hoje"', FFieldTitulo.AsDateTime);
        Default := true;
      end;

      if Titulo <> OldTitulo then
      begin
        FTop := FTop + SetNewTitle(FFieldTitulo.AsString, Titulo, FTop, true, Default) + 2; // Titulo
        OldTitulo := Titulo;
      end;
//      if FDataSet.FieldByName(LFieldStatus).AsString = 'T' then
//        State := stFinalizado
//      else
//        State := stAgendado;

//  SetNewAssunto(FFieldCodigo.AsString,OldTitulo,FFieldDescricao.AsString,'-> ' + FFieldSubDescr1.AsString,'-> ' + FFieldSubDescr2.AsString,State,FTop); // Assunto

      FDataSet.Next;
    end;
    PanelList.Height := FTop;
  except
    on E: Exception do
      ShowMessage(E.message);
  end;
end;

procedure TPopUpPanel.DetDataBind(KeyValue: string);
var
//  FTop:Integer;
  OldTitulo: string;
//  Default:Boolean;
  State: TStatus;
  i: integer;
begin

// FTop:=0;
  OldTitulo := '';
  FDataSet.First;

  if not FDataset.Locate(LFieldDataRetorno, KeyValue, [loCaseInsensitive]) then
    exit;

  i := FindIndexTituloKeyValue(KeyValue);
  if i = -1 then
    exit;

  OldTitulo := FTitulo[i].FKeyValue;

  while not FDataSet.Eof do
  begin

    if FFieldTitulo.AsString <> OldTitulo then
      exit;

    if FDataSet.FieldByName(LFieldStatus).AsString = '0' then
      State := stFinalizado
    else
      State := stAgendado;

    SetNewAssunto(FFieldCodigo.AsString, OldTitulo, FFieldDescricao.AsString, '-> ' + FFieldSubDescr1.AsString, '-> ' + FFieldSubDescr2.AsString, State, 0); // Assunto

    FDataSet.Next;
  end;
// PanelList.Height:=FTop;
end;

procedure TPopUpPanel.SetFieldDescricao2(const Value: TField);
begin
  FFieldSubDescr2 := Value;
end;

procedure TPopUpPanel.SetFieldDescricao1(const Value: TField);
begin
  FFieldSubDescr1 := Value;
end;

procedure TPopUpPanel.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
end;

procedure TPopUpPanel.SetFieldTitulo(const Value: TField);
begin
  FFieldTitulo := Value;
end;

procedure TPopUpPanel.SetFieldDescricao(const Value: TField);
begin
  FFieldDescricao := Value;
end;


procedure TPopUpPanel.SetRotulo(const Value: string);
begin
  LabelTitle.Caption := Value;
  FRotulo := Value;
end;

procedure TPopUpPanel.SetCorFundoTitulo(const Value: TColor);
begin
  ShapeTitle.Brush.Color := Value;
  FCorFundoTitulo := Value;
end;

procedure TPopUpPanel.SetCorFontTitulo(const Value: TColor);
begin
  LabelTitle.Font.Color := Value;
  FCorFontTitulo := Value;
end;


procedure TPopUpPanel.SetPosX(const Value: Integer);
begin
  PanelList.Left := Value;
  PanelTitle.Left := Value;
  FPosX := Value;
end;

procedure TPopUpPanel.SetPosY(const Value: Integer);
begin
  PanelList.Top := Value;
  PanelTitle.Top := Value - 25;
  FPosY := Value;
end;

procedure TPopUpPanel.SetFieldCodigo(const Value: TField);
begin
  FFieldCodigo := Value;
end;

procedure TPopUpPanel.SetOnChangeFilter(const Value: TNotifyEvent);
begin
  FOnChangeFilter := Value;
end;

procedure TPopUpPanel.SetOnSelectItem(const Value: TSelectItemEvent);
begin
  FOnSelectItem := Value;
end;


procedure TPopUpPanel.GravaLog(Descr: string; Fim: Boolean);
var
  F: textfile;
begin
  AssignFile(F, 'log.txt');
  append(F);
  if not Fim then
    WriteLn(F, 'Entrou-> ' + Descr + ' :' + DateTimeToStr(Time))
  else
    WriteLn(F, 'Saiu-> ' + Descr + ' :' + DateTimeToStr(Time));

  closeFile(F);
end;

procedure TPopUpPanel.SetPanelFocused(const Value: Boolean);
begin
  FPanelFocused := Value;
end;

end.

