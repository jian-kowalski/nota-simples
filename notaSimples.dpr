program notaSimples;

uses
  Vcl.Forms,
  uFrmNota in 'src\view\uFrmNota.pas' {FrmNota},
  uNotaFiscal in 'src\classe\uNotaFiscal.pas',
  uExcepition in 'src\excepition\uExcepition.pas',
  uItem in 'src\classe\uItem.pas',
  uPedido in 'src\classe\uPedido.pas',
  uFrmPedido in 'src\view\uFrmPedido.pas' {FrmPedido},
  uFrmPrincipal in 'src\view\uFrmPrincipal.pas' {FrmPrincipal},
  uListaDeItem in 'src\classe\uListaDeItem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
