inherited ViewOutputCreate: TViewOutputCreate
  Caption = 'Formul'#225'rio de sa'#237'da'
  ClientHeight = 351
  ClientWidth = 597
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 613
  ExplicitHeight = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnData: TPanel
    Width = 597
    Height = 302
    ExplicitWidth = 597
    ExplicitHeight = 302
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
    object Label2: TLabel
      Left = 191
      Top = 45
      Width = 4
      Height = 13
      Caption = ':'
    end
    object Label8: TLabel
      Left = 24
      Top = 233
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object editCod: TEdit
      Left = 32
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
      TabOrder = 1
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
      TabOrder = 3
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
      TabOrder = 2
    end
    object editQuant: TEdit
      Left = 24
      Top = 252
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
      TabOrder = 5
      OnKeyPress = editQuantKeyPress
    end
    object pnGrid: TPanel
      Left = 24
      Top = 80
      Width = 557
      Height = 147
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 4
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 557
        Height = 122
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
      object pnlTotal: TPanel
        Left = 0
        Top = 122
        Width = 557
        Height = 25
        Align = alBottom
        TabOrder = 0
        object lbTotal: TLabel
          AlignWithMargins = True
          Left = 476
          Top = 1
          Width = 73
          Height = 23
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 7
          Margins.Bottom = 0
          Align = alRight
          Alignment = taCenter
          Caption = 'Op'#231#245'es: 00000'
          Layout = tlCenter
          ExplicitHeight = 13
        end
      end
    end
  end
  inherited npFooter: TPanel
    Top = 302
    Width = 597
    ExplicitTop = 302
    ExplicitWidth = 597
    inherited btnCancel: TBitBtn
      Left = 473
      ExplicitLeft = 473
    end
    inherited btnCreate: TBitBtn
      Left = 347
      ExplicitLeft = 347
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
    Left = 256
    Top = 120
  end
  object DataSource1: TDataSource
    Left = 152
    Top = 112
  end
  object PopupMenu1: TPopupMenu
    Left = 392
    Top = 120
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
end
