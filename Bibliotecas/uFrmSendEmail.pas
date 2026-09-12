unit uFrmSendEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinCaramel, dxSkinDevExpressStyle, 
  cxContainer, cxEdit, dxGDIPlusClasses, cxImage, StdCtrls, dxActivityIndicator,
  dxSkinDevExpressDarkStyle, ACBrBase, ACBrMail, dxSkinBlue, dxSkinOffice2010Silver, dxSkinWhiteprint;

type
  TFrmSendEmail = class(TForm)
    dxActivityIndicator2: TdxActivityIndicator;
    lblMessage: TLabel;
    img1: TcxImage;
    ACBrMail1: TACBrMail;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail; const aStatus: TMailStatus);
  private
    FCompactaArquivo: Boolean;
    FListaAquivos: TStringList;
    FNomeArquivo: string;
    FDiretorioDestino: string;
    FListaEmails: TStringList;
    FAssuntoEmail: String;
    FTextoEmail: string;
    {Private declarations}
  public
    {Public declarations}
    function Compactar(AArquivos: TStringList): Boolean;
    procedure Enviar;
    procedure LoadParamEmail;
    procedure LoadParamEmailNFe;
    property DiretorioDestino: string read FDiretorioDestino write FDiretorioDestino;
    property NomeArquivo: string read FNomeArquivo write FNomeArquivo;
    property CompactaArquivo: Boolean read FCompactaArquivo write FCompactaArquivo;
    property ListaAquivos: TStringList read FListaAquivos write FListaAquivos;
    property ListaEmails: TStringList read FListaEmails write FListaEmails;
    property AssuntoEmail: String read FAssuntoEmail write FAssuntoEmail;
    property TextoEmail: string read FTextoEmail write FTextoEmail;
  end;

var
  FrmSendEmail: TFrmSendEmail;

implementation

uses cabfiles, FireDAC.Comp.Client;
{$R *.dfm}
{TFrmSendEmail}

procedure TFrmSendEmail.ACBrMail1MailProcess(const AMail: TACBrMail; const aStatus: TMailStatus);
begin
  case aStatus of
    pmsStartProcess:
      lblMessage.Caption := 'Iniciando processo de envio.';
    pmsConfigHeaders:
      lblMessage.Caption := 'Configurando o cabeçalho do e-mail.';
    pmsLoginSMTP:
      lblMessage.Caption := 'Logando no servidor de e-mail.';
    pmsStartSends:
      lblMessage.Caption := 'Iniciando os envios.';
    pmsSendTo:
      lblMessage.Caption := 'Processando lista de destinatários.';
    pmsSendCC:
      lblMessage.Caption := 'Processando lista CC.';
    pmsSendBCC:
      lblMessage.Caption := 'Processando lista BCC.';
    pmsSendReplyTo:
      lblMessage.Caption := 'Processando lista ReplyTo.';
    pmsSendData:
      lblMessage.Caption := 'Enviando dados.';
    pmsLogoutSMTP:
      lblMessage.Caption := 'Fazendo Logout no servidor de e-mail.';
    pmsDone:
      begin
        lblMessage.Caption := 'Terminando e limpando.';
        Self.Close;
      end;

  end;
  Application.ProcessMessages;
end;

function TFrmSendEmail.Compactar(AArquivos: TStringList): Boolean;
var
  I: Integer;
  CABFile1: TCABFile;
begin
  result := false;
  CABFile1 := TCABFile.Create(Self);
  try
    with CABFile1 do
    begin
      CABFileContents.Clear;
      CompressionType := typMSZIP;
      LZXMemory := lzxLowest;
    end;

    // lblMessage.Caption := 'compactando arquivos...!';
    for I := 0 to AArquivos.Count - 1 do
    begin
      CABFile1.CABFileContents.Add.Name := AArquivos.Strings[I];
    end;
    if CABFile1.CABFileContents.Count > 0 then
      CABFile1.CABFile := DiretorioDestino + NomeArquivo;

    if CABFile1.Compress then
    begin
      lblMessage.Caption := 'compactado com sucesso!';
      result := True;
    end;
  finally
    CABFile1.Destroy;
  end;
end;

procedure TFrmSendEmail.Enviar;
begin
  //
end;

procedure TFrmSendEmail.FormCreate(Sender: TObject);
begin
  ListaEmails := TStringList.Create;
end;

procedure TFrmSendEmail.FormShow(Sender: TObject);
begin
  LoadParamEmail;
  Compactar(ListaAquivos);
  ACBrMail1.Send(True);
end;

procedure TFrmSendEmail.LoadParamEmail;
var
  loSQL: TFDQuery;
  I: Integer;
begin
  lblMessage.Caption := 'Carregando configurações...';
  loSQL := TFDQuery.Create(Self);
  loSQL.ConnectionName := 'SimERPConn';
  loSQL.Open('SELECT * FROM dbo.fiscal_email_config WHERE femp_edi =1');
  try
    if loSQL.RecordCount > 0 then
    begin
      {carregando dados de configuração do email}
      ACBrMail1.Subject := AssuntoEmail;
      ACBrMail1.AltBody.Add(TextoEmail);
      ACBrMail1.From := loSQL.FieldByName('femp_email').Value; // 'fulano@empresa.com.br';
      ACBrMail1.FromName := loSQL.FieldByName('femp_name').Value;
      ACBrMail1.Host := loSQL.FieldByName('femp_smtp_server').Value; // 'smtp.empresa.com.br'; // troque pelo seu servidor smtp
      ACBrMail1.Username := loSQL.FieldByName('femp_username').Value; // 'fulano@empresa.com.br';
      ACBrMail1.Password := loSQL.FieldByName('femp_password').Value;
      ACBrMail1.Port := loSQL.FieldByName('femp_smtp_port').Value; // troque pela porta do seu servidor smtp
      ACBrMail1.SetTLS := (loSQL.FieldByName('femp_ssl').Value > 0); // Verifique se o seu servidor necessita SSL

      {carregando email para envio}
      for I := 0 to ListaEmails.Count - 1 do
      begin
        ACBrMail1.AddAddress(ListaEmails.Strings[I], '');
      end;
      ACBrMail1.AddCC('suporte@wibitecnologia.com.br'); // opcional
      ACBrMail1.ReadingConfirmation := True; // solicita confirmação de leitura

      {Atachando arquivos}
      ACBrMail1.AddAttachment(DiretorioDestino + NomeArquivo, NomeArquivo);

      // ACBrMail1.AddReplyTo('um_email'); // opcional
      // ACBrMail1.AddBCC('um_email'); // opcional
      // ACBrMail1.Priority := MP_high;
    end;

  finally
    loSQL.Free;
  end;

end;

procedure TFrmSendEmail.LoadParamEmailNFe;
var
  loSQL: TFDQuery;
  I: Integer;
begin
  lblMessage.Caption := 'Carregando configurações...';
  loSQL := TFDQuery.Create(Self);
  loSQL.ConnectionName := 'SimERPConn';
  loSQL.Open('SELECT * FROM dbo.fiscal_email_config WHERE femp_nfe = 1');
  try
    if loSQL.RecordCount > 0 then
    begin
      {carregando dados de configuração do email}
      ACBrMail1.Subject := AssuntoEmail;
      ACBrMail1.AltBody.Add(TextoEmail);
      ACBrMail1.From := loSQL.FieldByName('femp_email').Value; // 'fulano@empresa.com.br';
      ACBrMail1.FromName := loSQL.FieldByName('femp_name').Value;
      ACBrMail1.Host := loSQL.FieldByName('femp_smtp_server').Value; // 'smtp.empresa.com.br'; // troque pelo seu servidor smtp
      ACBrMail1.Username := loSQL.FieldByName('femp_username').Value; // 'fulano@empresa.com.br';
      ACBrMail1.Password := loSQL.FieldByName('femp_password').Value;
      ACBrMail1.Port := loSQL.FieldByName('femp_smtp_port').Value; // troque pela porta do seu servidor smtp
      ACBrMail1.SetTLS := (loSQL.FieldByName('femp_ssl').Value > 0); // Verifique se o seu servidor necessita SSL

      {carregando email para envio}
      for I := 0 to ListaEmails.Count - 1 do
      begin
        ACBrMail1.AddAddress(ListaEmails.Strings[I], '');
      end;
      // ACBrMail1.AddCC('suporte@wibitecnologia.com.br'); // opcional
      ACBrMail1.ReadingConfirmation := false; // solicita confirmação de leitura

      {Atachando arquivos}
      ACBrMail1.AddAttachment(DiretorioDestino + NomeArquivo, NomeArquivo);

      // ACBrMail1.AddReplyTo('um_email'); // opcional
      // ACBrMail1.AddBCC('um_email'); // opcional
      // ACBrMail1.Priority := MP_high;
    end;

  finally
    loSQL.Free;
  end;

end;

end.
