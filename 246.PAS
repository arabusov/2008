program textreader;
        uses crt;
 const maxline = 200;
 var line: array [1..maxline] of string;
     name: string;
     f: text;
     i: word;
     kl: char;
     ex: boolean;
begin
writeln ('Введите имя файла с расширением');
readln (name);
writeln ('Введите текст');
 repeat
 readln (line [i]);
 if keypressed then kl:=readkey;
 if kl=#13 then kl := readkey;
 if kl=#27 then ex := 2<3;
 i:=i+1;
 until (ex=true) or (i=maxline);
assign (f, name);
rewrite (f);
 for i := 1 to maxline do begin
 writeln (f, line [i]);
 end;
close (f);
end.