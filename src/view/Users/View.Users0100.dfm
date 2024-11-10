inherited FormSeachUsers: TFormSeachUsers
  Caption = 'Usu'#225'rios'
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
  inherited DataSource1: TDataSource
    DataSet = memTable
  end
  object memTable: TFDMemTable [4]
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
  inherited PopupMenu1: TPopupMenu
    Left = 432
  end
end
