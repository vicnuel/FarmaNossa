inherited FormSeachUsers: TFormSeachUsers
  Caption = 'Usu'#225'rios'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnGrid: TPanel
    inherited pnlTotal: TPanel
      inherited lbTotal: TLabel
        Height = 23
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = memTable
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
    Top = 200
  end
end
