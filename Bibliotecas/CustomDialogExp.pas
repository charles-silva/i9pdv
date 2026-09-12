unit CustomDialogExp;

interface

uses
  Classes, Forms;

implementation

uses
  SysUtils, Dialogs, TaskDialogEx, TaskDialog, madExceptVcl, madExcept, uGlobalLibWiBi;

type
  tpExcept = (tpErro, tpErroChave);

const
  ErroTxt = 'Ocorreu um erro neste procedimento.';
  ErroChave = 'Registro não pode ser excluido, existe depência em outro(s) cadastro(s).';

  // procedure madExceptTraduzir(exceptIntf: IMEException);
  // begin
  // with IMESettings do
  // begin
  //
  // end;
  // end;

procedure MyHandler(const exceptIntf: IMEException; var handled: boolean);
var
  Dialog: TAdvTaskDialogEx;
  TipoExpt: tpExcept;
  X, I: Integer;
  Lresiduo: string;
begin
  handled := true;

  for I := 1 to Length(exceptIntf.ExceptMessage) do
  begin
    Lresiduo := GetFieldInString(exceptIntf.ExceptMessage, I, ']', '[', X);
    if Lresiduo = 'null' then
      break;
  end;
  exceptIntf.ExceptMessage := StringReplace(exceptIntf.ExceptMessage, Copy(exceptIntf.ExceptMessage, 1, X), '', [rfReplaceAll]);

  {Dados padrão da mensagem}
  Dialog := TAdvTaskDialogEx.Create(nil);
  Dialog.Title := 'I9 Mobile';
  exceptIntf.ShowSetting := ssNothing;
  Dialog.Options := [TaskDialog.doHyperlinks];
  Dialog.Footer := 'Desenvolvido por: <A href="www.I9Mobile.com.br">I9 Mobile</A>';
  Dialog.FooterIcon := TaskDialog.tfiInformation;

  try
    TipoExpt := tpErro;

    {Conteudo para chave estrangeira em caso de DELETE}
    if Pos('The DELETE statement conflicted with the REFERENCE', exceptIntf.ExceptMessage) > 0 then
      TipoExpt := tpErroChave;

    case TipoExpt of
      tpErro:
        begin
          Dialog.Options := Dialog.Options + [doExpandedDefault];
          Dialog.CommonButtons := [];
          Dialog.ModalParent := Screen.ActiveForm.Handle;
          if exceptIntf.ExceptClass = 'EWiBiInfoException' then
          begin
            Dialog.Instruction := 'Informação';
            Dialog.Icon := TaskDialog.tiInformation;
            Dialog.Content := exceptIntf.ExceptMessage;
            Dialog.CustomButtons.Clear;
            Dialog.CustomButtons.Add('OK');
            Dialog.Execute;
            Screen.ActiveForm.SetFocus;
          end
          else
          begin
            Dialog.Instruction := 'Atenção';
            Dialog.Icon := TaskDialog.tiWarning;
            Dialog.Content := ErroTxt;
            Dialog.ExpandedText := 'Mensagem do erro: ' + sLineBreak + '-> ' + exceptIntf.ExceptMessage;
            Dialog.CustomButtons.Clear;
            Dialog.CustomButtons.Add('Enviar ao suporte');
            Dialog.CustomButtons.Add('OK');
            if Dialog.Execute = 100 then
            begin
              exceptIntf.SendBugReport(0);
              Screen.ActiveForm.SetFocus;
            end;
          end;
        end;

      tpErroChave:
        begin
          Dialog.ModalParent := Screen.ActiveForm.Handle;
          Dialog.Content := ErroChave;
          Dialog.ExpandedText := 'Restrito pela chave:' + sLineBreak + exceptIntf.ExceptMessage;
          Dialog.Instruction := 'Ação não permitida!';
          Dialog.CustomButtons.Clear;
          Dialog.CustomButtons.Add('OK');
          Dialog.Execute;
          Screen.ActiveForm.SetFocus;
        end;
    end;

  finally
    Dialog.Free;
  end;
end;

begin
  RegisterExceptionHandler(MyHandler, stTrySyncCallOnSuccess);

end.
