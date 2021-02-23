unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uPedido,
  uItem;

type
  TFrmPedido = class(TForm)
    pgControl: TPageControl;
    tbNota: TTabSheet;
    lbNome: TLabel;
    lbNumero: TLabel;
    btInlcuir: TButton;
    eb_nome: TEdit;
    eb_pedido: TEdit;
    tbItens: TTabSheet;
    lbDesc: TLabel;
    lbQuantidade: TLabel;
    lbValorUnitario: TLabel;
    Label2: TLabel;
    lbValorTotal: TLabel;
    mmResposta: TMemo;
    eb_descricao: TEdit;
    eb_quantidade: TEdit;
    eb_valorUnitario: TEdit;
    btAddItem: TButton;
    btVoltar: TButton;
    btAvancar: TButton;
    btRemover: TButton;
    eb_codigo: TEdit;
    eb_valorTotal: TEdit;
    procedure btInlcuirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure btAvancarClick(Sender: TObject);
    procedure btAddItemClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
  private
    { Private declarations }
    FoPedido: TPedido;
    procedure IncluirPedido;
    procedure VoltarItem;
    procedure AvancarItem;
    procedure AdicionarItem;
    procedure RemoverItem;
    procedure ExibirPedido;
    procedure DoObjetoParaTela(AoItem: TItem);
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

{$R *.dfm}

procedure TFrmPedido.AdicionarItem;
var
  oItem: TItem;
begin
  oItem               := TItem.Create;
  oItem.Descricao     := eb_descricao.Text;
  oItem.ValorUnitario := StrToFloat(eb_valorUnitario.Text);
  oItem.Quantidade    := StrToFloat(eb_quantidade.Text);
  DoObjetoParaTela(FoPedido.Itens.Adicionar(oItem));
  ExibirPedido;
end;

procedure TFrmPedido.AvancarItem;
var
  oItem: TItem;
begin
  oItem := FoPedido.Itens.AvancarItem;
  DoObjetoParaTela(oItem);
end;

procedure TFrmPedido.btAddItemClick(Sender: TObject);
begin
  AdicionarItem;
end;

procedure TFrmPedido.btAvancarClick(Sender: TObject);
begin
  AvancarItem;
end;

procedure TFrmPedido.btInlcuirClick(Sender: TObject);
begin
  IncluirPedido;
  pgControl.TabIndex := tbItens.TabIndex;
end;

procedure TFrmPedido.btRemoverClick(Sender: TObject);
begin
  RemoverItem;
end;

procedure TFrmPedido.btVoltarClick(Sender: TObject);
begin
  VoltarItem;
end;

procedure TFrmPedido.ExibirPedido;
begin
  mmResposta.Lines.Clear;
  mmResposta.Lines.Add(FoPedido.ToString);
  eb_valorTotal.Text := FloatToStr(FoPedido.CalcularValorTotalPedido);
end;

procedure TFrmPedido.FormCreate(Sender: TObject);
begin
  FoPedido := TPedido.Create;
end;

procedure TFrmPedido.FormDestroy(Sender: TObject);
begin
  FoPedido.Free;
end;

procedure TFrmPedido.IncluirPedido;
begin
  FoPedido.Pedido := StrToIntDef(eb_pedido.Text,0);
  FoPedido.Nome   := eb_nome.Text;
end;

procedure TFrmPedido.RemoverItem;
begin
  FoPedido.Itens.Remover;
  VoltarItem;
end;

procedure TFrmPedido.VoltarItem;
var
  oItem: TItem;
begin
  oItem := FoPedido.Itens.VoltarItem;
  DoObjetoParaTela(oItem);
end;

procedure TFrmPedido.DoObjetoParaTela(AoItem: TItem);
begin
  eb_codigo.Text        := AoItem.Cod.ToString;
  eb_descricao.Text     := AoItem.Descricao;
  eb_valorUnitario.Text := AoItem.ValorUnitario.ToString;
  eb_quantidade.Text    := AoItem.Quantidade.ToString;
  ExibirPedido;
end;

end.
