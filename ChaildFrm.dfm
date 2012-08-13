object ChaildForm: TChaildForm
  Left = 756
  Top = 150
  Width = 480
  Height = 408
  Caption = 'ChaildForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 0
    Top = 0
    Width = 472
    Height = 272
    Align = alClient
    PopupMenu = pm1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrd1DblClick
  end
  object pnl1: TPanel
    Left = 0
    Top = 272
    Width = 472
    Height = 90
    Align = alBottom
    TabOrder = 1
    object btn2: TBitBtn
      Left = 376
      Top = 56
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkCancel
    end
    object btn1: TBitBtn
      Left = 288
      Top = 56
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkOK
    end
    object btnSave: TButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 3
      OnClick = btnCancelClick
    end
  end
  object mm1: TMainMenu
    Left = 240
    Top = 144
    object File1: TMenuItem
      Caption = 'File'
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      OnClick = Edit1Click
    end
    object Insert1: TMenuItem
      Caption = 'Insert'
      OnClick = Insert1Click
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object ibqry1: TIBQuery
    Database = MainForm.IBD
    Transaction = ibtrnsctn1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 264
    Top = 88
  end
  object ibtrnsctn1: TIBTransaction
    Active = False
    DefaultDatabase = MainForm.IBD
    AutoStopAction = saNone
    Left = 304
    Top = 88
  end
  object pm1: TPopupMenu
    Left = 280
    Top = 144
    object Edit2: TMenuItem
      Caption = 'Edit'
      OnClick = Edit1Click
    end
    object Insert2: TMenuItem
      Caption = 'Insert'
      OnClick = Insert1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Delete2: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object actlst1: TActionList
    Left = 336
    Top = 144
    object act1: TAction
      Caption = 'act1'
    end
  end
end
