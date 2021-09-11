uses graph, crt;
var gd, gm, y: integer;
begin
gd:=0;
y:=0;
initgraph (gd, gm,' ');
readln;
 Repeat
 setcolor ( random (15)+1);
 circle (y, random(480), random(100));
 delay (3000);
 setcolor (0);
 circle (y, random(480), random(100));
 y:=y+1;
 until keypressed;
closegraph;
end.


