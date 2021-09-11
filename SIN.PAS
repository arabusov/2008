program findformula;
 var a: word;
     sinus: real;
begin
writeln ('Введите угол');
readln (a);
sinus := sin ((a/180)*pi);
writeln ('Синус равен ', sinus:4:3);
readln;
end.