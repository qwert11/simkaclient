inherited frmCmdToMoxa: TfrmCmdToMoxa
  Height = 421
  Caption = 'frmCmdToMoxa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    DataSource = CustomerDM.ds8
    ReadOnly = True
  end
  inherited pnl1: TPanel
    Height = 103
    object lbl1: TLabel [0]
      Left = 16
      Top = 8
      Width = 99
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1084#1072#1085#1076#1099
    end
    object lbl2: TLabel [1]
      Left = 16
      Top = 56
      Width = 45
      Height = 13
      Caption = #1050#1086#1084#1072#1085#1076#1072
    end
    inherited btn2: TBitBtn
      Top = 72
    end
    inherited btn1: TBitBtn
      Top = 72
    end
    inherited btnSave: TButton
      Top = 24
    end
    inherited btnCancel: TButton
      Top = 24
    end
    object edtCMTITLE: TEdit
      Left = 16
      Top = 24
      Width = 145
      Height = 21
      TabOrder = 4
      Text = 'edtCMTITLE'
    end
    object edtCMCOMMAND: TEdit
      Left = 16
      Top = 72
      Width = 233
      Height = 21
      TabOrder = 5
      Text = 'edtCMCOMMAND'
    end
  end
end
