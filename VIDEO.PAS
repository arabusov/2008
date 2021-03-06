{This unit is for create 3D picture }
unit Video;

(*/////////////////////////////////////////////////////////////////////////*)
(*----------------------------������ �������----------------------------*)
(*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*)

interface

uses Graph, Crt, Dos;

const MaxRadian = 2*Pi;
      MaxLoad   = 500;
      MaxVoxel  = 2000;

type CoordType  = LongInt; {��� ��� ���न���}
     RadianType = Real;    {��� ��� 㣫�� � ࠤ�����}
     CountType  = Word;    {��� ��� ����稪�}
     TCol       = Byte;    {��� ��� 256 梥⮢��� ०���}
     TColour    = Byte;    {��� ��� 16 梥⮢��� ०���}
     TSeason    = (Winter, Sprin, Summer, Autumn);
     THour      = 0..1440; {������}
     TGround    = (Fild, Forest, Sea, Mountains);
     (* ���ᥫ *)
     TVoxel = object
     x, y, z: CoordType;
     XD, ZD:  RadianType;
     function BaseColour (Way: String; i: CountType): TCol;
     function RealColour (BaseCol:TColour): TColour;
     end;
     (* ���筨� ᢥ� *)
     TSun = record
     x, y, z: CoordType;
     end;
     (* ����� *)
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
     (* ���� *)
     TMap = object
     MObjects: array [0..MaxLoad] of ^MObject;
     procedure LoadObjects;
     end;

(*//////////////////////////////////////////////////////////////////////////*)
(*-----------------------------������ ॠ����樨----------------------------*)
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