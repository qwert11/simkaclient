inherited frmTRlnShp: TfrmTRlnShp
  Caption = 'frmTRlnShp'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    DataSource = CustomerDM.ds6
    Columns = <
      item
        Expanded = False
        FieldName = 'RTITLE'
        Width = 384
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    object lbl1: TLabel [0]
      Left = 24
      Top = 32
      Width = 52
      Height = 13
      Caption = #1042#1080#1076' '#1089#1074#1103#1079#1080
    end
    object edtRltnShip: TEdit
      Left = 24
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtRltnShip'
    end
  end
end
