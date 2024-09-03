var i: integer; i_ptr: ^integer;
begin
  i:=2;
  i_ptr:= @i;
  writeln('Адрес  ='  , i_ptr); 
  writeln('Значение = ', i_ptr^); 
end.