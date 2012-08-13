inherited frmOwner: TfrmOwner
  Left = 745
  Top = 423
  Caption = 'frmOwner'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    Height = 286
    DataSource = CustomerDM.ds2
    Columns = <
      item
        Expanded = False
        FieldName = 'ONAME'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OIDPRSNL_ACNT'
        Width = 192
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    Top = 286
    Height = 76
    object lbl1: TLabel [0]
      Left = 16
      Top = 16
      Width = 107
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1083#1072#1076#1077#1083#1100#1094#1072
    end
    object lbl2: TLabel [1]
      Left = 16
      Top = 48
      Width = 92
      Height = 13
      Caption = #8470' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
    end
    inherited btn2: TBitBtn
      Top = 40
    end
    inherited btn1: TBitBtn
      Top = 40
    end
    object edtName: TEdit [4]
      Left = 128
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edtName'
    end
    object edtIDPrsnl_Acnt: TEdit [5]
      Left = 128
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edtIDPrsnl_Acnt'
    end
    inherited btnSave: TButton
      TabOrder = 4
    end
    inherited btnCancel: TButton
      TabOrder = 5
    end
  end
end
