unit TRlnShpFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  IBDatabase, DB, IBCustomDataSet, IBQuery, Menus, ActnList;

type
  TfrmTRlnShp = class(TChaildForm)
    edtRltnShip: TEdit;
    lbl1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTRlnShp: TfrmTRlnShp;

implementation

uses DM;

{$R *.dfm}

procedure TfrmTRlnShp.btnCancelClick(Sender: TObject);
begin
  inherited;
  edtRltnShip.Clear
end;

procedure TfrmTRlnShp.btnSaveClick(Sender: TObject);
begin

  try
    with ibqry1, ibtrnsctn1, CustomerDM do
    try

      if (FEditorState = esEdit) and (edtRltnShip.Text <> '') then begin

        SQL.Text := 'UPDATE RLTNSHP SET RTITLE = ''' + edtRltnShip.Text +
          ''' WHERE RID = ' + ibtblTRlnShp.FieldByName('RID').AsString;

      end else
      if (FEditorState = esInsert) and (edtRltnShip.Text <> '') then begin

        SQL.Text := 'INSERT INTO RLTNSHP (RTITLE) values (''' + edtRltnShip.Text + ''')';

      end else
      if (FEditorState = esDelete) then begin

        SQL.Text := 'Delete from RLTNSHP WHERE RID = ' + ibtblTRlnShp.FieldByName('RID').AsString;

      end else
        Exit;

      StartTransaction;
      ExecSQL;
      Commit;
      ibtrnsctn1.Active := False;
      ibtblTRlnShp.Close;
      ibtblTRlnShp.Open;

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
