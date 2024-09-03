uses 
  GraphABC, zxc;
procedure KeyPressed(Key: integer);
begin
  case Key of 
    VK_Left: 
      begin
        ClearWindow();
        x1 := x1 - 5; 
        x2 := x2 - 5; 
        drawing(x1, y1, x2, y2, deep);
        MoveTo(x1, y1);
        LineTo(x2, y1);
        LineTo(x2, y2);
        LineTo(x1, y2);
        LineTo(x1, y1);
      end;
    VK_Right: 
      begin
        ClearWindow();
        x1 := x1 + 5; 
        x2 := x2 + 5; 
        drawing(x1, y1, x2, y2, deep);
        MoveTo(x1, y1);
        LineTo(x2, y1);
        LineTo(x2, y2);
        LineTo(x1, y2);
        LineTo(x1, y1);
      end;
    VK_Up: 
      begin
        ClearWindow();
        y1 := y1 - 5; 
        y2 := y2 - 5; 
        drawing(x1, y1, x2, y2, deep);
        MoveTo(x1, y1);
        LineTo(x2, y1);
        LineTo(x2, y2);
        LineTo(x1, y2);
        LineTo(x1, y1);
      end;
    VK_Down: 
      begin
        ClearWindow(); 
        y1 := y1 + 5; 
        y2 := y2 + 5; 
        drawing(x1, y1, x2, y2, deep);
        MoveTo(x1, y1);
        LineTo(x2, y1);
        LineTo(x2, y2);
        LineTo(x1, y2);
        LineTo(x1, y1);
      end;
    VK_Z: 
      begin
        ClearWindow(); 
        deep := deep+1;
        drawing(x1, y1, x2, y2, deep);
        MoveTo(x1, y1);
        LineTo(x2, y1);
        LineTo(x2, y2);
        LineTo(x1, y2);
        LineTo(x1, y1);
      end;
    VK_X: 
      begin
        ClearWindow(); 
        deep := deep-1;
        drawing(x1, y1, x2, y2, deep);
        MoveTo(x1, y1);
        LineTo(x2, y1);
        LineTo(x2, y2);
        LineTo(x1, y2);
        LineTo(x1, y1);
      end;
    VK_A: 
      begin
        ClearWindow(); 
        x2 := x2 + 100;
        y2 := y2 + 100;
        drawing(x1, y1, x2, y2, deep);
        MoveTo(x1, y1);
        LineTo(x2, y1);
        LineTo(x2, y2);
        LineTo(x1, y2);
        LineTo(x1, y1);
      end;
     VK_S: 
      begin
        ClearWindow(); 
        x2 := x2 - 100;
        y2 := y2 - 100;
        drawing(x1, y1, x2, y2, deep);
        MoveTo(x1, y1);
        LineTo(x2, y1);
        LineTo(x2, y2);
        LineTo(x1, y2);
        LineTo(x1, y1);
      end;
end;
end;
begin
  deep := 2;
  MoveTo(20, 20);
  LineTo(460, 20);
  LineTo(460, 460);
  LineTo(20, 460);
  LineTo(20, 20);
  x1 := 20;
  x2 := 460;
  y1 := 20;
  y2 := 460;
  drawing(x1, y1, x2, y2, deep);
  while true do
  begin
    OnKeyDown := KeyPressed; 
  end;
end.
