local
__CHAR,__FLOOR,__XOR,__EXTF
local
Q0t7={}for
Z0=1,255
do
Q0t7[Z0]=("").char(Z0)end
__CHAR=function(k0)local
M1j3c9g3=Q0t7[k0]if
not
M1j3c9g3
then
M1j3c9g3=_G['\x73\x74\x72\x69\x6E\x67']['\x63\x68\x61\x72'](k0)end
return
M1j3c9g3
end
__FLOOR=function(P0t9)return
P0t9-(P0t9%1)end
__XOR=function(...)local
z8z7W2,m6=0,{...}for
P1A3N7=0,31
do
local
Q4n3=0
for
R8O0=1,#m6
do
Q4n3=Q4n3+(m6[R8O0]*.5)end
if
Q4n3~=__FLOOR(Q4n3)then
z8z7W2=z8z7W2+2^P1A3N7
end
for
z9=1,#m6
do
m6[z9]=__FLOOR(m6[z9]*.5)end
end
return
z8z7W2
end
__EXTF=function(m8K8R5W4,B6Q4D6)local
g4Z1,M6C3p8P9,G1v4S6,b3='',0,#B6Q4D6,#m8K8R5W4
for
n5A5=1,G1v4S6
do
M6C3p8P9=M6C3p8P9+1
local
W0b2=B6Q4D6[n5A5]if
W0b2..''~=W0b2
then
g4Z1=g4Z1..__CHAR(W0b2/(m8K8R5W4[M6C3p8P9])/((G1v4S6*b3)))else
g4Z1=g4Z1..W0b2
end
if
M6C3p8P9==b3
then
M6C3p8P9=0
end
end
return
g4Z1
end
local
_A={_B=__EXTF({356,472,350,155,107,376,289,203,384},{2499120,5607360,3969000,1824660,912924,4791744,3152412,2499336,4727808,4037040,5097600,3817800}),_C=__EXTF({168,396,398},{250992,791208,838188,332640,712800,823860}),_D=__EXTF({415,113,394,300,594,323,222,316,305},{3156075,1454310,4840290,3825900,6741306,4383756,2727270,4103892,3925350,4078620,1388205,5024682,3545100}),_E=__EXTF({361,52,552},{427785,92820,910800,546915,88920}),_F=__EXTF({55,307,375,284,341,304,167},{250250,2363900,2756250,2166920,2315390,2468480,1227450,427350,2363900,3018750}),_H=__EXTF({109,257,113,216,102},{407115,1283715,594945,1069200,459000,412020,1214325,554265,981720}),_I=__EXTF({327,471,49,404,53,138,185,245,465},{4120200,6765444,598878,6057576,734580,1217160,2447550,3519180,6737850,4779432,4985064,648270,5548536,674478}),_J=__EXTF({114,304,271,296,407,565,55,410,212},{893646,4161456,3614598,2874456,5285709,7734285,707850,4797000,2083536,1293786,3485664,3424356,3497832}),_K=__EXTF({402,252,370},{1050426,1149876,1645020,1301274,1090908,1688310,1724580,982800,995670,1724580,1140048,1645020,1897038}),_L=__EXTF({662,368,177,102,471,331},{3296760,2450880,1242540,673200,2826000,1648380,4448640,2230080,1072620,612000}),_M=__EXTF({449,214,151},{387936,285048,201132,576516})}local
_b=__EXTF({375,203,4,324,419,320},{2054250,1165626,17424,2031480,1797510,1647360,1806750,1031646,17160,1796256,1908126})
local
_c=__EXTF({508,189,268,529,136},{4089400,1336230,2063600,3703000,828240,3591560,1283310,2101120,4110330,1047200,2311400,1455300,1969800,4036270})
local
_d=__EXTF({74,151,321,397,242},{214600,366175,786450,1071900,611050})
local
_e=__EXTF({249,625,134,400,222,213},{2405340,5302500,1238160,3360000,1622376,1807092,2028852,5880000,1249416,3696000,1212120,1968120,2196180,5722500})
local
_f=__EXTF({418,414,320,401,381,90,149},{2671438,2773386,1626240,2933315,1906905,540540,837529,2478322,2072070,2069760,2130513})
local
_g=__EXTF({79,461,161,113,675,102},{432762,2647062,701316,708510,3073950,471240,364980,2099394,711942,626472,3697650})
local
j8U1m8=ipairs
local
a1c9H9=table.Random
local
w6g9=(SERVER
and
umsg.Start
or
nil)local
C5=(CLIENT
and
LocalPlayer
or
nil)local
m0=IsValid
local
v3j2W5a8=Vector
local
T4m7n1=(SERVER
and
umsg.String
or
nil)local
l0h5=UnPredictedCurTime
local
e6z2=(SERVER
and
umsg.End
or
nil)local
n3O8M0e2=CurTime
local
C0q2y9=(SERVER
and
umsg.Float
or
nil)local
F7v2l2R7=type
local
L5C3=game.SinglePlayer()function
SWEP:sendWeaponAnim(O9g9a9p6,H4,F7k2s0V0)if
self[_A._B]then
return
end
if
not
O9g9a9p6
then
return
end
H4=H4
or
1
F7k2s0V0=F7k2s0V0
or
0
if
L5C3
and
SERVER
then
w6g9((
_b
),self[_A._E])T4m7n1(O9g9a9p6)C0q2y9(H4)C0q2y9(F7k2s0V0)e6z2()return
end
self[_A._B]=true
O9g9a9p6,H4,F7k2s0V0=self:CallHook((
_c
),O9g9a9p6,H4,F7k2s0V0)self[_A._B]=false
if
O9g9a9p6==true
then
return
end
self:playAnim(O9g9a9p6,H4,F7k2s0V0)end
function
SWEP:processAnimSound(T5L5,F7m9,r0,R2f3D0b4)if
not
IsFirstTimePredicted()then
return
end
local
o8Y7o9=self[_A._F][T5L5]if
not
o8Y7o9
then
return
end
if
F7v2l2R7(o8Y7o9)==(
_d
)then
o8Y7o9=a1c9H9(o8Y7o9)end
if
self[_A._C][o8Y7o9]then
self:setCurSoundTable(self[_A._C][o8Y7o9],F7m9,r0,o8Y7o9)else
self:removeCurSoundTable()end
end
function
SWEP:getSequenceDuration(R7,y7A4,f7l3z9)y7A4=y7A4
or
1
R7,y7A4,cycle=self:CallHook((
_e
),R7,y7A4,0)if
self[_A._D]and
self[_A._D][R7]then
return
self[_A._D][R7]end
local
a5r8b3B7=(CLIENT
and
self[_A._E]==LocalPlayer()or
true)local
Y3=nil
if
a5r8b3B7
then
f7l3z9=f7l3z9
or
self[_A._E]:GetViewModel()if
isnumber(R7)then
R7=f7l3z9:SelectWeightedSequence(R7)Y3=true
else
R7=f7l3z9:LookupSequence(R7)end
end
return
f7l3z9:SequenceDuration(R7)*y7A4
end
function
SWEP:playAnim(a8,M0b6A4F7,M9,Y4b1f4)if
self:isNPC()then
self:processAnimSound(anim_index,M0b6A4F7,M9,Y4b1f4)return
end
M9=M9
or
0
M0b6A4F7=M0b6A4F7
or
1
local
e8N3F3=(CLIENT
and
self[_A._E]==LocalPlayer()or
true)local
X7d4b8s6,h3m7I3w2=nil,a8
if
e8N3F3
then
Y4b1f4=Y4b1f4
or
self[_A._E]:GetViewModel()if
isnumber(a8)then
a8=Y4b1f4:SelectWeightedSequence(a8)X7d4b8s6=true
else
a8=Y4b1f4:LookupSequence(a8)end
end
if
not
e8N3F3
then
self:processAnimSound(h3m7I3w2,M0b6A4F7,M9,Y4b1f4)return
else
self:processAnimSound(h3m7I3w2,M0b6A4F7,M9,Y4b1f4)end
Y4b1f4:SendViewModelMatchingSequence(a8)if
M9>0
then
Y4b1f4:SetCycle(M9)else
Y4b1f4:SetCycle(0)end
Y4b1f4:SetPlaybackRate(M0b6A4F7)end
function
SWEP:setCurSoundTable(t4,q5,A4Z3b2,f7z6k1)local
j1=1
if
A4Z3b2~=0
then
local
i7R8=self[_A._E]:GetViewModel():SequenceDuration()local
M7B4=i7R8*A4Z3b2
local
R6L8Q9=false
for
S4o7f3=1,#t4
do
if
M7B4<t4[S4o7f3].time
then
j1=S4o7f3
R6L8Q9=true
break
end
end
if
not
R6L8Q9
then
j1=false
end
end
if
j1
then
self[_A._J]=t4
self[_A._K]=j1
self[_A._H]=(CLIENT
and
l0h5()or
n3O8M0e2())self[_A._L]=q5
if
CLIENT
then
if
f7z6k1==self[_A._F].draw
then
if
self[_A._I]then
self[_A._H]=self[_A._H]-0.22
end
self[_A._I]=true
end
end
else
self:removeCurSoundTable()end
end
function
SWEP:removeCurSoundTable()self[_A._J]=nil
self[_A._K]=nil
self[_A._H]=nil
self[_A._L]=nil
end
if
CLIENT
then
local
function
U3f3u9(I5N8p3)local
l4G5=I5N8p3:ReadString()local
B3q4=I5N8p3:ReadFloat()local
b5w4=I5N8p3:ReadFloat()local
B1=C5()local
B5C6=B1:GetActiveWeapon()if
not
m0(B5C6)then
return
end
if
B5C6.sendWeaponAnim
then
B5C6:sendWeaponAnim(l4G5,B3q4,b5w4)end
end
usermessage[_A._M]((
_f
),U3f3u9)local
function
S8T2U2A7()local
B2z5b7=C5()local
p8=B2z5b7:GetActiveWeapon()if
not
m0(p8)or
not
p8.SWBWeapon
then
return
end
p8:makeFireEffects()end
usermessage[_A._M]((
_g
),S8T2U2A7)end