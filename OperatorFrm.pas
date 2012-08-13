unit OperatorFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  IBDatabase, DB, IBCustomDataSet, IBQuery, Menus, ActnList;

type
  TfrmOperator = class(TChaildForm)
    edtOperator: TEdit;
    lbl1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOperator: TfrmOperator;

implementation

uses DM;

{$R *.dfm}

procedure TfrmOperator.btnCancelClick(Sender: TObject);
begin
  inherited;
  edtOperator.Clear
end;

procedure TfrmOperator.btnSaveClick(Sender: TObject);
begin
  try

    with ibqry1, ibtrnsctn1, CustomerDM do
    try

      if (FEditorState = esEdit) and (edtOperator.Text <> '') then begin

        SQL.Text := 'UPDATE OPERATOR SET OPTITLE = ''' + edtOperator.Text +
          ''' WHERE OPID = ' + ibtblOperator.FieldByName('OPID').AsString;

      end else
      if (FEditorState = esInsert) and (edtOperator.Text <> '') then begin

        SQL.Text := 'INSERT INTO OPERATOR (OPTITLE) values (''' + edtOperator.Text + ''')';

      end else
      if FEditorState = esDelete then begin

        SQL.Text := 'Delete from OPERATOR WHERE OPID = ' + ibtblOperator.FieldByName('OPID').AsString;

      end else
        Exit;

      StartTransaction;
      ExecSQL;
      Commit;
      ibtrnsctn1.Active := False;
      ibtblOperator.Close;
      ibtblOperator.Open;

    except
      on E: Exception do begin
        Rollback;
        Application.MessageBox(PChar(E.Message), 'ошибка', MB_ICONERROR);
        Halt;
      end;

    end;

  finally
    inherited;
  end
end;

end.
