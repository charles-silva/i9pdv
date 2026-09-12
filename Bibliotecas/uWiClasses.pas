unit uWiClasses;

interface

type
  TVenda = class
  private
    FId: Integer;

  public
    property Id: Integer read FId write FId;
  end;

  TCliente = class
  private
    FId      : Integer;
    FNome    : String;
    FCNPJCPF : string;
    FEndereco: string;
  public
    property Id      : Integer read FId write FId;
    property Nome    : String read FNome write FNome;
    property CNPJCPF : string read FCNPJCPF write FCNPJCPF;
    property Endereco: string read FEndereco write FEndereco;
  end;

  TProduto = class
  private
    FId       : Integer;
    FDescricao: String;
    FPreco    : Real;
    FCusto    : Real;
    FSigla    : String;
    FEAN      : String;
  public
    property Id       : Integer read FId write FId;
    property Descricao: String read FDescricao write FDescricao;
    property EAN      : String read FEAN write FEAN;
    property Sigla    : String read FSigla write FSigla;
    property Preco    : Real read FPreco write FPreco;
    property Custo    : Real read FCusto write FCusto;
  end;

implementation

end.
