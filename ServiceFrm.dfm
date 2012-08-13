inherited frmService: TfrmService
  Left = 553
  Top = 188
  Width = 561
  Height = 643
  Caption = 'frmService'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    Width = 553
    Height = 318
    DataSource = CustomerDM.ds4
    Columns = <
      item
        Expanded = False
        FieldName = 'SRID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRTITLE'
        Width = 393
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    Top = 318
    Width = 553
    Height = 74
    object lbl1: TLabel [0]
      Left = 24
      Top = 24
      Width = 38
      Height = 13
      Caption = #1057#1083#1091#1078#1073#1072
    end
    inherited btnSave: TButton [1]
      Left = 296
      TabOrder = 0
    end
    inherited btnCancel: TButton [2]
      Left = 384
      TabOrder = 1
    end
    object edtService: TEdit [3]
      Left = 24
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edtService'
    end
    inherited btn2: TBitBtn [4]
      Left = 384
      Top = 34
      TabOrder = 3
    end
    inherited btn1: TBitBtn [5]
      Left = 296
      Top = 34
      TabOrder = 4
    end
  end
  object dbgrd2: TDBGrid [2]
    Left = 0
    Top = 392
    Width = 553
    Height = 120
    Align = alBottom
    DataSource = CustomerDM.ds7
    PopupMenu = pm2
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CMD_TITLE'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CMD_MOX'
        Width = 298
        Visible = True
      end>
  end
  object pnl2: TPanel [3]
    Left = 0
    Top = 512
    Width = 553
    Height = 85
    Align = alBottom
    TabOrder = 3
    object lbl2: TLabel
      Left = 24
      Top = 40
      Width = 106
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    end
    object lbl3: TLabel
      Left = 240
      Top = 40
      Width = 89
      Height = 13
      Caption = #1050#1086#1084#1072#1085#1076#1072' '#1082' '#1084#1086#1082#1089#1077
    end
    object btnCMD_MOX: TSpeedButton
      Left = 512
      Top = 56
      Width = 23
      Height = 22
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FF3F96BD0076A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7EBAD30078AB0078ABFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF007BAE00B7EB007BAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7EBDD600A5D900B8EC00
        7EB1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0081B400BAEE00B8EC0081B4FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7EC0D907AADC06
        B9EB0ABCED0085B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3FA5CB
        0089BC0089BC0089BC0089BC099CCE05AFE20BB7E818C0EE0089BCFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF7EC4DD1CB3E01BC0EE1BC0EE1BC0EE14BBEA0B
        B2E300A9DD0EB5E52AC5EF008DC0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0092C532CBF232CAF238CFF446D7FA4FDDFE4FDDFE48D8FB45D7FA3DCCF10092
        C5FF00FFFF00FFFF00FFFF00FFFF00FF7EC8E237BDE56EE5FF6EE5FF6EE5FFA5
        F2FFDDFFFFDDFFFFDDFFFFDDFFFFA5E5F20096CAFF00FFFF00FFFF00FFFF00FF
        FF00FF009ACE89ECFF89ECFF89ECFF89ECFF66D8F322AEDA009ACE009ACE009A
        CE009ACE3FB1D8FF00FFFF00FFFF00FFFF00FF7ECCE651C9E9A3F2FFA3F2FFA3
        F2FFA3F2FF7ADDF4009ED2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00A1D5BAF7FFBAF7FFBAF7FFBAF7FFBAF7FF8BE2F400A1D5FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7ECFE967D1ECCFFCFFCF
        FCFFCFFCFFCFFCFFCFFCFF9AE6F500A4D8FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00A7DBDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFA5E9
        F600A7DBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7ED2EC16B2E036
        BEE657CCEB6ED5EE6ED5EE57CCEB36BEE616B2E03FBDE4FF00FF}
      OnClick = btnCMD_MOXClick
    end
    object edtInstruction: TEdit
      Left = 240
      Top = 56
      Width = 257
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = 'edtInstruction'
    end
    object dblkcbbOption: TDBLookupComboBox
      Left = 24
      Top = 56
      Width = 193
      Height = 21
      KeyField = 'CMID'
      ListField = 'CMTITLE'
      ListSource = CustomerDM.ds8
      TabOrder = 1
      OnClick = dblkcbbOptionClick
    end
    object btnEditOptServis: TButton
      Left = 208
      Top = 8
      Width = 80
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 2
      OnClick = btnEditOptServisClick
    end
    object btnInsOptServis: TButton
      Left = 296
      Top = 8
      Width = 80
      Height = 25
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      TabOrder = 3
      OnClick = btnInsOptServisClick
    end
    object btnDelOptServis: TButton
      Left = 384
      Top = 8
      Width = 80
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 4
      OnClick = btnDelOptServisClick
    end
  end
  object pm2: TPopupMenu [8]
    Left = 296
    Top = 448
    object Edit3: TMenuItem
      Caption = 'Edit'
      OnClick = btnEditOptServisClick
    end
    object Insert3: TMenuItem
      Caption = 'Insert'
      OnClick = btnInsOptServisClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Delete3: TMenuItem
      Caption = 'Delete'
      OnClick = btnDelOptServisClick
    end
  end
end
