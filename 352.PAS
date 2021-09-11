program pixel_3d;
uses crt;
var gd, gm: integer;
 a, b, c, x, y: word;
procedure three;

begin
if a<320
 then begin
 if b<240
  then begin
  x:=-(320*c div 640)-(a*c div 640)+320;
  y:=240-(b*c div 640);
  end
  else begin
  x:=-(320-a)*(c div 640)+320;
  y:=240+(b*c div 640);
  end;
 end
 else begin
 if b<240
  then begin
  x:=320-(a*c div 640);
  y:=240-(b*c div 640);
  end
  else begin
  x:=320+(a*c div 640);
  y:=240+(b*c div 640);
  end;
 end;
end;
begin
clrscr;
writeln ('enter a, b, c');
readln (a, b, c);
three;
writeln (x, ' ', y);
readln;
end.