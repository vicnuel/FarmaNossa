inherited ViewInputSearch: TViewInputSearch
  Caption = 'Entradas'
  ExplicitWidth = 790
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottom: TPanel
    inherited btnSelect: TBitBtn
      Enabled = False
    end
  end
  inherited pnGrid: TPanel
    inherited DBGrid1: TDBGrid
      OnDrawColumnCell = nil
    end
    inherited pnlTotal: TPanel
      inherited lbTotal: TLabel
        Height = 23
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    inherited CreateUser: TMenuItem
      OnClick = CreateUserClick
    end
  end
end
