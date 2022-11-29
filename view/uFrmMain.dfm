object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'TESTE WK'
  ClientHeight = 389
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PctPedidos: TPageControl
    Left = 0
    Top = 20
    Width = 667
    Height = 349
    ActivePage = Pedido
    Align = alClient
    TabOrder = 0
    object TabListaPeds: TTabSheet
      Caption = 'Lista Pedidos'
      object pnlRodLista: TPanel
        Left = 0
        Top = 280
        Width = 659
        Height = 41
        Align = alBottom
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 500
          Top = 10
          Width = 148
          Height = 25
          Caption = 'Filtrar Todos Pedidos '
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333300003333333333333333333300003333373333333333333300003333
            07733333333333330000333000773333333333330000330F0007733333333333
            00003330F000777777733333000033330F000000007733330000333330F00788
            87077333000033333300788FF870773300003333330788888F87073300003333
            3308888888F80733000033333307888888F807330000333333078FF888880733
            0000333333777FF8888773330000333333307788887033330000333333330777
            7703333300003333333337000733333300003333333333333333333300003333
            33333333333333330000}
          OnClick = SpeedButton1Click
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 100
          Height = 39
          Align = alLeft
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
          object lblTotPeds: TLabel
            Left = 2
            Top = 15
            Width = 96
            Height = 22
            Align = alClient
            Alignment = taRightJustify
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 86
            ExplicitWidth = 12
            ExplicitHeight = 23
          end
          object Label11: TLabel
            Left = 2
            Top = 2
            Width = 96
            Height = 13
            Align = alTop
            Caption = 'Pedidos Lancados'
            ExplicitWidth = 85
          end
        end
      end
      object DBGPeds: TDBGrid
        Left = 0
        Top = 0
        Width = 659
        Height = 280
        Align = alClient
        DataSource = DSTabPeds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object Pedido: TTabSheet
      Caption = 'Pedido'
      ImageIndex = 1
      object pnlRegPeds: TPanel
        Left = 0
        Top = 0
        Width = 659
        Height = 65
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Pedido'
        end
        object Label2: TLabel
          Left = 123
          Top = 8
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label5: TLabel
          Left = 247
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object btnPesq: TSpeedButton
          Left = 93
          Top = 24
          Width = 23
          Height = 22
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333300003333333333333333333300003333373333333333333300003333
            07733333333333330000333000773333333333330000330F0007733333333333
            00003330F000777777733333000033330F000000007733330000333330F00788
            87077333000033333300788FF870773300003333330788888F87073300003333
            3308888888F80733000033333307888888F807330000333333078FF888880733
            0000333333777FF8888773330000333333307788887033330000333333330777
            7703333300003333333337000733333300003333333333333333333300003333
            33333333333333330000}
          OnClick = btnPesqClick
        end
        object mskDataHora: TMaskEdit
          Left = 122
          Top = 24
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 1
          Text = 'mskDataHora'
          OnExit = edtNumPedidoExit
        end
        object edtCliente: TNumberBox
          Left = 245
          Top = 24
          Width = 60
          Height = 21
          BiDiMode = bdRightToLeft
          CurrencyString = '0'
          ParentBiDiMode = False
          TabOrder = 2
          OnExit = edtClienteExit
        end
        object edtNumPedido: TNumberBox
          Left = 8
          Top = 24
          Width = 80
          Height = 21
          BiDiMode = bdRightToLeft
          CurrencyString = '0'
          ParentBiDiMode = False
          TabOrder = 0
          OnExit = edtNumPedidoExit
        end
      end
      object pnlResumo: TPanel
        Left = 0
        Top = 280
        Width = 659
        Height = 41
        Align = alBottom
        TabOrder = 2
        object btnSalvar: TSpeedButton
          Left = 481
          Top = 8
          Width = 80
          Height = 25
          Caption = 'Gravar'
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E00000000000000000000BFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000BFBFBFBFBFBFBFBFBF80008080008080008080008080008080
            0080800080800080800080800080800080800080800080BFBFBFBFBFBF000000
            007F7F007F7F000000000000000000000000000000000000BFBFBFBFBFBF0000
            00007F7F000000BFBFBFBFBFBF80008080008080008080008080008080008080
            0080800080800080BFBFBFBFBFBF800080800080800080BFBFBFBFBFBF000000
            007F7F007F7F000000000000000000000000000000000000BFBFBFBFBFBF0000
            00007F7F000000BFBFBFBFBFBF80008080008080008080008080008080008080
            0080800080800080BFBFBFBFBFBF800080800080800080BFBFBFBFBFBF000000
            007F7F007F7F000000000000000000000000000000000000BFBFBFBFBFBF0000
            00007F7F000000BFBFBFBFBFBF80008080008080008080008080008080008080
            0080800080800080BFBFBFBFBFBF800080800080800080BFBFBFBFBFBF000000
            007F7F007F7F0000000000000000000000000000000000000000000000000000
            00007F7F000000BFBFBFBFBFBF80008080008080008080008080008080008080
            0080800080800080800080800080800080800080800080BFBFBFBFBFBF000000
            007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
            7F007F7F000000BFBFBFBFBFBF80008080008080008080008080008080008080
            0080800080800080800080800080800080800080800080BFBFBFBFBFBF000000
            007F7F007F7F000000000000000000000000000000000000000000000000007F
            7F007F7F000000BFBFBFBFBFBF80008080008080008080008080008080008080
            0080800080800080800080800080800080800080800080BFBFBFBFBFBF000000
            007F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
            00007F7F000000BFBFBFBFBFBF800080800080800080BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF800080800080800080BFBFBFBFBFBF000000
            007F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
            00007F7F000000BFBFBFBFBFBF800080800080800080BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF800080800080800080BFBFBFBFBFBF000000
            007F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
            00007F7F000000BFBFBFBFBFBF800080800080800080BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF800080800080800080BFBFBFBFBFBF000000
            007F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
            00007F7F000000BFBFBFBFBFBF800080800080800080BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF800080800080800080BFBFBFBFBFBF000000
            007F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
            00000000000000BFBFBFBFBFBF800080800080800080BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF800080800080800080BFBFBFBFBFBF000000
            007F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000
            00BFBFBF000000BFBFBFBFBFBF800080800080800080BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF800080BFBFBF800080BFBFBFBFBFBF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000BFBFBFBFBFBF80008080008080008080008080008080008080
            0080800080800080800080800080800080800080800080BFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF}
          NumGlyphs = 2
          OnClick = btnSalvarClick
        end
        object btnExcluir: TSpeedButton
          Left = 567
          Top = 8
          Width = 80
          Height = 25
          Caption = 'Excluir'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
            03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
            33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
            0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
            3333333337FFF7F3333333333000003333333333377777333333}
          NumGlyphs = 2
          OnClick = btnExcluirClick
        end
        object Panel1: TPanel
          Left = 101
          Top = 1
          Width = 185
          Height = 39
          Align = alLeft
          BevelKind = bkFlat
          BevelOuter = bvLowered
          TabOrder = 0
          object lblTotal: TLabel
            Left = 1
            Top = 14
            Width = 179
            Height = 20
            Align = alClient
            Alignment = taRightJustify
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 138
            ExplicitWidth = 42
            ExplicitHeight = 23
          end
          object label4: TLabel
            Left = 1
            Top = 1
            Width = 179
            Height = 13
            Align = alTop
            Caption = 'Valor Total R$ '
            ExplicitWidth = 70
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 100
          Height = 39
          Align = alLeft
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 1
          object lblQtd: TLabel
            Left = 2
            Top = 15
            Width = 96
            Height = 22
            Align = alClient
            Alignment = taRightJustify
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 86
            ExplicitWidth = 12
            ExplicitHeight = 23
          end
          object Label3: TLabel
            Left = 2
            Top = 2
            Width = 96
            Height = 13
            Align = alTop
            Caption = 'Qtd. Itens'
            ExplicitWidth = 50
          end
        end
      end
      object pnlAddItem: TPanel
        Left = 0
        Top = 65
        Width = 659
        Height = 64
        Align = alTop
        Color = clWindow
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        object Label6: TLabel
          Left = 8
          Top = 20
          Width = 38
          Height = 13
          Caption = 'Produto'
          FocusControl = edtNumProd
        end
        object Label7: TLabel
          Left = 337
          Top = 20
          Width = 22
          Height = 13
          Caption = 'Qtd.'
          FocusControl = edtQuant
        end
        object Label8: TLabel
          Left = 400
          Top = 20
          Width = 34
          Height = 13
          Caption = 'Vl. Unit'
          FocusControl = edtValUnit
        end
        object Label9: TLabel
          Left = 483
          Top = 20
          Width = 24
          Height = 13
          Caption = 'Total'
          FocusControl = edtValTotal
        end
        object btnAddItem: TSpeedButton
          Left = 595
          Top = 36
          Width = 23
          Height = 22
          Enabled = False
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            700077777777777770007777700077777000777770C077777000777770C07777
            7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
            7000777770C07777700077777000777770007777777777777000777777777777
            7000}
          OnClick = btnAddItemClick
        end
        object btnDelItem: TSpeedButton
          Left = 624
          Top = 36
          Width = 23
          Height = 22
          Enabled = False
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7000777777777777700077777777777770007777777777777000777777777777
            70007700000000077000770CCCCCCC0770007700000000077000777777777777
            7000777777777777700077777777777770007777777777777000777777777777
            7000}
          OnClick = btnDelItemClick
        end
        object edtNumProd: TNumberBox
          Left = 6
          Top = 37
          Width = 60
          Height = 21
          BiDiMode = bdRightToLeft
          CurrencyString = '0'
          ParentBiDiMode = False
          TabOrder = 0
          OnExit = edtNumProdExit
        end
        object edtQuant: TNumberBox
          Left = 335
          Top = 37
          Width = 60
          Height = 21
          BiDiMode = bdRightToLeft
          CurrencyString = '0'
          Mode = nbmFloat
          ParentBiDiMode = False
          TabOrder = 2
          OnChange = edtQuantChange
          OnExit = edtNumProdExit
        end
        object edtValUnit: TNumberBox
          Left = 398
          Top = 37
          Width = 80
          Height = 21
          BiDiMode = bdRightToLeft
          Mode = nbmFloat
          ParentBiDiMode = False
          TabOrder = 3
          OnChange = edtQuantChange
          OnExit = edtNumProdExit
        end
        object edtValTotal: TNumberBox
          Left = 481
          Top = 37
          Width = 100
          Height = 21
          BiDiMode = bdRightToLeft
          Color = clScrollBar
          Mode = nbmFloat
          ParentBiDiMode = False
          TabOrder = 4
          OnKeyPress = edtValTotalKeyPress
        end
        object cbNomProd: TDBLookupComboBox
          Left = 70
          Top = 37
          Width = 262
          Height = 21
          KeyField = 'IDPRODUTO'
          ListField = 'DESCR_PROD'
          ListSource = DSProds
          TabOrder = 1
          OnExit = cbNomProdExit
        end
      end
      object DBGItens: TDBGrid
        Left = 0
        Top = 129
        Width = 659
        Height = 151
        Align = alClient
        DataSource = DSItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SIT_ITEM'
            Title.Caption = 'A'
            Width = 15
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODPROD_ITEM'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCR_PROD'
            Title.Caption = 'Produto'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_ITEM'
            Title.Caption = 'Quantidade'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLUNIT_ITEM'
            Title.Caption = 'Val. Unit.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLTOT_ITEM'
            Title.Caption = 'Total'
            Width = 80
            Visible = True
          end>
      end
      object cbNomCli: TDBLookupComboBox
        Left = 307
        Top = 24
        Width = 340
        Height = 21
        KeyField = 'IDCLIENTE'
        ListField = 'NOME_CLI'
        ListSource = DSCliente
        TabOrder = 4
        OnExit = cbNomCliExit
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 0
    Top = 369
    Width = 667
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
  end
  object DSItens: TDataSource
    DataSet = FDMemTabItens
    Left = 588
    Top = 284
  end
  object FDMemTabItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 524
    Top = 284
    object FDMemTabItensIDITEM: TIntegerField
      FieldName = 'IDITEM'
    end
    object FDMemTabItensNUMPED_ITEM: TIntegerField
      FieldName = 'NUMPED_ITEM'
    end
    object FDMemTabItensCODPROD_ITEM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPROD_ITEM'
    end
    object FDMemTabItensDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      Size = 60
    end
    object FDMemTabItensQTD_ITEM: TBCDField
      FieldName = 'QTD_ITEM'
      Size = 2
    end
    object FDMemTabItensVLUNIT_ITEM: TBCDField
      FieldName = 'VLUNIT_ITEM'
      Size = 2
    end
    object FDMemTabItensVLTOT_ITEM: TBCDField
      FieldName = 'VLTOT_ITEM'
      Size = 2
    end
    object FDMemTabItensSIT_ITEM: TStringField
      FieldName = 'SIT_ITEM'
      Size = 1
    end
  end
  object DSTabPeds: TDataSource
    DataSet = FDMemTabPeds
    Left = 588
    Top = 228
  end
  object FDMemTabPeds: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 524
    Top = 228
  end
  object FDMemTabCliente: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 36
    Top = 212
    object FDMemTabClienteIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
    end
    object FDMemTabClienteNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Size = 60
    end
  end
  object DSCliente: TDataSource
    DataSet = FDMemTabCliente
    Left = 100
    Top = 212
  end
  object FDMemTabProds: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 36
    Top = 268
    object FDMemTabProdsIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
    end
    object FDMemTabProdsDESCR_PROD: TStringField
      FieldName = 'DESCR_PROD'
      Size = 60
    end
    object FDMemTabProdsPVENDA_PROD: TBCDField
      FieldName = 'PVENDA_PROD'
      Size = 2
    end
  end
  object DSProds: TDataSource
    DataSet = FDMemTabProds
    Left = 100
    Top = 268
  end
end
