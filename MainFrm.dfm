object MainForm: TMainForm
  Left = 127
  Top = 170
  Width = 1537
  Height = 711
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 0
    Top = 0
    Width = 1529
    Height = 544
    Align = alClient
    DataSource = ds1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrd1DrawColumnCell
    OnKeyPress = dbgrd1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'SPHONE_NMBR'
        Title.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPTITLE'
        Title.Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RTITLE'
        Title.Caption = #1042#1080#1076' '#1089#1074#1103#1079#1080
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OIDPRSNL_ACNT'
        Title.Caption = #8470' '#1083#1080#1094'.'#1089#1095'.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SICC_SIM'
        Title.Caption = 'ICC_SIM'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPUK1'
        Title.Caption = 'PUK1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPUK2'
        Title.Caption = 'PUK2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPTITLE'
        Title.Caption = #1058#1072#1088#1080#1092#1085'.'#1087#1083#1072#1085
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SACTIVE'
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPAYMENT'
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCLIR'
        Title.Caption = #1040#1085#1090#1080' '#1086#1087#1088#1077#1076'.'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCLIR_PRICE'
        Title.Caption = #1040#1085#1090#1080' '#1086#1087#1088'. '#1094#1077#1085#1072
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ONAME'
        Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRTITLE'
        Title.Caption = #1057#1083#1091#1078#1073#1072
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDTITLE'
        Title.Caption = #1056#1086#1083#1100
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINSTALL'
        Title.Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRADRSNG_ALL'
        Title.Caption = #1055#1077#1088#1077#1072#1076#1088'. '#1074#1089#1077#1093
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNUM_RADRSNG_ALL'
        Title.Caption = #1053#1086#1084'. '#1087#1077#1088#1077#1072#1076#1088'.'#1074#1089#1077
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRADRSNG_BUSY'
        Title.Caption = #1055#1077#1088#1077#1072#1076#1088'.'#1079#1072#1085#1103#1090
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNUM_RADRSNG_BUSY'
        Title.Caption = #1053#1086#1084'. '#1087#1077#1088#1077#1072#1076#1088'.'#1079#1072#1085#1103#1090
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRADRSNG_NOANSWR'
        Title.Caption = #1055#1077#1088#1077#1072#1076#1088'. '#1085#1077#1090' '#1086#1090#1074#1077#1090#1072
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNUM_RADRSNG_NOANSWR'
        Title.Caption = #1053#1086#1084'. '#1087#1077#1088#1077#1072#1076#1088'.'#1085#1077#1090' '#1086#1090#1074'.'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRADRSNG_OUTSD'
        Title.Caption = #1055#1077#1088#1077#1072#1076#1088'. '#1074#1085#1077' '#1079#1086#1085#1099
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNUM_ADRSNG_OUTSD'
        Title.Caption = #1053#1086#1084'.'#1087#1077#1088'.'#1074#1085#1077' '#1079#1086#1085#1099
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 544
    Width = 1529
    Height = 121
    Align = alBottom
    TabOrder = 1
    object btnTestCountTransact: TButton
      Left = 128
      Top = 16
      Width = 121
      Height = 25
      Caption = 'btnTestCountTransact'
      TabOrder = 0
      OnClick = btnTestCountTransactClick
    end
    object btnNew: TButton
      Left = 16
      Top = 16
      Width = 90
      Height = 25
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      TabOrder = 1
      OnClick = btnNewClick
    end
    object btnEdit: TButton
      Left = 16
      Top = 80
      Width = 90
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TButton
      Left = 16
      Top = 48
      Width = 90
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = btnDeleteClick
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 665
    Width = 1529
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object IBD: TIBDatabase
    DatabaseName = '192.168.1.153:D:\SERVER\MOXA.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = ibtrnsDel
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 64
    Top = 40
  end
  object ibqAllNum: TIBQuery
    Database = IBD
    Transaction = ibTrnsctn
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      '    simka.sphone_nmbr,'
      '    operator.optitle,'
      '    owner.oname,'
      '    owner.oidprsnl_acnt,'
      '    tdevice.tdtitle,'
      '    tarif_plan.tptitle,'
      '    rltnshp.rtitle,'
      '    service.srtitle,'
      '    simka.sicc_sim,'
      '    simka.spuk1,'
      '    simka.spuk2,'
      '    simka.sactive,'
      '    simka.spayment,'
      '    simka.sclir,'
      '    simka.sclir_price,'
      '    simka.sinstall,'
      '    simka.sradrsng_all,'
      '    simka.snum_radrsng_all,'
      '    simka.sradrsng_busy,'
      '    simka.snum_radrsng_busy,'
      '    simka.sradrsng_noanswr,'
      '    simka.snum_radrsng_noanswr,'
      '    simka.sradrsng_outsd,'
      '    simka.sid,'
      '    operator.opid,'
      '    tdevice.tdid,'
      '    rltnshp.rid,'
      '    tarif_plan.tpid,'
      '    owner.oid,'
      '    service.srid,'
      '    simka.snum_adrsng_outsd'
      'from tdevice'
      '   right outer join simka on (tdevice.tdid = simka.st_device)'
      '   left outer join operator on (simka.soperator = operator.opid)'
      '   left outer join owner on (simka.sowner = owner.oid)'
      
        '   left outer join tarif_plan on (simka.starif_plan = tarif_plan' +
        '.tpid)'
      '   left outer join rltnshp on (simka.st_rlnshp = rltnshp.rid)'
      '   left outer join service on (simka.sservice = service.srid)')
    Left = 24
    Top = 128
    object ibstrngfldAllNumSPHONE_NMBR: TIBStringField
      FieldName = 'SPHONE_NMBR'
      Origin = 'SIMKA.SPHONE_NMBR'
      Required = True
      Size = 12
    end
    object ibstrngfldAllNumOPTITLE: TIBStringField
      FieldName = 'OPTITLE'
      Origin = 'OPERATOR.OPTITLE'
      Size = 30
    end
    object ibstrngfldAllNumONAME: TIBStringField
      FieldName = 'ONAME'
      Origin = 'OWNER.ONAME'
      Size = 50
    end
    object ibstrngfldAllNumOIDPRSNL_ACNT: TIBStringField
      FieldName = 'OIDPRSNL_ACNT'
      Origin = 'OWNER.OIDPRSNL_ACNT'
    end
    object ibstrngfldAllNumTDTITLE: TIBStringField
      FieldName = 'TDTITLE'
      Origin = 'TDEVICE.TDTITLE'
      Size = 25
    end
    object ibstrngfldAllNumTPTITLE: TIBStringField
      FieldName = 'TPTITLE'
      Origin = 'TARIF_PLAN.TPTITLE'
      Size = 25
    end
    object ibstrngfldAllNumRTITLE: TIBStringField
      FieldName = 'RTITLE'
      Origin = 'RLTNSHP.RTITLE'
      Size = 15
    end
    object ibstrngfldAllNumSRTITLE: TIBStringField
      FieldName = 'SRTITLE'
      Origin = 'SERVICE.SRTITLE'
      Size = 35
    end
    object ibstrngfldAllNumSICC_SIM: TIBStringField
      FieldName = 'SICC_SIM'
      Origin = 'SIMKA.SICC_SIM'
      Size = 19
    end
    object ibstrngfldAllNumSPUK1: TIBStringField
      FieldName = 'SPUK1'
      Origin = 'SIMKA.SPUK1'
      Size = 8
    end
    object ibstrngfldAllNumSPUK2: TIBStringField
      FieldName = 'SPUK2'
      Origin = 'SIMKA.SPUK2'
      Size = 8
    end
    object ibstrngfldAllNumSACTIVE: TIBStringField
      FieldName = 'SACTIVE'
      Origin = 'SIMKA.SACTIVE'
      Size = 1
    end
    object ibcdfldAllNumSPAYMENT: TIBBCDField
      FieldName = 'SPAYMENT'
      Origin = 'SIMKA.SPAYMENT'
      Precision = 18
      Size = 4
    end
    object ibstrngfldAllNumSCLIR: TIBStringField
      FieldName = 'SCLIR'
      Origin = 'SIMKA.SCLIR'
      Size = 1
    end
    object ibcdfldAllNumSCLIR_PRICE: TIBBCDField
      FieldName = 'SCLIR_PRICE'
      Origin = 'SIMKA.SCLIR_PRICE'
      Precision = 18
      Size = 4
    end
    object ibstrngfldAllNumSINSTALL: TIBStringField
      FieldName = 'SINSTALL'
      Origin = 'SIMKA.SINSTALL'
      Size = 1
    end
    object ibstrngfldAllNumSRADRSNG_ALL: TIBStringField
      FieldName = 'SRADRSNG_ALL'
      Origin = 'SIMKA.SRADRSNG_ALL'
      Size = 1
    end
    object ibstrngfldAllNumSNUM_RADRSNG_ALL: TIBStringField
      FieldName = 'SNUM_RADRSNG_ALL'
      Origin = 'SIMKA.SNUM_RADRSNG_ALL'
      Size = 12
    end
    object ibstrngfldAllNumSRADRSNG_BUSY: TIBStringField
      FieldName = 'SRADRSNG_BUSY'
      Origin = 'SIMKA.SRADRSNG_BUSY'
      Size = 1
    end
    object ibstrngfldAllNumSNUM_RADRSNG_BUSY: TIBStringField
      FieldName = 'SNUM_RADRSNG_BUSY'
      Origin = 'SIMKA.SNUM_RADRSNG_BUSY'
      Size = 12
    end
    object ibstrngfldAllNumSRADRSNG_NOANSWR: TIBStringField
      FieldName = 'SRADRSNG_NOANSWR'
      Origin = 'SIMKA.SRADRSNG_NOANSWR'
      Size = 1
    end
    object ibstrngfldAllNumSNUM_RADRSNG_NOANSWR: TIBStringField
      FieldName = 'SNUM_RADRSNG_NOANSWR'
      Origin = 'SIMKA.SNUM_RADRSNG_NOANSWR'
      Size = 12
    end
    object ibstrngfldAllNumSRADRSNG_OUTSD: TIBStringField
      FieldName = 'SRADRSNG_OUTSD'
      Origin = 'SIMKA.SRADRSNG_OUTSD'
      Size = 1
    end
    object ibstrngfldAllNumSNUM_ADRSNG_OUTSD: TIBStringField
      FieldName = 'SNUM_ADRSNG_OUTSD'
      Origin = 'SIMKA.SNUM_ADRSNG_OUTSD'
      Size = 12
    end
    object intgrfldAllNumSID: TIntegerField
      FieldName = 'SID'
      Origin = 'SIMKA.SID'
      Required = True
    end
    object intgrfldAllNumOPID: TIntegerField
      FieldName = 'OPID'
      Origin = 'OPERATOR.OPID'
    end
    object intgrfldAllNumTDID: TIntegerField
      FieldName = 'TDID'
      Origin = 'TDEVICE.TDID'
    end
    object intgrfldAllNumRID: TIntegerField
      FieldName = 'RID'
      Origin = 'RLTNSHP.RID'
    end
    object intgrfldAllNumTPID: TIntegerField
      FieldName = 'TPID'
      Origin = 'TARIF_PLAN.TPID'
    end
    object intgrfldAllNumOID: TIntegerField
      FieldName = 'OID'
      Origin = 'OWNER.OID'
    end
    object intgrfldAllNumSRID: TIntegerField
      FieldName = 'SRID'
      Origin = 'SERVICE.SRID'
    end
  end
  object ds1: TDataSource
    DataSet = ibqAllNum
    Left = 64
    Top = 128
  end
  object ibTrnsctn: TIBTransaction
    Active = False
    DefaultDatabase = IBD
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 104
    Top = 128
  end
  object ibqry2: TIBQuery
    Database = IBD
    Transaction = ibtrnsDel
    BufferChunks = 1000
    CachedUpdates = False
    Left = 136
    Top = 640
  end
  object ibtrnsDel: TIBTransaction
    Active = False
    DefaultDatabase = IBD
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 176
    Top = 640
  end
end
