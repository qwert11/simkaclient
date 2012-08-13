unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBDatabase, Grids, DBGrids, IniFiles, IBCustomDataSet,
  IBQuery, StdCtrls, ExtCtrls, ComCtrls;

type
  TMainForm = class(TForm)
    dbgrd1: TDBGrid;
    { TODO  -ofbgrid -cedit : редактирование прямо в таблице }
    IBD: TIBDatabase;
    ibqAllNum: TIBQuery;
    ds1: TDataSource;
    ibTrnsctn: TIBTransaction;
    btnNew: TButton;
    btnDelete: TButton;
    ibqry2: TIBQuery;
    btnEdit: TButton;
    btnTestCountTransact: TButton;
    ibstrngfldAllNumSPHONE_NMBR: TIBStringField;
    ibstrngfldAllNumOPTITLE: TIBStringField;
    ibstrngfldAllNumONAME: TIBStringField;
    ibstrngfldAllNumOIDPRSNL_ACNT: TIBStringField;
    ibstrngfldAllNumTDTITLE: TIBStringField;
    ibstrngfldAllNumTPTITLE: TIBStringField;
    ibstrngfldAllNumRTITLE: TIBStringField;
    ibstrngfldAllNumSRTITLE: TIBStringField;
    ibstrngfldAllNumSICC_SIM: TIBStringField;
    ibstrngfldAllNumSPUK1: TIBStringField;
    ibstrngfldAllNumSPUK2: TIBStringField;
    ibstrngfldAllNumSACTIVE: TIBStringField;
    ibcdfldAllNumSPAYMENT: TIBBCDField;
    ibstrngfldAllNumSCLIR: TIBStringField;
    ibcdfldAllNumSCLIR_PRICE: TIBBCDField;
    ibstrngfldAllNumSINSTALL: TIBStringField;
    ibstrngfldAllNumSRADRSNG_ALL: TIBStringField;
    ibstrngfldAllNumSNUM_RADRSNG_ALL: TIBStringField;
    ibstrngfldAllNumSRADRSNG_BUSY: TIBStringField;
    ibstrngfldAllNumSNUM_RADRSNG_BUSY: TIBStringField;
    ibstrngfldAllNumSRADRSNG_NOANSWR: TIBStringField;
    ibstrngfldAllNumSNUM_RADRSNG_NOANSWR: TIBStringField;
    ibstrngfldAllNumSRADRSNG_OUTSD: TIBStringField;
    intgrfldAllNumSID: TIntegerField;
    intgrfldAllNumOPID: TIntegerField;
    intgrfldAllNumTDID: TIntegerField;
    intgrfldAllNumRID: TIntegerField;
    intgrfldAllNumTPID: TIntegerField;
    intgrfldAllNumOID: TIntegerField;
    intgrfldAllNumSRID: TIntegerField;
    ibstrngfldAllNumSNUM_ADRSNG_OUTSD: TIBStringField;
    ibtrnsDel: TIBTransaction;
    pnl1: TPanel;
    stat1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnTestCountTransactClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrd1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FFindName: string;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses CustomersGlobal, DM, SetDateFrm, FunctionGlobal;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
  procedure ConnectBase();
  var
    FIniFile: TIniFile;
  begin
    FIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + NAME_FILE_OPTION);
    //with CustomerDM do
    try
      { TODO -oCreate -cConfig : Сделать загрузку настроек }
      IBD.DatabaseName := FIniFile.ReadString('Base', 'Patch', '');
      IBD.Connected := True;
    finally
      FIniFile.Free;
    end;
  end;
begin
  FFindName := '';

  //with CustomerDM do
  try
    if not IBD.Connected then
      ConnectBase;

    if IBD.Connected then
    with ibqAllNum do
      if not Active then begin
        //SQL.Text := SQL_SELECT_SIMKA;
        Open;
      end;

  except
    on E: Exception do begin
      Application.MessageBox(PChar(E.Message), 'ошибка', MB_ICONERROR);
      Halt;
    end;  
  end;
  WindowState := wsMaximized;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ibqAllNum.Close;
  IBD.Connected := False;

end;

procedure TMainForm.btnNewClick(Sender: TObject);
begin
  with TSetDateForm.Create(stNew, TComponent(Sender)) do begin
    ShowModal;
    Free;
  end;
end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
var
  s: string;
begin
  if ibqAllNum.Eof then
    Exit;
    
  if Application.MessageBox('Продолжить удаление?', 'Удаление', MB_ICONQUESTION + MB_YESNO, ) <> ID_YES then
    Exit;

  with ibqry2 do
  try
    s := 'DELETE FROM SIMKA WHERE SID = ' + ibqAllNum.FieldByName('SID').AsString;;
    SQL.Text := s;
    ibtrnsDel.StartTransaction;
    ExecSQL;
    ibtrnsDel.Commit;
    ibtrnsDel.Active := False;
    ibqAllNum.Close;
    ibqAllNum.Open;
  except
    on E: Exception do begin
      ibtrnsDel.Rollback;
      Application.MessageBox(PChar(E.Message), 'ошибка', MB_ICONERROR);
      Halt;
    end;
  end;
end;

procedure TMainForm.btnTestCountTransactClick(Sender: TObject);
begin
  ShowMessage('Кол-во транзакций: ' + IntToStr(IBD.TransactionCount) + #13#10 +
    'Транзакция включена: ' + BoolToStr(ibTrnsctn.InTransaction, True)
  )
end;

procedure TMainForm.btnEditClick(Sender: TObject);
begin
  with TSetDateForm.Create(stEdit, TComponent(Sender)) do begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;


procedure TMainForm.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

  procedure DrawGridCheckBox(Canvas: TCanvas; Rect: TRect; Checked: boolean);
  var
    DrawFlags: Integer;
  begin
    Canvas.TextRect(Rect, Rect.Left + 1, Rect.Top + 1, ' ');
    DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_ADJUSTRECT);
    DrawFlags := DFCS_BUTTONCHECK or DFCS_ADJUSTRECT;// DFCS_BUTTONCHECK
    if Checked then
      DrawFlags := DrawFlags or DFCS_CHECKED;
    DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DrawFlags);
  end;

begin
  with Column do
  if (FieldName = 'SACTIVE') or (FieldName = 'SINSTALL') or (FieldName = 'SRADRSNG_ALL')
      or (FieldName = 'SRADRSNG_BUSY') or (FieldName = 'SRADRSNG_NOANSWR') or
        (FieldName = 'SRADRSNG_OUTSD') or (FieldName = 'SCLIR')
          then // Модифицируйте под себя
    if CharToBool(Column.Field.AsString) then
      DrawGridCheckBox(dbgrd1.Canvas, Rect, true)
    else
      DrawGridCheckBox(dbgrd1.Canvas, Rect, false)

end;

procedure TMainForm.dbgrd1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    FFindName := '' else
  if Key = #8 then
    Delete(FFindName, Length(FFindName), 1)
  else
    FFindName := FFindName + Key;
    
  stat1.Panels[2].Text := 'Поиск: ' + FFindName;
  if FFindName <> NullAsStringValue then begin
    if not ibqAllNum.Locate('oname', FFindName, [loCaseInsensitive, loPartialKey]) then
      stat1.Panels[2].Text := 'Запись: ' + FFindName + ' - отсутствует'
  end else
    stat1.Panels[2].Text := ''
end;

end.
