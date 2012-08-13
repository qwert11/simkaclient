program simka;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  CustomersGlobal in 'CustomersGlobal.pas',
  SetDateFrm in 'SetDateFrm.pas' {SetDateForm},
  DM in 'DM.pas' {CustomerDM: TDataModule},
  ChaildFrm in 'ChaildFrm.pas' {ChaildForm},
  TarifPlanFrm in 'TarifPlanFrm.pas' {frmTarifPlan},
  OwnerFrm in 'OwnerFrm.pas' {frmOwner},
  TDeviceFrm in 'TDeviceFrm.pas' {frmTDevice},
  ServiceFrm in 'ServiceFrm.pas' {frmService},
  OperatorFrm in 'OperatorFrm.pas' {frmOperator},
  TRlnShpFrm in 'TRlnShpFrm.pas' {frmTRlnShp},
  FunctionGlobal in 'FunctionGlobal.pas',
  CmdToMoxaFrm in 'CmdToMoxaFrm.pas' {frmCmdToMoxa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfrmCmdToMoxa, frmCmdToMoxa);
  //Application.CreateForm(TSetDateForm, SetDateForm);
  Application.CreateForm(TCustomerDM, CustomerDM);
  Application.CreateForm(TChaildForm, ChaildForm);
  Application.CreateForm(TfrmTarifPlan, frmTarifPlan);
  Application.CreateForm(TfrmOwner, frmOwner);
  Application.CreateForm(TfrmTDevice, frmTDevice);
  Application.CreateForm(TfrmService, frmService);
  Application.CreateForm(TfrmOperator, frmOperator);
  Application.CreateForm(TfrmTRlnShp, frmTRlnShp);
  Application.Run;
end.
