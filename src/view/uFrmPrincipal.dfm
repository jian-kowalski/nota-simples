object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Nossa Sistema'
  ClientHeight = 193
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btAbrirNota: TButton
    Left = 72
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Nota'
    TabOrder = 0
    OnClick = btAbrirNotaClick
  end
  object btAbrirPedido: TButton
    Left = 264
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Pedido'
    TabOrder = 1
    OnClick = btAbrirPedidoClick
  end
end
