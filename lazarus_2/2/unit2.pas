unit unit2;

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
    Label1: TLabel;
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
var S,a,d,S1:float;
begin
S:=strtofloat(Edit1.Text);
a:=sqrt(S);
d:=a*sqrt(2);
S1:=pi*sqr(d);
Memo1.Lines.add('Сторона а= '+floattostr(a)+', диагональ d= '+floattostr(d)+', площаль круга S1= '+floattostr(S1));
end;

end.

