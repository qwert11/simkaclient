unit TDeviceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  IBDatabase, DB, IBCustomDataSet, IBQuery, Menus, ActnList;

type
  TfrmTDevice = class(TChaildForm)
    edtTDevice: TEdit;
    lbl1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDevice: TfrmTDevice;

implementation

uses DM;

{$R *.dfm}

procedure TfrmTDevice.btnCancelClick(Sender: TObject);
begin
  inherited;
  edtTDevice.Clear
end;

procedure TfrmTDevice.btnSaveClick(Sender: TObject);
begin
  try
    with ibqry1, ibtrnsctn1, CustomerDM do
    try

      if (FEditorState = esEdit) and (edtTDevice.Text <> '') then begin

        SQL.Text := 'UPDATE TDEVICE SET TDTITLE = ''' + edtTDevice.Text +
          ''' WHERE TDID = ' + ibtblTDevice.FieldByName('TDID').AsString;

      end else
      if (FEditorState = esInsert) and (edtTDevice.Text <> '') then begin

        SQL.Text := 'INSERT INTO TDEVICE (TDTITLE) values (''' + edtTDevice.Text + ''')';

      end else
      if (FEditorState = esDelete) then begin

        SQL.Text := 'Delete from TDEVICE WHERE TDID = ' + ibtblTDevice.FieldByName('TDID').AsString;

      end else
        Exit;

      StartTransaction;
      ExecSQL;
      Commit;
      ibtrnsctn1.Active := False;
      ibtblTDevice.Close;
      ibtblTDevice.Open;

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
