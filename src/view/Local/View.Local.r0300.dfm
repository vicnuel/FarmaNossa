inherited FormSeachLocal: TFormSeachLocal
  Caption = 'Buscar local'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottom: TPanel
    inherited btnCreate: TBitBtn
      OnClick = btnCreateClick
    end
    inherited btnSelect: TBitBtn
      ExplicitTop = 10
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
    Left = 272
    Top = 192
  end
end
