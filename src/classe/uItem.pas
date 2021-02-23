unit uItem;

interface

type
  TItem = class(TObject)
  private
    FCod: Integer;
    FDescricao: String;
    FValorUnitario: Extended;
    FQuantidade: Double;
    function GetDescricao: String;
    function GetQuantidade: Double;
    function GetValorUnitario: Extended;
    procedure SetDescricao(const Value: String);
    procedure SetQuantidade(const Value: Double);
    procedure SetValorUnitario(const Value: Extended);
    function GetCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
  public
    property Cod: Integer read GetCodigo write SetCodigo;
    property Descricao: String read GetDescricao write SetDescricao;
    property ValorUnitario: Extended read GetValorUnitario write SetValorUnitario;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    function ToString: String; override;
    function ValorTotal: Double;
  end;

implementation

uses
  System.SysUtils;

{ TItem }

function TItem.GetCodigo: Integer;
begin
  Result := FCod;
end;

function TItem.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TItem.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

function TItem.GetValorUnitario: Extended;
begin
  Result := FValorUnitario;
end;

procedure TItem.SetCodigo(const Value: Integer);
begin
  FCod := Value;
end;

procedure TItem.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TItem.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TItem.SetValorUnitario(const Value: Extended);
begin
  FValorUnitario := Value;
end;

function TItem.ToString: String;
begin
  Result :=   'C�d: ' + FCod.ToString
            + '| Descricao: ' + FDescricao
            + '| Valor Unitario: ' + FValorUnitario.ToString
            + '| Quantidade: ' + FQuantidade.ToString
            + '| Total: ' + ValorTotal.ToString + ' R$';
end;

function TItem.ValorTotal: Double;
begin
  Result := FValorUnitario * FQuantidade;
end;

end.
