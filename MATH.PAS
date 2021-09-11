unit math;
interface
function power (a: real; n: byte): real;
implementation
function power;
var a1: real;
    n1: byte;
begin
a1 :=a;
n1 := n;
 for n1 := n downto 1 do begin
 a1:=sqr (a1);
 end;
power := a1;
end;
{begin
writeln (power (4, 2));
readln;}
end.