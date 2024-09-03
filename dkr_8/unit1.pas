unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetValidatedInput(const AMessage: string): Double;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function TForm1.GetValidatedInput(const AMessage: string): Double;
var
  InputStr: string;
  Value: Double;
begin
  Result := 0;
  repeat
    InputStr := InputBox(AMessage, '', '0');
    if TryStrToFloat(InputStr, Value) then
      Result := Value
    else
      ShowMessage('Пожалуйста, введите правильное число.');
  until TryStrToFloat(InputStr, Value);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Volume: Double;
  Length, WidthValue, HeightValue: Double;
begin
  Memo1.Clear;

  if RadioButton1.Checked then
  begin
    Length := GetValidatedInput('Введите длину ребра куба');
    Volume := Power(Length, 3);
  end
  else if RadioButton2.Checked then
  begin
    Length := GetValidatedInput('Введите длину');
    WidthValue := GetValidatedInput('Введите ширину');
    HeightValue := GetValidatedInput('Введите высоту');
    Volume := Length * WidthValue * HeightValue;
  end
  else if RadioButton3.Checked then
  begin
    Length := GetValidatedInput('Введите длину основания');
    HeightValue := GetValidatedInput('Введите высоту пирамиды');
    Volume := (Length * Length * HeightValue) / 3;
  end
  else if RadioButton4.Checked then
  begin
    Length := GetValidatedInput('Введите длину');
    WidthValue := GetValidatedInput('Введите ширину');
    HeightValue := GetValidatedInput('Введите высоту');
    Volume := Length * WidthValue * HeightValue;
  end
  else
  begin
    ShowMessage('Выберите фигуру для расчета объема.');
    Exit;
  end;

  Memo1.Lines.Add('Объем выбранной фигуры: ' + FloatToStr(Volume));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

