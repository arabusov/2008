uses graph;
var gd, gm, x_smesh, dlina, visota: integer;
begin
gd:=0;
initgraph (gd, gm,' ');
readln;
x_smesh:=100;
dlina:=200;
visota:=50;
setcolor (8);
line (x_smesh+30, visota+50, x_smesh+dlina+30, visota+50);
line (x_smesh, visota, x_smesh+30, visota+50);
line (x_smesh+dlina+60, 50, x_smesh+dlina+30, visota+50);
line (x_smesh, visota, x_smesh+dlina+60, visota);
setfillstyle (1, 8);
floodfill (x_smesh+30, visota+3, 8);
readln;
closegraph;
end.