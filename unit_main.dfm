object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Farma Nossa'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 16
    Top = 8
    object N0Cadastros1: TMenuItem
      Caption = '0-Cadastros'
      object N0100CadastrodeOperadores1: TMenuItem
        Caption = '0100 - Cadastro de Operadores'
        OnClick = N0100CadastrodeOperadores1Click
      end
      object N0200CadastrodeProdutos1: TMenuItem
        Caption = '0200 - Cadastro de Produtos'
      end
      object N0300CadastrodeLocais1: TMenuItem
        Caption = '0300 - Cadastro de Locais'
      end
    end
    object N1ControledeEstoque1: TMenuItem
      Caption = '1-Controle de Estoque'
      object N1000EntradadeMercadorias1: TMenuItem
        Caption = '1000 - Entrada de Mercadorias'
      end
      object N1100SadasdeMercadorias1: TMenuItem
        Caption = '1100 - Sa'#237'das de Mercadorias'
      end
      object N1200ConsultarEstoque1: TMenuItem
        Caption = '1200 - Consultar Estoque'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object RELRelatriodeEstoque1: TMenuItem
        Caption = 'REL - Relat'#243'rio de Estoque'
      end
    end
  end
end
