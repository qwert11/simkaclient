object CustomerDM: TCustomerDM
  OldCreateOrder = False
  Left = 1451
  Top = 459
  Height = 482
  Width = 200
  object ibtblTarifPlan: TIBTable
    Database = MainForm.IBD
    Transaction = ibtrnsctn2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'TPID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TPTITLE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY8'
        Fields = 'TPID'
        Options = [ixPrimary, ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'TARIF_PLAN'
    Left = 32
    Top = 24
  end
  object ibtblOwner: TIBTable
    Database = MainForm.IBD
    Transaction = ibtrnsctn2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'OID'
        DataType = ftInteger
      end
      item
        Name = 'ONAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OIDPRSNL_ACNT'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'OID'
        Options = [ixPrimary, ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'OWNER'
    Left = 32
    Top = 72
  end
  object ibtblTDevice: TIBTable
    Database = MainForm.IBD
    Transaction = ibtrnsctn2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'TDID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TDTITLE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'TDID'
        Options = [ixPrimary, ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'TDEVICE'
    Left = 32
    Top = 128
  end
  object ibtblService: TIBTable
    Database = MainForm.IBD
    Transaction = ibtrnsctn2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'SRID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SRTITLE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY7'
        Fields = 'SRID'
        Options = [ixPrimary, ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'SERVICE'
    Left = 32
    Top = 296
  end
  object ibtblOperator: TIBTable
    Database = MainForm.IBD
    Transaction = ibtrnsctn2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'OPID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'OPTITLE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'OPID'
        Options = [ixPrimary, ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'OPERATOR'
    Left = 32
    Top = 184
    object intgrfldOperatorOPID: TIntegerField
      FieldName = 'OPID'
    end
    object ibstrngfldOperatorOPTITLE: TIBStringField
      FieldName = 'OPTITLE'
      Size = 30
    end
  end
  object ibtblTRlnShp: TIBTable
    Database = MainForm.IBD
    Transaction = ibtrnsctn2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'RID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RTITLE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY6'
        Fields = 'RID'
        Options = [ixPrimary, ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'RLTNSHP'
    Left = 32
    Top = 240
  end
  object ibtrnsctn2: TIBTransaction
    Active = False
    DefaultDatabase = MainForm.IBD
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 120
  end
  object ds1: TDataSource
    DataSet = ibtblTarifPlan
    Left = 80
    Top = 24
  end
  object ds2: TDataSource
    DataSet = ibtblOwner
    Left = 80
    Top = 72
  end
  object ds3: TDataSource
    DataSet = ibtblTDevice
    Left = 80
    Top = 128
  end
  object ds4: TDataSource
    DataSet = ibtblService
    Left = 80
    Top = 296
  end
  object ds5: TDataSource
    DataSet = ibtblOperator
    Left = 80
    Top = 184
  end
  object ds6: TDataSource
    DataSet = ibtblTRlnShp
    Left = 80
    Top = 240
  end
  object ibtblOPTION_SERVICE: TIBTable
    Database = MainForm.IBD
    Transaction = ibtrnsctn2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'OSID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'OSERVICEID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'OSCMID'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'OSID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN11'
        Fields = 'OSERVICEID'
      end>
    IndexFieldNames = 'OSERVICEID'
    MasterFields = 'SRID'
    MasterSource = ds4
    StoreDefs = True
    TableName = 'OPTION_SERVICE'
    Left = 32
    Top = 344
    object intgrfldOPTION_SERVICEOSID: TIntegerField
      FieldName = 'OSID'
      Required = True
    end
    object intgrfldOPTION_SERVICEOSERVICEID: TIntegerField
      FieldName = 'OSERVICEID'
      Required = True
    end
    object intgrfldOPTION_SERVICEOSCMID: TIntegerField
      FieldName = 'OSCMID'
    end
    object strngfldOPTION_SERVICECMD_MOX: TStringField
      FieldKind = fkLookup
      FieldName = 'CMD_MOX'
      LookupDataSet = ibtblCMD_MOX
      LookupKeyFields = 'CMID'
      LookupResultField = 'CMCOMMAND'
      KeyFields = 'OSCMID'
      Size = 50
      Lookup = True
    end
    object strngfldOPTION_SERVICECMD_TITLE: TStringField
      FieldKind = fkLookup
      FieldName = 'CMD_TITLE'
      LookupDataSet = ibtblCMD_MOX
      LookupKeyFields = 'CMID'
      LookupResultField = 'CMTITLE'
      KeyFields = 'OSCMID'
      Size = 30
      Lookup = True
    end
  end
  object ds7: TDataSource
    DataSet = ibtblOPTION_SERVICE
    Left = 80
    Top = 344
  end
  object ibtblCMD_MOX: TIBTable
    Database = MainForm.IBD
    Transaction = ibtrnsctn2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CMID'
        DataType = ftInteger
      end
      item
        Name = 'CMTITLE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CMCOMMAND'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY12'
        Fields = 'CMID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CMD_MOX'
    Left = 32
    Top = 392
  end
  object ds8: TDataSource
    DataSet = ibtblCMD_MOX
    Left = 80
    Top = 392
  end
end
