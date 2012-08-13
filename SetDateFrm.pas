unit SetDateFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBTable, DBCtrls,
  ImgList, IBDatabase, IBQuery, ActnList, AppEvnts;

type
  TSetDate = (stNew, stEdit);         { TODO 1 -oBefoEdt...Insert -cмаска : защитить такие компоненты как edit(с маской ввода по событию) от Insert }

  TSetDateForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtPhoneNmbr: TEdit;
    edtIDPrsnl_Acnt: TEdit;
    edtSICC_SIM: TEdit;
    lbl7: TLabel;
    edtPUK1: TEdit;
    edtPUK2: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    chkActive: TCheckBox;
    edtPaymend: TEdit;
    lbl10: TLabel;
    chCLIR: TCheckBox;
    edtCLIR_Price: TEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    btn1: TBitBtn;
    btnSTarifPlan: TSpeedButton;
    il1: TImageList;
    dblkcbbSTarifPlan: TDBLookupComboBox;
    btnSOwner: TSpeedButton;
    btnSService: TSpeedButton;
    btnSTDevice: TSpeedButton;
    btnSOperator: TSpeedButton;
    btnSTRlnShp: TSpeedButton;
    dblkcbbSOwner: TDBLookupComboBox;
    dblkcbbSService: TDBLookupComboBox;
    dblkcbbSTDevice: TDBLookupComboBox;
    dblkcbbSOperator: TDBLookupComboBox;
    dblkcbbSTRlnShp: TDBLookupComboBox;
    btn2: TBitBtn;
    ibqrySetData: TIBQuery;
    ibtrnsctnSetData: TIBTransaction;
    chkInstall: TCheckBox;
    chkSRADRSNG_ALL: TCheckBox;
    edtNUM_SRADRSNG_ALL: TEdit;
    chkSRADRSNG_BUSY: TCheckBox;
    edtNUM_SRADRSNG_BUSY: TEdit;
    chkSRADRSNG_NOANSWR: TCheckBox;
    edtSNUM_RADRSNG_NOANSWR: TEdit;
    chkSRADRSNG_OUTSD: TCheckBox;
    edtSNUM_RADRSNG_OUTSD: TEdit;
    aplctnvnts1: TApplicationEvents;
    btnReset: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSOperatorClick(Sender: TObject);
    procedure btnSTRlnShpClick(Sender: TObject);
    procedure btnSTarifPlanClick(Sender: TObject);
    procedure btnSOwnerClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edtPaymendChange(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure edtPhoneNmbrKeyPress(Sender: TObject; var Key: Char);
    procedure edtPaymendKeyPress(Sender: TObject; var Key: Char);
    procedure edtPhoneNmbrChange(Sender: TObject);
    procedure edtCheckedChange(Sender: TObject);
    procedure btnSServiceClick(Sender: TObject);
    procedure btnSTDeviceClick(Sender: TObject);
    procedure dblkcbbSOwnerClick(Sender: TObject);
    procedure aplctnvnts1Idle(Sender: TObject; var Done: Boolean);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
    FSetDate: TSetDate;
    procedure CompareData;
  public
    { Public declarations }
    constructor Create(SetDate: TSetDate; AOwner: TComponent); reintroduce;
  end;

var
  SetDateForm: TSetDateForm;

implementation

uses MainFrm, DM, OperatorFrm, OwnerFrm, ServiceFrm, TarifPlanFrm,
  TDeviceFrm, TRlnShpFrm, FunctionGlobal;

{$R *.dfm}

{ TSetDateForm }



{ TSetDateForm }

constructor TSetDateForm.Create(SetDate: TSetDate; AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSetDate := SetDate;
end;

procedure TSetDateForm.FormActivate(Sender: TObject);
begin
  with CustomerDM do
  begin
    ibtblTarifPlan.Open;
    ibtblOwner.Open;
    ibtblTDevice.Open;
    ibtblService.Open;
    ibtblOperator.Open;
    ibtblTRlnShp.Open;
    ibtblOPTION_SERVICE.Open;
    ibtblCMD_MOX.Open;
  end;


end;

procedure TSetDateForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  case FSetDate of
    stNew:
      begin
        Caption := DateToStr(Date) + ' Новая запись';
        for I := 0 to ComponentCount - 1 do
          if Components[I] is TEdit then
            (Components[I] as TEdit).Clear;
      end;
    stEdit:
      with MainForm do
      begin
        (Sender as TForm).Caption := DateToStr(Date) + ' Редактирование записи № ' +
          MainForm.ibqAllNum.FieldByName('SID').AsString;

        btnReset.Visible := True;
        btnResetClick(nil);
        
        // запускаем проверку на изменение данных
        Application.OnIdle := aplctnvnts1Idle;
      end;

  end;
end;

//установка TDBLookupComboBox от TIBTable
procedure SetDblkCbbFrom_IbTbl_Frm(Frm: TForm; Cbb: TDBLookupComboBox; tbl: TIBTable);
begin
  Frm.ShowModal;
  with CustomerDM, Cbb, tbl do
  if Frm.ModalResult = mrOk then
    KeyValue := Fields[0].AsInteger
  else
    KeyValue := null
end;

procedure TSetDateForm.btnSOperatorClick(Sender: TObject);
begin
  SetDblkCbbFrom_IbTbl_Frm(frmOperator, dblkcbbSOperator, CustomerDM.ibtblOperator);
end;

procedure TSetDateForm.btnSTRlnShpClick(Sender: TObject);
begin
  SetDblkCbbFrom_IbTbl_Frm(frmTRlnShp, dblkcbbSTRlnShp, CustomerDM.ibtblTRlnShp)
end;

procedure TSetDateForm.btnSTarifPlanClick(Sender: TObject);
begin
  SetDblkCbbFrom_IbTbl_Frm(frmTarifPlan, dblkcbbSTarifPlan, CustomerDM.ibtblTarifPlan)
end;

procedure TSetDateForm.btnSServiceClick(Sender: TObject);
begin
  SetDblkCbbFrom_IbTbl_Frm(frmService, dblkcbbSService, CustomerDM.ibtblService)
end;

procedure TSetDateForm.btnSTDeviceClick(Sender: TObject);
begin
  SetDblkCbbFrom_IbTbl_Frm(frmTDevice, dblkcbbSTDevice, CustomerDM.ibtblTDevice)
end;

procedure TSetDateForm.btnSOwnerClick(Sender: TObject);
begin
  frmOwner.ShowModal;
  with CustomerDM do
  if frmOwner.ModalResult = mrOk then begin
    dblkcbbSOwner.KeyValue := ibtblOwner.Fields[0].AsInteger;
    edtIDPrsnl_Acnt.Text := ibtblOwner.FieldByName('OIDPRSNL_ACNT').AsString
  end else begin
    dblkcbbSOwner.KeyValue := null;
    edtIDPrsnl_Acnt.Text := ''
  end;

end;

procedure TSetDateForm.btn1Click(Sender: TObject);
var
  s: string;
begin
  ModalResult := 0;
  { TODO 3 -omrOk -ccorrectness : проверка на корректность введенных данных }
  if Length(edtPhoneNmbr.Text) < 5 then
    Exit; 
  with ibqrySetData, ibtrnsctnSetData do
  try

    case FSetDate of
      stNew:
        SQL.Text := 'INSERT INTO SIMKA (SPHONE_NMBR, SOPERATOR, ST_RLNSHP, SICC_SIM, SPUK1, SPUK2, STARIF_PLAN, SACTIVE, SPAYMENT, SCLIR, SCLIR_PRICE, ST_DEVICE, SINSTALL, SOWNER, ' +
        'SRADRSNG_ALL, SNUM_RADRSNG_ALL, SRADRSNG_BUSY, SNUM_RADRSNG_BUSY, SRADRSNG_NOANSWR, SNUM_RADRSNG_NOANSWR, SRADRSNG_OUTSD, SNUM_ADRSNG_OUTSD, SSERVICE)' +
        'VALUES (''' +
          edtPhoneNmbr.Text +
          ''',' + ToStrNull(dblkcbbSOperator.KeyValue) + ', ' + ToStrNull(dblkcbbSTRlnShp.KeyValue) +
          ',''' + edtSICC_SIM.Text + ''',''' + edtPUK1.Text + ''',''' +
          edtPUK2.Text + ''',' + ToStrNull(dblkcbbSTarifPlan.KeyValue) + ',''' +
          BoolToChar(chkActive.Checked) + ''',' + ToStrPoint(edtPaymend.Text) + ',''' +
          BoolToChar(chCLIR.Checked) + ''',' + ToStrPoint(edtCLIR_Price.Text) + ',' +
          ToStrNull(dblkcbbSTDevice.KeyValue) + ',''' + BoolToChar(chkInstall.Checked) + ''',' +
          ToStrNull(dblkcbbSOwner.KeyValue) +
          ',''' + BoolToChar(chkSRADRSNG_ALL.Checked) + ''',''' + edtNUM_SRADRSNG_ALL.Text +
          ''', ''' + BoolToChar(chkSRADRSNG_BUSY.Checked) + ''', ''' + edtNUM_SRADRSNG_BUSY.Text +
          ''', ''' + BoolToChar(chkSRADRSNG_NOANSWR.Checked) + ''', ''' + edtSNUM_RADRSNG_NOANSWR.Text +
          ''', ''' + BoolToChar(chkSRADRSNG_OUTSD.Checked) + ''', ''' + edtSNUM_RADRSNG_OUTSD.Text +
          ''', ' + ToStrNull(dblkcbbSService.KeyValue)
        + ')';

      stEdit: SQL.Text := 'UPDATE SIMKA SET SPHONE_NMBR = ''' + edtPhoneNmbr.Text +
        ''', SOPERATOR = ' + ToStrNull(dblkcbbSOperator.KeyValue) + ', ST_RLNSHP = ' + ToStrNull(dblkcbbSTRlnShp.KeyValue) +
        ', SICC_SIM = ''' + edtSICC_SIM.Text + ''', SPUK1 = ''' + edtPUK1.Text + ''', SPUK2 = ''' +
        edtPUK2.Text + ''', STARIF_PLAN = ' + ToStrNull(dblkcbbSTarifPlan.KeyValue) + ', SACTIVE = ''' +
        BoolToChar(chkActive.Checked) + ''', SPAYMENT = ' + ToStrNull(edtPaymend.Text) + ', SCLIR = ''' +
        BoolToChar(chCLIR.Checked) + ''', SCLIR_PRICE = ' + ToStrNull(edtCLIR_Price.Text) + ', ST_DEVICE = ' +
        ToStrNull(dblkcbbSTDevice.KeyValue) + ', SINSTALL = ''' + BoolToChar(chkInstall.Checked) + ''', SOWNER = ' +
        ToStrNull(dblkcbbSOwner.KeyValue) +
        ', SRADRSNG_ALL = ''' + BoolToChar(chkSRADRSNG_ALL.Checked) + ''', SNUM_RADRSNG_ALL = ''' + edtNUM_SRADRSNG_ALL.Text +
        ''', SRADRSNG_BUSY = ''' + BoolToChar(chkSRADRSNG_BUSY.Checked) + ''', SNUM_RADRSNG_BUSY = ''' + edtNUM_SRADRSNG_BUSY.Text +
        ''', SRADRSNG_NOANSWR = ''' + BoolToChar(chkSRADRSNG_NOANSWR.Checked) + ''', SNUM_RADRSNG_NOANSWR = ''' + edtSNUM_RADRSNG_NOANSWR.Text +
        ''', SRADRSNG_OUTSD = ''' + BoolToChar(chkSRADRSNG_OUTSD.Checked) + ''', SNUM_ADRSNG_OUTSD = ''' + edtSNUM_RADRSNG_OUTSD.Text +
        ''', SSERVICE = ' + ToStrNull(dblkcbbSService.KeyValue) +
        ' WHERE SID = ' + MainForm.ibqAllNum.FieldByName('SID').AsString;
    else
      Exit;
    end;

    s := SQL.Text;
    //Exit;

    StartTransaction;
    ExecSQL;
    Commit;
    ibtrnsctnSetData.Active := False;
    MainForm.ibqAllNum.Close;
    MainForm.ibqAllNum.Open;

  except
    on E: Exception do begin
      if ibtrnsctnSetData.Active then Rollback;
      Application.MessageBox(PChar(E.Message), 'ошибка', MB_ICONERROR);
      Application.Terminate;
    end;

  end;

  ModalResult := mrOk;
end;

procedure TSetDateForm.edtPaymendChange(Sender: TObject);
begin
  //
  { DONE 2 -oedt...Change -cмаска : Маску Currency для edit полей }

end;

procedure TSetDateForm.FormHide(Sender: TObject);
var
  I: Integer;
begin
  Application.OnIdle := nil;
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDBLookupComboBox then
      if (Components[I] as TDBLookupComboBox).ListVisible then
        (Components[I] as TDBLookupComboBox).CloseUp(True);
end;

procedure TSetDateForm.edtPhoneNmbrKeyPress(Sender: TObject;
  var Key: Char);
begin
  MaskKeyEdit(Sender, Key, ['0'..'9']) // допускается ввод только целых
end;

procedure TSetDateForm.edtPaymendKeyPress(Sender: TObject; var Key: Char);
begin
  MaskKeyEdit(Sender, Key, ['0'..'9',DecimalSeparator]) // допускается ввод только вещественных
end;

procedure TSetDateForm.edtPhoneNmbrChange(Sender: TObject);
begin
  if Length(edtPhoneNmbr.Text) > 5 then
    edtPhoneNmbr.Color := clWhite
  else
    edtPhoneNmbr.Color := clRed
end;

procedure TSetDateForm.edtCheckedChange(Sender: TObject);
var
  CName: string;
  Ltext: Integer;
begin
  CName := (Sender as TEdit).Name;
  Ltext := Length((Sender as TEdit).Text);
  
  if 'edtCLIR_Price' = CName then begin
    if Ltext > 0 then
      chCLIR.Checked := True
    else
      chCLIR.Checked := False end else

  if 'edtNUM_SRADRSNG_ALL' = CName then begin
    if Ltext > 0 then
      chkSRADRSNG_ALL.Checked := True
    else
      chkSRADRSNG_ALL.Checked := False end else
  if 'edtNUM_SRADRSNG_BUSY' = CName then begin
    if Ltext > 0 then
      chkSRADRSNG_BUSY.Checked := True
    else
      chkSRADRSNG_BUSY.Checked := False end else
  if 'edtSNUM_RADRSNG_NOANSWR' = CName then begin
    if Ltext > 0 then
      chkSRADRSNG_NOANSWR.Checked := True
    else
      chkSRADRSNG_NOANSWR.Checked := False end else
  if 'edtSNUM_RADRSNG_OUTSD' = CName then begin
    if Ltext > 0 then
      chkSRADRSNG_OUTSD.Checked := True
    else
      chkSRADRSNG_OUTSD.Checked := False
  end;
end;


procedure TSetDateForm.dblkcbbSOwnerClick(Sender: TObject);
begin
  with CustomerDM do
  if ibtblOwner.Locate('OID', dblkcbbSOwner.KeyValue, []) then
    edtIDPrsnl_Acnt.Text := ibtblOwner.FieldByName('OIDPRSNL_ACNT').AsString
  else begin
    dblkcbbSOwner.KeyValue := null;
    edtIDPrsnl_Acnt.Text := ''
  end;
end;


procedure TSetDateForm.CompareData;
  procedure SetComponentColorFromTag();
  var
    I: Integer;
  begin
    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TEdit) then begin
        if (Components[I] as TControl).Tag = -1 then
          // внесены изменения в редактируемые данные
          (Components[I] as TEdit).Color := clGreen

          // изменения отсутствуют
        else
          (Components[I] as TEdit).Color := clWindow;
      end else begin
        if (Components[I] is TDBLookupComboBox) then
          if (Components[I] as TControl).Tag = -1 then
            // внесены изменения в редактируемые данные
            (Components[I] as TDBLookupComboBox).Color := clGreen

            // изменения отсутствуют
          else
            (Components[I] as TDBLookupComboBox).Color := clWindow;
      end;

  end;
begin
  edtIDPrsnl_Acnt.Color := clWindow;
  with MainForm do begin
    if edtPhoneNmbr.Text = ibstrngfldAllNumSPHONE_NMBR.AsString then
      edtPhoneNmbr.Tag := 0
    else
      edtPhoneNmbr.Tag := -1;

    if dblkcbbSOperator.KeyValue = intgrfldAllNumOPID.Value then
      dblkcbbSOperator.Tag := 0
    else
      dblkcbbSOperator.Tag := -1;

    if dblkcbbSTRlnShp.KeyValue = intgrfldAllNumRID.Value then
      dblkcbbSTRlnShp.Tag := 0
    else
      dblkcbbSTRlnShp.Tag := -1;

    if edtSICC_SIM.Text = ibstrngfldAllNumSICC_SIM.Value then
      edtSICC_SIM.Tag := 0
    else
      edtSICC_SIM.Tag := -1;

    if edtPUK1.Text = ibstrngfldAllNumSPUK1.Value then
      edtPUK1.Tag := 0
    else
      edtPUK1.Tag := -1;

    if edtPUK2.Text = ibstrngfldAllNumSPUK2.Value then
      edtPUK2.Tag := 0
    else
      edtPUK2.Tag := -1;

    if dblkcbbSTarifPlan.KeyValue = intgrfldAllNumTPID.Value then
      dblkcbbSTarifPlan.Tag := 0
    else
      dblkcbbSTarifPlan.Tag := -1;

    if chkActive.Checked = CharToBool(ibstrngfldAllNumSACTIVE.AsString) then
      chkActive.Tag := 0
    else
      chkActive.Tag := -1;

    if edtPaymend.Text = ibcdfldAllNumSPAYMENT.AsString then
      edtPaymend.Tag := 0
    else
      edtPaymend.Tag := -1;

    if chCLIR.Checked = CharToBool(ibstrngfldAllNumSCLIR.AsString) then
      chCLIR.Tag := 0
    else
      chCLIR.Tag := -1;

    if edtCLIR_Price.Text = ibcdfldAllNumSCLIR_PRICE.AsString then
      edtCLIR_Price.Tag := 0
    else
      edtCLIR_Price.Tag := -1;

    if dblkcbbSOwner.KeyValue = intgrfldAllNumOID.Value then
      dblkcbbSOwner.Tag := 0
    else
      dblkcbbSOwner.Tag := -1;

    if edtIDPrsnl_Acnt.Text = ibstrngfldAllNumOIDPRSNL_ACNT.Value then
      edtIDPrsnl_Acnt.Tag := 0
    else
      edtIDPrsnl_Acnt.Tag := -1;

    if dblkcbbSService.KeyValue = intgrfldAllNumSRID.Value then
      dblkcbbSService.Tag := 0
    else
      dblkcbbSService.Tag := -1;

    if dblkcbbSTDevice.KeyValue = intgrfldAllNumTDID.Value then
      dblkcbbSTDevice.Tag := 0
    else
      dblkcbbSTDevice.Tag := -1;

    if chkSRADRSNG_ALL.Checked = CharToBool(ibstrngfldAllNumSRADRSNG_ALL.AsString) then
      chkSRADRSNG_ALL.Tag := 0
    else
      chkSRADRSNG_ALL.Tag := -1;

    if edtNUM_SRADRSNG_ALL.Text = ibstrngfldAllNumSNUM_RADRSNG_ALL.Value then
      edtNUM_SRADRSNG_ALL.Tag := 0
    else
      edtNUM_SRADRSNG_ALL.Tag := -1;

    if chkSRADRSNG_BUSY.Checked = CharToBool(ibstrngfldAllNumSRADRSNG_BUSY.AsString) then
      chkSRADRSNG_BUSY.Tag := 0
    else
      chkSRADRSNG_BUSY.Tag := -1;

    if edtNUM_SRADRSNG_BUSY.Text = ibstrngfldAllNumSNUM_RADRSNG_BUSY.Value then
      edtNUM_SRADRSNG_BUSY.Tag := 0
    else
      edtNUM_SRADRSNG_BUSY.Tag := -1;

    if chkSRADRSNG_NOANSWR.Checked = CharToBool(ibstrngfldAllNumSRADRSNG_NOANSWR.AsString) then
      chkSRADRSNG_NOANSWR.Tag := 0
    else
      chkSRADRSNG_NOANSWR.Tag := -1;

    if edtSNUM_RADRSNG_NOANSWR.Text = ibstrngfldAllNumSNUM_RADRSNG_NOANSWR.Value then
      edtSNUM_RADRSNG_NOANSWR.Tag := 0
    else
      edtSNUM_RADRSNG_NOANSWR.Tag := -1;

    if chkSRADRSNG_OUTSD.Checked = CharToBool(ibstrngfldAllNumSRADRSNG_OUTSD.AsString) then
      chkSRADRSNG_OUTSD.Tag := 0
    else
      chkSRADRSNG_OUTSD.Tag := -1;

    if edtSNUM_RADRSNG_OUTSD.Text = ibstrngfldAllNumSNUM_ADRSNG_OUTSD.Value then
      edtSNUM_RADRSNG_OUTSD.Tag := 0
    else
      edtSNUM_RADRSNG_OUTSD.Tag := -1;
  end;

  SetComponentColorFromTag
end;

procedure TSetDateForm.aplctnvnts1Idle(Sender: TObject; var Done: Boolean);
begin
  if FSetDate = stEdit then CompareData;
end;

procedure TSetDateForm.btnResetClick(Sender: TObject);
begin
  if FSetDate = stEdit then
  with MainForm do begin
    edtPhoneNmbr.Text := ibstrngfldAllNumSPHONE_NMBR.AsString;
    dblkcbbSOperator.KeyValue := intgrfldAllNumOPID.Value;
    dblkcbbSTRlnShp.KeyValue := intgrfldAllNumRID.Value;
    edtSICC_SIM.Text := ibstrngfldAllNumSICC_SIM.Value;
    edtPUK1.Text := ibstrngfldAllNumSPUK1.Value;
    edtPUK2.Text := ibstrngfldAllNumSPUK2.Value;
    dblkcbbSTarifPlan.KeyValue := intgrfldAllNumTPID.Value;
    chkActive.Checked := CharToBool(ibstrngfldAllNumSACTIVE.AsString);
    edtPaymend.Text := ibcdfldAllNumSPAYMENT.AsString;
    chCLIR.Checked := CharToBool(ibstrngfldAllNumSCLIR.AsString);
    edtCLIR_Price.Text := ibcdfldAllNumSCLIR_PRICE.AsString;
    dblkcbbSOwner.KeyValue := intgrfldAllNumOID.Value;
    edtIDPrsnl_Acnt.Text := ibstrngfldAllNumOIDPRSNL_ACNT.Value;
    dblkcbbSService.KeyValue := intgrfldAllNumSRID.Value;
    dblkcbbSTDevice.KeyValue := intgrfldAllNumTDID.Value;
    chkSRADRSNG_ALL.Checked := CharToBool(ibstrngfldAllNumSRADRSNG_ALL.AsString);
    edtNUM_SRADRSNG_ALL.Text := ibstrngfldAllNumSNUM_RADRSNG_ALL.Value;
    chkSRADRSNG_BUSY.Checked := CharToBool(ibstrngfldAllNumSRADRSNG_BUSY.AsString);
    edtNUM_SRADRSNG_BUSY.Text := ibstrngfldAllNumSNUM_RADRSNG_BUSY.Value;
    chkSRADRSNG_NOANSWR.Checked := CharToBool(ibstrngfldAllNumSRADRSNG_NOANSWR.AsString);
    edtSNUM_RADRSNG_NOANSWR.Text := ibstrngfldAllNumSNUM_RADRSNG_NOANSWR.Value;
    chkSRADRSNG_OUTSD.Checked := CharToBool(ibstrngfldAllNumSRADRSNG_OUTSD.AsString);
    edtSNUM_RADRSNG_OUTSD.Text := ibstrngfldAllNumSNUM_ADRSNG_OUTSD.Value;
  end;
end;

end.
