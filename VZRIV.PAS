uses crt;
procedure vniz;
var hz: word;
begin
hz:=880;
 repeat
 sound (hz);
 delay (1000);
 nosound;
 hz:=hz-40;
 until hz<=15;
end;
procedure vzriv;
var hz: word;
begin
sound (100);
delay (1000);
nosound;
vniz;
sound (16);
delay (1000);
nosound;
end;
begin
vzriv;
end.
