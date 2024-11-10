inherited ViewReport: TViewReport
  Caption = 'Relat'#243'rios'
  ClientHeight = 471
  ClientWidth = 902
  ExplicitTop = -37
  ExplicitWidth = 918
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottom: TPanel
    Top = 415
    Width = 902
    ExplicitLeft = 1
    ExplicitTop = 385
    ExplicitWidth = 793
    object Label6: TLabel [0]
      Left = 15
      Top = 18
      Width = 64
      Height = 16
      Alignment = taCenter
      Caption = 'Relat'#243'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnClose: TBitBtn
      Left = 791
    end
    inherited btnCreate: TBitBtn
      Left = 488
      Visible = False
    end
    inherited btnSelect: TBitBtn
      Left = 690
      Visible = False
    end
    inherited btnUpdate: TBitBtn
      Left = 589
      Visible = False
      ExplicitTop = 10
    end
    object cbReport: TComboBox
      Left = 87
      Top = 14
      Width = 250
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      Text = '1. Ficha de estoque'
      OnChange = cbReportChange
      Items.Strings = (
        '1. Ficha de estoque'
        '2. Rela'#231#227'o de produtos'
        '3. Rela'#231#227'o de produtos por lote'
        '4. Produtos em estoque por Local')
    end
  end
  inherited pnGrid: TPanel
    Width = 902
    Height = 334
    inherited DBGrid1: TDBGrid
      Width = 902
      Height = 309
    end
    inherited pnlTotal: TPanel
      Top = 309
      Width = 902
      inherited lbTotal: TLabel
        Left = 812
      end
    end
  end
  inherited pnTop: TPanel
    Width = 902
    inherited Panel1: TPanel
      Width = 900
      ExplicitLeft = 2
      ExplicitTop = -4
      ExplicitWidth = 870
      inherited labelLocal: TLabel
        Left = 975
        Top = 13
        Enabled = False
        Visible = False
        ExplicitLeft = 975
        ExplicitTop = 13
      end
      inherited Label5: TLabel
        Left = 921
        Top = 61
        Enabled = False
        Visible = False
        ExplicitLeft = 921
        ExplicitTop = 61
      end
      inherited btnSearch: TButton
        Left = 804
        ExplicitLeft = 804
      end
      inherited dtFrom: TDateTimePicker
        Left = 975
        Top = 32
        Enabled = False
        Visible = False
        ExplicitLeft = 975
        ExplicitTop = 32
      end
      inherited dtTo: TDateTimePicker
        Left = 1057
        Top = 32
        Enabled = False
        Visible = False
        ExplicitLeft = 1057
        ExplicitTop = 32
      end
      inherited btnCleanDate: TButton
        Left = 1003
        Top = 59
        Enabled = False
        Visible = False
        ExplicitLeft = 1003
        ExplicitTop = 59
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    inherited CreateUser: TMenuItem
      Visible = False
    end
  end
end
