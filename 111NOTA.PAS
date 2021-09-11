program Gimn;
 uses CRT;
 var tempo: word;

procedure nota (dlit, inter: word; octava: real);
var hz: word;
begin
 case inter of
 1: hz:=440;
 2: hz:=440+27;
 3: hz:=440+55;
 4: hz:=440+27+55;
 5: hz:=550;
 6: hz:=550+110 div 3;
 7: hz:=550+(2*(110 div 3));
 8: hz:=660;
 9: hz:=660+110 div 3;
 10: hz:=660+(2*(110 div 3));
 11: hz:=787;
 12: hz:=770+55;
 end;
hz:=round(hz*octava);
sound (hz);
delay (tempo div dlit);
nosound;
end;

begin
tempo:=10000;
nota (8, 4, 1);
nota (2, 9, 1);
nota (3, 4, 1);
nota (8, 6, 1);
nota (2, 8, 1);
nota (4, 1, 1);
nota (4, 1, 1);
nota (2, 6, 1);
nota (3, 4, 1);
nota (8, 2, 1);
nota (2, 4, 1);
nota (3, 9, 0.5);
nota (8, 9, 0.5);
nota (2, 11, 0.5);
nota (3, 11, 0.5);
nota (8, 1, 1);
nota (2, 2, 1);
nota (3, 2, 1);
nota (8, 4, 1);
nota (2, 6, 1);
nota (3, 8, 1);
nota (8, 9, 1);
nota (2, 11, 1);
end.