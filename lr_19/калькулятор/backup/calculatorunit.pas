unit calculatorunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  TCalculatorOperation = (None, Equal, Add, Subtract, Multiplication, Division, Percentage);

  { TCalculator }

  TCalculator = class
  private
    DisplayText: string;
    CurrentInput: string;
    LastResult: string;
    ResultShown: Boolean;
    LastOperator: TCalculatorOperation;
  public
    constructor Create;
    procedure SendInput(Input: string);
    procedure InputNumber(Number: string);
    procedure AddOperator(Operation: TCalculatorOperation);
    function GetDisplay: string;
    procedure Clear;
    procedure AllClear;
    procedure Backspace;
  end;

implementation

{ TCalculator }

constructor TCalculator.Create;
begin
  AllClear;
end;

procedure TCalculator.SendInput(Input: string);
begin
  case Input of
    '0' .. '9': InputNumber(Input);
    '.': InputNumber(Input);
    '+': AddOperator(TCalculatorOperation.Add);
    '-': AddOperator(TCalculatorOperation.Subtract);
    '*', '×': AddOperator(TCalculatorOperation.Multiplication);
    '/', '÷': AddOperator(TCalculatorOperation.Division);
    '%': AddOperator(TCalculatorOperation.Percentage);
    '=': AddOperator(TCalculatorOperation.Equal);
    'C': Clear;
    'AC': AllClear;
    '←': Backspace;
  else
    //
  end;
end;

procedure TCalculator.InputNumber(Number: string);
begin
  if (Pos('.', CurrentInput) <> 0) and (Number = '.') then Exit;

  if CurrentInput = '0' then begin
    CurrentInput := Number;
  end else begin
    if ResultShown then
      CurrentInput := Number
    else
      CurrentInput := CurrentInput + Number;
  end;

  DisplayText := CurrentInput;
  ResultShown := False;
end;

procedure TCalculator.AddOperator(Operation: TCalculatorOperation);
var
  TempFloat: Double;
begin
  if Operation = TCalculatorOperation.Equal then begin
    if TryStrToFloat(LastResult, TempFloat) and TryStrToFloat(CurrentInput, TempFloat) then begin
      case LastOperator of
        TCalculatorOperation.Add:
          LastResult := FloatToStr(StrToFloat(LastResult) + StrToFloat(CurrentInput));
        TCalculatorOperation.Subtract:
          LastResult := FloatToStr(StrToFloat(LastResult) - StrToFloat(CurrentInput));
        TCalculatorOperation.Multiplication:
          LastResult := FloatToStr(StrToFloat(LastResult) * StrToFloat(CurrentInput));
        TCalculatorOperation.Division:
          if StrToFloat(CurrentInput) = 0 then
            LastResult := 'Деление на ноль запрещено'
          else
            LastResult := FloatToStr(StrToFloat(LastResult) / StrToFloat(CurrentInput));
      end;
    end else begin
      LastResult := '0';
    end;

    CurrentInput := LastResult;
    LastOperator := TCalculatorOperation.None;
    ResultShown := True;
  end else if Operation = TCalculatorOperation.Percentage then begin
    if TryStrToFloat(LastResult, TempFloat) and TryStrToFloat(CurrentInput, TempFloat) then begin
      LastResult := FloatToStr(StrToFloat(LastResult) * (StrToFloat(CurrentInput) / 100));
    end else begin
      LastResult := '0';
    end;

    CurrentInput := LastResult;
    DisplayText := LastResult;
    ResultShown := True;
  end else if LastOperator <> TCalculatorOperation.None then begin
    AddOperator(TCalculatorOperation.Equal);
    AddOperator(Operation);
  end else begin
    LastOperator := Operation;
    LastResult := CurrentInput;
    DisplayText := CurrentInput;
    CurrentInput := '0';
  end;
end;

function TCalculator.GetDisplay: string;
begin
  if ResultShown then
    Result := LastResult
  else
    Result := DisplayText;
end;

procedure TCalculator.Clear;
begin
  CurrentInput := '0';
  DisplayText := '0';
end;

procedure TCalculator.AllClear;
begin
  Clear;
  LastResult := '0';
  ResultShown := False;
  LastOperator := TCalculatorOperation.None;
end;

procedure TCalculator.Backspace;
begin
  if ResultShown then Exit;

  if Length(CurrentInput) > 1 then
    CurrentInput := Copy(CurrentInput, 0, Length(CurrentInput) - 1)
  else
    CurrentInput := '0';
  DisplayText := CurrentInput;
end;

end.

