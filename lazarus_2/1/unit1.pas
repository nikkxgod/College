unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Math, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b:integer; f:float;
begin
a:=strtoint(Edit1.Text);
b:=strtoint(Edit2.Text);
f:=sqrt(pi/8)*sqrt(sqrt(a+b)/sqr(a)+sqr(b))-a*b*b*b;
Memo1.Lines.add('функция при a равном '+IntToStr(a)+' и b равном '+ IntToStr(b) +' равняется '+FloatToStr(f));
end;

end.

