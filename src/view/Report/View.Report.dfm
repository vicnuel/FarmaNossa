inherited ViewReport: TViewReport
  Caption = 'Relat'#243'rios'
  ClientHeight = 471
  ClientWidth = 902
  ExplicitLeft = -131
  ExplicitWidth = 918
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottom: TPanel
    Top = 415
    Width = 902
    ExplicitTop = 415
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
    ReportOptions.CreateDate = 45608.637361307900000000
    ReportOptions.LastChange = 45608.646611053240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 456
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDataset4
        DataSetName = 'frxDBDataset4'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 411.968770000000000000
          Top = 30.236240000000000000
          Width = 328.819110000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de produtos por local')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 15.118120000000000000
          Width = 52.913420000000000000
          Height = 52.913420000000000000
          Frame.Typ = []
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000A60000
            00A608060000005088F477000000097048597300000B1300000B1301009A9C18
            000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000014
            2B4944415478DAED9D0B804DE5DAC7FF6BADBDF7CC981966C610956BB70F4D9D
            8A5C2AA9A4FA904AE808B9CC605C0E4788538E508994628C313888EF4C7570EA
            44372709090995E492EB304AEEE6BAF75E6B7DCFFBAE31F2257B3B6666BFF6F7
            FC0633F665F67AD7FEEDE77D9FF7B6B461D5ABDB6018C5D0584C4645584C4649
            584C4649584C4649584C4649584C4649584C4649584C4649584C4649584C4649
            584C4649584C4649584C4649584C4649584C4649584C4649584C4649584C4649
            584C4649584C4649584C4649584C4649584C4649584C4649584C4649584C4649
            584C4649584C4649584C4649584C4649584C4649584C4649584C4649584C4649
            584C4649584C4649584C4649584C4649584C4649584C4649584C4649584C4649
            584C4649584C4649584C4649584C4649584C4649584C4649584C464958CC4B40
            370CC457AD8AD8C404B85C6E98A61FF9274EE248CE21987E7FA80FEFB286C5FC
            0F888C8E46D23DCD51EF9E1648AC53075A5404DD6ACB3F5641018EECDA831F3E
            5F8D6D6BBE44EEF1E3A13EDCCB1216F322A9D7B4319A77EF86D8ABAF864FD360
            E83AD96843D33558F4DDB0359864A865E8C8DFBB179F65CEC6AECD9B615B56A8
            0FFDB282C5BC086E79A8159AF7780A46C54AB034C0AF5988F0929006894932FA
            61C0639298BA058B84B5E8BBEB542E3E4D9F81EF56AC64392F02163348FE706F
            0BB4E8DF07EEA858141A809BA2A34962BAFD3A0A5D26DCF9F9D0DD11D03D11F0
            4208A843334D68364551BF0F1FBC32195B57AF0975312E1B58CC2010094EE749
            E3E1A2EFB6E622E5281252F433E9CBB00C9C3E7D1CEF8E18055F4121EA2425A1
            FE7DD4F6BCB13E34974B343B4960A060FF41643DF3176E7306098B190477777C
            1C0DBB778597B270AAB5494C13DB3F5C86842BAB93804910ADCAC5CF3C8BBD5B
            B6CAC71B2464F3273AE2D6CE1DE1A7E7D0DD143D6D6C98370FAB172E0A75712E
            0B58CC00B8233C78EAB557105BBB26B5250D19290F6CD88085E326E0A6E677A1
            C59F070A13F1FDE277F1C9CCD925CF1372FE71DC6824DE7633740A99A272CF3B
            B01F6F0E1E8EA2BCBC50174B7958CC00D4BDF926B47F712C453E4A6F3483DA94
            5E640D79060776EC44C5CA95D16DD6549237162777EFC69B4386C1EFF5963C37
            49883B7C10749787A22A455ACDC6DB7F1A8683DB7784BA58CAC36206A049DB36
            68DEBF2F65DC9469DB3AFC470E23A3671FF87D3E689A868E639FC595B73586AB
            C88FAC9124ECB6B3D2C5C4C7A3DBB437E049889759BBB073C56B53B1E9E365A1
            2E96F2B09801B8BB6307DCD6BD0B454B3A5974A68E6DDB8EB9438697DC5FAB41
            3DB41F37069A3B1239DF6CC43B635E80E973467D2AC4C6A2F7F429D0132B3B49
            103503D6A46762C3920F425D2CE5613103D0BC437B12B32B351AA92AB6741CFD
            7E2BE60E1B5172BF889AED9E1E843A2DEF83E1B7B078D468ECDEB459DE27C44C
            9E3105A02ADF700686F0455A06BE623103C26206A0D923EDD0B44F2F982E8DC4
            D37072C776CC1AF4F4398FA95AB306FEF8EA44E8313138BE7D3B55E9A3505450
            20C5EC39632A5C0995C94A9B9A0226BE4C9FC96206018B1980860FB69299B757
            B7E0F619C8DDB71B99FD07FF6614A761DBD6B8AB6F8A1C9ADCBAF03D7C3C67AE
            1C534FCE98024F7C224C6A0788E77C397D26D62F591AEA62290F8B19806B1ADE
            8A762F8D81E84ED7494CFFF1A3C8ECDD0F85F9F9E73CCE305C683778206AB4BC
            079ACF8BE593DEC0CEAF37A267661A222A5F41D5B8098DC45C3D2D03EB977E18
            EA62290F8B1980F86A57A07BDA1BD0A2A3E0D75C88F47A317FF0101CDABDE737
            8FAD9890802E2F8D83BBF6D5B04F9EC6B2D7D3F1C0C054B8E3E2E083184FB7F0
            05253FEBB92A0F088B190031E7B2DB4B2F20E1C606F0BB7444500DBE6EDE9B58
            F9D63BE77D7C8DEBAE45BBD17F81272191A26A1122A23C30C4840FBA4F54E56B
            3366621D8B19101633085AF6E8869BDAB7874D0990E8373AFAC30F58306C242C
            D33CEFE36BD5AF87B623862182E434299BB734673A9C6D9924E66CAC7D7F49A8
            8BA43C2C6610D44CBA119D268C87A6995425EB701579313B75008E1DFAE9779F
            53BD4E1D741C3B1A466282338758F683DA5843C90F8B1918163308A26263F1D4
            E449A870D59594C06894799BD8F9E1C7786F4AFA059F57EFF6DB71FF7343E172
            47D099B6C84F37BE4C9F81B5FF7A3FD445521E163348EEEBD219B776EE4455B3
            98CA460DCD63C730B3DF20E41E3FF1BBCF898EAB846E19531059314E0E1B693E
            9D226606D67EC86DCC40B098415285A2659757C7C38C8F879BEA659DF4FC6EF1
            3FF151E69CDF7D4E0C65E3BD66A6C11D5D095E4DE8AC61DFB27F63E99469B078
            B1DA05097B31C59061B5DAB57055FDFF82272A0A72264531B66DC9FFDA964D3F
            DBD0759DAA6971934699B48EDD9BBFC3C19D3BE57DE2F7B4EE9B8CEBDBB5859B
            321A317BDD7FEA046653D43C4DD1F37CC4C4C7C9911F4F749C980222C7DADD74
            FB8E95ABB07BE3266894F16BF43AF2753539CD431C15FDEC1CA6FC4E1F0141D1
            E93CFCB27F3F0ED35F318124DC095B310DB71BB7B5BA1FB73CDC1AB135AE82A9
            1BF2765158219A2DFB15E94B8CC8949C014740DB24496D03BAAF08EBE7FF1DAB
            162F96F756AD51035D274D805E31563E5F8CFD1C5CF905DE99F0CA79D7F30831
            7B88919FD87829720425F17E92502E62B345C4349CD7B37FFD16D8F2A3233E34
            425A5B34014446AF5394A6DB0A720E616DD63FB0F5CBB5280CE3799D6129A658
            0AD1E1F9E710794D1D2999331752BEDDA2C8C511D0F9EF995BC5FD143849151B
            221EE9B62EBB79F4DCD3787BE8481CDABF4FFEEE7BBB754152E78E521283BE2C
            6F01168DF82BF6FDB0ED37C7E18899064F4C25FA6008D99D6516A2216090C842
            BAF3BC25CE5F1B670F4E7E138F1737D0EBD267C07BE204168D7901393B7F0CF5
            E92E13C24ECCCA575D854E2F3C0F4FF52BE41BE9B2C4788B2D5735CAE5B50609
            27A29BED54F36704D09C7FA09B167C62D523454C99B05064FBF4C549D8B2FA0B
            F9FB63A98DF9D474AA9EE3639D99E954D316EDDD87594386A328BFE09C63116D
            CC9E33A6C1A0AC5EBBF8A29CC3B951D541CFCBC53BA3C722FB87EDA13EEDA54E
            5889191913831ED326C355B50A55953A45274D36D13CF4A616513BF0D8C11C39
            A6AD9DE958C4D96A5C2B0EA1A22D681A8ED01ECD859FB66FC78AFFC942DEE9D3
            25AF73CBFDF7E19E410360B974A7FB887EC7CEF7DEC79259B3CFA9D2632A5542
            AFCC3480B273C3BCB8B20442467DFA2ACA3F89F97D07E3D4D1A3A13EFDA54A58
            89D9FE9961A8D1E22EAAEA3419214DCB8F827DD95893F53676AC5B0F5F29250D
            2259E9F0EC4854BFB3110CBF2E2A667AAD022C1D371EDBD77F5DF2B86812B377
            E63480DAA49A7DA931F33C50C4B6299B3AB06215FEF1F2C4F23ACDE542D88819
            57A50ABA4D9F02BB424CF12D7E1CFFFA1B2C9EF82AF27F15ED4A8BD88478F44C
            7B031195E2C42248F85C24EC91E398FBE7E13871F867F9984A14B99FA4081E55
            21B6B87D88920CBF34906D565B2C253631A7EF401CC9C9298F535D2E848D98AD
            7A7647BDC71FA1C8E472BA667C85C81AF8340E676797D96BDED4A2051E1CF227
            F8220C59A5BBA8163FF1E32E648D1987BC9327E512DEA4AE4FC0E3175975E9BF
            BEE81910C99487DACE9BDE5E884FDF5C508667B87C091B31BB4E7A19090D1AC8
            CE3F31EF71F7AA95F8D7F84965FA9AA24A7F62D4485CD1EC769908395DE894D9
            1714C12AA266435C2CC84927012B9B9A9CCA6ACBA6C4F11F7FC49C4183CBB4BC
            E549D888993A6F263C55ABC90DAEC44E199F4C7C0DDF7FBEB2CC5F573621664C
            4144442C7C9A9FB2749B922D436E70E07541AAEAB270C959F9F9907DB2A2DF93
            C271FECF3F6146CF94322F6F79113662F6CF9A0BBD623CC4062EA28B67F173CF
            63EFE66FCAE5B51B3EF420EE18900A430C3B521415ED4897DC9FC31152B74BBA
            234B95B3E3021AFC274F20EDC96EE7ED56BA1C091B319333D350B1761D587E0B
            3A55E5AB3267E1AB729AC52376DDE8346614AADF7C33B525C508D3D96A5D4AA9
            D9C5E339A58B55BCA45874D89F3E908D99BD53CBA5BCE541D888D96DC24B884B
            A236A6687151D438BA6D2BE60F1D596E11A47AEDDAE8F4FA0420229A3E189494
            E8424A5B8E74DB25C338A58B6863EA722F251DBF6CF91E6F0E7FA65CCA5A1E84
            8D984DDBB641D37E29B04C2703F6F8BD58FCECF3D8F5DD96723B86367DFBE0DA
            76FF2D27046BC51BBAEA76D9243E120A974E72057CB3E02D7CFAF7AC722B6B59
            133662464547A3DFDC59F0C544C3D9739ADEAD9F8FE0EDD163F173197619FD1A
            D9A19E9E0633B1929CB1E4B19D1943CE6E99A58F905E2C0B465E2E6626A722F7
            E4C9722967791036620A1EE8DE1D0D3A3D26AB373F452DBF4DEDCDDC5C6C5CF8
            2E367FB20CB9A74E95F931882D65FED0B32BC4FC39B79F8E41774EAF5E0667D9
            16E253E6BFF7BD0FF06EFAF4322F5B791256627A2222A8ADF92262AEBF96120E
            5DFE1583E18610D4EB87595800B741EFA4484DC4EC1ECB99BC21FA23EDE27990
            B20B46B3E410A29C2F29F756B7647BF1F8AE3D583869328EFFF2CBEF1E8388DC
            291953A1255686DB32E48410D7991942A5D8DE15BF4BCC843AB66737E60F1901
            DFAF76990B07C24A4C416C7C1C3A8D1E85981BAE95514B17514BB39CEC58D7E4
            D0A0944E4C3012938275671A9C5D3C515797FD82E79E1267B2992D253FBC6A2D
            B2C6BF7CC163B8B3FDA3684C5153831B45868648B9FB70E9223E4427B66D47D6
            5FC796C9906BA8093B310562CFA0D6FD5271F55DCDC4FE19F2CBD24C3154E33C
            402427969CA6EB8809270289C82866AEC3107B065BB29D6A08613567FAAE573C
            F2D04F989EDCF7821BFD8BC56BBDA64D81AB4A65B97C37D247CF1591538E0069
            323ABB2C31154F2F9EE45432E9B23879771E6397DC08A75F48740D5198F79836
            B2377F8B45E327C05B508070242CC594052301AAD7AD8BA68F3F865A773682ED
            892C594221106FBB01BDE4ED97993489722681B6CE2CBBD08C922D08FD74BF79
            E0203252FA06AC961F1B361435EFBB4BFE0E97A9CB24C525AF6801399B5D1C81
            5BA4EBB67D763EB088E65AB1A7C5933DC4CFE2922D061D87AF2017BBBF5A8FF5
            8BDEC3819D3F864D67FAF9085B314B0A486FAE886009D5AAC98EF0B311C8F966
            17FF73E64D96337F2CA7BD797DE346B8A5C3A3541DBBA498627EA7753007E9C9
            81C5AC7563037478E545383BB63BAFE3232923E8879CD5EBF0D592F7E1F7F98B
            671A398D853307A5158F1E89E390B3DCE92E5F61218E52B42E2AC8C7FF07C25E
            CC4B4108D2AA670FDCF8E8C372F2B0DC7C95C44CEBD537E0733D5191489E3E15
            9155AAC2D2E5FC78D9D6CD59B1068B26BC028471B42B0D58CC00346BD31A4D44
            C7BDEE4436FFFE8348EB931AD4E077FB512351B359D3922D6274BF89E593A762
            E3F2E5A12E96F2B09801B8A35D5B341A902266E4CA056ADE03D9484BE917D473
            9B75EA80463DBA96FC5F8CA22F9F38199B977F16EA62290F8B19803B1E79184D
            FAA6C88B0388E425EF603632FA0C08AA2ABEAE5143B41E3D12B6CB2D1F2EDA97
            9F4F9D86F51F7E1CEA62290F8B1980A68FB445933EC94E6A42672A37E72066F7
            1E10D47521C505AA3ABF3A016E71ED496AAFBAC5ACA7691958F7016FDC1A0816
            33004DDAB5C1ED24A6AEC9AE77E41D3A80D9BDFA05D55513115D01C9E969884C
            4C84496D54C334B172DA747CC51133202C66001A3FD2064D52FBC8AA584C9AC8
            CFD98F99C9FD8312D3EDF1206576062212AB385BD0F8FD583D3D93AAF28F425D
            2CE5613103D0982266E37EBD65B474531B333F7B2F32FA0E082A2B77B9DD4899
            930177E5AA72F2B26152553E7D068B19042C66009A3CFA301AF74D86BCCCB365
            C3BB6F1FD253070695FCE82E177AFF2D035189556597919B32FB95E92426B731
            03C26206A0A9C8CAFBA588DE226781D9FE6C4C4F0D2E2B17FBB78BAABC82EC64
            17D73807568B8D5B97F2FE988160310320AAF266A9BDE5840B3144E8CB3E80F4
            3EFD8216B3F7DF6620AA8A1331C595D3D664CC64318380C50C40E3B6AD7147FF
            3E3035676692373B1B1929C165E542CC3E73321159A58A6C920A3157531B93BB
            8B02C36206A0D1430FE0EE4103E4E550C46420EF3ED1C1DE3FF836E6ACE9A870
            4535399F53243F524CBE00554058CC00DCD4EA5EB41A3A147ECB4FED4C1B66CE
            4FC8A4AC3C985D7D2BC6C7A3FBD4D7E5454EC54EC26293D88F27BC8AEF3E5B11
            EA62290F8B19806AD7D4C593D35E970152CE42F716E19F234661FF79366AFDBF
            2435BF0B0F8E180A9FE6A28CDE845E5488AC612390B36B77A88BA53C2C66003C
            9191E834F105245C7B9D9C012F96639CDAF80D16FC752CFC17586713111D8D2E
            13C7A362DDDA526A51959FDEB60DF3868E74368E652E088B1904373FD012CD07
            F5976B88C4720C9DAAF1AD4B3EC28AF90B50789EA50DE29A922D7B27A3E69D77
            5202A4C36B5870F94C7CFEFA346C5AF6EF5017E7B280C50C82A8D8183CF1E238
            54BCE11ACAAC6DAA9A4934FA7E7AEF1EEC5CBD0E3B366C900BC22A525BB2EEAD
            B7A2DEDDCD117D7575B9538658E4A6EB1AF276EDC3BCA787C9EB983381613183
            A456FDFA683372183C09F1CE6235B17C564867395B015A94711B6E435E58C0A4
            FBC5288FB8E080699BF01F3E82A5AFBD81DDDF7E1BEA625C36B0981741EDA406
            7870C820B8291AEAF2FA51C50BD66C145F9A45772E30E03765A4343D1AFC393F
            631955E13B376E0AF5E15F56B0981749955A35D132B50FAEA408EA379C754167
            3680D18A7779133B29183E3FB2376FC2EA056F2167E7AE501FF665078BF91F20
            A6B3D568501F37DCD184A268122AC4C5C112D53B55E7B9BF1CC1A1AD5BB17DD5
            1AECD9B225AC97D896252CE62522A6B6C59298E24A6CDEC242E49D3A0593AF13
            79C9B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B098
            8C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B098
            8C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B098
            8C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B098
            8C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B098
            8C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B0988C92B098
            8C92B0988C92B0988C92FC2F8BD655C3A5154B0B0000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 15.118120000000000000
          Width = 143.622140000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Farma Nossa')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 45.354360000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 960.000620000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 960.000620000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset4
        DataSetName = 'frxDBDataset4'
        RowCount = 0
        object Memo2: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset4."Cod Local"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 340.157700000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset4."Produto"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 68.031540000000010000
          Top = 2.000000000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset4."LOCAL"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 2.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset4."Cod Prod"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 529.134199999999900000
          Top = 2.000000000000000000
          Width = 188.976414570000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset4."Lote"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 718.110614570000000000
          Top = 2.000000000000000000
          Width = 94.488201180000040000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset4."Fabrica'#231#227'o"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 812.598815750000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset4."Vencimento"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 907.087065750000000000
          Top = 2.000000000000000000
          Width = 139.842744250000100000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset4."Quantidade"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 306.141930000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 963.780150000000000000
          Top = -3.779530000000020000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 1046.929810000000000000
        object Memo15: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 75.590551181102400000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C. LOCAL')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
        object Memo16: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 340.157480314960700000
          Width = 188.976377952756000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODUTO')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 75.590551181102400000
          Width = 188.976377952756000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LOCAL')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 264.566929133858400000
          Width = 75.590551181102280000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C. PROD')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 529.133858267716700000
          Width = 188.976377952756000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LOTE')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 718.110236220472700000
          Width = 94.488188980000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'FAB')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 812.598425200472800000
          Width = 94.488188976377960000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VENC')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 907.086614176850700000
          Width = 139.843195823149400000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'QUANT')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = memTable
    BCDToCurrency = False
    Left = 504
    Top = 15
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
    Left = 696
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
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = memTable
    BCDToCurrency = False
    Left = 536
    Top = 65535
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 600
    Top = 15
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'frxDBDataset4'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 640
    Top = 7
  end
end
