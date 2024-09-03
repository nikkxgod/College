Unit zxc;
Uses GraphABC;
var
  x1, x2, y1, y2: integer;
  deep: integer;

procedure drawing(x1, y1, x2, y2, deep: integer);
var
  x3, y3, x4, y4: integer;
begin
  if deep > 0 then
  begin
    x3 := (x2 - x1) div 3 + x1; 
    y3 := (y2 - y1) div 3 + y1;
    x4 := 2 * ((x2 - x1) div 3) + x1; 
    y4 := 2 * ((y2 - y1) div 3) + y1;
    MoveTo(x3, y3);
    LineTo(x4, y3);
    LineTo(x4, y4);
    LineTo(x3, y4);
    LineTo(x3, y3);
    floodfill(x3, y4, clwhite);
    setbrushcolor(clwhite);
    drawing(x1, y1, x3, y3, deep - 1);
    drawing(x3, y1, x4, y3, deep - 1);
    drawing(x4, y1, x2, y3, deep - 1);
    drawing(x4, y3, x2, y4, deep - 1);
    drawing(x4, y4, x2, y2, deep - 1);
    drawing(x3, y4, x4, y2, deep - 1);
    drawing(x1, y4, x3, y2, deep - 1);
    drawing(x1, y3, x3, y4, deep - 1);
  end;
end;
end.
