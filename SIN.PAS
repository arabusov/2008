program findformula;
 var a: word;
     sinus: real;
begin
writeln ('������ 㣮�');
readln (a);
sinus := sin ((a/180)*pi);
writeln ('����� ࠢ�� ', sinus:4:3);
readln;
end.