inherited frmOperator: TfrmOperator
  Left = 491
  Top = 355
  Caption = 'frmOperator'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrd1: TDBGrid
    DataSource = CustomerDM.ds5
    Columns = <
      item
        Expanded = False
        FieldName = 'OPTITLE'
        Width = 381
        Visible = True
      end>
  end
  inherited pnl1: TPanel
    object lbl1: TLabel [0]
      Left = 32
      Top = 32
      Width = 82
      Height = 13
      Caption = #1054#1087#1077#1088#1072#1090#1086#1088' '#1089#1074#1103#1079#1080
    end
    object edtOperator: TEdit
      Left = 32
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtOperator'
    end
  end
end
