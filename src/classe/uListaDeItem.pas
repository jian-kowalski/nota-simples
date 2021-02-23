unit uListaDeItem;

interface

uses
  System.Generics.Collections, uItem;

type
  TListaItens = class
  private
    FCodItem: Integer;
    FoListaDeItens: TList<TItem>;
    FnPosicaoDaLista: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function Adicionar(AoItem: TItem): TItem;
    procedure Remover;
    function AvancarItem: TItem;
    function VoltarItem: TItem;
    function ValorTotal: Extended;
    function ToString(): String; override;
  end;

implementation

uses
  Vcl.Dialogs;

{ TListaItens }

function TListaItens.Adicionar(AoItem: TItem): TItem;
begin
  Inc(FCodItem);
  AoItem.Cod := FCodItem;
  FoListaDeItens.Add(AoItem);
  FnPosicaoDaLista := FoListaDeItens.Count-1;
  Result := AoItem;
end;

function TListaItens.AvancarItem: TItem;
begin
  Inc(FnPosicaoDaLista);
  if FnPosicaoDaLista < FoListaDeItens.Count then
    Result := FoListaDeItens[FnPosicaoDaLista]
  else
    begin
    Dec(FnPosicaoDaLista);
    ShowMessage('Item n�o encontrado');
    Result := FoListaDeItens[FnPosicaoDaLista];
  end;
end;

constructor TListaItens.Create;
begin
  FoListaDeItens   := TList<TItem>.Create;
  FnPosicaoDaLista := 0;
  FCodItem         := 0;
end;

destructor TListaItens.Destroy;
begin
  FoListaDeItens.Free;
  inherited;
end;

procedure TListaItens.Remover;
begin
  FoListaDeItens.Delete(FnPosicaoDaLista);
end;

function TListaItens.ToString: String;
var
  oItem: TItem;
begin
  Result := Result + 'Itens: ' + sLineBreak;
  for oItem in FoListaDeItens do
    Result := Result + oItem.ToString + sLineBreak;
end;

function TListaItens.ValorTotal: Extended;
var
  oItem: TItem;
begin
  Result := 0;
  for oItem in FoListaDeItens do
    Result := Result + oItem.ValorTotal;
end;

function TListaItens.VoltarItem: TItem;
begin
  if FnPosicaoDaLista-1 >= 0 then
    Dec(FnPosicaoDaLista);

  if FnPosicaoDaLista < FoListaDeItens.Count then
    Result := FoListaDeItens[FnPosicaoDaLista]
  else
    begin
    Inc(FnPosicaoDaLista);
    ShowMessage('Item n�o encontrado');
    Result := TItem.Create;
  end;
end;

end.
