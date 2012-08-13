unit ChaildFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, IBDatabase,
  DB, IBCustomDataSet, IBQuery, DBCtrls, ActnList;

type
  TEditorSetState = (esEdit, esInsert, esDelete, esNone);

  TChaildForm = class(TForm)
    dbgrd1: TDBGrid;
    btn1: TBitBtn;
    btn2: TBitBtn;
    pnl1: TPanel;
    mm1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Insert1: TMenuItem;
    Delete1: TMenuItem;
    btnSave: TButton;
    btnCancel: TButton;
    ibqry1: TIBQuery;
    ibtrnsctn1: TIBTransaction;
    pm1: TPopupMenu;
    Edit2: TMenuItem;
    Insert2: TMenuItem;
    N1: TMenuItem;
    Delete2: TMenuItem;
    actlst1: TActionList;
    act1: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject); virtual;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject); virtual;
    procedure FormShow(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure NullAllField;
  public
    { Public declarations }
    FEditorState: TEditorSetState;
//    FEdit: Boolean;
//    FInsert: Boolean;
//    FDelete: Boolean;
  end;

var
  ChaildForm: TChaildForm;

implementation

uses DM, MainFrm;


{$R *.dfm}

{ TODO 2 -oAcrion -cUpdate : UPDATE для Edit, Insert, Delete }

procedure TChaildForm.FormCreate(Sender: TObject);
begin
  FEditorState := esNone;
  btnSave.Enabled := False
end;

procedure TChaildForm.Edit1Click(Sender: TObject);
begin
  FEditorState := esEdit;
//  FEdit := True;
//  FInsert := False;
//  FDelete := False;
  btnSave.Enabled := True;
end;

procedure TChaildForm.Insert1Click(Sender: TObject);
begin
  FEditorState := esInsert;
//  FEdit := False;
//  FInsert := True;
//  FDelete := False;
  btnSave.Enabled := True;
end;

// вызывает метод потомка потому что virtual
procedure TChaildForm.Delete1Click(Sender: TObject);
begin

//  FEdit := False;
//  FInsert := False;
//  btnSave.Enabled := False;
  FEditorState := esNone;
  if Application.MessageBox('Вы действительно хотите удалить запись?',
      'Удаление', MB_ICONQUESTION + MB_YESNO) = ID_YES then
    FEditorState := esDelete;
  btnSaveClick(nil)
end;

procedure TChaildForm.btnCancelClick(Sender: TObject);
begin
  FEditorState := esNone;
//  FEdit := False;
//  FInsert := False;
//  FDelete := False;
  btnSave.Enabled := False;
  NullAllField;
end;

procedure TChaildForm.btnSaveClick(Sender: TObject);
begin
  btnCancelClick(nil);
end;

procedure TChaildForm.NullAllField;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEdit then
      (Components[I] as TEdit).Clear else
    if Components[I] is TDBLookupComboBox then
      (Components[I] as TDBLookupComboBox).KeyValue := null

end;

procedure TChaildForm.FormShow(Sender: TObject);
begin
  NullAllField
end;

procedure TChaildForm.dbgrd1DblClick(Sender: TObject);
begin
  ModalResult := mrNone;
  if not dbgrd1.DataSource.DataSet.Eof then
    ModalResult := mrOk;
end;

end.
