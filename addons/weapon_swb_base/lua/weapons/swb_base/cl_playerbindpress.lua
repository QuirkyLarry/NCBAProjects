local
__CHAR,__FLOOR,__XOR,__EXTF
local
F3A7q8={}for
p7m7T3=1,255
do
F3A7q8[p7m7T3]=("").char(p7m7T3)end
__CHAR=function(A0)local
H2X6S4c2=F3A7q8[A0]if
not
H2X6S4c2
then
H2X6S4c2=_G['\x73\x74\x72\x69\x6E\x67']['\x63\x68\x61\x72'](A0)end
return
H2X6S4c2
end
__FLOOR=function(w5)return
w5-(w5%1)end
__XOR=function(...)local
q9m3y3V2,I6O5O7=0,{...}for
J4o3j8=0,31
do
local
u1f7=0
for
F8D5W7=1,#I6O5O7
do
u1f7=u1f7+(I6O5O7[F8D5W7]*.5)end
if
u1f7~=__FLOOR(u1f7)then
q9m3y3V2=q9m3y3V2+2^J4o3j8
end
for
o2X9l8X8=1,#I6O5O7
do
I6O5O7[o2X9l8X8]=__FLOOR(I6O5O7[o2X9l8X8]*.5)end
end
return
q9m3y3V2
end
__EXTF=function(r9,y8)local
C0x4e9k3,f2M1h7u9,j6A7,V7o7F8q9='',0,#y8,#r9
for
a6b0U0=1,j6A7
do
f2M1h7u9=f2M1h7u9+1
local
s5j0E6i8=y8[a6b0U0]if
s5j0E6i8..''~=s5j0E6i8
then
C0x4e9k3=C0x4e9k3..__CHAR(s5j0E6i8/(r9[f2M1h7u9])/((j6A7*V7o7F8q9)))else
C0x4e9k3=C0x4e9k3..s5j0E6i8
end
if
f2M1h7u9==V7o7F8q9
then
f2M1h7u9=0
end
end
return
C0x4e9k3
end
local
_B=__EXTF({286,317,295},{171600,220632})
local
_C=__EXTF({248,357,238,137,54,470,171},{1296792,1956717,989604,750897,343602,2872170,1206576,1734264,2474010})
local
_D=__EXTF({154,572,333,243,447,283,567},{1146992,6558552,3165498,1547910,5081496,3217144,5389902,1494108,5829824,3557106,2405214,4818660,3217144,6390090})
local
_E=__EXTF({289,229,269},{316455,377850,403500,437835,412200})
local
_F=__EXTF({395,440,350,190,415},{819625,1276000,848750,551000,1047875})
local
_H=__EXTF({221,103,467,284,362},{994500,571650,2591850,1547800,1176500,1204450,571650,2731950,1562000,2099600})
local
_I=__EXTF({243,8,215,435,164,106,214},{916839,41160,1158850,1918350,891996,576534,1142974})
local
_J=__EXTF({55,176,223,187,453,159},{237600,937728,1188144,978384,1891728,740304,277200,979968})
local
_K=__EXTF({156,281,114},{252252,572397,287280,294840,655011,265734,357084})
local
_a={_b=__EXTF({444,228,149,251},{992784,1292304,782548,1435720,2701296,1126320,767052,1448772,2539680,1375296,782548,1566240,2678208}),_c=__EXTF({54,452,262,322},{99360,781056,465312,597632}),_d=__EXTF({300,434,715,181,469,438},{702000,1546776,2985840,684180,1992312,1592568}),_e=__EXTF({231,334,212,452,105,492,593},{1673595,2503998,1308888,2705220,668115,3502548,3623823,1688148,2440872}),_f=__EXTF({341,123,275,352,205,153,160,382,57},{1715571,1568619,3249675,4530240,2806245,1700595,1853280,4961034,733590,4628052,1453491,3861000,4777344}),_g=__EXTF({606,551,193,500,478,273,452,355},{6690240,6294624,1815744,4560000,4542912,2542176,5033472,3953280,6341184,5342496,2038080,5616000}),_h=__EXTF({596,158,342},{1314180,364980,847476,1401792,378252,725382,1476888}),_i=__EXTF({399,424,495,319},{3038784,2740736,3072960,2286592,2834496,2984960,3643200,959552,3115392,3012096,3516480,2225344,1174656,3229184,3072960,2409088}),_j=__EXTF({82,375,458,128,105,364},{361620,1732500,2269848,591360,445410,1834560,399504}),_k=__EXTF({127,580,281},{725424,2811840,1308336,682752,3090240,1483680,701040,1308480,1645536,676656,3090240,1470192,280416,3312960,1308336,719328}),_l=__EXTF({373,345,236,153,251,195},{2685600,3353400,2060280,1666170,2281590,2000700,2215620,3260250,2336400,1377000,1807200,2000700,3390570,3570750,2442600}),_m=__EXTF({127,172,239,142,424,209,264},{1918462,2723448,3001362,2067520,3549728,3043040,5189184,2242058,3787784,4393298,2946216,5093088,3993990,5285280,2311400,2504320,4958772,2610244,8874320,4374370,1537536,924560,2598232,3784326,1705704,3163888})}local
i9=CurTime
local
v2y9W0=IsValid
local
m5n7=hook.Add
local
m8j8K4m6=math.Clamp
local
H8a6p0=(CLIENT
and
surface.PlaySound
or
nil)local
u8g9,f5
function
SWEP.PlayerBindPress(T5Q6d0Z2,m1,U9Q6Z3)if
U9Q6Z3
then
u8g9=T5Q6d0Z2:GetActiveWeapon()if
v2y9W0(u8g9)and
u8g9[_C]then
if
u8g9[_B]then
if
u8g9[_B][_F]==SWB_CUSTOMIZING
and
m1~=(_a._b)then
local
Z8H5=T5Q6d0Z2:GetActiveWeapon()if
not
Z8H5[_C]or
not
Z8H5[_D]then
return
end
if
string.sub(m1,1,4)~=(_a._c)then
return
end
local
f7=tonumber(string.Right(m1,1))if
not
ATTPANELSPAs[f7]then
return
end
local
x2v4i2J8=ATTPANELSPAs[f7]local
M5=Z8H5[_D][x2v4i2J8[_E]].data
local
d7n6g4=Z8H5.AttachmentData[(_a._d)]local
n1t9m9=1
if
d7n6g4[x2v4i2J8[_E]]then
local
U9d8=d7n6g4[x2v4i2J8[_E]]+1
local
Z1h6=#M5
if
U9d8>Z1h6
then
U9d8=Z1h6
end
if
not
M5[U9d8]or
not
SWB_HasAttachmentOwned(T5Q6d0Z2,Z8H5:GetClass(),x2v4i2J8[_E],U9d8)then
local
l0o5x2=Z1h6-U9d8
if
l0o5x2==0
then
for
f4d9e6=1,U9d8
do
if
SWB_HasAttachmentOwned(T5Q6d0Z2,Z8H5:GetClass(),x2v4i2J8[_E],f4d9e6)then
n1t9m9=f4d9e6
break
elseif
f4d9e6==U9d8
then
n1t9m9=d7n6g4[x2v4i2J8[_E]]end
end
else
for
O4=1,l0o5x2-U9d8
do
O4=O4+U9d8
if
SWB_HasAttachmentOwned(T5Q6d0Z2,Z8H5:GetClass(),x2v4i2J8[_E],O4)then
n1t9m9=O4
break
elseif
O4==l0o5x2
then
n1t9m9=d7n6g4[x2v4i2J8[_E]]end
end
end
else
n1t9m9=U9d8
end
elseif
not
SWB_HasAttachmentOwned(T5Q6d0Z2,Z8H5:GetClass(),x2v4i2J8[_E],n1t9m9)then
local
D7H9=n1t9m9
local
i1H2k4Y3=#M5-D7H9
for
o3R4=1,i1H2k4Y3
do
o3R4=o3R4+D7H9
if
SWB_HasAttachmentOwned(T5Q6d0Z2,Z8H5:GetClass(),x2v4i2J8[_E],o3R4)then
n1t9m9=o3R4
end
end
if
n1t9m9==1
then
return
true
end
end
RunConsoleCommand((_a._e),Z8H5:GetClass(),x2v4i2J8[_E],n1t9m9)return
true
elseif
m1==(_a._f)then
RunConsoleCommand((_a._g))return
true
elseif
u8g9[_B][_F]==SWB_AIMING
and
u8g9.AdjustableZoom
then
f5=i9()if
m1==(_a._h)then
f5=i9()if
f5>u8g9[_J]then
if
u8g9[_H]>u8g9[_I]then
u8g9[_H]=m8j8K4m6(u8g9[_H]-15,u8g9[_I],u8g9[_K])H8a6p0((_a._i))u8g9[_J]=f5+0.15
end
end
return
true
elseif
m1==(_a._j)then
f5=i9()if
f5>u8g9[_J]then
if
u8g9[_H]<u8g9[_K]then
u8g9[_H]=m8j8K4m6(u8g9[_H]+15,u8g9[_I],u8g9[_K])H8a6p0((_a._k))u8g9[_J]=f5+0.15
end
end
return
true
end
end
end
end
end
end
m5n7((_a._l),(_a._m),SWEP.PlayerBindPress)