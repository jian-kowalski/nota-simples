object FrmPedido: TFrmPedido
  Left = 0
  Top = 0
  Caption = 'Pedido'
  ClientHeight = 327
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pgControl: TPageControl
    Left = 0
    Top = 0
    Width = 840
    Height = 327
    ActivePage = tbItens
    Align = alClient
    TabOrder = 0
    object tbNota: TTabSheet
      Caption = 'Pedido'
      object lbNome: TLabel
        Left = 8
        Top = 59
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object lbNumero: TLabel
        Left = 8
        Top = 32
        Width = 32
        Height = 13
        Caption = 'Pedido'
      end
      object btInlcuir: TButton
        Left = 59
        Top = 100
        Width = 75
        Height = 25
        Caption = 'Incluir'
        TabOrder = 2
        OnClick = btInlcuirClick
      end
      object eb_nome: TEdit
        Left = 59
        Top = 51
        Width = 297
        Height = 21
        TabOrder = 1
      end
      object eb_pedido: TEdit
        Left = 59
        Top = 24
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
    end
    object tbItens: TTabSheet
      Caption = 'Itens'
      ImageIndex = 1
      object lbDesc: TLabel
        Left = 346
        Top = 24
        Width = 27
        Height = 13
        Caption = 'Desc.'
      end
      object lbQuantidade: TLabel
        Left = 3
        Top = 67
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object lbValorUnitario: TLabel
        Left = 203
        Top = 67
        Width = 44
        Height = 13
        Caption = 'Val. Unit.'
      end
      object Label2: TLabel
        Left = 3
        Top = 24
        Width = 19
        Height = 13
        Caption = 'C'#243'd'
      end
      object lbValorTotal: TLabel
        Left = 504
        Top = 264
        Width = 55
        Height = 13
        Caption = 'Valor Total:'
      end
      object mmResposta: TMemo
        Left = 19
        Top = 108
        Width = 689
        Height = 116
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object eb_descricao: TEdit
        Left = 408
        Top = 16
        Width = 308
        Height = 21
        TabOrder = 0
      end
      object eb_quantidade: TEdit
        Left = 65
        Top = 59
        Width = 132
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
      object eb_valorUnitario: TEdit
        Left = 260
        Top = 59
        Width = 132
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
      object btAddItem: TButton
        Left = 560
        Top = 55
        Width = 75
        Height = 25
        Caption = 'Add Item'
        TabOrder = 3
        OnClick = btAddItemClick
      end
      object btVoltar: TButton
        Left = 398
        Top = 55
        Width = 75
        Height = 25
        Caption = '<<'
        TabOrder = 5
        OnClick = btVoltarClick
      end
      object btAvancar: TButton
        Left = 479
        Top = 55
        Width = 75
        Height = 25
        Caption = '>>'
        TabOrder = 6
        OnClick = btAvancarClick
      end
      object btRemover: TButton
        Left = 641
        Top = 55
        Width = 75
        Height = 25
        Caption = 'Remover'
        TabOrder = 7
        OnClick = btRemoverClick
      end
      object eb_codigo: TEdit
        Left = 65
        Top = 16
        Width = 132
        Height = 21
        NumbersOnly = True
        TabOrder = 8
      end
      object eb_valorTotal: TEdit
        Left = 578
        Top = 256
        Width = 132
        Height = 21
        TabStop = False
        Enabled = False
        NumbersOnly = True
        TabOrder = 9
      end
    end
  end
end
