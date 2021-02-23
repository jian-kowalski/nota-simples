unit uNotaFiscal;

interface

uses
  uItem, System.Generics.Collections, uListaDeItem;

type
  TNotaFiscal = class(TObject)
  private
    FNome: String;
    FEndereco: String;
    FNumeroNf: Integer;
    FoListaDeItens: TListaItens;
    function GetEndereco: String;
    function GetNome: String;
    function GetNumeroNf: Integer;
    procedure SetEndereco(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetNumeroNf(const Value: Integer);
    function GetItem: TListaItens;
    procedure SetItem(const Value: TListaItens);
  public
    property Nome: String read GetNome write SetNome;
    property Endereco: String read GetEndereco write SetEndereco;
    property NumeroNf: Integer read GetNumeroNf write SetNumeroNf;

    property Itens: TListaItens read GetItem write SetItem;
    function CalcularValorTotalNota: Extended;
    function ToString: String; override;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils, uExcepition, Vcl.Dialogs;

{ TNotaFiscal }

function TNotaFiscal.CalcularValorTotalNota: Extended;
begin
  Result := FoListaDeItens.ValorTotal;
end;

constructor TNotaFiscal.Create;
begin
  FoListaDeItens := TListaItens.Create;
end;

destructor TNotaFiscal.Destroy;
begin
  FoListaDeItens.Free;
end;

function TNotaFiscal.GetEndereco: String;
begin
  Result := FEndereco;
end;

function TNotaFiscal.GetItem: TListaItens;
begin
  Result := FoListaDeItens;
end;

function TNotaFiscal.GetNome: String;
begin
  Result := FNome;
end;

function TNotaFiscal.GetNumeroNf: Integer;
begin
  Result := FNumeroNf;
end;

procedure TNotaFiscal.SetEndereco(const Value: String);
begin
  if Value = EmptyStr then
    raise EEnderecoObrigatorio.Create;
  FEndereco := Value;
end;

procedure TNotaFiscal.SetItem(const Value: TListaItens);
begin
  FoListaDeItens := Value;
end;

procedure TNotaFiscal.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise ENomeObrigatorio.Create;
  FNome := Value;
end;

procedure TNotaFiscal.SetNumeroNf(const Value: Integer);
begin
  if Value <= 0 then
    raise ENumeroNFObrigatorio.Create;
  FNumeroNf := Value;
end;

function TNotaFiscal.ToString: String;
begin
  Result := 'N�mero da nota: ' + FNumeroNf.ToString + sLineBreak
          + 'Nome do Cliente: ' + FNome + sLineBreak
          + 'Endere�o do Cliente: ' + FEndereco + sLineBreak
          + FoListaDeItens.ToString;
end;

end.
