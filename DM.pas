unit DM;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, IBTable;

type
  TCustomerDM = class(TDataModule)
    ibtblTarifPlan: TIBTable;
    ibtblOwner: TIBTable;
    ibtblTDevice: TIBTable;
    ibtblService: TIBTable;
    ibtblOperator: TIBTable;
    ibtblTRlnShp: TIBTable;
    ibtrnsctn2: TIBTransaction;
    ds1: TDataSource;
    ds2: TDataSource;
    ds3: TDataSource;
    ds4: TDataSource;
    ds5: TDataSource;
    ds6: TDataSource;
    intgrfldOperatorOPID: TIntegerField;
    ibstrngfldOperatorOPTITLE: TIBStringField;
    ibtblOPTION_SERVICE: TIBTable;
    ds7: TDataSource;
    ibtblCMD_MOX: TIBTable;
    ds8: TDataSource;
    intgrfldOPTION_SERVICEOSID: TIntegerField;
    intgrfldOPTION_SERVICEOSERVICEID: TIntegerField;
    intgrfldOPTION_SERVICEOSCMID: TIntegerField;
    strngfldOPTION_SERVICECMD_MOX: TStringField;
    strngfldOPTION_SERVICECMD_TITLE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerDM: TCustomerDM;

implementation

uses MainFrm;

{$R *.dfm}

end.
