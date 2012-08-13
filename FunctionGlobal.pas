unit FunctionGlobal;

interface

uses
  Variants, SysUtils, StdCtrls, Windows;

function BoolToChar(B: Boolean; UseBoolChr: Boolean = False): Char;
function CharToBool(ch: string): Boolean;

function ToStrNull(V: Variant): string; overload;
function ToStrNull(S: string): string; overload;

function ToStrPoint(Value: Real): string; overload;
function ToStrPoint(Value: string): string; overload;

type
  TMask = set of Char;

procedure MaskKeyEdit(Sender: TObject; var Key: Char; AMask: TMask);

implementation


function BoolToChar(B: Boolean; UseBoolChr: Boolean = False): Char;
begin
  if UseBoolChr then begin
    if B then
      Result := 'T'
    else
      Result := 'F'
  end else begin
    if B then
      Result := '1'
    else
      Result := '0'
  end;
end;

function CharToBool(ch: string): Boolean;
begin
  Result := False;

  if Length(ch) <> 1 then begin
    if ch <> NullAsStringValue then
      Result := StrToBool(ch);
    Exit;
  end;

  if (ch = 't') or (ch = 'T') or (ch = '1') then
    Result := True
  else
    Result := False
end;

function findComa(s: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 1 to Length(s) do
    case s[I] of
      ',', '.': Result := I;
    end;
end;

function ToStrPoint(Value: Real): string;
begin
  Result := FloatToStr(Value);
  if findComa(Result) < 0 then
    Result := Result + '.00'
  else
    Result[findComa(Result)] := '.';
end;

function ToStrPoint(Value: string): string;
begin
  try
    Result := FloatToStr(StrToFloat(Value))
  except
    Result := 'null';
    Abort;
  end;

  if findComa(Result) < 0 then
    Result := Result + '.00'
  else
    Result[findComa(Result)] := '.';
end;  

function ToStrNull(V: Variant): string;
begin
  if VarIsNull(V) then
    Result := 'NULL'
  else
    Result := VarToStr(V)
end;

procedure MaskKeyEdit(Sender: TObject; var Key: Char; AMask: TMask);
begin                             // '0'..'9',DecimalSeparator
  if Key = ',' then
    Key := DecimalSeparator; // ������� �������� �� ����������� ��� �����

  if Key = '.' then
    Key := DecimalSeparator; // ����� �������� �� ��������� (�� ������ ������)

  if not ((Key in AMask) or (Key in [#8,#13]))  // ������� ������� ������������
    or ((Key = DecimalSeparator) // ��� ����� ���� ����� �����������
    and (POS (DecimalSeparator, TEdit(Sender).Text) > 0)) // ������ �� ������ ���������
    or ((Key = '-') and (POS ('-', TEdit(Sender).Text) > 0)) // ������ �� ������ �����
    or ((Key = '-') and (TEdit(Sender).SelStart <> 0)) // ������ �� ����� �� ������� �����
    then // (����� � ���������� ������� �� ��� ����� ��� ���������)
  begin
    Key := #0; // ����������� ������ �������� �����
    MessageBeep (MB_OK); // ��� � ������
  end;
end;

function ToStrNull(S: string): string;
begin
  Result := 'Null';
  if (S <> '') and (S <> null) then
    Result := S
end;  

end.
