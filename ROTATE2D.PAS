program graph2d;
 uses Crt, Graph;
 type RotateType = 0..359;
 var  gd, gm:      integer;
      kl:          char;
      gradus:      RotateType;
      ex:          Boolean;

procedure rotate (XCenter, YCenter: Word; radius: Word; vector: RotateType);
 var X2, Y2: Word;
begin
 case vector of
 0..89:     begin X2 := round(XCenter + radius * sin(pi * vector/180));
            Y2 := round(YCenter - radius * cos(pi * vector/180));
            end;
 90..179:   begin vector := vector mod 90; X2 := round(XCenter + radius * sin(pi * vector/180));
            Y2 := round(YCenter + radius * cos(pi * vector/180));
            end;
 180.. 269: begin vector := vector mod 90; X2 := round(XCenter - radius * sin(pi * vector/180));
            Y2 := round(YCenter + radius * cos(pi * vector/180));
            end;
 270.. 359: begin vector := vector mod 90; X2 := round(XCenter - radius * cos(pi * vector/180));
            Y2 := round(YCenter - radius * sin(pi * vector/180));
            end;
 end;
line (XCenter, YCenter, X2, Y2);
end;

begin
gd := 0;
initgraph (gd, gm, '');
setcolor (12);
gradus := 0;
 repeat
 if keypressed then begin
  kl := readkey;
  case kl of
  'd':
closegraph;
end.