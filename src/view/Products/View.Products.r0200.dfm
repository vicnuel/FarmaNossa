inherited FormSeachProduct: TFormSeachProduct
  Caption = 'Buscar produto'
  OnCreate = FormCreate
  ExplicitWidth = 800
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottom: TPanel
    inherited btnCreate: TBitBtn
      OnClick = btnCreateClick
    end
  end
  inherited pnGrid: TPanel
    inherited pnlTotal: TPanel
      inherited lbTotal: TLabel
        Height = 23
      end
    end
  end
  object memTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 312
    Top = 208
  end
end
