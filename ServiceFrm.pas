unit ServiceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  IBDatabase, DB, IBCustomDataSet, IBQuery, Menus, DBCtrls, ActnList;

type
  TServiseOption = (soEdit, soInsert, soDelete, soNone);

  TfrmService = class(TChaildForm)
    edtService: TEdit;
    lbl1: TLabel;
    dbgrd2: TDBGrid;
    pnl2: TPanel;
    lbl2: TLabel;
    edtInstruction: TEdit;
    lbl3: TLabel;
    btnCMD_MOX: TSpeedButton;
    dblkcbbOption: TDBLookupComboBox;
    btnEditOptServis: TButton;
    btnInsOptServis: TButton;
    btnDelOptServis: TButton;
    pm2: TPopupMenu;
    Edit3: TMenuItem;
    Insert3: TMenuItem;
    N2: TMenuItem;
    Delete3: TMenuItem;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject); override;
    procedure btnEditOptServisClick(Sender: TObject);
    procedure btnInsOptServisClick(Sender: TObject);
    procedure btnDelOptServisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkcbbOptionClick(Sender: TObject);
    procedure btnCMD_MOXClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
    FServiseOption: TServiseOption;
  public
    { Public declarations }
  end;

var
  frmService: TfrmService;

implementation

uses DM, FunctionGlobal, CmdToMoxaFrm;

{$R *.dfm}

procedure TfrmService.btnCancelClick(Sender: TObject);
begin
  inherited;
  edtService.Clear
end;

procedure TfrmService.btnSaveClick(Sender: TObject);
begin
  try
    with ibqry1, ibtrnsctn1, CustomerDM do
    try
      // изменения табл. tbSERVICE
      if (FEditorState = esEdit) and (edtService.Text <> '') then begin

        SQL.Text := 'UPDATE SERVICE SET SRTITLE = ''' + edtService.Text +
          ''' WHERE SRID = ' + ibtblService.FieldByName('SRID').AsString;

      end else
      if (FEditorState = esInsert) and (edtService.Text <> '') then begin

        SQL.Text := 'INSERT INTO SERVICE (SRTITLE) values (''' + edtService.Text + ''')';

      end else
      if (FEditorState = esDelete) then begin

        SQL.Text := 'Delete from SERVICE WHERE SRID = ' + ibtblService.FieldByName('SRID').AsString;

      end else

      if ibtblService.Eof then
        Exit else
      // // изменения табл. OPTION_SERVICE
      case FServiseOption of

        soEdit:
          if  not ibtblOPTION_SERVICE.Eof and not VarIsNull(dblkcbbOption.KeyValue)
            and not VarIsEmpty(dblkcbbOption.KeyValue) then
              SQL.Text := 'UPDATE OPTION_SERVICE SET OSCMID = ''' + ToStrNull(dblkcbbOption.KeyValue) +
                ''' WHERE OSID = ' + ibtblOPTION_SERVICE.FieldByName('OSID').AsString;

        soInsert:
          if not VarIsNull(dblkcbbOption.KeyValue) and not VarIsEmpty(dblkcbbOption.KeyValue) then
            SQL.Text := 'INSERT INTO OPTION_SERVICE (OSERVICEID, OSCMID) values (' +
              ibtblService.FieldByName('SRID').AsString +
                ', ' + IntToStr(dblkcbbOption.KeyValue) + ')';


        soDelete:
          if not ibtblOPTION_SERVICE.Eof then
            SQL.Text := 'Delete from OPTION_SERVICE WHERE SRID = ' +
              ibtblOPTION_SERVICE.FieldByName('OSID').AsString;

      else
        Exit;
      end;

      FServiseOption := soNone;

      StartTransaction;
      ExecSQL;
      Commit;
      ibtrnsctn1.Active := False;
      ibtblService.Close;
      ibtblService.Open;

      ibtblOPTION_SERVICE.Close;
      ibtblOPTION_SERVICE.Open;
    except
      on E: Exception do begin
        Rollback;
        Application.MessageBox(PChar(E.Message), 'ошибка', MB_ICONERROR);
        Halt;
      end;

    end;
  finally
    inherited;
  end;
end;

procedure TfrmService.btnEditOptServisClick(Sender: TObject);
begin
  inherited;
  with CustomerDM do
  begin
    if ibtblOPTION_SERVICE.Eof then
      Exit;

    FServiseOption := soEdit;
    btnSave.Enabled := True;
    dblkcbbOption.KeyValue := ibtblOPTION_SERVICE.FieldByName('OSCMID').Value;
    dblkcbbOptionClick(nil)
  end;

end;

procedure TfrmService.btnInsOptServisClick(Sender: TObject);
begin
  inherited;
  FServiseOption := soInsert;
  btnSave.Enabled := True;
end;

procedure TfrmService.btnDelOptServisClick(Sender: TObject);
begin
  inherited;
  if CustomerDM.ibtblOPTION_SERVICE.Eof then
    Exit;
    
  try
    FServiseOption := soDelete;
    btnSaveClick(nil);
  finally
    FServiseOption := soNone;
  end;
end;

procedure TfrmService.FormCreate(Sender: TObject);
begin
  inherited;
  FServiseOption := soNone;
end;

procedure TfrmService.dblkcbbOptionClick(Sender: TObject);
begin
  inherited;
  with CustomerDM do
  if ibtblCMD_MOX.Locate('CMID', dblkcbbOption.KeyValue, []) then
    edtInstruction.Text := ibtblCMD_MOX.FieldByName('CMCOMMAND').AsString
end;

procedure TfrmService.btnCMD_MOXClick(Sender: TObject);
begin
  inherited;
  frmCmdToMoxa.ShowModal;
  with CustomerDM do
  if frmCmdToMoxa.ModalResult = mrOk then begin
    dblkcbbOption.KeyValue := ibtblCMD_MOX.FieldByName('CMID').Value;
    edtInstruction.Text := ibtblCMD_MOX.FieldByName('CMCOMMAND').AsString;
  end else begin
    dblkcbbOption.KeyValue := null;
    edtInstruction.Text := '';
  end;
end;

procedure TfrmService.Edit1Click(Sender: TObject);
begin
  inherited;
  if CustomerDM.ibtblService.Eof then
    Exit;
  edtService.Text := CustomerDM.ibtblService.FieldByName('SRTITLE').AsString
end;

end.
