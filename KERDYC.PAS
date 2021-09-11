uses graph, crt;
var gd, gm, i, radius: integer;
    y: 1..640;
begin
gd:=0;
y:=100;
initgraph (gd, gm,' ');
readln;
i:=240;
radius:=100;
 repeat
  Repeat
  setcolor (5);
  circle (y, i, radius);
  delay (100);
  setcolor (0);
  circle (y, i, radius);
  y:=y+1;
  until y=540;
  Repeat
  setcolor (15);
  circle (y, i, radius);
  delay (100);
  setcolor (0);
  circle (y, i, radius);
  y:=y-1;
  until y=100;
 until keypressed;
closegraph;
end.


