program ReverseList;

type
  PNode = ^Node;
  Node = record
    data: Integer;
    next: PNode;
  end;

var
  InputFile, OutputFile: text;
  StackTop: PNode;

// Функция для добавления элемента в стек
procedure Push(var Head: PNode; x: Integer);
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.Data := x;
  NewNode^.Next := Head;
  Head := NewNode;
end;

// снятие верхнего элемента
function Pop(var Head: PNode): Integer;
var
  q: PNode;
begin
  if Head = nil then
  begin
    writeln('Стек пуст');
    Exit;
  end
  else
  begin
    q := Head;
    Pop := q^.Data;
    Head := Head^.Next;
    Dispose(q);
  end;
end;

//чтения списка
procedure ReadListAndPushToStack(FileName: string);
var
  Num: Integer;
begin
  Assign(InputFile, FileName);
  Reset(InputFile);
  while not eof(InputFile) do
  begin
    Readln(InputFile, Num);
    Push(StackTop, Num);
  end;
  Close(InputFile);
end;

// запись  обратном порядке
procedure WriteStackToList(FileName: string);
var
  Num: Integer;
begin
  Assign(OutputFile, FileName);
  Rewrite(OutputFile);
  while StackTop <> nil do
  begin
    Num := Pop(StackTop);
    Writeln(OutputFile, Num);
  end;
  Close(OutputFile);
end;

begin
  StackTop := nil;
  ReadListAndPushToStack('input.txt');
  WriteStackToList('output.txt');
  writeln('Готово');
end.
