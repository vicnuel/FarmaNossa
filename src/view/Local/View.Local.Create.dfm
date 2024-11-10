inherited ViewLocalCreate: TViewLocalCreate
  Caption = 'Formul'#225'rio de local'
  ClientHeight = 220
  ClientWidth = 433
  OnActivate = FormActivate
  OnShow = FormShow
  ExplicitWidth = 449
  ExplicitHeight = 259
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnData: TPanel
    Width = 433
    Height = 171
    ExplicitTop = -2
    ExplicitWidth = 420
    ExplicitHeight = 185
    object Label2: TLabel
      Left = 298
      Top = 77
      Width = 39
      Height = 14
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 77
      Width = 55
      Height = 14
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 19
      Width = 41
      Height = 14
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbStatus: TComboBox
      Left = 298
      Top = 97
      Width = 89
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
      TabOrder = 2
      Text = 'ATIVO'
      Items.Strings = (
        'ATIVO'
        'INATIVO')
    end
    object editDesc: TEdit
      Left = 24
      Top = 97
      Width = 249
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 200
      ParentFont = False
      TabOrder = 1
    end
    object editCod: TEdit
      Left = 24
      Top = 39
      Width = 89
      Height = 24
      Alignment = taRightJustify
      CharCase = ecUpperCase
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 200
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '0000'
    end
  end
  inherited npFooter: TPanel
    Top = 171
    Width = 433
    inherited btnCancel: TBitBtn
      Left = 309
    end
    inherited btnCreate: TBitBtn
      Left = 183
    end
  end
end
