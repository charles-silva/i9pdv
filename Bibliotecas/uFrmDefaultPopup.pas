unit uFrmDefaultPopup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinDevExpressStyle,   StdCtrls,
  cxButtons, ExtCtrls, cxControls, dxSkinscxPCPainter, cxClasses,
  dxLayoutContainer, dxLayoutControl, uGlobalLibWiBi, Rtti, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer,
  dxLayoutcxEditAdapters, cxTextEdit, cxCurrencyEdit, ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, Contnrs,
  dxLayoutLookAndFeels, dxSkinBlack, dxSkinCaramel, dxSkinBlue, dxSkinOffice2010Silver;

type
  TFrmDefaultPopup = class(TForm)
    Panel1: TPanel;
    btnConfirma: TcxButton;
    btnCancel: TcxButton;
    Root: TdxLayoutGroup;
    LayoutControl: TdxLayoutControl;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
  private
    Fcontrol: TObject;
    gGroup: TdxLayoutGroup;
    function addLayoutItem(ALayoutItem: TPopupInputs; AParent: TdxLayoutItem): TdxLayoutItem;
    procedure CriarControle(ALayoutItem: TPopupInputs; AOwner: TComponent; var AControl: TObject);
    procedure MakeForm;
    {Private declarations}
  public
    gInputs: TObjectList;
    gRetorno: TStrings;
    gTitulo: String;
    {Public declarations}
  end;

var
  FrmDefaultPopup: TFrmDefaultPopup;

implementation

{$R *.dfm}

procedure TFrmDefaultPopup.btnConfirmaClick(Sender: TObject);
var
  I: Integer;
  loValue: string;
begin
  for I := 0 to gGroup.ComponentCount - 1 do
  begin
    if (gGroup.Components[I] is TcxTextEdit) then
      loValue := TcxTextEdit(gGroup.Components[I]).Text
    else if (gGroup.Components[I] is TcxCurrencyEdit) then
    begin
      if TcxCurrencyEdit(gGroup.Components[I]).EditValue = null then
        loValue := ''
      else
        loValue := TcxCurrencyEdit(gGroup.Components[I]).Text;
    end
    else if (gGroup.Components[I] is TcxDateEdit) then
      loValue := TcxDateEdit(gGroup.Components[I]).Text;
    gRetorno.Add(loValue);
  end;
  ModalResult := mrOk;
end;

procedure TFrmDefaultPopup.CriarControle(ALayoutItem: TPopupInputs; AOwner: TComponent; var AControl: TObject);
// var
// ctx: TRttiContext;
// t: TRttiType;
// prop: TRTTIProperty;
begin
  case ALayoutItem.Tipo of
    tpString:
      begin
        AControl := TcxTextEdit.Create(AOwner);
        TcxTextEdit(AControl).Properties.MaxLength := 450;
      end;
    tpInteger:
      begin
        AControl := TcxCurrencyEdit.Create(AOwner);
        with TcxCurrencyEdit(AControl).Properties do
        begin
          AssignedValues.DisplayFormat := True;
          AssignedValues.EditFormat := True;
          DisplayFormat := '0';
        end;
      end;
    tpData:
      begin
        AControl := TcxDateEdit.Create(AOwner);
      end;
    tpCombobox:
      begin
        AControl := TcxComboBox.Create(AOwner);
        // TcxDBCheckBox(Fcontrol).OnExit := ControlChange;
      end;
  end;
  // if Pos('@', ALayoutItem.Nome) > 0 then
  // TControl(AControl).Name := Copy(ALayoutItem.Nome, 2, length(ALayoutItem.Nome))
  // else
  // TControl(AControl).Name := ALayoutItem.Nome;
  //
  // ctx := TRttiContext.Create;
  // t := ctx.GetType(AControl.ClassType);
  // try
  // { Limpando texto }
  // prop := t.GetProperty('Text');
  // prop.SetValue(AControl, '');
  //
  // if ALayoutItem.Padrao <> '' then
  // BEGIN
  // prop := t.GetProperty('Text');
  // prop.SetValue(AControl, ALayoutItem.Padrao);
  // END;
  //
  // if ALayoutItem.Nome = 'DICIONARIO' then
  // BEGIN
  // prop := t.GetProperty('Text');
  // prop.SetValue(AControl, IntToStr(ALayoutItem.Dicionario));
  // END;
  //
  // { Setando o texthint }
  // prop := t.GetProperty('TextHint');
  // prop.SetValue(AControl, ALayoutItem.Descricao);
  //
  // { Setando a Tag se for obrigatorio }
  // TControl(AControl).Tag := 0;
  // if ALayoutItem.Obrigatorio then
  // TControl(AControl).Tag := 1;
  // finally
  // prop.Free;
  // t.Free;
  // ctx.Free;
  // end;

end;

procedure TFrmDefaultPopup.FormShow(Sender: TObject);
begin
  MakeForm;
end;

procedure TFrmDefaultPopup.MakeForm;
var
  I: Integer;
  loFormSize: Integer;
begin
  gGroup := LayoutControl.CreateGroup;
  gGroup.Parent := TdxLayoutGroup(Root);
  gGroup.CaptionOptions.Text := gTitulo;
  for I := 0 to gInputs.Count - 1 do
  begin
    addLayoutItem(TPopupInputs(gInputs.Items[I]), TdxLayoutItem(gGroup));
  end;

  loFormSize := Self.Height + (20 * gInputs.Count - 1);
  Self.Height := loFormSize;
end;

function TFrmDefaultPopup.addLayoutItem(ALayoutItem: TPopupInputs; AParent: TdxLayoutItem): TdxLayoutItem;
begin
  Result := TdxLayoutItem(LayoutControl.CreateItem(TdxLayoutItem, TdxLayoutGroup(AParent)));
  CriarControle(ALayoutItem, TdxLayoutGroup(AParent), Fcontrol);
  with Result do
  begin
    Visible := True;
    Enabled := True;
    Control := TControl(Fcontrol);
    CaptionOptions.Text := ALayoutItem.Caption;
    CaptionOptions.AlignHorz := taRightJustify;
    Width := 350;
  end;
end;

end.
