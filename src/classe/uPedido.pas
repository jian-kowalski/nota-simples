unit uPedido;

interface

uses
  System.Generics.Collections, uItem, uListaDeItem;

type
  TPedido = class
  private
    FNome: string;
    FPedido: Integer;
    FoListaDeItens: TListaItens;
    function GetItens: TListaItens;
    procedure SetItens(const Value: TListaItens);
    function GetNome: string;
    function GetPedido: Integer;
    procedure SetNome(const Value: string);
    procedure SetPedido(const Value: Integer);
  public
   property  Itens: TListaItens read GetItens write SetItens;
   property  Nome: string read GetNome write SetNome;
   property  Pedido: Integer read GetPedido write SetPedido;
   function CalcularValorTotalPedido: Extended;
   function ToString: string; override;
   constructor  Create;
   destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TPedido }

function TPedido.CalcularValorTotalPedido: Extended;
begin
  Result := FoListaDeItens.ValorTotal;
end;

constructor TPedido.Create;
begin
  FoListaDeItens := TListaItens.Create;
end;

destructor TPedido.Destroy;
begin
  FoListaDeItens.Free;
  inherited;
end;

function TPedido.GetItens: TListaItens;
begin
  Result := FoListaDeItens;
end;

function TPedido.GetNome: string;
begin
  Result := FNome;
end;

function TPedido.GetPedido: Integer;
begin
  Result := FPedido;
end;

procedure TPedido.SetItens(const Value: TListaItens);
begin
  FoListaDeItens := Value;
end;

procedure TPedido.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPedido.SetPedido(const Value: Integer);
begin
  FPedido := Value;
end;

function TPedido.ToString: string;
begin
 Result := 'N�mero do Pedido: ' + FPedido.ToString + sLineBreak
          + 'Nome do Cliente: ' + FNome + sLineBreak
          + FoListaDeItens.ToString;
end;

end.
