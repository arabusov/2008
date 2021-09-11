{$R+;$Q+}
{$N+;$E+}
unit Plane;

interface

uses Crt, Graph, Dos, UMFT2;

const
     MouseMaxX = 82;
     MouseMaxY = 26;

type
 TFlight = object
         N,{power}NCoeff,u,{speed}dt,{time}
         D,{Middle} S,{Square}p,{plott}
         cx {coeffx}, cy, Rx, Ry, Rz,
         m, {massa} g, FN, {reak opor}
         mx, my, mz, {moments of forces}
         x, y, z, vx{vector x}, vy, vz:    Double;
         ex: Boolean;
 procedure Key;
 procedure Vectors;
 procedure Forces;
 procedure Result;
 procedure Run;
 procedure Init;
 end;

implementation

procedure TFlight.Init;
begin
ex := False;
N := 0;
NCoeff := 70000;{power of flight}
mx := 0;
my := 0;
mz := 0;
u := 0;
D := 1;
S := 16;
p := 1.27;
cx := 0.2;
cy := 0.7;
m := 5000;
g := 9.8;
vx := 0;
vy := 0;
vz := 0;
x := 0;
y := 0;
z := 0;
dt := 0.04;
end;

procedure TFlight.Key;
 var kl: char;
begin
if keypressed then kl := ReadKey;
 case kl of
 '`': N := 0;
 '1': N := 0.1 * NCoeff;
 '2': N := 0.2 * NCoeff;
 '3': N := 0.3 * NCoeff;
 '4': N := 0.4 * NCoeff;
 '5': N := 0.5 * NCoeff;
 '6': N := 0.6 * NCoeff;
 '7': N := 0.7 * NCoeff;
 '8': N := 0.8 * NCoeff;
 '9': N := 0.9 * NCoeff;
 '0': N := 1.0 * NCoeff;
 ']': ex := True;
 end;
mz := -mouse_y + (MouseMaxY/2);
mx := -mouse_x + (MouseMaxX/2);
 if mouse_left  then my :=  50;
 if mouse_right then my := -50;
 if not (mouse_left xor mouse_right) then my := 0;
end;

procedure TFlight.Forces;
 var MyN: Double;
begin
 if (cy*s*p*u*u/2) <= (m*g)
  then FN := (m * g) - (cy*s*p*u*u/2)
  else FN := 0;
 if (N=0) or (u=0) then MyN := 0;
 if (N>0) and (u=0) then MyN := 10E+0077; {neizv chislo}
 if (N>0) and (u<>0) then MyN := N/u;
Rx := MyN - (cx*D*p*sqr(u)/2) + (m * g * cos (vy) * cos (vz+(pi/2)));
Ry := (cy*s*p*u*u/2) + (m * g* cos (vx) * cos (vz+pi)) + FN;
Rz := m * g * sin (vx) * sin (vy);
end;

procedure TFlight.Vectors;
begin
vx := vx + mx * dt * pi/300 * u; {pi/2 - 60 gradusov, by 1 second-60gr}
vy := vy + my * dt * u * pi/300;
vz := vz + mz * dt * u * pi/1800;
end;

procedure TFlight.Result;
begin
if Rx<>0 then u := abs(u + Rx*dt/m)
         else u := 0;
x := x + sin(vy)*sin(vz)*Rx*dt*dt/(2*m);
y := y + sin(vx)*sin(vz)*Ry*dt*dt/(2*m);
z := z + cos(vy)*cos(vx)*Ry*dt*dt/(2*m);
end;

procedure TFlight.Run;
begin
Key;
Vectors;
Result;
Forces;

end;

end.