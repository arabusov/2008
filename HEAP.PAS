program uses_pointer;
 type t1 = array [1..640] of byte;
      t2 = array [1..480] of ^t1;
 var v1: t2;
     v5: array [1..78] of byte;
     y: word;
begin
 for y:=1 to 450 do begin
 new (v1 [y]);
 end;
end.