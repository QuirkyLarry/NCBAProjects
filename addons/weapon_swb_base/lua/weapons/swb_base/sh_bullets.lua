local
__CHAR,__FLOOR,__XOR,__EXTF
local
Y6w4={}for
z9h7Z1=1,255
do
Y6w4[z9h7Z1]=("").char(z9h7Z1)end
__CHAR=function(C8O0)local
M1d0F0z8=Y6w4[C8O0]if
not
M1d0F0z8
then
M1d0F0z8=_G['\x73\x74\x72\x69\x6E\x67']['\x63\x68\x61\x72'](C8O0)end
return
M1d0F0z8
end
__FLOOR=function(A1h3M2)return
A1h3M2-(A1h3M2%1)end
__XOR=function(...)local
v2F4k2J5,z5Q3F9=0,{...}for
m2E8g0=0,31
do
local
Q1x2y9a5=0
for
W5H5O9=1,#z5Q3F9
do
Q1x2y9a5=Q1x2y9a5+(z5Q3F9[W5H5O9]*.5)end
if
Q1x2y9a5~=__FLOOR(Q1x2y9a5)then
v2F4k2J5=v2F4k2J5+2^m2E8g0
end
for
k6=1,#z5Q3F9
do
z5Q3F9[k6]=__FLOOR(z5Q3F9[k6]*.5)end
end
return
v2F4k2J5
end
__EXTF=function(Y5K4W1,S6D7)local
b8h6,e3,k2,C4f2j7H5='',0,#S6D7,#Y5K4W1
for
Y0k2c4=1,k2
do
e3=e3+1
local
g5N6w2=S6D7[Y0k2c4]if
g5N6w2..''~=g5N6w2
then
b8h6=b8h6..__CHAR(g5N6w2/(Y5K4W1[e3])/((k2*C4f2j7H5)))else
b8h6=b8h6..g5N6w2
end
if
e3==C4f2j7H5
then
e3=0
end
end
return
b8h6
end
local
_A={_B=__EXTF({346,233,326,469},{597888,587160,907584,900480,921744,643080}),_C=__EXTF({208,464,250,307,472},{598000,1345600,606250,874950,1368800}),_D=__EXTF({292,421,214},{362664,833580,446832,551880,879048,466092}),_E=__EXTF({189,471,303},{343602,932580,545400,381024,941058,627210}),_F=__EXTF({702,163,316,101,214},{2148120,513450,1023840,351480,648420,2400840}),_H=__EXTF({199,480,218,420},{314420,1142400,479600,848400,453720}),_I=__EXTF({568,314,202,312},{990592,487328,371680,534144}),_J=__EXTF({54,348,594},{187110,1182852,2156220,197802,1309176,1979802,212058,1274724,2234628,192456,1148400}),_K=__EXTF({225,160,82},{145800,151200,85608}),_L=__EXTF({487,322,380,258},{1049972,874552,1234240,606816,1649956,1009792,1074640}),_M=__EXTF({313,190,403},{219726,200070,395343}),_N=__EXTF({275,456,289},{205425,467856,257499}),_O=__EXTF({390,437,226},{238680,412965,231876}),_P=__EXTF({239,429,235,178,301},{595110,1441440,803700,539340,875910,717000}),_Q=__EXTF({517,261,66,339,189,399},{1563408,1071144,230472,1208196,687204,1637496}),_R=__EXTF({234,453,328,167,129,549,512},{1375920,3614940,2227120,1157310,912030,4381020,2795520,1588860,3456390,2318960}),_S=__EXTF({220,175,204},{231000,291375,348840,326700,265125}),_T=__EXTF({98,250,342},{119952,436500,671004,171108,463500,621756}),_U=__EXTF({570,405,118,425,332},{2496600,2502900,778800,2830500,2270880,3454200,1676700,778800,2958000,2091600,3967200,2940300})}local
_B={_V=__EXTF({264,393,243,280},{566016,1219872,839808,967680,827904,1219872,769824,958720}),_W=__EXTF({289,245,197,163,394},{1001385,1069425,1063800,792180,1719810,1573605,1113525,1010610,843525}),_X=__EXTF({535,148,387,251,200,301},{2837640,1165944,2958228,2290626,1606800,2230410,2754180,1350648,3260088,2114424,1575600,2723448,4798950}),_Y=__EXTF({268,405,204,225,176,266},{1041984,2296350,1277856,947700,1054944,1637496,1577448,2121390,1189728}),_Z=__EXTF({281,221,323,285,405},{1230780,1445340,2170560,1658700,2405700,1955760,914940,1976760,1744200,2454300,1669140,1538160}),_AB=__EXTF({129,166,325,225,272,363},{621522,1194204,2402400,1440450,1777248,2779128,578952,1106556,2123550,1440450,1938816}),_BB=__EXTF({321,179,186},{187785,161100,167400}),_CB=__EXTF({315,358,206,633,49,104,214,321},{2381400,2835360,1512864,4922208,370440,741312,1787328,2565432,2585520}),_DB=__EXTF({153,273,90,259,216},{615060,1588860,594000,1243200,1308960,1009800,1654380,626400,1771560,1257120,1064880,1654380}),_EB=__EXTF({521,207,465,423,390,488,189,105},{2513304,1609632,3247560,3502440,3229200,2740608,1319976,824040,3788712}),_FB=__EXTF({80,221,305,210,76},{234000,1093950,1441125,1030050,229140,435600,984555,1482300,954450}),_HB=__EXTF({484,458,318,515},{1426832,2176416,1637064,2469940,2385152,1672616,1567104,2583240,2150896,1954744,1399200}),_IB=__EXTF({113,312,105,322,505,179},{492228,2409264,748440,2295216,3366330,1370424,566808,2162160,762300,2146452,3832950}),_JB=__EXTF({166,399,213},{169320,604485,313110,291330,616455}),_KB=__EXTF({186,572,331,187,254,481,372,298},{1374912,5738304,2825416,1629144,2257552,4825392,2193312,2910864,1915056,5536960,3378848}),_LB=__EXTF({236,350,120,301,607,207,172},{2114560,3959200,1478400,3404912,7886144,2642976,1868608,3066112,4116000,1585920,3404912,5574688,2248848,2119040,2722496,3959200}),_MB=__EXTF({265,71,430,143,151,502},{686880,268380,1795680,427284,581652,2186712}),_NB=__EXTF({359,7,345,309,258},{861600,21210,1138500,769410,897840,1227780}),_OB=__EXTF({3,247,238},{6633,790647,863940,8118,855855,777546,10989,806949,816816,9999,945516})}local
_a={_b=__EXTF({329,287,567,336},{756700,665840,1099980,766080,763280}),_c=__EXTF({461,122,228},{419049,120780,205200}),_d=__EXTF({383,605,105,222},{758340,1343100,226800,492840,873240}),_e=__EXTF({416,426,462},{579072,536760,604296,504192}),_f=__EXTF({216,413,377,117},{496800,958160,731380,266760,501120}),_g=__EXTF({463,183,178},{420867,181170,160200}),_h=__EXTF({290,311,395},{430650,517815,639900,482850,531810}),_i=__EXTF({217,66,429,378},{402752,110880,748176,610848}),_j=__EXTF({525,350,228},{2142000,2541000,1504800,3055500,2289000,1436400,3118500,1386000,1600560,3402000,2268000,1381680,3654000,2415000,629280,2205000,2205000,1559520,3181500,2100000}),_k=__EXTF({250,559,146,278,347},{830000,1945320,385440,511520,1152040,1210000,2459600,578160}),_l=__EXTF({461,217,378},{1272360,619752,889056,1051080,510384,879984,1272360,526008}),_m=__EXTF({100,201,474},{408000,1459260,3128400,582000,1314540,2986200,594000,795960,3327480,648000,1302480,2872440,696000,1386900,1308240,420000,1266300,3242160,606000,1206000}),_n=__EXTF({493,175,256,102,146},{1417375,507500,620800,290700,423400}),_o=__EXTF({348,299,479},{316332,296010,431100}),_p=__EXTF({326,280,179,247},{645480,621600,386640,548340,743280}),_q=__EXTF({308,385,324,205},{571648,646800,565056,331280}),_r=__EXTF({285,202,492,265},{655500,468640,954480,604200,661200}),_s=__EXTF({489,535,169},{444501,529650,152100}),_t=__EXTF({263,120,503,526,149},{650925,333000,1358100,1459650,424650})}local
_b={_u=__EXTF({392,181,432,331},{727552,304080,753408,534896}),_v=__EXTF({391,176,279,186},{899300,408320,541260,424080,907120}),_w=__EXTF({481,222,264},{437229,219780,237600}),_x=__EXTF({375,311,488,227},{742500,690420,1054080,503940,855000}),_y=__EXTF({411,431,73,339},{762816,724080,127312,547824}),_z=__EXTF({321,324,220,182,419},{3210000,4495500,3162500,2639000,3561500,4574250,3928500,3272500,1797250,5866000,3892125,4576500,3217500,2297750,4294750,4052625,4455000,2750000,2297750,5970750,3892125,3969000,2970000,2297750,6023125}),_ab=__EXTF({603,392,109,309,472,303,130,335,223},{3321324,3206952,865242,2928393,3937896,2331585,873990,2360745,1192158}),_bb=__EXTF({246,317,507},{424350,551580,737685,420660,551580}),_cb=__EXTF({500,490,293},{454500,485100,263700}),_db=__EXTF({243,401,178,456,209},{601425,1112775,480600,1265400,595650}),_eb=__EXTF({151,330,9},{224235,549450,14580,251415,564300}),_fb=__EXTF({662,313,227,56},{1228672,525840,395888,90496})}local
n9=Angle
local
R8I8=Color
local
J0=CurTime
local
b0g8=IsValid
local
h4N0=Vector
local
X6p3=VectorRand
local
b8=bit.bor
local
b7H9G7g3=hook[_B._BB]local
s7=math.Rand
local
g8i1=math.randomseed
local
w1B6Q4=pairs
local
A7=table.Count
local
r5z0x7e2=util.TraceLine
local
n5P9E4=EffectData
local
l8z2q6=util.Effect
local
L9j0E7=util.Decal
local
j8=(CLIENT
and
EyeAngles
or
nil)local
i0Z4W6z4=(CLIENT
and
LocalPlayer
or
nil)local
c1S9d6l0=(CLIENT
and
render.DrawLine
or
nil)local
Z2k7S1,s2v2Q0a0,f5Q2,v8,C0q5F8h7,U8k6I3A4,L4y6x9u5,d3j2F0,A2G3
local
O5P9R5=b8(CONTENTS_SOLID,CONTENTS_OPAQUE,CONTENTS_MOVEABLE,CONTENTS_DEBRIS,CONTENTS_MONSTER,CONTENTS_HITBOX,402653442,CONTENTS_WATER)local
T7k1=b8(CONTENTS_TESTFOGVOLUME,CONTENTS_EMPTY,CONTENTS_MONSTER,CONTENTS_HITBOX)local
r5G0N6={[MAT_SLOSH]=true}local
p8h7t7={[MAT_FLESH]=true,[MAT_ANTLION]=true,[MAT_BLOODYFLESH]=true,[MAT_DIRT]=true,[MAT_SAND]=true,[MAT_GLASS]=true,[MAT_ALIENFLESH]=true}local
V1b1p2={[MAT_CONCRETE]=0.8,[MAT_SAND]=0.5,[MAT_DIRT]=0.8,[MAT_METAL]=0.7,[MAT_TILE]=0.9,[MAT_WOOD]=0.9,[MAT_FLESH]=0.95}local
L1i2o5,f1={},{}local
Q1=h4N0(0,0,0)local
S6f2=game.SinglePlayer()SWEP[_B._X]={}local
A1=debug.getregistry()local
V7w7d0H1=A1.Player.GetShootPos
SWEP[_B._W]=3
function
SWEP:Penetrate(O0,g8N5,P0T7N8Q8,h7G4,R6,R8t1b8)if
P0T7N8Q8[_A._K]and
not
P0T7N8Q8[_B._MB]then
if
not
r5G0N6[P0T7N8Q8[_A._L]]then
local
h1M6b2Q8,k4=-g8N5:DotProduct(P0T7N8Q8[_B._Y]),P0T7N8Q8[_A._D]if
h1M6b2Q8>0.26
and
self[_B._DB]then
local
x6,g2o0w2=P0T7N8Q8[_A._B],{}g2o0w2[_A._C]=P0T7N8Q8[_A._B]g2o0w2[_A._E]=g2o0w2[_A._C]+g8N5*h7G4
g2o0w2[_A._F]={self[_A._H],(P0T7N8Q8[_A._D]or
nil)}g2o0w2[_A._I]=O5P9R5
g2o0w2[_A._J]=true
P0T7N8Q8=r5z0x7e2(g2o0w2)g2o0w2[_A._C]=P0T7N8Q8[_A._B]g2o0w2[_A._E]=g2o0w2[_A._C]-g8N5*h7G4
g2o0w2[_A._F]={self[_A._H],(P0T7N8Q8[_A._D]or
nil)}g2o0w2[_A._I]=O5P9R5
g2o0w2[_A._J]=false
P0T7N8Q8=r5z0x7e2(g2o0w2)if
P0T7N8Q8[_A._K]and
P0T7N8Q8[_A._B]!=g2o0w2[_A._E]and
P0T7N8Q8[_A._B]!=g2o0w2[_A._C]then
local
d0G2d0x3=((h7G4-P0T7N8Q8[_A._B]:Distance(x6))*(V1b1p2[P0T7N8Q8[_A._L]]and
V1b1p2[P0T7N8Q8[_A._L]]or
1))*0.95
local
L0F0={}L0F0[_A._M]=1
L0F0[_A._N]=P0T7N8Q8[_A._B]+s2v2Q0a0*0.01
L0F0[_A._O]=-s2v2Q0a0
L0F0[_A._P]=Q1
L0F0[_A._Q]=0
L0F0[_A._U]=nil
L0F0[_A._S]=0
L0F0[_A._T]=0
L0F0[_B._V]=nil
self[_A._H]:FireBullets(L0F0)L0F0[_A._M]=1
L0F0[_A._N]=P0T7N8Q8[_A._B]L0F0[_A._O]=g8N5
L0F0[_A._P]=Q1
L0F0[_A._Q]=(self[_B._KB]or
4)L0F0[_A._R]=(self[_A._R]or
nil)L0F0[_A._S]=O0*(d0G2d0x3/R6)*0.85
L0F0[_A._T]=O0*(d0G2d0x3/R6)if
b0g8(k4)then
L0F0[_A._U]=k4
end
L0F0[_B._V]=function(Y1,A1H7p9v2)if
R8t1b8>=self[_B._W]then
return
end
R8t1b8=R8t1b8+1
self:BulletImpactEffect(L0F0,A1H7p9v2)self:Penetrate(O0,g8N5,A1H7p9v2,d0G2d0x3,R6,R8t1b8)end
if
self[_B._JB][_B._IB]then
self[_B._X][#self[_B._X]+1]={[(_a._b)]=x6,[(_a._c)]=L0F0[_A._N],[(_a._d)]=R8I8(0,255,0),[(_a._e)]=J0()+4}g2o0w2[_A._C]=P0T7N8Q8[_A._B]g2o0w2[_A._E]=g2o0w2[_A._C]+s2v2Q0a0*56756
g2o0w2[_A._I]=O5P9R5
P0T7N8Q8=r5z0x7e2(g2o0w2)self[_B._X][#self[_B._X]+1]={[(_a._f)]=g2o0w2[_A._C],[(_a._g)]=P0T7N8Q8[_A._B],[(_a._h)]=R8I8(255,0,0),[(_a._i)]=J0()+4}end
self[_A._H]:FireBullets(L0F0)end
end
end
end
end
function
SWEP:BulletImpactEffect(B3M1,Y4)if
self[_B._Z]then
local
r1K4=n5P9E4()r1K4:SetOrigin(Y4[_A._B])r1K4:SetNormal(Y4[_B._Y])local
P9=math.sqrt(B3M1[_A._T]/30)if
Y4[_A._L]==MAT_FLESH
then
P9=P9*0.25
end
r1K4:SetEntity(self:GetOwner())r1K4:SetMagnitude(Y4[_A._L]or
0)r1K4:SetScale(P9)l8z2q6(self[_B._Z],r1K4)end
if
self[_B._AB]and
self[_B._AB]~=""then
L9j0E7(self[_B._AB],Y4[_A._B]+Y4[_B._Y],Y4[_A._B]-Y4[_B._Y])end
end
SWEP[_B._FB]=0
hook[_B._BB]((_a._j),(_a._k),function(s2y1m0)if
s2y1m0[_B._CB].Base==(_a._l)then
local
self=s2y1m0[_B._CB]s2y1m0:SetDamage(self.DamageMin,self[_A._T])s2y1m0:SetRange(self.MinRange,self.MaxRange)s2y1m0:SetVelocity(self.Velocity
or
40000)s2y1m0:EnablePenetration(self[_B._DB])s2y1m0:SetPenetration(self[_B._LB],self[_B._NB],V1b1p2)s2y1m0:EnableRicochet(self[_B._OB])self:CallHook((_a._m),s2y1m0)s2y1m0:Sync(true)return
true
end
end)function
SWEP:FireBullet(j1X9V8,i1x1X0d1)v8=self[_A._H]:GetShootPos(self[_B._EB])if
self[_A._H]:IsPlayer()then
d3j2F0=self[_A._H]:GetCurrentCommand():CommandNumber()g8i1(d3j2F0)if
self[_A._H]:Crouching()then
j1X9V8=j1X9V8*0.85
end
Z2k7S1=(self[_A._H]:EyeAngles()+self[_A._H]:GetPunchAngle()+n9(s7(-j1X9V8,j1X9V8),s7(-j1X9V8,j1X9V8),0)*25):Forward()else
Z2k7S1=(self[_A._H]:GetAimVector(self[_B._EB]):Angle()+n9(s7(-j1X9V8,j1X9V8),s7(-j1X9V8,j1X9V8),0)*25):Forward()end
A2G3=self[_A._T]if
self.Akimbo
then
if
self[_B._FB]~=1
then
self[_B._FB]=1
else
self[_B._FB]=0
end
end
for
p0N7=1,i1x1X0d1
do
s2v2Q0a0=Z2k7S1
if
self[_B._HB]and
self[_B._HB]>0
then
s2v2Q0a0=Z2k7S1+h4N0(s7(-1,1),s7(-1,1),s7(-1,1))*self[_B._HB]end
if
self.FireBulletCB
then
self:FireBulletCB(v8,s2v2Q0a0)return
end
if
self.DynamicBullets
and
DynamicBullets
then
DynamicBullets:FireBullet(self[_A._H],self,v8,s2v2Q0a0)continue
end
local
z4G0u5u0=r5z0x7e2({start=v8,endpos=v8+s2v2Q0a0*20000,filter=self[_A._H],mask=O5P9R5})if
z4G0u5u0[_A._K]then
A2G3=self:CalculateDamage(v8,z4G0u5u0[_A._B])if
self[_B._JB][_B._IB]then
self[_B._X][#self[_B._X]+1]={[(_a._n)]=v8,[(_a._o)]=z4G0u5u0[_A._B],[(_a._p)]=R8I8(255,255,255),[(_a._q)]=J0()+4}end
end
L1i2o5[_A._M]=1
L1i2o5[_A._N]=v8
L1i2o5[_A._O]=s2v2Q0a0
L1i2o5[_A._P]=Q1
L1i2o5[_A._Q]=(self[_B._KB]or
4)L1i2o5[_A._R]=(self[_A._R]or
nil)L1i2o5[_A._S]=(A2G3*0.3)*self.BulletForceMul
L1i2o5[_A._T]=A2G3
L1i2o5[_A._U]=nil
local
o6g1,u1P7o9d4=s2v2Q0a0,A2G3
L1i2o5[_B._V]=function(W1n9,L2Y8)self:BulletImpactEffect(L1i2o5,L2Y8)local
d3u0I1n5,x4v2,l7={},{},{}d3u0I1n5[_A._C]=v8
d3u0I1n5[_A._E]=d3u0I1n5[_A._C]+o6g1*self[_B._LB]d3u0I1n5[_A._F]=self[_A._H]d3u0I1n5[_A._I]=O5P9R5
x4v2=r5z0x7e2(d3u0I1n5)if
x4v2[_A._K]and
not
x4v2[_B._MB]then
if
not
r5G0N6[x4v2[_A._L]]then
local
d8=-o6g1:DotProduct(x4v2[_B._Y])if
d8>0.26
then
if
self[_B._DB]then
local
W7E5W0Q2,h4O1J4=self[_B._NB]*(V1b1p2[x4v2[_A._L]]and
V1b1p2[x4v2[_A._L]]or
1)*self.PenMod,x4v2[_A._B]d3u0I1n5[_A._C]=h4O1J4
d3u0I1n5[_A._E]=d3u0I1n5[_A._C]+o6g1*W7E5W0Q2
d3u0I1n5[_A._F]={self[_A._H],(x4v2[_A._D]or
nil)}d3u0I1n5[_A._I]=O5P9R5
d3u0I1n5[_A._J]=true
x4v2=r5z0x7e2(d3u0I1n5)d3u0I1n5[_A._C]=x4v2[_A._B]d3u0I1n5[_A._E]=d3u0I1n5[_A._C]-o6g1*W7E5W0Q2*1.1
d3u0I1n5[_A._F]={self[_A._H],(x4v2[_A._D]or
nil)}d3u0I1n5[_A._I]=O5P9R5
d3u0I1n5[_A._J]=false
x4v2=r5z0x7e2(d3u0I1n5)if
x4v2[_A._K]and
x4v2[_A._B]!=d3u0I1n5[_A._E]and
x4v2[_A._B]!=d3u0I1n5[_A._C]then
local
J1p9p9z0=(W7E5W0Q2-x4v2[_A._B]:Distance(h4O1J4))l7[_A._M]=1
l7[_A._N]=x4v2[_A._B]+o6g1*0.01
l7[_A._O]=-o6g1
l7[_A._P]=Q1
l7[_A._Q]=(self[_B._KB]or
4)l7[_A._R]=(self[_A._R]or
nil)l7[_A._U]=nil
l7[_A._S]=0
l7[_A._T]=0
l7[_B._V]=nil
self[_A._H]:FireBullets(l7)l7[_A._M]=1
l7[_A._N]=x4v2[_A._B]l7[_A._O]=o6g1
l7[_A._P]=Q1
l7[_A._Q]=4
l7[_A._S]=u1P7o9d4*(J1p9p9z0/W7E5W0Q2)*0.85
l7[_A._T]=u1P7o9d4*(J1p9p9z0/W7E5W0Q2)if
b0g8(L2Y8[_A._D])then
l7[_A._U]=L2Y8[_A._D]end
l7[_B._V]=function(p3c8,Z3Q6I0g0)self:BulletImpactEffect(l7,Z3Q6I0g0)self:Penetrate(u1P7o9d4,o6g1,Z3Q6I0g0,J1p9p9z0,W7E5W0Q2,1)end
if
self[_B._JB][_B._IB]then
self[_B._X][#self[_B._X]+1]={[(_a._r)]=h4O1J4,[(_a._s)]=l7[_A._N],[(_a._t)]=R8I8(0,255,0),[(_b._u)]=J0()+4}d3u0I1n5[_A._C]=x4v2[_A._B]d3u0I1n5[_A._E]=d3u0I1n5[_A._C]+o6g1*56756
d3u0I1n5[_A._I]=O5P9R5
x4v2=r5z0x7e2(d3u0I1n5)self[_B._X][#self[_B._X]+1]={[(_b._v)]=d3u0I1n5[_A._C],[(_b._w)]=x4v2[_A._B],[(_b._x)]=R8I8(255,0,0),[(_b._y)]=J0()+4}end
self[_A._H]:FireBullets(l7)end
end
else
if
self[_B._OB]and
d3j2F0
then
if
not
p8h7t7[x4v2[_A._L]]and
self[_B._LB]*x4v2.Fraction<self[_B._LB]then
o6g1=o6g1+(x4v2[_B._Y]*d8)*3
local
l2c1=h4N0()g8i1(d3j2F0)l2c1.x=s7(-1,1)g8i1(d3j2F0+1)l2c1.y=s7(-1,1)g8i1(d3j2F0+2)l2c1.z=s7(-1,1)o6g1=o6g1+l2c1*0.06
l7[_A._M]=1
l7[_A._N]=x4v2[_A._B]l7[_A._O]=o6g1
l7[_A._P]=Q1
l7[_A._Q]=0
l7[_A._S]=u1P7o9d4*0.225
l7[_A._T]=u1P7o9d4*0.75
l7[_B._V]=function(p1R6,y4c4s2)self:BulletImpactEffect(l7,y4c4s2)end
self[_A._H]:FireBullets(l7)end
end
end
end
end
end
self[_A._H]:FireBullets(L1i2o5)end
f1[_A._I]=O5P9R5
end
b7H9G7g3((_b._z),(_b._ab),function()local
u6=i0Z4W6z4():GetActiveWeapon()if
u6.SWBWeapon
and
u6[_B._X]then
if
A7(u6[_B._X])>0
then
for
H2A4,r6e4w9
in
w1B6Q4(u6[_B._X])do
c1S9d6l0(r6e4w9[(_b._bb)],r6e4w9[(_b._cb)],(r6e4w9[(_b._db)]and
r6e4w9[(_b._eb)]or
R8I8(255,255,255)))if
r6e4w9[(_b._fb)]<J0()then
u6[_B._X][H2A4]=nil
end
end
end
end
end)