unit CmdToMoxaFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChaildFrm, Menus, IBDatabase, DB, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ActnList;

type
  TfrmCmdToMoxa = class(TChaildForm)
    edtCMTITLE: TEdit;
    lbl1: TLabel;
    edtCMCOMMAND: TEdit;
    lbl2: TLabel;
    procedure btnSaveClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCmdToMoxa: TfrmCmdToMoxa;

implementation

uses DM;

{$R *.dfm}

procedure TfrmCmdToMoxa.btnSaveClick(Sender: TObject);
begin

  try
    with ibqry1, ibtrnsctn1, CustomerDM do
    try

      if (FEditorState = esEdit) and (edtCMTITLE.Text <> '') and (edtCMCOMMAND.Text <> '') then begin

        SQL.Text := 'UPDATE CMD_MOX SET CMTITLE = ''' + edtCMTITLE.Text + ', CMCOMMAND = ''' +
          edtCMCOMMAND.Text + ''' WHERE CMID = ' + ibtblCMD_MOX.FieldByName('CMID').AsString;

      end else
      if (FEditorState = esInsert) and (edtCMTITLE.Text <> '') and (edtCMCOMMAND.Text <> '') then begin

        SQL.Text := 'INSERT INTO CMD_MOX (CMTITLE, CMCOMMAND) values (''' + edtCMTITLE.Text +
          ''', ''' + edtCMCOMMAND.Text + ''')';

      end else
      if (FEditorState = esDelete) then begin

        SQL.Text := 'Delete from CMD_MOX WHERE CMID = ' + ibtblCMD_MOX.FieldByName('CMID').AsString;

      end else
        Exit;

      StartTransaction;
      ExecSQL;
      Commit;
      ibtrnsctn1.Active := False;
      ibtblCMD_MOX.Close;
      ibtblCMD_MOX.Open;

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
