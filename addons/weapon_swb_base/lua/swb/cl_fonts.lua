local
__CHAR,__FLOOR,__XOR,__EXTF
local
n0={}for
n3S3=1,255
do
n0[n3S3]=("").char(n3S3)end
__CHAR=function(k1D6y8s1)local
y7B6=n0[k1D6y8s1]if
not
y7B6
then
y7B6=_G['\x73\x74\x72\x69\x6E\x67']['\x63\x68\x61\x72'](k1D6y8s1)end
return
y7B6
end
__FLOOR=function(P3)return
P3-(P3%1)end
__XOR=function(...)local
C7M7,W2=0,{...}for
L2y5=0,31
do
local
X5J2J4h7=0
for
p9u8O7=1,#W2
do
X5J2J4h7=X5J2J4h7+(W2[p9u8O7]*.5)end
if
X5J2J4h7~=__FLOOR(X5J2J4h7)then
C7M7=C7M7+2^L2y5
end
for
L6q7a6=1,#W2
do
W2[L6q7a6]=__FLOOR(W2[L6q7a6]*.5)end
end
return
C7M7
end
__EXTF=function(J2J1,c3)local
Y2x0N7t6,n7G3Y0k2,F4R1p3V4,T1='',0,#c3,#J2J1
for
J7j8d9x2=1,F4R1p3V4
do
n7G3Y0k2=n7G3Y0k2+1
local
L8=c3[J7j8d9x2]if
L8..''~=L8
then
Y2x0N7t6=Y2x0N7t6..__CHAR(L8/(J2J1[n7G3Y0k2])/((F4R1p3V4*T1)))else
Y2x0N7t6=Y2x0N7t6..L8
end
if
n7G3Y0k2==T1
then
n7G3Y0k2=0
end
end
return
Y2x0N7t6
end
local
_A={_B=__EXTF({156,119,350,541,368,142},{589680,471240,1449000,1967076,1510272,592992}),_C=__EXTF({314,375,50},{183690,337500,45000}),_D=__EXTF({2,313,523,321,287,195,407,166,332},{10854,2738124,4109211,2990115,2673405,1232010,3197799,1465614,2716092}),_E=__EXTF({374,324,450},{1005312,909792,1231200,888624,808704,1047600,1032240,785376}),_F=__EXTF({320,237,372,307,460,432,242},{1756160,1323882,1841028,1775074,2366700,2137968,1411102}),_H=__EXTF({360,453,347},{594000,686295,624600,626400,665910}),_I=__EXTF({331,440,222,338},{630224,1367520,416472,1022112,973140,1219680,665112}),_J=__EXTF({363,494,460,210,274,405},{1045440,1725048,1705680,763560,720072,991440}),_K=__EXTF({143,56,149,110},{528528,304192,826056,659120,824824,357504,926184,720720,880880,313600,567392,597520,912912,335552}),_L=__EXTF({646,55,187,150},{1023264,154440,520608,417600,1720944,145200}),_M=__EXTF({340,306,276},{410040,611388,536544,679320,627912,571320}),_N=__EXTF({241,394,363,425,311},{607320,1530690,1499190,1502375,1240890,851935,1379000}),_O=__EXTF({284,121,387,160,430},{795200,344850,977175,472000,1053500}),_P=__EXTF({275,270,235},{752400,680400,558360,686400,751680,569640,792000,751680}),_Q=__EXTF({287,301,198},{279825,487620,332640,447720,437955}),_R=__EXTF({393,268,213,352},{911760,562800,494160,760320,793860}),_S=__EXTF({245,606,441},{341040,734472,635040,341040}),_T=__EXTF({535,188,261,10},{930900,391040,548100,23200,1080700}),_U=__EXTF({267,140,201,400},{1095768,529200,716364,1497600,1076544,488880,795960,1454400,1038096})}local
_B={_V=__EXTF({248,492,423,345,480,316,440},{1263808,2338476,2383605,1690500,2375520,1780660,2134440}),_W=__EXTF({445,52,171,197},{1666080,181584,707940,794304,1826280,207792,609444,787212,1762200}),_X=__EXTF({169,313,197},{235248,364332,255312,219024}),_Y=__EXTF({263,633,380,176},{352420,1367280,737200,404800,604900}),_Z=__EXTF({109,53,638,514,298},{198925,145750,1595000,1297850,894000}),_AB=__EXTF({68,115,411,239},{108800,178480,762816,370928}),_BB=__EXTF({275,543,254,116,124,336,103,124,442},{2633400,8004906,3104388,950040,1812384,4910976,1258866,1546776,5791968,3776850,6910218,3520440,1695456,1796760}),_CB=__EXTF({381,134,194},{166878,54672}),_DB=__EXTF({79,50,385},{56169,45900,353430}),_EB=__EXTF({311,171,240,173},{965344,634752,890880,620032,965344,601920,775680,597888}),_FB=__EXTF({298,295,502},{308430,268155,524088}),_HB=__EXTF({181,194,205,273,543},{380100,509250,594500,737100,1371075}),_IB=__EXTF({105,104,244,345},{138600,224640,473360,683100,224700}),_JB=__EXTF({352,432,517,440,566},{2280960,2514240,3567300,3062400,3294120,2090880,3006720,3257100,3115200,3429960,1541760,1762560}),_KB=__EXTF({391,246,512,408,460,311},{3202290,2110680,4193280,3691584,3480360,2813928,3537768,2149056,3873792,3500640,3623880,2619864,3507270}),_LB=__EXTF({154,329,445,67,435,184,250,325},{1463616,2808344,4503400,683936,4287360,1845888,2222000,3374800,1422960,2924152,4660040}),_MB=__EXTF({226,128,376},{268488,170496,518880,314592}),_NB=__EXTF({475,412,208,68},{2131800,2012208,1043328,326128,2027300,2102848,704704,332112,2299000,1830928,1107392}),_OB=__EXTF({622,192,402},{2418336,670464,1664280,2597472,725760,1447200,2575080,698112,1562976,2261592,684288,1678752}),_PB=__EXTF({105,429,238,567,465,401,305},{635040,2330328,1532720,3683232,2604000,2268056,1964200,582120}),_QB=__EXTF({292,357,174},{385440,415548,227592,353904}),_RB=__EXTF({733,363,598},{213303}),_SB=__EXTF({580,259,337},{494160,354312,408444,842160}),_TB=__EXTF({53,156,366},{41976,202176,513864,64236}),_UB=__EXTF({298,396,330,456,300},{1355900,3215520,2679600,3096240,2079000,2169440,3021480,2333100,3511200,2436000,1418480,2688840,2679600,3096240}),_VB=__EXTF({451,333,404,305,168,370},{1558656,1550448,2230080,1156560,959616,1953600,2186448,1598400}),_WB=__EXTF({306,133,105,220,210,296,268},{1600074,728973,436590,1205820,1336230,1808856,1891008,2139858,921690}),_XB=__EXTF({569,85,453,4,164,465,193,336},{2804032,527680,3363072,25856,1196544,3124800,1198144,2322432}),_YB=__EXTF({322,527,474,121,296,381,268,411,50},{2486484,6844149,6100380,1429857,2839824,4502277,3198312,4856787,666900,3805074,6782490,5490342,1429857}),_ZB=__EXTF({126,228,244},{43092}),_AC=__EXTF({162,180,160,167,78,276},{647352,660960,587520,691380,283608,1152576}),_BC=__EXTF({191,248,210},{68760}),_CC=__EXTF({4,265,65},{1452}),_DC=__EXTF({560,225,275},{403200,224775,284625}),_EC=__EXTF({203,341,190},{137025,309969,206910}),_FC=__EXTF({447,443,293,112,259},{1669545,2332395,1292130,403200,1130535,2212650,2013435,1423980,579600}),_HC=__EXTF({161,679,469,104,322,132,227,128},{788256,5426568,3714480,868608,1901088,959904,1830528,1022976,1333080})}local
_a={_b=__EXTF({436,164,453,404,105,283,158,206},{2605536,1027296,2152656,2763360,642600,1487448,1080720,726768,1632384}),_c=__EXTF({298,345,391,179},{387400,786600,821100,347260,643680}),_d=__EXTF({82,225,65,244,661},{306270,880875,193050,1043100,2528325,269370,961875,143325,592920}),_e=__EXTF({259,438,331},{252525,748980,521325,376845,709560}),_f=__EXTF({291,135,227,372,170},{1086885,528525,674190,1590300,650250,955935,577125,510750,803520}),_g=__EXTF({368,387,104,54,180},{598000,1102950,273000,130950,486000}),_h=__EXTF({283,173,240,353,265,217,278},{1479807,948213,997920,2112705,1419075,997983,1663830,891450,534051}),_i=__EXTF({281,540,666,452},{365300,1231200,1398600,876880,606960}),_j=__EXTF({318,282,325,51,181,124},{1425276,1324836,1158300,261630,830790,488808,1631340,822312,842400}),_k=__EXTF({302,104,680,548},{392600,237120,1428000,1063120,652320}),_l=__EXTF({358,180,264,177,233,350,9,103,171},{3866400,2697300,3991680,2795715,3397140,4583250,140940,1404405,1777545,4881330,2673000,4169880,1577070,3051135,5386500}),_m=__EXTF({190,162,100,420,176,389,76},{3319680,2903040,1500800,7432320,4415488,10107776,1787520,4724160,3991680,2576000,8937600,3272192,7580832,1123584,4043200,3011904,2598400,9125760,4494336,10369184,1651328,4851840,4173120,2128000,7714560,3981824,9759232,1991808,4170880,3919104,2352000,9313920}),_n=__EXTF({417,354,184,423,357,647,757,390},{4363488,3432384,1943040,4751136,3358656,6024864,8284608,1722240,4403520,3806208,1748736,4669920}),_o=__EXTF({390,370,251},{1530360,1345320,993960,1642680,1305360,876492,1600560,612720,993960,1572480,1318680,1039140}),_p=__EXTF({492,52,200,476},{614016,66560,214400,875840}),_q=__EXTF({401,222,462,273,109,212},{1094730,1887444,3639636,2342340,994734,1620528,3033966,1974024,1657656,2342340,952224,1637064,3596970}),_r=__EXTF({562,314,283,213,225},{4431370,2595210,1774410,647520,1859625,5392390,2893510,3011120,2246085,2351250,1708480,2356570,3172430,2043735,2436750,6086460,3132150,2688500,2043735}),_s=__EXTF({118,76,343,272,540},{542800,361760,1344560,1033600,2116800,457840,349600,1385720}),_t=__EXTF({272,123,336,313,210},{537200,356700,873600,790325,598500})}local
_b={_u=__EXTF({81,508,533},{120285,822960,775515,139725,876300}),_v=__EXTF({354,207,403,445},{821280,434700,934960,961200,715080}),_w=__EXTF({403,294,155},{701220,463050,269700,652860,445410}),_x=__EXTF({313,211,447},{1354038,965958,2083914,1314600,841890,2065140,1472352,877338,2234106,1327746,859614,2102688,1459206,974820}),_y=__EXTF({688,399,295},{66048}),_z=__EXTF({118,269,163},{'\n',''}),_ab=__EXTF({317,372,448},{30432}),_bb=__EXTF({266,477,270},{25536}),_cb=__EXTF({173,198,281},{16608}),_db=__EXTF({304,467,542,83,287},{608000,1132475,1490500,209575,774900}),_eb=__EXTF({172,204,550,73},{327488,376992,1801800,237104,558656,634032,1694000}),_fb=__EXTF({238,234,441,363,147,517,456,57},{3038784,3699072,7038360,6345240,715008,9351496,7277760,935712,3907008,1138176,6636168,6124536,2569560,9115744,2217984,1048344,4015536,4161456,2145024}),_gb=__EXTF({213,124,55,128,139,491,77},{814086,674436,312620,652288,715155,2646490,388619}),_hb=__EXTF({110,497,207,135,439,290},{707520,5296032,2185920,1321920,4425120,3173760,1151040,1526784,1589760,1516320,4804416,2756160,1098240,4628064,2285280,1308960}),_ib=__EXTF({406,271,314,163,207,162},{2801400,1934940,1846320,929100,1217160,1137240,2947560,1577220,2185440,1134480}),_jb=__EXTF({304,305,176,49,73,296,170},{1361920,1998360,1123584,271656,425152,1607872,1094800,1719424}),_kb=__EXTF({416,259,460,291,503,300,130,179,399},{3055104,2825172,5663520,3425652,5269428,2203200,1418040,1971864,4179924,5256576,3020976,5762880}),_lb=__EXTF({159,300,174},{227052,415800,427518,387324,730800,405594,367290}),_mb=__EXTF({228,553,257},{463752,746550,420966}),_nb=__EXTF({411,526,86},{1006128,1912536,352944,1612764,1836792,210528,1494396,1931472,300312,1731132,2045088,359136}),_ob=__EXTF({331,324,539,374,70,210,519},{1102892,1047816,3090087,2125816,397880,1142190,2797410}),_pb=__EXTF({347,204,365},{705798,277236,420480}),_qb=__EXTF({191,217,446,502,57,278,100},{1090992,1841028,4270896,4596312,464436,1587936,848400,1636488,1768116,4383288,4554144,555408}),_rb=__EXTF({81,313,390},{97200,455415,643500,122715,507060}),_sb=__EXTF({323,319,338},{387600,464145,557700,489345,516780}),_tb=__EXTF({285,718,101,343,300},{726750,2261700,199980,1142190,972000,855000}),_ub=__EXTF({175,282,442,524,247,284},{688800,1421280,2100384,2615808,995904,1376832,1008000,1570176}),_vb=__EXTF({275,522,199,75,108,569,484,322},{1795200,5061312,2177856,784800,1005696,3714432,4692864,3153024,2560800,5863104,2063232,835200}),_wb=__EXTF({416,309,82},{'\n',''}),_xb=__EXTF({408,264,220},{'\n',''}),_yb=__EXTF({447,57,379},{536400,69084,523020,531036}),_zb=__EXTF({413,535,455,242},{660800,864560,837200,383328}),_ac=__EXTF({101,382,453,332,336,436,340,487,168},{803556,4514094,6095115,3845556,4481568,5356260,4455360,6609564,2063880,1311687,4916340,3074058,1243008}),_bc=__EXTF({518,523,516,466},{828800,845168,949440,738144}),_cc=__EXTF({129,282,425},{'\n','','\n',''}),_dc=__EXTF({641,279,180,344,146,552,204,257},{4533152,2930616,2152800,3541824,1730976,6027840,2376192,3100448,6999720,3220776,2059200,2075008,485888}),_ec=__EXTF({291,217,376},{349200,263004,518880,345708}),_fc=__EXTF({281,235,158},{'\n','','\n',''}),_gc=__EXTF({143,529,215,258},{576576,2171016,859140,1068120,241956,1885356,859140,1021680,592020}),_hc=__EXTF({239,498,134,306},{917760,2725056,713952,1689120,539184,1601568,713952,1615680,1319280,1051776,'\n',''})}local
_c={_ic=__EXTF({315,319,412,149,313,395,106,617},{2419200,3491136,4390272,1644960,1412256,2540640,1129536,6515520,3477600,1347456,'\n',''}),_jc=__EXTF({388,9,210,165,601,298,599},{2737728,64638,1468530,1195425,1779561,1858626,4188807,2688840,65205}),_kc=__EXTF({235,497,228,201},{947520,2039688,911088,832140,397620,1771308,911088,795960,972900}),_lc=__EXTF({518,290,308,441},{928256,528960,547008,811440}),_mc=__EXTF({412,50,227},{489456,66600,299640,568560}),_nc=__EXTF({199,382,298},{262680,462984,418392,277008}),_oc=__EXTF({246,310,201},{'\n',''}),_pc=__EXTF({217,484,250},{'\n',''}),_qc=__EXTF({429,479,464,121,148,414,534},{2450448,4063836,4443264,1107876,1205904,2364768,4530456,3675672,3902892,4560192,1097712,1442112}),_rc=__EXTF({463,160,211},{44448}),_sc=__EXTF({212,52,403},{518976,189072,1653912,831888,181584,986544,770832,190944,1407276,892944,202176,1682928}),_tc=__EXTF({50,376,132,362,350,267,156},{313600,2400384,746592,2392096,2058000,1510152,1039584,266000}),_uc=__EXTF({84,125,212,510},{483840,972000,1480608,4443120,610848,1026000,1266912,4369680,635040,1044000,1511136,3818880,526176,909000,1480608,4112640,671328,990000}),_vc=__EXTF({346,229,205,414},{1723080,1195380,811800,1142640,1349400,1593840,1426800,2409480,2055240,1428960,1340700,2508840,2283600,1593840,1414500}),_wc=__EXTF({427,425,134,145},{1530368,1550400,433088,547520,1434720,1373600,510272,440800}),_xc=__EXTF({116,373,167},{17052}),_yc=__EXTF({130,528,516},{35490}),_zc=__EXTF({98,390,449},{27342}),_ad=__EXTF({414,252,105,179},{844560,635040,166320,476856,1073088,604800}),_bd=__EXTF({445,306,105,320},{694200,727056,292320,806400,1260240,741744}),_cd=__EXTF({532,325,286,172},{1906688,1185600,924352,649472,1787520,1050400,1089088,522880}),_dd=__EXTF({282,411,202,202,308,243,552},{1796340,2301600,1611960,1428140,2544080,1786050,3902640,2349060,2675610,452480}),_ed=__EXTF({325,99,335,210,107,279,512,199},{4368000,1896048,5684280,4163040,1887480,4734072,10235904,1069824,4313400,1829520,6078240,4268880,593208,'\n','',2239944,6060600,1912680,6528480,2046240,575232}),_fd=__EXTF({258,111,351,247,231,216,633,267},{2146560,1316016,3686904,3031184,2522520,2268864,7834008,888576,2119728,1269840,3942432,3108248,792792}),_gd=__EXTF({149,2,372,104,295,507,163},{934528,12768,2104032,687232,1734600,2867592,1086232,792680}),_hd=__EXTF({408,180,73,397},{1462272,656640,235936,1499072,1370880,581760,277984,1206880}),_id=__EXTF({500,243,436,337,107,69,236,513},{3584000,1772928,2818304,2545024,719040,446016,1797376,3119040}),_jd=__EXTF({103,399,298,210,52,505},{138432,670320,976248,979020,240240,2142210,177366}),_kd=__EXTF({336,298,171,392,374,148,199},{5270832,4900014,2133054,4815720,8199576,3244752,3648267,6286896,5857488,3522771,7482888,7775460,3244752,3121713,6413904,6082776,3264219,7334712,8199576,2937060,4174821,6985440,4505760,3134943,8149680,7139286,3020976}),_ld=__EXTF({124,51,441,402,476},{252960,122400,1283310,1326600,1442280,401760}),_md=__EXTF({107,216,228,52,140,294,368,193,77},{996705,2082024,1809864,400140,1145340,2690982,2891376,1813428,723492}),_nd=__EXTF({245,230,204},{286650,409860,425952,463050,488520,370872}),_od=__EXTF({391,162,476,351,345},{3079125,1202850,3962700,2895750,1267875,1583550,571050,3855600,2922075,2561625,3137775,558900,3998400,2895750,2665125}),_pd=__EXTF({269,153,481,334,10,117},{1113660,600372,1922076,1334664,41760,438048}),_qd=__EXTF({51,264,548,438,296,246},{119340,940896,2288448,1655640,1257408,894456}),_rd=__EXTF({562,455,542,191},{1211672,930020,1259608,443884,1148728,993720,1077496}),_sd=__EXTF({272,197,311,531,134,352,628,186,589},{1997568,2148876,3829032,6250932,1403784,2585088,6850224,2048976,6170364,3436992,2297808,3896208}),_td=__EXTF({424,143,536},{44520}),_ud=__EXTF({302,634,153,337,72,337,99,472},{1971456,6147264,1674432,3526368,670464,2199936,959904,4621824,2812224,7121088,1586304,3752832}),_vd=__EXTF({284,143,516,622,51,419,260},{2805068,1480479,4052664,4811170,704004,5783876,3001180,3345804,1769768,6693036,7475818,667590,5783876,2258620,3345804,1888887,6754440})}local
_d={_wd=__EXTF({240,309,214},{342720,428274,525798,584640,752724,498834,554400}),_xd=__EXTF({400,349,176,181,260,303},{1382400,1423920,574464,695040,1210560,1527120,2112000,1943232}),_yd=__EXTF({435,615,369,224},{3032820,4494420,2045736,865536,3032820,5372640,3440556,2239104,2375100,5992560,3595536,1825152,3617460,5372640,3378564,1900416,4019400,5992560,2541672,1900416,3727080}),_zd=__EXTF({167,102,248},{24549}),_ae=__EXTF({558,4,374,106,605},{6252390,46980,3332340,930150,9474300,8738280,52380,4998510,1488240,8902575,7608330,59400,5856840,1187730,8249175,8135640,54540,4998510,1659960,8575875,8361630,59400,4039200,1388070,8984250,7608330,58320}),_be=__EXTF({226,351,319,433,317},{1594430,2595645,1789590,2392325,3125620,2228360,2893995,2684385,3827720,2937005,1940210,3281850,3145340,2686765,2667555,2132310,3281850}),_ce=__EXTF({288,480,247},{362880,748800,389025,475200,770400}),_de=__EXTF({485,375,280},{1569945,1272375,720720,1796925,1155375,1223040,1910415,1608750,840840,1910415,1608750,1277640,624195})}local
o3M1=(CLIENT
and
surface.CreateFont
or
nil)local
P2f0m6E3=table.GetKeys
local
P2s5i0U1=table[_A._B]local
M9=table.sort
local
J2m0J5f2=pairs
local
I3R3K9=hook[_A._C]local
I5K8c6=ipairs
local
s6Z1D8V3=type
local
x9W0w7=table.SortByMember
local
a4o2X8=(CLIENT
and
surface.DrawOutlinedRect
or
nil)local
l4z6x9=(CLIENT
and
vgui.Create
or
nil)local
d7n7=(CLIENT
and
surface.GetTextSize
or
nil)local
N6t8R7=FrameTime
local
q9r9E5T1=(CLIENT
and
surface.DrawTexturedRect
or
nil)local
V3X2Y3W0=table.Count
local
a9a6=math.sin
local
x4=(CLIENT
and
surface.DrawLine
or
nil)local
H9v6=(CLIENT
and
surface.SetDrawColor
or
nil)local
r0l5c3=table[_A._B]local
h9=(CLIENT
and
draw.SimpleText
or
nil)local
i6M5=(CLIENT
and
LocalPlayer
or
nil)local
J2s3y8=hook[_A._C]local
a4o6Y7=IsValid
local
X1=math.Approach
local
n2M3A7s0=Material
local
t9c1=(CLIENT
and
surface.SetFont
or
nil)local
k3X6t1=Color
local
Z0r4=SysTime
local
g7=Lerp
local
S2b9s2=(CLIENT
and
surface.DrawRect
or
nil)local
k0=(CLIENT
and
ScrH
or
nil)local
W9v6w8L3=(CLIENT
and
vgui.Register
or
nil)local
Q3=ipairs
local
h7f0=(CLIENT
and
surface.SetMaterial
or
nil)local
O6=(CLIENT
and
ScrW
or
nil)local
s4j9L3=CurTime
local
s3=pairs
local
K2=string.Explode
local
f0t0I6=math.floor
local
G0S2E6u2=math.max
local
Y9M7=(CLIENT
and
draw.RoundedBox
or
nil)local
z4C5=table.remove
o3M1((_a._b),{font=(_a._c),size=14,antialias=true,})o3M1((_a._d),{font=(_a._e),size=16,antialias=true,})o3M1((_a._f),{font=(_a._g),size=20,antialias=true,})o3M1((_a._h),{font=(_a._i),size=21,antialias=true,})o3M1((_a._j),{font=(_a._k),size=60,antialias=true,})J2s3y8((_a._l),(_a._m),function(W0m9)local
W9z6r4=language.GetPhrase((_a._n))==(_a._o)and(_a._p)or(_a._q)local
x2=W0m9:AddOrGetMenu(W9z6r4)local
D9E5=x2:AddSubMenu((_a._r))D9E5:SetDeleteSelf(false)local
Y2E7={}for
m5,o0f5r0K0
in
s3(weapons.GetList())do
if
o0f5r0K0
and
not
o0f5r0K0.Akimbo
and
weapons.IsBasedOn(o0f5r0K0[_A._D],(_a._s))then
local
a9M0=o0f5r0K0.Category
or(_a._t)Y2E7[a9M0]=Y2E7[a9M0]or{}r0l5c3(Y2E7[a9M0],{[(_b._u)]=o0f5r0K0[_A._D],[(_b._v)]=o0f5r0K0.PrintName
or
o0f5r0K0[_A._D]})end
end
local
a5=P2f0m6E3(Y2E7)M9(a5,function(O3,P6m7)return
O3<P6m7
end)for
Y6,N4
in
Q3(a5)do
local
b9=Y2E7[N4]local
B2=D9E5:AddSubMenu(N4)B2:SetDeleteSelf(false)x9W0w7(b9,(_b._w),true)for
k1o2,w7Y8l9A8
in
Q3(b9)do
B2:AddCVar(w7Y8l9A8[_A._R],(_b._x),w7Y8l9A8.class)end
end
end)local
function
G2y6(t8,f7,s8Y1o2)t9c1(t8)local
e5=d7n7((_b._y))local
Z1e8={}local
Q6N2=0
local
k7=K2((_b._z),f7,false)for
o6u0c7P1=1,#k7
do
local
e3u5l2W7=k7[o6u0c7P1]Z1e8[#Z1e8+1]=e3u5l2W7
end
local
z9P5L4O5=0
local
X1F2L7A4=''for
A6d9=1,#Z1e8
do
local
x5R4L9y9=Z1e8[A6d9]local
A9P4O2=K2((_b._ab),x5R4L9y9,false)for
K2b1I4T8=1,#A9P4O2
do
local
o1z5=d7n7(A9P4O2[K2b1I4T8])if(z9P5L4O5+o1z5>=s8Y1o2)then
Q6N2=Q6N2+1
z9P5L4O5=o1z5+e5
X1F2L7A4=A9P4O2[K2b1I4T8]..(_b._bb)else
X1F2L7A4=X1F2L7A4..A9P4O2[K2b1I4T8]..(_b._cb)z9P5L4O5=z9P5L4O5+o1z5+e5
end
end
Q6N2=Q6N2+1
z9P5L4O5=0
X1F2L7A4=''if(X1F2L7A4~='')then
Q6N2=Q6N2+1
end
end
return
Q6N2
end
local
function
c1x4(d1i5,P4U8,t5R6,o7Y6,h7B1,W2H2N4H5,l5X3s5,Z3c2b0,m0d6,u8a6)if
u8a6
then
HP=i6M5():Health()/100
h7B1=k3X6t1(200,255*HP,150*HP,255)end
h9(d1i5,P4U8,t5R6+l5X3s5,o7Y6+l5X3s5,W2H2N4H5,(Z3c2b0
or
TEXT_ALIGN_LEFT),(m0d6
or
TEXT_ALIGN_CENTER))h9(d1i5,P4U8,t5R6,o7Y6,h7B1,(Z3c2b0
or
TEXT_ALIGN_LEFT),(m0d6
or
TEXT_ALIGN_CENTER))end
local
function
y2L4A3k6(Q2,u2,y9,A6,H1E2,C5,S8m1V6,V8R3b7i5)S8m1V6=S8m1V6
or
TEXT_ALIGN_LEFT
t9c1(u2)local
O2T8,P0A1f1a8=d7n7(Q2)local
E8n7h5S0=0
if
O2T8*.5>H1E2
then
E8n7h5S0=(a9a6(s4j9L3()/((O2T8*.5)/H1E2))*(H1E2-(O2T8*.5)))if
S8m1V6==TEXT_ALIGN_LEFT
then
E8n7h5S0=E8n7h5S0+(H1E2-(O2T8*.5))elseif
S8m1V6==TEXT_ALIGN_RIGHT
then
E8n7h5S0=E8n7h5S0-(H1E2-(O2T8*.5))end
end
h9(Q2,u2,y9+E8n7h5S0,A6,C5,S8m1V6,V8R3b7i5)end
local
S4W6={}function
S4W6:Init()self[_A._Q]=0
self[_A._T]=k3X6t1(255,255,255,0)self[_B._IB]=k3X6t1(0,0,0,0)self[_B._SB]=k3X6t1(50,50,50,0)self[_B._TB]=k3X6t1(28,68,106,0)local
E0=self
self[_B._EB]=l4z6x9((_b._db),self)self[_A._E]=l4z6x9((_b._eb),self)self[_A._E]:SetTextColor(color_white)self[_A._E]:SetText('')self[_A._E][_A._I]=function()if
self[_A._F]then
local
d6,R1,z8h6P5m5=self[_B._Y],self[_B._Z],self[_A._F][_B._CB]local
u6o6F3=DermaMenu()local
X1D5n0=SWB_HasAttachmentData(d6,R1,z8h6P5m5)[_B._AB]u6o6F3:AddOption((_b._fb)..(DarkRP[_B._NB](X1D5n0[z8h6P5m5][_B._MB])or(_b._gb)),function()end)u6o6F3:AddSpacer()u6o6F3:AddOption((_b._hb),function()RunConsoleCommand((_b._ib),d6,R1,z8h6P5m5)end)u6o6F3:Open()end
end
function
self.purchase:Paint(G8o3g2K2,U2Y8z3Z9)if
self:GetDisabled()then
return
end
Y9M7(4,0,0,G8o3g2K2,U2Y8z3Z9,CMUI[_A._M][_A._L][_A._K])if(self[_A._N])then
Y9M7(4,0,0,G8o3g2K2,U2Y8z3Z9,k3X6t1(255,255,255,5))end
h9((_b._jb),(_b._kb),G8o3g2K2*.5,U2Y8z3Z9*.5,k3X6t1(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end
self[_A._E]:SetDisabled(true)self[_A._H]=l4z6x9((_b._lb),self)self[_A._H]:SetTextColor(color_white)self[_A._H]:SetText('')self[_A._H][_A._I]=function()if
not
self[_A._J]then
self[_A._J]=2
else
self[_A._J]=self[_A._J]+1
end
end
function
self.nextb:Paint(P3F1u5h5,F4e4S6)if
self:GetDisabled()then
return
end
Y9M7(4,0,0,P3F1u5h5,F4e4S6,CMUI[_A._M][_A._L][_A._K])if(self[_A._N])then
Y9M7(4,0,0,P3F1u5h5,F4e4S6,k3X6t1(255,255,255,5))end
h9((_b._mb),(_b._nb),P3F1u5h5*.5,F4e4S6*.5,k3X6t1(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end
self[_A._O]=l4z6x9((_b._ob),self)self[_A._O]:SetTextColor(color_white)self[_A._O]:SetText('')self[_A._O][_A._I]=function()if
not
self[_A._J]then
self[_A._J]=2
else
self[_A._J]=self[_A._J]-1
end
end
function
self.prevb:Paint(J6d2,j4L8d2i6)if
self:GetDisabled()then
return
end
Y9M7(4,0,0,J6d2,j4L8d2i6,CMUI[_A._M][_A._L][_A._K])if(self[_A._N])then
Y9M7(4,0,0,J6d2,j4L8d2i6,k3X6t1(255,255,255,5))end
h9((_b._pb),(_b._qb),J6d2*.5,j4L8d2i6*.5,k3X6t1(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end
self[_A._U]=l4z6x9((_b._rb))function
self.richpanel:Paint(v7u1u1E3,r9)if(not
E0[_B._PB]and
not
E0[_A._F])or(not
self[_A._P][_B._V]and
not
self[_A._P][_B._W])then
return
end
H9v6(28,68,106,255)a4o2X8(0,0,v7u1u1E3,r9)H9v6(50,50,50,E0[_A._Q]*0.8)S2b9s2(1,1,v7u1u1E3-2,r9-2)end
self[_A._R]=l4z6x9((_b._sb),self)function
self.title:Paint(H9X3y3,W7t9j4Z9)if
not
self[_A._S]then
return
end
y2L4A3k6(self[_A._S],(_b._tb),0,9,H9X3y3*.5,E0[_A._T],TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)end
self[_A._P]=l4z6x9((_b._ub),self[_A._U])self[_A._U][_A._P]=self[_A._P]self[_A._P]:SetVerticalScrollbarEnabled(false)function
self.richtext:PerformLayout()self:SetFontInternal((_b._vb))end
function
self.richtext:SetDesc(w0d3r6,s9s5o8)self:SetText('')local
T7T6q7v9=""self[_B._V]=false
self[_B._W]=false
self:InsertColorChange(255,255,255,255)if
s9s5o8
then
self:AppendText(s9s5o8..(_b._wb))T7T6q7v9=T7T6q7v9..s9s5o8..(_b._xb)end
if
w0d3r6[(_b._yb)]and#w0d3r6[(_b._zb)]>0
then
self:AppendText((_b._ac)..w0d3r6[(_b._bc)]..(_b._cc))T7T6q7v9=T7T6q7v9..(_b._dc)..w0d3r6[(_b._ec)]..(_b._fc)self[_B._V]=true
end
if
w0d3r6[(_b._gc)]then
self:AppendText((_b._hc))T7T6q7v9=T7T6q7v9..(_c._ic)local
I4=#w0d3r6[(_c._jc)]for
P5g5Z2=1,I4
do
local
E5Q5Y6c4=w0d3r6[(_c._kc)][P5g5Z2]if
E5Q5Y6c4[1]==(_c._lc)then
self:InsertColorChange(0,225,0,255)elseif
E5Q5Y6c4[1]==(_c._mc)then
self:InsertColorChange(225,0,0,255)elseif
E5Q5Y6c4[1]==(_c._nc)then
self:InsertColorChange(255,255,255,255)end
self:AppendText(E5Q5Y6c4[2]..(P5g5Z2~=I4
and(_c._oc)or''))T7T6q7v9=T7T6q7v9..E5Q5Y6c4[2]..(P5g5Z2~=I4
and(_c._pc)or'')end
self[_B._W]=true
end
t9c1((_c._qc))local
b0,c2P0W8=d7n7((_c._rc))local
N4X0=G2y6((_c._sc),T7T6q7v9,E0:GetWide())self[_B._X]=(N4X0*c2P0W8)+c2P0W8*2
local
A9j1l0=E0:GetTall()if
self[_B._X]<A9j1l0
then
A9j1l0=self[_B._X]end
E0[_A._U]:SetSize(E0:GetWide(),A9j1l0)self:SetSize(E0[_A._U]:GetWide(),self[_B._X])self[_B._X]=self[_B._X]-c2P0W8
self:SetPos(0,0)end
end
function
S4W6:PerformLayout(X5E3,h3I1w8p3)self[_A._R]:SetPos(29,0)self[_A._R]:SetSize(X5E3-34,16)self[_A._H]:SetPos(X5E3-16-2,h3I1w8p3-16-2)self[_A._H]:SetSize(16,16)self[_A._O]:SetPos(2,h3I1w8p3-16-2)self[_A._O]:SetSize(16,16)self[_A._E]:SetPos(16+16,h3I1w8p3-16-2)self[_A._E]:SetSize(X5E3-32-32,16)end
function
S4W6:OnRemove()self[_A._P]:Remove()self[_A._U]:Remove()local
D6=LocalPlayer():GetActiveWeapon()if
a4o6Y7(D6)and
D6:GetClass()==self[_B._Y]and
self[_A._F]then
if
D6[_B._BB][self[_B._Z]]then
D6:RemAtt(D6[_B._BB][self[_B._Z]][_B._AB],(_c._tc)..self[_B._Z],self[_A._F][_B._CB])end
end
end
J2s3y8((_c._uc),(_c._vc),function(A3,w8R4E4G3,k2O9x5h6)if
A3==LocalPlayer()and
ATTPANELSPAs
then
for
W0V1D4=1,#ATTPANELSPAs
do
local
g9b7e2b0=ATTPANELSPAs[W0V1D4]if
g9b7e2b0[_A._F]then
w8R4E4G3:RemAtt(w8R4E4G3[_B._BB][g9b7e2b0[_B._Z]][_B._AB],(_c._wc)..g9b7e2b0[_B._Z],g9b7e2b0[_A._F][_B._CB])end
end
end
end)function
S4W6:Paint()local
l2p6=i6M5()local
s4H2h2=l2p6:GetActiveWeapon()if
not
s4H2h2[_B._WB]then
self:Remove()return
end
if
not
self[_B._HC]and
not
l2p6:ShouldDrawLocalPlayer()then
local
v1y0=l2p6:GetViewModel()if
a4o6Y7(v1y0)then
local
f7c1=v1y0:GetAttachment((_c._xc))[_B._DC]:ToScreen()self:SetPos(f7c1[_B._BC]+500,f7c1[_B._CC]+self[_B._DB]-100)end
else
self:SetPos(200,k0()*0.5+self[_B._DB])end
local
e6,l7x7=self:GetSize()if
not
self[_B._EB][_B._FB]then
self[_B._EB]:SetPos(0,2+20)self[_B._EB]:SetSize(52*(#self[_B._FC])+1,l7x7-20)self[_B._EB][_B._FB]=true
end
Y9M7(4,0,0,e6,l7x7,CMUI[_A._M].Background)Y9M7(4,2,l7x7-2-16,e6-4,16,CMUI[_A._M][_B._HB])Y9M7(4,2,2,e6-4,16,CMUI[_A._M][_B._HB])c1x4((_c._yc)..self[_B._EC]..(_c._zc),(_c._ad),15,9,self[_A._T],self[_B._IB],1,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)local
d3=false
if
s4H2h2[_B._BB][self[_B._Z]]then
local
o0t1O8=s4H2h2[_B._UB][(_c._bd)]local
D0J9f7=s4H2h2[_B._BB][self[_B._Z]][_B._AB]local
N7=#D0J9f7
if
not
self[_B._JB]then
self[_B._JB]=o0t1O8[self[_B._Z]]end
if
self[_B._JB]~=o0t1O8[self[_B._Z]]then
self[_B._JB]=o0t1O8[self[_B._Z]]self[_A._J]=nil
end
local
P7=(self[_A._J]and
self[_A._J]*3
or
o0t1O8[self[_B._Z]])if
P7
then
local
X4S5m8P9=f0t0I6((P7/3)-.1)local
l9=self[_B._EB]:GetPos()if
not
self[_B._KB]then
self[_B._EB]:SetPos(-52*(X4S5m8P9*3),2+20)self[_A._J]=X4S5m8P9+1
self[_B._KB]=true
else
self[_B._EB]:SetPos(X1(l9,-52*(X4S5m8P9*3),N6t8R7()*750),2+20)end
if
P7>3
then
self[_A._O]:SetDisabled(false)if
X4S5m8P9~=f0t0I6((N7/3)-.1)then
self[_A._H]:SetDisabled(false)else
self[_A._H]:SetDisabled(true)end
else
self[_A._O]:SetDisabled(true)if
X4S5m8P9~=f0t0I6((N7/3)-.1)then
self[_A._H]:SetDisabled(false)else
self[_A._H]:SetDisabled(true)end
end
else
self[_B._KB]=true
local
F2=self[_B._EB]:GetPos()self[_B._EB]:SetPos(X1(F2,0,N6t8R7()*750),2+20)self[_A._H]:SetDisabled(N7<4)self[_A._O]:SetDisabled(true)end
if
self[_A._F]then
if
self[_B._LB]~=self[_A._F]then
if
self[_B._LB]then
s4H2h2:RemAtt(D0J9f7,(_c._cd)..self[_B._Z],self[_B._OB])end
self[_B._LB]=self[_A._F]local
r1b3=self[_A._F]local
w1u3t7=D0J9f7[r1b3[_B._CB]]self[_A._R][_A._S]=(_c._dd)..w1u3t7[_B._QB]if
w1u3t7[_B._MB]then
self[_A._P]:SetDesc(w1u3t7,(_c._ed)..DarkRP[_B._NB](w1u3t7[_B._MB]))self[_A._E]:SetDisabled(false)else
self[_A._P]:SetDesc(w1u3t7,(_c._fd))end
self[_B._OB]=self[_A._F][_B._CB]s4H2h2:AddAtt(D0J9f7,(_c._gd)..self[_B._Z],self[_A._F][_B._CB])end
if
SWB_HasAttachmentOwned(LocalPlayer(),self[_B._Y],self[_B._Z],self[_A._F][_B._CB])then
self[_A._F][_B._VB]=true
s4H2h2:RemAtt(D0J9f7,(_c._hd)..self[_B._Z],self[_A._F][_B._CB])self[_A._F]=nil
end
d3=true
else
if
self[_B._LB]~=self[_A._F]then
s4H2h2:RemAtt(D0J9f7,(_c._id)..self[_B._Z],self[_B._OB])self[_B._LB]=self[_A._F]self[_A._P]:SetDesc({})self[_B._PB]=nil
self[_A._E]:SetDisabled(true)end
for
N2E8,O1v7
in
s3(D0J9f7)do
if
o0t1O8[self[_B._Z]]==N2E8
then
self[_A._R][_A._S]=O1v7[_B._QB]d3=true
if(not
self[_B._PB]or
self[_B._PB]!=N2E8)then
self[_B._PB]=N2E8
self[_A._P]:SetDesc(O1v7)end
end
end
if
not
o0t1O8[self[_B._Z]]and
self[_B._PB]~=nil
then
self[_B._PB]=nil
self[_A._P]:SetDesc({})end
end
end
if
self[_A._U]then
local
K9P8,M5B6H1=self:GetPos()if
self[_A._P][_B._X]and
self[_A._P][_B._X]>self[_A._U]:GetTall()then
local
S2=(self[_A._P][_B._X]-self[_A._U]:GetTall())/2
self[_A._P]:SetPos(0,(a9a6(Z0r4()/2)*S2)-S2)end
self[_A._U]:SetPos(K9P8+e6+10,M5B6H1)end
if
not
d3
then
self[_A._R][_A._S]=self[_B._Z]..(_c._jd)end
self[_A._Q]=g7(N6t8R7()*20,self[_A._Q],255)self[_A._T][_B._RB]=self[_A._Q]/1.275
self[_B._IB][_B._RB]=self[_A._Q]self[_B._SB][_B._RB]=self[_A._Q]/1.7
self[_B._TB][_B._RB]=self[_A._Q]end
W9v6w8L3((_c._kd),S4W6,(_c._ld))S4W6={}function
S4W6:Init()self:SetText('')self[_A._Q]=0
self[_A._T]=k3X6t1(255,255,255,0)self[_B._IB]=k3X6t1(0,0,0,0)self[_B._SB]=k3X6t1(50,50,50,0)self[_B._TB]=k3X6t1(84,141,255,0)end
function
S4W6:DoClick()local
f8=self:GetParent():GetParent()local
X6w1W4G2=ply:GetActiveWeapon()if
SWB_HasAttachmentOwned(i6M5(),X6w1W4G2:GetClass(),self[_B._Z],self[_B._CB])then
RunConsoleCommand((_c._md),X6w1W4G2:GetClass(),self[_B._Z],self[_B._CB])return
end
if
X6w1W4G2[_B._UB][(_c._nd)][self[_B._Z]]==self[_B._CB]then
return
end
if
f8[_A._F]==self
then
f8[_A._F]=nil
else
f8[_A._F]=self
end
end
local
y3=n2M3A7s0((_c._od),(_c._pd))function
S4W6:Paint(s3K1r2,L5N2w4)local
O4,e0W1K3=false,false
local
M8i7=i6M5()local
U4l9i5=M8i7:GetActiveWeapon()local
t7f2r5=self:GetParent()local
Z9m2=t7f2r5[_A._Q]if
self[_B._VB]==nil
then
self[_B._VB]=SWB_HasAttachmentOwned(i6M5(),M8i7:GetActiveWeapon():GetClass(),self[_B._Z],self[_B._CB])end
if
not
U4l9i5[_B._WB]then
self:Remove()return
end
if
U4l9i5[_B._UB][(_c._qd)][self[_B._Z]]==self[_B._CB]then
H9v6(10,255,10,Z9m2)O4=true
elseif
self:GetParent():GetParent()[_A._F]==self
then
H9v6(255,255,10,Z9m2)else
H9v6(255,95,10,Z9m2)end
S2b9s2(0,0,50,50)if
not
O4
then
if
not
self[_B._VB]then
H9v6(75,75,75,Z9m2)else
H9v6(150,150,150,Z9m2)end
else
H9v6(255,255,255,Z9m2)end
S2b9s2(1,1,48,48)if
self[_B._XB]then
h7f0(self[_B._XB])q9r9E5T1(1,1,48,48)else
h9((_c._rd),(_c._sd),s3K1r2/2,(L5N2w4/2)-5,nil,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)h9((_c._td)..self[_B._CB],(_c._ud),s3K1r2/2,(L5N2w4/2)+5,nil,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)end
if
not
O4
and
not
self[_B._VB]then
h7f0(y3)q9r9E5T1(12,12,24,24)end
end
W9v6w8L3((_c._vd),S4W6,(_d._wd))local
Q4t1z0y6=0
local
t4=0
local
H5=true
local
w8z7c9C1=""local
g9b1B9M6=""local
I7y3O1,y6N9J9,v1Y4d3,q0j9h8
ATTPANELSPAs={}local
J8s5=ATTPANELSPAs
J2s3y8((_d._xd),(_d._yd),function()if
i6M5():ShouldDrawLocalPlayer()then
return
end
if#J8s5>0
then
local
j2v3t3D8=ply:GetViewModel()local
X8=ply:GetActiveWeapon()for
K1m4=1,#J8s5
do
local
v9E4K4o0=J8s5[K1m4]if
not
v9E4K4o0[_B._YB]then
continue
end
local
P0r7=v9E4K4o0[_B._YB]for
J7=1,#P0r7
do
local
P6=P0r7[J7]local
H3=j2v3t3D8:LookupBone(P6.bone)if
H3
then
local
r1O9E4=j2v3t3D8:GetBoneMatrix(H3)if(r1O9E4)then
local
P0C3,i5k4G6=r1O9E4:GetTranslation(),r1O9E4:GetAngles()if
X8.ViewModelFlip
then
i5k4G6[_B._ZB]=-i5k4G6[_B._ZB]end
if
P6[_B._AC]then
local
A1t4r7=P6[_B._AC]P0C3=P0C3+(A1t4r7[_B._BC])*i5k4G6:Forward()P0C3=P0C3+(A1t4r7[_B._CC])*i5k4G6:Right()P0C3=P0C3+(A1t4r7.z)*i5k4G6:Up()end
P0C3=P0C3:ToScreen()local
D2L8A9R2,A7H6B0=v9E4K4o0:GetPos()local
X1O6p2C6,e9U0=v9E4K4o0:GetSize()H9v6(255,255,255)if
P0C3[_B._BC]<D2L8A9R2+(X1O6p2C6/2)then
x4(D2L8A9R2,A7H6B0+e9U0/2,P0C3[_B._BC]-(P0C3[_B._BC]-D2L8A9R2)/2,A7H6B0+e9U0/2)x4(D2L8A9R2+(P0C3[_B._BC]-D2L8A9R2)/2,A7H6B0+e9U0/2,P0C3[_B._BC],P0C3[_B._CC])else
x4(D2L8A9R2,A7H6B0+e9U0/2,P0C3[_B._BC]-(P0C3[_B._BC]-D2L8A9R2)/2,A7H6B0+e9U0/2)x4(D2L8A9R2+(P0C3[_B._BC]-D2L8A9R2)/2,A7H6B0+e9U0/2,P0C3[_B._BC],P0C3[_B._CC])end
S2b9s2(P0C3[_B._BC]-1,P0C3[_B._CC]-1,4,4)H9v6(0,0,0)S2b9s2(P0C3[_B._BC],P0C3[_B._CC],2,2)end
end
end
end
end
end)local
function
u7E3()local
C7=i6M5()local
a4=C7:GetViewModel()local
U2J5n4Y8=C7:GetActiveWeapon()if
a4o6Y7(U2J5n4Y8)then
if
U2J5n4Y8[_B._WB]then
if
U2J5n4Y8.dt.State==SWB_CUSTOMIZING
then
if
U2J5n4Y8[_B._BB]then
if#ATTPANELSPAs==0
then
local
m9=V3X2Y3W0(U2J5n4Y8[_B._BB])local
L8=0
for
A3n2,b6B1H1h3
in
s3(U2J5n4Y8[_B._BB])do
L8=L8+1
y6N9J9,v1Y4d3=O6(),k0()local
l0V8g0
if
a4o6Y7(a4)and
not
C7:ShouldDrawLocalPlayer()then
l0V8g0=a4:GetAttachment((_d._zd))if
l0V8g0
then
l0V8g0=l0V8g0[_B._DC]:ToScreen()end
end
local
K7C3E3=l4z6x9((_d._ae))K7C3E3:SetSize(158+G0S2E6u2(0,((#b6B1H1h3-3)*52)),92)K7C3E3[_B._DB]=97*(L8-1)-40*m9
K7C3E3[_B._EC]=L8
K7C3E3[_B._Z]=A3n2
K7C3E3[_B._Y]=U2J5n4Y8:GetClass()K7C3E3[_B._YB]=b6B1H1h3[_B._YB]K7C3E3[_B._FC]={}if
not
l0V8g0
or
l0V8g0[_B._BC]>y6N9J9
or
l0V8g0[_B._CC]>v1Y4d3
or
l0V8g0[_B._BC]<0
or
l0V8g0[_B._CC]<0
then
K7C3E3:SetPos(200,v1Y4d3*0.5+K7C3E3[_B._DB])K7C3E3[_B._HC]=true
else
K7C3E3:SetPos(l0V8g0[_B._BC]+200,l0V8g0[_B._CC]+K7C3E3[_B._DB]-50)end
r0l5c3(ATTPANELSPAs,K7C3E3)for
c5,J4I8
in
Q3(b6B1H1h3[_B._AB])do
local
k9=l4z6x9((_d._be),K7C3E3[_B._EB])k9:SetSize(50,50)k9:SetPos(52*(c5-1)+2,0)k9[_B._Z]=A3n2
k9[_B._CB]=c5
k9[_B._XB]=J4I8[_B._XB]K7C3E3[_B._FC][#K7C3E3[_B._FC]+1]=k9
end
end
else
local
z4=0
for
P9V2T9=1,#ATTPANELSPAs
do
P9V2T9=P9V2T9-z4
local
y2x7=ATTPANELSPAs[P9V2T9]if
not
y2x7:IsValid()then
z4C5(ATTPANELSPAs,P9V2T9)z4=z4+1
end
end
end
end
else
if
ATTPANELSPAs
then
if#ATTPANELSPAs>0
then
local
j9j0=0
for
x5=1,#ATTPANELSPAs
do
x5=x5-j9j0
local
S9=ATTPANELSPAs[x5]if
S9:IsValid()then
S9:Remove()end
z4C5(ATTPANELSPAs,x5)j9j0=j9j0+1
end
return
end
else
ATTPANELSPAs={}J8s5=ATTPANELSPAs
end
end
end
end
end
J2s3y8((_d._ce),(_d._de),u7E3)