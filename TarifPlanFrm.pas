unit TarifPlanFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  IBDatabase, DB, IBCustomDataSet, IBQuery, Menus, ActnList;

type
  TfrmTarifPlan = class(TChaildForm)
    edtTarifPlan: TEdit;
    lbl1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarifPlan: TfrmTarifPlan;

implementation

uses DM;

{$R *.dfm}

procedure TfrmTarifPlan.btnCancelClick(Sender: TObject);
begin
  inherited;
  edtTarifPlan.Clear
end;

procedure TfrmTarifPlan.btnSaveClick(Sender: TObject);
begin
  try
    with ibqry1, ibtrnsctn1, CustomerDM do
    try

      if (FEditorState = esEdit) and (edtTarifPlan.Text <> '') then begin

        SQL.Text := 'UPDATE TARIF_PLAN SET TPTitle = ''' + edtTarifPlan.Text +
          ''' WHERE TPID = ' + ibtblTarifPlan.FieldByName('TPID').AsString;

      end else
      if (FEditorState = esInsert) and (edtTarifPlan.Text <> '') then begin

        SQL.Text := 'INSERT INTO TARIF_PLAN (TPTitle) values (''' + edtTarifPlan.Text + ''')';

      end else
      if (FEditorState = esDelete) then begin

        SQL.Text := 'Delete from TARIF_PLAN WHERE TPID = ' + ibtblTarifPlan.FieldByName('TPID').AsString;
      
      end else
        Exit;

      StartTransaction;
      ExecSQL;
      Commit;
      ibtrnsctn1.Active := False;
      ibtblTarifPlan.Close;
      ibtblTarifPlan.Open;

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

end.
