local
__CHAR,__FLOOR,__XOR,__EXTF
local
H6={}for
E6=1,255
do
H6[E6]=("").char(E6)end
__CHAR=function(h4c7w8f2)local
V1u8K1=H6[h4c7w8f2]if
not
V1u8K1
then
V1u8K1=_G['\x73\x74\x72\x69\x6E\x67']['\x63\x68\x61\x72'](h4c7w8f2)end
return
V1u8K1
end
__FLOOR=function(l9A1)return
l9A1-(l9A1%1)end
__XOR=function(...)local
Z7,W4W6f9U5=0,{...}for
k2m3=0,31
do
local
m9=0
for
U0=1,#W4W6f9U5
do
m9=m9+(W4W6f9U5[U0]*.5)end
if
m9~=__FLOOR(m9)then
Z7=Z7+2^k2m3
end
for
Y8C6=1,#W4W6f9U5
do
W4W6f9U5[Y8C6]=__FLOOR(W4W6f9U5[Y8C6]*.5)end
end
return
Z7
end
__EXTF=function(e5m9,C2e9H5m6)local
E3O0t8,j2S6K9u9,R5h3,s3='',0,#C2e9H5m6,#e5m9
for
R7D7=1,R5h3
do
j2S6K9u9=j2S6K9u9+1
local
a8O1=C2e9H5m6[R7D7]if
a8O1..''~=a8O1
then
E3O0t8=E3O0t8..__CHAR(a8O1/(e5m9[j2S6K9u9])/((R5h3*s3)))else
E3O0t8=E3O0t8..a8O1
end
if
j2S6K9u9==s3
then
j2S6K9u9=0
end
end
return
E3O0t8
end
local
_a={_b=__EXTF({341,164,291,50,218,99},{1528362,770472,1037124,256500,812268,582714,2062368,1027296,1901394}),_c=__EXTF({120,192,359,57,329,437,49},{3298680,4479552,8044113,1474704,8435889,11104170,1301685,1302840,5100480,8624616,1461537,8815884,10397541,1324323,3049200,2084544,9536835,1369368,8435889,11709852,1165857,3243240,4878720,7878255,1329867,8283891,11306064,1313004,3354120,2040192,9868551,1277199,8967882}),_d=__EXTF({222,394,161,259,251,189},{1437228,2673684,828828,1919190,1468350,1621620,1818180,3134664,1268358,1919190,1409616,1547910,2008656}),_e=__EXTF({52,5,250,179,186,166},{1039584,84840,4074000,3368064,3468528,3067680,1004640,39480,4494000,3307920,3281040,2844576,882336,39480,4494000,3307920,3281040,2844576,882336,79800,4368000,3157560,3624768,1366512,401856,99960,4074000,3548496}),_f=__EXTF({309,280,104,446,107},{5147940,3959200,1412320,6993280,1662780,4758600,4508000,684320,6681080,1647800,4542300,3998400,1470560,2934680,1602860,4758600,4116000,1485120,6306440,1423100,4499040,4116000,1688960,3122000,689080,5147940,3802400,1718080}),_g=__EXTF({359,208,325,57,8,489,306},{8373316,4117568,6178900,1251264,174048,10542840,6897240,3307108,4362176,7007000,1173060,159936,9680244,2818872,7528948,4484480,6688500,1139544,158368,9105180,6237504,7388220,4729088,3248700,513912,186592,9296868,7077168}),_h=__EXTF({589,500,341,103,105,266,281},{13737836,9898000,6483092,2261056,2284380,5734960,6333740,5425868,10486000,7351960,2119740,2099160,5265736,2588572,12352508,10780000,7017780,2059176,2078580,4952920,5727904,12121620,11368000,3475472,928648,2449020,5057192,6498968}),_i=__EXTF({120,379,496,497,452,411,282,498},{1354560,4484328,4452096,6421240,4610400,6148560,4026960,6908256,1648320,4896680,4856832,7097160,7130752,3856824,4142016,7788720,1648320}),_j=__EXTF({483,291,505,87,52,630,250,162,322},{16553376,8464608,14107680,2806272,1662336,19958400,8280000,2192832,9922752,15301440,8799840,14834880,2530656,703872,19414080,7920000,4898880,9459072,14049504,7961760,15125760,2630880,1737216,21591360,6984000,5038848,10015488,6816096,3855168,17307360,2430432,1767168}),_k=__EXTF({306,332,306,636,128,53},{2285820,2599560,1817640,5437800,864000,524700,2891700,3047760,2781540,5437800,956160,567630,2891700,3286800,2836620}),_l=__EXTF({392,106,200,104,110,300,438},{9796080,2248260,4074000,2446080,2564100,6930000,10577700,3869040,2381820,4620000,2293200,2356200,6363000,4323060,8808240,2448600,4410000,2227680,2333100,5985000,10577700,8890560,2159220,4830000,2271360,1131900,2898000,10945620,7985040,2626680}),_m=__EXTF({433,391,3},{4637430,3554190,26190,4364640,3906090,29700,4481550,1653930,28890,4286700,3694950,27540,3935970,1653930,28890,4286700,3694950,27540,3935970,3343050,31050,4208760,3413430,31050,4052880,1759500,12420,4637430,3413430,31860})}function
SWB_RegisterSound(f3O4p7,k7a3W0m8,y7k8,a2I1P7n2,F8)local
A3m5Y2U0={channel=CHAN_STATIC,volume=1,level=y7k8,name=f3O4p7,sound=k7a3W0m8,pitchstart=a2I1P7n2,pitchend=F8}sound.Add(A3m5Y2U0)end
SWB_RegisterSound((_a._b),(_a._c),60,95,112)SWB_RegisterSound((_a._d),{(_a._e),(_a._f),(_a._g),(_a._h)},70,92,122)SWB_RegisterSound((_a._i),(_a._j),70,92,122)SWB_RegisterSound((_a._k),{(_a._l),(_a._m)},65,92,122)