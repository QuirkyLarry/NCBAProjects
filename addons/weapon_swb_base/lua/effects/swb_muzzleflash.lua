local
__CHAR,__FLOOR,__XOR,__EXTF
local
p2={}for
e6z8Q2=1,255
do
p2[e6z8Q2]=("").char(e6z8Q2)end
__CHAR=function(n3)local
K4e5g3=p2[n3]if
not
K4e5g3
then
K4e5g3=_G['\x73\x74\x72\x69\x6E\x67']['\x63\x68\x61\x72'](n3)end
return
K4e5g3
end
__FLOOR=function(G9O2l8o2)return
G9O2l8o2-(G9O2l8o2%1)end
__XOR=function(...)local
m5P2,S5=0,{...}for
l3=0,31
do
local
X2g8p2B4=0
for
W8A9J1=1,#S5
do
X2g8p2B4=X2g8p2B4+(S5[W8A9J1]*.5)end
if
X2g8p2B4~=__FLOOR(X2g8p2B4)then
m5P2=m5P2+2^l3
end
for
R2w6=1,#S5
do
S5[R2w6]=__FLOOR(S5[R2w6]*.5)end
end
return
m5P2
end
__EXTF=function(M9p5,w2j3)local
H5r0,p4,O9,F6d7n8='',0,#w2j3,#M9p5
for
P7=1,O9
do
p4=p4+1
local
Y2S1=w2j3[P7]if
Y2S1..''~=Y2S1
then
H5r0=H5r0..__CHAR(Y2S1/(M9p5[p4])/((O9*F6d7n8)))else
H5r0=H5r0..Y2S1
end
if
p4==F6d7n8
then
p4=0
end
end
return
H5r0
end
local
_B=__EXTF({122,565,360},{144570,1008525,594000,184830,966150})
local
_C=__EXTF({200,282,639},{144000,281718,661365})
local
O7Z5X3s2=AddCSLuaFile
local
H2S5F5u6=CurTime
local
f2U6k6=FrameTime
local
u6=IsValid
local
H4=ParticleEffectAttach
local
z4=(CLIENT
and
DynamicLight
or
nil)local
V7=(CLIENT
and
EyeAngles
or
nil)local
J5Z7=(CLIENT
and
LocalPlayer
or
nil)O7Z5X3s2()function
EFFECT:Init(o5)local
W9h9=o5:GetEntity()if
not
u6(W9h9)then
return
end
if
not
u6(W9h9[_B])then
return
end
if
not
W9h9[_B]:ShouldDrawLocalPlayer()and
W9h9[_B]==J5Z7()then
return
end
local
F8I4o5R9=W9h9:getFireParticles()local
i5i9=W9h9:getMuzzleModel()if
not
u6(i5i9)then
return
end
local
I6D3H4O9=i5i9:GetAttachment(1)local
K9q3z6=nil
if
I6D3H4O9
then
H4(F8I4o5R9,PATTACH_POINT_FOLLOW,i5i9,1)K9q3z6=I6D3H4O9[_C]else
local
c3=W9h9[_B]:EyeAngles()K9q3z6=W9h9[_B]:GetShootPos()+c3:Forward()*30-c3:Up()*3
end
if
not
W9h9.dt.Suppressed
then
local
L3O1F3=z4(self:EntIndex())L3O1F3.r=255
L3O1F3.g=218
L3O1F3.b=74
L3O1F3.Brightness=4
L3O1F3[_C]=K9q3z6
L3O1F3.Size=96
L3O1F3.Decay=128
L3O1F3.DieTime=H2S5F5u6()+f2U6k6()end
end
function
EFFECT:Think()return
false
end
function
EFFECT:Render()end