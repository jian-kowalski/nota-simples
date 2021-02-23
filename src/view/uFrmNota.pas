unit uFrmNota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uNotaFiscal, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Tabs, Vcl.DockTabSet, uItem;

type
  TFrmNota = class(TForm)
    pgControl: TPageControl;
    tbNota: TTabSheet;
    lbEndereco: TLabel;
    lbNome: TLabel;
    lbNumero: TLabel;
    btInlcuir: TButton;
    eb_endereco: TEdit;
    eb_nome: TEdit;
    eb_numero: TEdit;
    tbItens: TTabSheet;
    mmResposta: TMemo;
    lbDesc: TLabel;
    eb_descricao: TEdit;
    lbQuantidade: TLabel;
    eb_quantidade: TEdit;
    lbValorUnitario: TLabel;
    eb_valorUnitario: TEdit;
    btAddItem: TButton;
    btVoltar: TButton;
    btAvancar: TButton;
    btRemover: TButton;
    eb_codigo: TEdit;
    Label2: TLabel;
    eb_valorTotal: TEdit;
    lbValorTotal: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btInlcuirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAddItemClick(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure btAvancarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
  private
    { Private declarations }
    FoNota: TNotaFiscal;
    procedure IncluirNota;
    procedure AdicionarItem;
    procedure ExibirNota;
    procedure VoltarItem;
    procedure DoObjetoParaTela(AoItem: TItem);
    procedure AvancarItem;
    procedure RemoverItem;
  public
    { Public declarations }
  end;

var
  FrmNota: TFrmNota;

implementation

{$R *.dfm}

procedure TFrmNota.btInlcuirClick(Sender: TObject);
begin
  IncluirNota;
  pgControl.TabIndex := tbItens.TabIndex;
end;

procedure TFrmNota.btRemoverClick(Sender: TObject);
begin
  RemoverItem;
end;

procedure TFrmNota.btVoltarClick(Sender: TObject);
begin
  VoltarItem;
end;

procedure TFrmNota.ExibirNota;
begin
  mmResposta.Lines.Clear;
  mmResposta.Lines.Add(FoNota.ToString);
  eb_valorTotal.Text := FloatToStr(FoNota.CalcularValorTotalNota);
end;

procedure TFrmNota.btAddItemClick(Sender: TObject);
begin
  AdicionarItem;
end;

procedure TFrmNota.btAvancarClick(Sender: TObject);
begin
  AvancarItem;
end;

procedure TFrmNota.FormCreate(Sender: TObject);
begin
  FoNota := TNotaFiscal.Create;
end;

procedure TFrmNota.FormDestroy(Sender: TObject);
begin
  FoNota.Free;
end;

procedure TFrmNota.IncluirNota;
begin
  FoNota.Nome     := eb_nome.Text;
  FoNota.Endereco := eb_endereco.Text;
  FoNota.NumeroNf := StrToInt(eb_numero.Text);
end;

procedure TFrmNota.RemoverItem;
begin
  FoNota.Itens.Remover;
  VoltarItem;
end;

procedure TFrmNota.AvancarItem;
var
  oItem: TItem;
begin
  oItem := FoNota.Itens.AvancarItem;
  DoObjetoParaTela(oItem);
end;

procedure TFrmNota.VoltarItem;
var
  oItem: TItem;
begin
  oItem := FoNota.Itens.VoltarItem;
  DoObjetoParaTela(oItem);
end;

procedure TFrmNota.DoObjetoParaTela(AoItem: TItem);
begin
  eb_codigo.Text        := AoItem.Cod.ToString;
  eb_descricao.Text     := AoItem.Descricao;
  eb_valorUnitario.Text := AoItem.ValorUnitario.ToString;
  eb_quantidade.Text    := AoItem.Quantidade.ToString;
  ExibirNota;
end;

procedure TFrmNota.AdicionarItem;
var
  oItem: TItem;
begin
  oItem               := TItem.Create;
  oItem.Descricao     := eb_descricao.Text;
  oItem.ValorUnitario := StrToFloat(eb_valorUnitario.Text);
  oItem.Quantidade    := StrToFloat(eb_quantidade.Text);
  DoObjetoParaTela(FoNota.Itens.Adicionar(oItem));
  ExibirNota;
end;

end.
