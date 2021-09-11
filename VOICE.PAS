uses crt;
var hz, mydelay: word;
procedure voice;
begin
mydelay:=300;
 repeat
 sound (hz);
 delay (mydelay);
 nosound;
 hz:=hz+10;
 until keypressed;
end;
begin
hz:=16;
voice;
end.