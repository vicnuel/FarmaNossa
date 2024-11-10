inherited ViewCreateProduct: TViewCreateProduct
  Caption = 'Formul'#225'rio de produto'
  ClientHeight = 325
  ClientWidth = 523
  OnActivate = FormActivate
  OnShow = FormShow
  ExplicitWidth = 539
  ExplicitHeight = 364
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnData: TPanel
    Width = 523
    Height = 276
    ExplicitLeft = -48
    ExplicitTop = -6
    ExplicitWidth = 523
    ExplicitHeight = 276
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
    object Label2: TLabel
      Left = 312
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
    object Label3: TLabel
      Left = 24
      Top = 141
      Width = 149
      Height = 14
      Caption = 'Permite Estoque Negativo?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 205
      Width = 94
      Height = 14
      Caption = 'Permite Entrada?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 160
      Top = 205
      Width = 80
      Height = 14
      Caption = 'Permite Sa'#237'da?'
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
    object cbStatus: TComboBox
      Left = 312
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
    object cbNStock: TComboBox
      Left = 24
      Top = 161
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
      TabOrder = 3
      Text = 'SIM'
      Items.Strings = (
        'SIM'
        'N'#195'O')
    end
    object cbInput: TComboBox
      Left = 24
      Top = 225
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
      TabOrder = 4
      Text = 'SIM'
      Items.Strings = (
        'SIM'
        'N'#195'O')
    end
    object cbOutput: TComboBox
      Left = 160
      Top = 225
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
      TabOrder = 5
      Text = 'SIM'
      Items.Strings = (
        'SIM'
        'N'#195'O')
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
    Top = 276
    Width = 523
    ExplicitTop = 276
    ExplicitWidth = 523
    inherited btnCancel: TBitBtn
      Left = 399
      ExplicitLeft = 399
    end
    inherited btnCreate: TBitBtn
      Left = 273
      ExplicitLeft = 273
    end
  end
end
