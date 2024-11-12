inherited ViewInputCreate: TViewInputCreate
  Caption = 'Formul'#225'rio de Entrada'
  ClientHeight = 306
  ClientWidth = 548
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 564
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnData: TPanel
    Width = 548
    Height = 257
    ExplicitWidth = 548
    ExplicitHeight = 257
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
    object Label1: TLabel
      Left = 127
      Top = 20
      Width = 42
      Height = 13
      Caption = 'Produto:'
    end
    object Label3: TLabel
      Left = 325
      Top = 20
      Width = 28
      Height = 13
      Caption = 'Local:'
    end
    object Label4: TLabel
      Left = 389
      Top = 45
      Width = 4
      Height = 13
      Caption = ':'
    end
    object Label2: TLabel
      Left = 191
      Top = 45
      Width = 4
      Height = 13
      Caption = ':'
    end
    object labelLocal: TLabel
      Left = 161
      Top = 92
      Width = 80
      Height = 13
      Caption = 'Data fabrica'#231#227'o:'
    end
    object Label5: TLabel
      Left = 267
      Top = 92
      Width = 70
      Height = 13
      Caption = 'Data validade:'
    end
    object Label7: TLabel
      Left = 24
      Top = 89
      Width = 25
      Height = 13
      Caption = 'Lote:'
    end
    object Label8: TLabel
      Left = 24
      Top = 153
      Width = 56
      Height = 13
      Caption = 'Quantidade'
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
      TabOrder = 2
      Text = '0000'
    end
    object btnSeachProd: TButton
      Left = 127
      Top = 39
      Width = 23
      Height = 24
      Caption = #55357#56590
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSeachProdClick
    end
    object editProdId: TEdit
      Left = 156
      Top = 39
      Width = 29
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 6
      OnChange = editProdIdChange
      OnKeyDown = editProdIdKeyDown
      OnKeyPress = editProdIdKeyPress
    end
    object editProdName: TEdit
      Left = 201
      Top = 39
      Width = 112
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnSearchLocal: TButton
      Left = 325
      Top = 39
      Width = 23
      Height = 24
      Caption = #55357#56590
      TabOrder = 1
      OnClick = btnSearchLocalClick
    end
    object editLocalId: TEdit
      Left = 354
      Top = 39
      Width = 29
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 7
      OnChange = editLocalIdChange
      OnKeyDown = editLocalIdKeyDown
    end
    object editLocalName: TEdit
      Left = 399
      Top = 38
      Width = 120
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object dtFab: TDateTimePicker
      Left = 161
      Top = 111
      Width = 100
      Height = 21
      Date = 45592.959168541660000000
      Time = 45592.959168541660000000
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 9
      OnChange = dtFabChange
    end
    object dtExp: TDateTimePicker
      Left = 267
      Top = 111
      Width = 100
      Height = 21
      Date = 45592.959168541660000000
      Time = 45592.959168541660000000
      TabOrder = 10
      OnChange = dtExpChange
    end
    object btnCleanDateExp: TButton
      Left = 373
      Top = 108
      Width = 28
      Height = 24
      Caption = #55357#56785#65039
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnCleanDateExpClick
    end
    object editLot: TEdit
      Left = 24
      Top = 108
      Width = 131
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnExit = editLotExit
      OnKeyDown = editLotKeyDown
    end
    object editQuant: TEdit
      Left = 24
      Top = 172
      Width = 113
      Height = 32
      Alignment = taRightJustify
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnKeyPress = editQuantKeyPress
    end
  end
  inherited npFooter: TPanel
    Top = 257
    Width = 548
    ExplicitTop = 257
    ExplicitWidth = 548
    inherited btnCancel: TBitBtn
      Left = 424
      ExplicitLeft = 424
    end
    inherited btnCreate: TBitBtn
      Left = 298
      ExplicitLeft = 298
    end
  end
end
