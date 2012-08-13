inherited frmTarifPlan: TfrmTarifPlan
  Left = 686
  Top = 173
  Caption = 'frmTarifPlan'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    DataSource = CustomerDM.ds1
    Columns = <
      item
        Expanded = False
        FieldName = 'TPTITLE'
        Width = 359
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    object lbl1: TLabel [0]
      Left = 48
      Top = 24
      Width = 80
      Height = 13
      Caption = #1058#1072#1088#1080#1092#1085#1099#1081' '#1087#1083#1072#1085
    end
    object edtTarifPlan: TEdit
      Left = 48
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtTarifPlan'
    end
  end
end
