inherited frmTDevice: TfrmTDevice
  Caption = 'frmTDevice'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    DataSource = CustomerDM.ds3
    Columns = <
      item
        Expanded = False
        FieldName = 'TDTITLE'
        Width = 385
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    object lbl1: TLabel [0]
      Left = 24
      Top = 32
      Width = 79
      Height = 13
      Caption = #1058#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
    end
    object edtTDevice: TEdit
      Left = 24
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtTDevice'
    end
  end
end
