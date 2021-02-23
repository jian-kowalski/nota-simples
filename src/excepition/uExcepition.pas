unit uExcepition;

interface

uses
  System.SysUtils;

type
  ENomeObrigatorio= class(Exception)
  public
    constructor Create; reintroduce;
  end;

  EEnderecoObrigatorio= class(Exception)
  public
    constructor Create; reintroduce;
  end;

  ENumeroNFObrigatorio= class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ ENumeroNFObrigatorio }

constructor ENumeroNFObrigatorio.Create;
begin
  self.Message := 'N�mero da NF � obrigat�rio ';
end;

{ ENomeObrigatorio }

constructor ENomeObrigatorio.Create;
begin
  self.Message := 'Nome � obrigat�rio no cadastro da nota.';
end;

{ EEnderecoObrigatorio }

constructor EEnderecoObrigatorio.Create;
begin
  self.Message := 'Endere�o � obrigat�rio ';
end;

end.
