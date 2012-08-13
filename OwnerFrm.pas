unit OwnerFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
  IBDatabase, DB, IBCustomDataSet, IBQuery, ActnList;

type
  TfrmOwner = class(TChaildForm)
    edtName: TEdit;
    edtIDPrsnl_Acnt: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure btnSaveClick(Sender: TObject); override;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOwner: TfrmOwner;

implementation

uses DM, MainFrm;

{$R *.dfm}

procedure TfrmOwner.btnSaveClick(Sender: TObject);
begin
  try

    with ibqry1, ibtrnsctn1, CustomerDM do
    try

      if (FEditorState = esEdit) and (edtName.Text <> '') then begin

        SQL.Text := 'execute procedure IN_OWNER(' + ibtblOwner.FieldByName('OID').AsString + ',''' +
          edtName.Text + ''',''' + edtIDPrsnl_Acnt.Text + ''')';

  //      'UPDATE OWNER SET ONAME = ''' + edtName.Text + ', OIDPRSNL_ACNT = ''' +
  //        edtIDPrsnl_Acnt.Text + ''' WHERE OID = ' + ibtblOwner.FieldByName('OID').AsString;

      end else
      if (FEditorState = esInsert) and (edtName.Text <> '') then begin

        SQL.Text := 'execute procedure IN_OWNER(-1,''' +
          edtName.Text + ''',''' + edtIDPrsnl_Acnt.Text + ''')';

  //        'INSERT INTO OWNER (ONAME, OIDPRSNL_ACNT) values (''' + edtName.Text + ',''' +
  //          edtIDPrsnl_Acnt.Text + ''')';

      end else
      if (FEditorState = esDelete) then begin

        SQL.Text := 'Delete from OWNER WHERE OID = ' + ibtblOwner.FieldByName('OID').AsString;

      end else
        Exit;

      StartTransaction;
      ExecSQL;
      Commit;
      ibtrnsctn1.Active := False;
      ibtblOwner.Close;
      ibtblOwner.Open;

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

procedure TfrmOwner.btnCancelClick(Sender: TObject);
begin
  inherited;
  edtName.Clear;
  edtIDPrsnl_Acnt.Clear
end;

end.
