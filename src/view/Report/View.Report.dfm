inherited ViewReport: TViewReport
  Caption = 'Relat'#243'rios'
  ClientHeight = 471
  ClientWidth = 902
  ExplicitWidth = 918
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottom: TPanel
    Top = 415
    Width = 902
    ExplicitTop = 417
    ExplicitWidth = 902
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
      ExplicitLeft = 791
    end
    inherited btnCreate: TBitBtn
      Left = 488
      Visible = False
      ExplicitLeft = 488
    end
    inherited btnSelect: TBitBtn
      Left = 690
      Visible = False
      ExplicitLeft = 690
    end
    inherited btnUpdate: TBitBtn
      Left = 589
      Visible = False
      ExplicitLeft = 589
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
    ExplicitWidth = 902
    ExplicitHeight = 334
    inherited DBGrid1: TDBGrid
      Width = 902
      Height = 309
    end
    inherited pnlTotal: TPanel
      Top = 309
      Width = 902
      ExplicitTop = 309
      ExplicitWidth = 902
      inherited lbTotal: TLabel
        Left = 812
        Height = 23
        ExplicitLeft = 812
      end
    end
  end
  inherited pnTop: TPanel
    Width = 902
    ExplicitWidth = 902
    inherited Panel1: TPanel
      Width = 900
      ExplicitWidth = 900
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
    object N2: TMenuItem
      Caption = '-'
    end
    object btnExport: TMenuItem
      Caption = 'Exportar'
      OnClick = btnExportClick
    end
  end
  object frxReport1: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45607.728599548600000000
    ReportOptions.LastChange = 45607.728599548600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 456
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 592
    Top = 7
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 664
    Top = 15
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 744
    Top = 23
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 600
    Top = 15
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 608
    Top = 23
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 616
    Top = 31
  end
end
