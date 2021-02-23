unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    btAbrirNota: TButton;
    btAbrirPedido: TButton;
    procedure btAbrirNotaClick(Sender: TObject);
    procedure btAbrirPedidoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirNota;
    procedure AbrirPedido;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uFrmNota, uFrmPedido;

{$R *.dfm}

procedure TFrmPrincipal.AbrirNota;
var
  oFormularioNota: TFrmNota;
begin
  oFormularioNota := TFrmNota.Create(nil);
  try
    oFormularioNota.ShowModal;
  finally
    oFormularioNota.Free;
  end;
end;

procedure TFrmPrincipal.AbrirPedido;
var
  oFormularioPedido: TFrmPedido;
begin
  oFormularioPedido := TFrmPedido.Create(nil);
  try
    oFormularioPedido.ShowModal;
  finally
    oFormularioPedido.Free;
  end;
end;

procedure TFrmPrincipal.btAbrirNotaClick(Sender: TObject);
begin
  AbrirNota;
end;

procedure TFrmPrincipal.btAbrirPedidoClick(Sender: TObject);
begin
  AbrirPedido;
end;

end.
