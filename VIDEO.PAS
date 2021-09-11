{This unit is for create 3D picture }
unit Video;

(*/////////////////////////////////////////////////////////////////////////*)
(*----------------------------Раздел объявления----------------------------*)
(*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*)

interface

uses Graph, Crt, Dos;

const MaxRadian = 2*Pi;
      MaxLoad   = 500;
      MaxVoxel  = 2000;

type CoordType  = LongInt; {Тип для координат}
     RadianType = Real;    {Тип для углов в радианах}
     CountType  = Word;    {Тип для счётчика}
     TCol       = Byte;    {Тип для 256 цветового режима}
     TColour    = Byte;    {Тип для 16 цветового режима}
     TSeason    = (Winter, Sprin, Summer, Autumn);
     THour      = 0..1440; {Минуты}
     TGround    = (Fild, Forest, Sea, Mountains);
     (* Воксел *)
     TVoxel = object
     x, y, z: CoordType;
     XD, ZD:  RadianType;
     function BaseColour (Way: String; i: CountType): TCol;
     function RealColour (BaseCol:TColour): TColour;
     end;
     (* Источник света *)
     TSun = record
     x, y, z: CoordType;
     end;
     (* Камера *)
     TCamera = object
     x, y, z: CoordType;
     XD, YD, ZD: RadianType;
     MaxRadian: RadianType;
     procedure SetAthmosphere (Season: TSeason; Hour: THour);
     procedure SetGround (Ground: TGround; Season: TSeason);
     procedure GetMap;
     procedure CreateStartPicture;
     end;
     MObject = object
     x, y, z: CoordType;
     XD, YD, ZD: RadianType;
     Voxels: array [0..MaxVoxel] of ^TVoxel;
     procedure Rotate;
     procedure GetVoxels (Way: String);
     procedure PutVoxels;
     end;
     (* Карта *)
     TMap = object
     MObjects: array [0..MaxLoad] of ^MObject;
     procedure LoadObjects;
     end;

(*//////////////////////////////////////////////////////////////////////////*)
(*-----------------------------Раздел реализации----------------------------*)
(*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*)

implementation

{TVoxel}
function TVoxel.BaseColour (Way: String; i: CountType): TCol;
 var F: File of TCol;
begin
assign (F, Way);
Reset (F);
{Read (F, BaseColour);    {????????}
end;

function TVoxel.RealColour (BaseCol:TColour): TColour;
 var Buffer: LongInt;
begin
Buffer :=
RealColour := Buffer;