inherited ViewUserCreate: TViewUserCreate
  Caption = 'Formul'#225'rio de usu'#225'rio'
  ClientHeight = 280
  ClientWidth = 483
  OnActivate = FormActivate
  OnShow = FormShow
  ExplicitWidth = 499
  ExplicitHeight = 319
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnData: TPanel
    Width = 483
    Height = 231
    ExplicitWidth = 483
    ExplicitHeight = 231
    object Label1: TLabel
      Left = 138
      Top = 20
      Width = 32
      Height = 13
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 83
      Width = 30
      Height = 13
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 152
      Width = 93
      Height = 13
      Caption = 'Senha se acesso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
    object editName: TEdit
      Left = 138
      Top = 39
      Width = 241
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
    object editLogin: TEdit
      Left = 24
      Top = 102
      Width = 241
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 200
      ParentFont = False
      TabOrder = 2
    end
    object editPass: TEdit
      Left = 24
      Top = 171
      Width = 241
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 200
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      OnKeyPress = FormKeyPress
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
    Top = 231
    Width = 483
    ExplicitTop = 231
    ExplicitWidth = 483
    inherited btnCancel: TBitBtn
      Left = 359
      ExplicitLeft = 359
    end
    inherited btnCreate: TBitBtn
      Left = 233
      ExplicitLeft = 233
    end
  end
end
