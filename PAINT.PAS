{                       Paint for DOS. Version 0.01
Программа написана Андреем Рабусовым (в учебных целях)
Эта программа - подобие графического редактора без возможности использо-
вания диска (для первых версий). Главная задача - научиться осуществлять
совокупную работу модулей Graph & Crt.}
uses graph, crt;
const dely=200;
type RAM = array [1..320, 1..50] of 0..15;
var gd, gm: integer;
    kl: char;
    color: 0..15;
    radius: 1..10;
    x{Координата ширины экрана}: 1..640;
    y{Координата высоты экрана}: 1..420;
    brush_pen, cur: boolean;
    RAM_help: RAM;
    a: 1..320;  {индексы предыдущего массива}
    b: 1..50;
procedure cursor;
var pic: byte;
begin
pic:=getpixel (x, y);
putpixel (x, y, color);
delay (dely);
putpixel (x, y, pic);
end;
procedure pencil;
begin
putpixel (x, y, color);
delay (dely);
end;
procedure brush;
begin
setcolor (color);
circle (x, y, radius);
delay (dely);
end;
procedure spravca;
begin
a:=1;
b:=1;
 for a:=1 to 320 do begin
  for b:=1 to 50 do begin
  RAM_help [a, b]:=getpixel (a, b);
  b:=b+1;
  end;
 a:=a+1;
 end;
moveto (0, 0);
SetTextStyle(DefaultFont, HorizDir, 1);
SetTextJustify(LeftText, TopText);
OutText('"w", "a", "s", "d" - moving cursor');
moveto (0, 10);
outtext ('for "z" to "/" and for "f" to "l" - color');
moveto (0, 20);
outtext ('for "1" to "0" - radius of cursor');
moveto (0, 30);
outtext ('"]" - exit, e-brush, r-pencil, t-cursor');
moveto (0, 40);
outtext ('"q" - exit to help');
end;
procedure helpexit;
begin
a:=1;
b:=1;
 for a:=1 to 320 do begin
  for b:=1 to 50 do begin
  putpixel (a, b, RAM_help [a, b]);
  b:=b+1;
  end;
 a:=a+1;
 end;
end;
{var clean: 0..640;
begin
clean:=0;
 repeat
 setcolor (0);
 circle (clean, 25, 25);
 clean:=clean+1;
 until clean=320;   }
procedure key;
begin
if keypressed
 then begin
 kl:=readkey;
 if kl='w' then begin y:=y-1; end;
 if kl='d' then begin x:=x+1; end;
 if kl='a' then begin x:=x-1; end;
 if kl='s' then begin y:=y+1; end;
 if kl='z' then begin color:=0; end;
 if kl='x' then begin color:=1; end;
 if kl='c' then begin color:=2; end;
 if kl='v' then begin color:=3; end;
 if kl='b' then begin color:=4; end;
 if kl='n' then begin color:=5; end;
 if kl='m' then begin color:=6; end;
 if kl=',' then begin color:=7; end;
 if kl='.' then begin color:=8; end;
 if kl='/' then begin color:=9; end;
 if kl='f' then begin color:=10; end;
 if kl='g' then begin color:=11; end;
 if kl='h' then begin color:=12; end;
 if kl='j' then begin color:=13; end;
 if kl='k' then begin color:=14; end;
 if kl='l' then begin color:=15; end;
 if kl='1' then begin radius:=1; end;
 if kl='2' then begin radius:=2; end;
 if kl='3' then begin radius:=3; end;
 if kl='4' then begin radius:=4; end;
 if kl='5' then begin radius:=5; end;
 if kl='6' then begin radius:=6; end;
 if kl='7' then begin radius:=7; end;
 if kl='8' then begin radius:=8; end;
 if kl='9' then begin radius:=9; end;
 if kl='0' then begin radius:=10; end;
 if kl='e' then begin brush_pen:=true; cur:=true; end;
 if kl='r' then begin brush_pen:=false; cur:=true; end;
 if kl='t' then begin cur:=false; end;
 if kl='[' then begin spravca; end;
 if kl='q' then begin helpexit; end;
  end;
end;
begin
x:=320;
y:=240;
color:=15;
clrscr;
writeln ('                      Corp Rabusoft');
writeln ('                   Paint for DOS. Version 0.02');
writeln ('Для справки нажмите [');
writeln ('Для продолжения дважды (с интервалом в 3 сек.) нажмите <ENTER>');
readln;
gd:=0;
initgraph (gd, gm,' ');
readln;
 repeat
 key;
 if cur=true then begin
  if brush_pen=true then begin brush; end;
  if brush_pen=false then begin pencil; end;
 end
 else begin cursor; end;
 until kl=']';
closegraph;
end.