type
  NodePtr = ^Node;
  Node = record
    data: Integer;
    next: NodePtr;
  end;

function FMax(node: NodePtr): Integer;
var
  maxValue: Integer;
begin
  maxValue := node^.data;
  while node <> nil do
  begin
    if node^.data > maxValue then
      maxValue := node^.data;
    node := node^.next;
  end;
  FMax := maxValue;
end;

function FMin(node: NodePtr): Integer;
var
  minValue: Integer;
begin
  minValue := node^.data;
  while node <> nil do
  begin
    if node^.data < minValue then
      minValue := node^.data;
    node := node^.next;
  end;
  FMin := minValue;
end;

var
  a,b,c,d:integer;
  head, node1, node2, node3: NodePtr;

begin
  
  New(head);
  writeln('Введите первый элемент: ');
  readln(a);
  head^.data := a;

  New(node1);
  writeln('Введите второй элемент: ');
  readln(b);
  node1^.data := b;
  head^.next := node1;

  New(node2);
  writeln('Введите третий элемент: ');
  readln(c);
  node2^.data := c;
  node1^.next := node2;

  New(node3);
  writeln('Введите четвертый элемент: ');
  readln(d);
  node3^.data := d;
  node2^.next := node3;
  node3^.next := nil;

  writeln('Максимальный элемент: ', FMax(head));
  writeln('Минимальный элемент: ', FMin(head));
end.
