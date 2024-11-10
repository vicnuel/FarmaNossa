object ViewStock: TViewStock
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Consultar Estoque'
  ClientHeight = 537
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnGrid: TPanel
    Left = 0
    Top = 105
    Width = 1002
    Height = 432
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 970
    ExplicitHeight = 430
    object pnProd: TPanel
      Left = 0
      Top = 0
      Width = 601
      Height = 432
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnProd'
      TabOrder = 0
      ExplicitHeight = 430
      object pnlTotal: TPanel
        Left = 0
        Top = 407
        Width = 601
        Height = 25
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 405
        object lbTotal: TLabel
          AlignWithMargins = True
          Left = 511
          Top = 1
          Width = 82
          Height = 23
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 7
          Margins.Bottom = 0
          Align = alRight
          Alignment = taCenter
          Caption = 'Registros: 00000'
          Layout = tlCenter
          ExplicitHeight = 13
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 601
        Height = 407
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
      end
    end
    object Panel2: TPanel
      Left = 607
      Top = 0
      Width = 395
      Height = 432
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 1
      ExplicitWidth = 363
      ExplicitHeight = 430
      object pnStock: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 28
        Width = 389
        Height = 404
        Margins.Left = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnProd'
        TabOrder = 0
        ExplicitWidth = 357
        ExplicitHeight = 402
        object pnTotalStock: TPanel
          Left = 0
          Top = 379
          Width = 389
          Height = 25
          Align = alBottom
          TabOrder = 0
          ExplicitTop = 377
          ExplicitWidth = 357
          object lbTotalStock: TLabel
            AlignWithMargins = True
            Left = 299
            Top = 1
            Width = 82
            Height = 23
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 7
            Margins.Bottom = 0
            Align = alRight
            Alignment = taCenter
            Caption = 'Registros: 00000'
            Layout = tlCenter
            ExplicitLeft = 267
            ExplicitHeight = 13
          end
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 389
          Height = 379
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          PopupMenu = PopupMenu1
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 395
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Estoque'
        TabOrder = 1
        ExplicitWidth = 363
      end
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1002
    Height = 105
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 970
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1000
      Height = 103
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 968
      object Label1: TLabel
        Left = 15
        Top = 11
        Width = 42
        Height = 13
        Caption = 'Produto:'
      end
      object Label3: TLabel
        Left = 341
        Top = 10
        Width = 28
        Height = 13
        Caption = 'Local:'
      end
      object Label4: TLabel
        Left = 405
        Top = 32
        Width = 4
        Height = 13
        Caption = ':'
      end
      object Label5: TLabel
        Left = 91
        Top = 33
        Width = 4
        Height = 13
        Caption = ':'
      end
      object Label2: TLabel
        Left = 15
        Top = 70
        Width = 35
        Height = 13
        Caption = 'Status:'
      end
      object Label6: TLabel
        Left = 191
        Top = 70
        Width = 43
        Height = 13
        Caption = 'Estoque:'
      end
      object btnSearch: TButton
        Left = 848
        Top = 38
        Width = 77
        Height = 28
        Caption = 'Buscar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnSearchClick
      end
      object btnSearchLocal: TButton
        Left = 341
        Top = 29
        Width = 23
        Height = 21
        Caption = #55357#56590
        TabOrder = 2
        OnClick = btnSearchLocalClick
      end
      object editLocalId: TEdit
        Left = 370
        Top = 29
        Width = 29
        Height = 22
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        OnChange = editLocalIdChange
        OnKeyPress = editLocalIdKeyPress
      end
      object editLocalName: TEdit
        Left = 415
        Top = 29
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object cbType: TComboBox
        Left = 15
        Top = 30
        Width = 66
        Height = 22
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        Text = 'Nome'
        OnChange = cbTypeChange
        Items.Strings = (
          'Nome'
          'C'#243'digo')
      end
      object editValue: TEdit
        Left = 101
        Top = 29
        Width = 212
        Height = 22
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnKeyDown = editValueKeyDown
        OnKeyPress = editValueKeyPress
      end
      object cbStatus: TComboBox
        Left = 56
        Top = 66
        Width = 121
        Height = 22
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
        Text = 'Somente ativos'
        OnChange = cbStatusChange
        Items.Strings = (
          'Somente ativos'
          'Somente Inativos'
          'Todos')
      end
      object cbStock: TComboBox
        Left = 240
        Top = 67
        Width = 185
        Height = 22
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        Text = 'N'#227'o Mostrar Estoque Zerado'
        OnChange = cbStockChange
        Items.Strings = (
          'Mostrar Tudo'
          'N'#227'o Mostrar Estoque Zerado'
          'Estoque Maior que'
          'Estoque Menor que'
          'Estoque Igual a')
      end
      object editQuant: TEdit
        Left = 439
        Top = 66
        Width = 72
        Height = 22
        Alignment = taRightJustify
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Visible = False
        OnKeyPress = editQuantKeyPress
      end
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 168
    Top = 152
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
    Top = 256
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 176
    object popUpdate: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFA87D78A47874A47874A47874A47874A47874A47874A47874
        A47874A47874A47874A47874A47874A47874A47874A47874A47874A47874986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFA97F79F3DDC4F8E3C6F6DFBFF5DCB8F4
        D9B2F3D7ACF3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98
        F1CF98EFCD97986B66FF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF2DEC8F7E3
        CAF5DFC2F4DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EE
        CC97EECC97EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        A97F7AF2E0CEF8E7CFF5E2C8F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CF
        A0EFCD9AEECC97EECC97EECC97EECC97EFCD97EDCB96986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFA97F7AF3E3D2F9E9D4F6E4CDF5E1C7018A02F4DCBCF3D9B6
        C2C88D018A02018A02018A02BFBF7BEECC97EECC97EECC97EFCD97EDCB96986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFA97F7BF4E6D8FAECDAF8E7D3F6E4CC01
        8A020B8E0AC3CC97018A02C2C88DF1D4ABC1C485018A02BFC07CEECC97EECC97
        EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FFAA807BF5E9DDFBEF
        E0F8EAD9F7E6D2018A02018A02018A02C3CC97F3D9B6F2D7B1F1D4ACC1C48501
        8A02EECC99EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        AD837DF5ECE3FBF2E6F9EDDEF8E9D7018A02018A02018A02018A02F4DCBBF3D9
        B6F2D7B1F1D4AB018A02F0CFA0EECC99EFCD97EDCB96986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFB2887EF7EFE8FCF5ECFAEFE4F9ECDD018A02018A02018A02
        018A02018A02F4DCBCF3D9B7F1D7B0F1D4ABF0D2A5F0CF9FEFCD9AEDCA96986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFB68B80F8F2EEFDF8F1FAF3EAF9EFE3F9
        ECDDF8E9D8F7E6D2F6E4CCF5E1C6F4DFC1F4DCBCF3D9B6F2D6B0F1D4AAF0D1A4
        F0D09FEDCB98986B66FF00FFFF00FFFF00FFFF00FFFF00FFBA8E82FAF6F4FEFC
        F8FCF6F0FAF2EAFAF0E4F9EDDDF8E9D8F7E7D2018A02018A02018A02018A0201
        8A02F1D7B0F1D4AAF1D2A5EECD9E986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        BE9283FBF8F7FFFFFEFEFAF6FCF5EF018A02FAF0E3F9ECDDF9E9D8F8E7D2018A
        02018A02018A02018A02F3D9B6F2D7B0F2D5ABEFCFA4986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFC29685FBF8F7FFFFFFFFFEFCFEF9F4018A02C9DEBCFAEFE3
        F9EDDDF8E9D7C7D4A8018A02018A02018A02F4DCBBF3D9B5F2D7B0F0D2A8986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFC69986FBF8F7FFFFFFFFFFFFFFFDFCCB
        E3C4018A02C8DDBCFAF0E4C7D8B1018A02C7D4A80B8E0A018A02F5DEC0F4DCBB
        F4DAB6F1D5AE986B66FF00FFFF00FFFF00FFFF00FFFF00FFCA9C88FBF8F7FFFF
        FFFFFFFFFFFFFFFFFEFCCBE3C4018A02018A02018A02C7D8B1F8E9D7F8E6D101
        8A02F5E1C6F4DEC0F3DBBAD9C4A7986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        CEA089FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0
        E3F9ECDDF8E9D7F8E6D1F6E4CCEBD9C0D1C1ABB5A897986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFD2A38AFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
        FDFAF5FCF6EFFAF2E9FAEFE2FAEDDEFBEEDBE7DBC9C8BDAFBAB0A2B7AC9D986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFD7A78CFCF9F7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B48176B48176B48176
        B48176B48176B48176FF00FFFF00FFFF00FFFF00FFFF00FFDAAB8DFCF9F8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B4
        8176E3B585E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FF
        DEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
        FCFFFEF9E5D1CBB48176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE5D4D0B48176EFC38CF3BA6CB88285FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFDEAD8EFFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B48176F1C58BB88285
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAA482DAA482DAA4
        82DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482B4
        8176B88285FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = 'Atualizar'
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
  object memTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 704
    Top = 256
  end
  object DataSource2: TDataSource
    Left = 728
    Top = 328
  end
end
