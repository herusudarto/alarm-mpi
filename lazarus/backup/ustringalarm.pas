unit uStringAlarm;

{$mode objfpc}{$H+}

interface
uses Classes, SysUtils, StdCtrls, ExtCtrls;


const


AString:array[1..160] of string =
  (
'M/E(PS) Overspeed Stop ',                         //1
'M/E(PS) L.O. Pres. Low Stop',                     //2
'M/E(PS) F.W. Outlet Temp. High Stop',             //3
'F.W Pres. ME(PS) Inlet Low Low Stop',             //4
'G/B(PS) L.O. Inlet Pres. Low Stop',               //5
'M/E(PS) L.O. Inlet Pres. Low Stop',               //6
'M/E(PS) L.O. Filter Diffr. Pres High',            //7
'M/E(PS) L.O. Inlet Temp High',                    //8
'M/E(PS) F.O Inlet Pres. Low',                     //9
'M/E(PS) HIGH-PRES. Oil Pipe Leakage',             //10
'M/E(PS) C.F.W. Inlet Pres. Low',                  //11
'M/E(PS) C.F.W. Outlet Temp. High',                //12
'M/E(PS) C.S.W Inlet Pres. Low',                   //13
'T/C(PS) Exhaust Gas Temp',                        //14
'No. 1 Cyl. Exhaust Gas Temp',                     //15
'No. 2 Cyl. Exhaust Gas Temp',                     //16
'No. 3 Cyl. Exhaust Gas Temp',                     //17
'No. 4 Cyl. Exhaust Gas Temp',                     //18
'No. 5 Cyl. Exhaust Gas Temp',                     //19
'No. 6 Cyl. Exhaust Gas Temp',                     //20
'No. 7 Cyl. Exhaust Gas Temp',                     //21
'No. 8 Cyl. Exhaust Gas Temp',                     //22
'M/E(PS) L/T F.C.W. Expan. Tank Level Low',        //23
'M/E(PS) L.O. Circulating Tank Level Low',         //24
'M/E Control Air Pres. Low',                       //25
'M/E Starting Air Pres. Low',                      //26
'G/B(PS) L.O. Pres. Low',                          //27
'G/B(PS) Servo Oil Pres. Low',                     //28
'G/B(PS) L.O. Temp High',                          //29
'Pre. Trip Alarm',                                 //30
'MSB AC220V Insulation',                           //31
'MSB AC440 Insulation',                            //32
//End Group 1

'M/E(SB) Overspeed Stop ',                         //33
'M/E(SB) L.O. Pres. Low Stop',                     //34
'M/E(SB) F.W. Outlet Temp. High Stop',             //35
'F.W Pres. ME(SB) Inlet Low Low Stop',             //36
'G/B(SB) L.O. Inlet Pres. Low Stop',               //37
'M/E(SB) L.O. Inlet Pres. Low Stop',               //38
'M/E(SB) L.O. Filter Diffr. Pres High',            //39
'M/E(SB) L.O. Inlet Temp High',                    //40
'M/E(SB) F.O Inlet Pres. Low',                     //41
'M/E(SB) HIGH-PRES. Oil Pipe Leakage',             //42
'M/E(SB) C.F.W. Inlet Pres. Low',                  //43
'M/E(SB) C.F.W. Outlet Temp. High',                //44
'M/E(SB) C.S.W Inlet Pres. Low',                   //45
'T/C(SB) Exhaust Gas Temp',                        //46
'No. 1 Cyl. Exhaust Gas Temp',                     //47
'No. 2 Cyl. Exhaust Gas Temp',                     //48
'No. 3 Cyl. Exhaust Gas Temp',                     //49
'No. 4 Cyl. Exhaust Gas Temp',                     //50
'No. 5 Cyl. Exhaust Gas Temp',                     //51
'No. 6 Cyl. Exhaust Gas Temp',                     //52
'No. 7 Cyl. Exhaust Gas Temp',                     //53
'No. 8 Cyl. Exhaust Gas Temp',                     //54
'M/E(SB) L/T F.C.W. Expan. Tank Level Low',        //55
'M/E(SB) L.O. Circulating Tank Level Low',         //56
'M/E(PS) EM''CY Stop',                             //57
'M/E(SB) EM''CY Stop',                             //58
'G/B(SB) L.O. Pres. Low',                          //59
'G/B(SB) Servo Oil Pres. Low',                     //60
'G/B(SB) L.O. Temp High',                          //61
'MSB Air Contition Tripping',                      //62
'ESB AC220V Insulation',                           //63
'ESB AC440V Insulation',                           //64



'G/B(PS) Idle',                                      //65
'M/E(PS) L.O. Auto Filter Differ. Pres. High',       //66
'M/E(PS) Exhaust Compenstate',                       //67
'G/B(SB) Idle',                                      //68
'M/E(SB) L.O. Auto Filter Differ. Pres. High',       //69
'M/E(SB) Exhaust Compenstate',                       //70

'No.1. Aux Diesel Overspeed Stop',                   //71
'No.1. Aux Diesel L.O. Pres Low Stop',               //72
'No.1. Aux Diesel L.O. Pres Low',                    //73
'No.1. Aux Diesel L.O. Temp. High',                  //74
'No.1. Aux Diesel C.F.W. Temp. High',                //75
'No.1. Aux Diesel H-PRes. Oil Pipe Leakage',         //76
'No.1. Aux Diesel Battery Low Voltage',              //77

'No.2. Aux Diesel Overspeed Stop',                   //78
'No.2. Aux Diesel L.O. Pres Low Stop',               //79
'No.2. Aux Diesel L.O. Pres Low',                    //80
'No.2. Aux Diesel L.O. Temp. High',                  //81
'No.2. Aux Diesel C.F.W. Temp. High',                //82
'No.2. Aux Diesel H-PRes. Oil Pipe Leakage',         //83
'No.2. Aux Diesel Battery Low Voltage',              //84

'No.3. Aux Diesel Overspeed Stop',                   //85
'No.3. Aux Diesel L.O. Pres Low Stop',               //86
'No.3. Aux Diesel L.O. Pres Low',                    //87
'No.3. Aux Diesel L.O. Temp. High',                  //88
'No.3. Aux Diesel C.F.W. Temp. High',                //89
'No.3. Aux Diesel H-PRes. Oil Pipe Leakage',         //90
'No.3. Aux Diesel Battery Low Voltage',              //91

'EMCY Aux. Diesel Common Alarm',                     //92
'EMCY Aux. Diesel Start Fail Three Times',           //93
'EMCY Aux. Diesel Battery Low Voltage',              //94
'Intermediate (PS) Bearing Temp High',               //95
'Intermediate (SB) Bearing Temp High',               //96

'1# Steering Gear Power Fail',                       //97
'1# Steering Gear Control Power Fail',               //98
'1# Steering Gear Phase Fail',                       //99
'1# Steering Gear Over Load',                        //100
'1# Steering Gear Oil Low Level',                    //101
'1# Steering Gear Filter Diff. Press. High',         //102
'1# Steering Gear Oil Temp. High',                   //103

'2# Steering Gear Power Fail',                       //104
'2# Steering Gear Control Power Fail',               //105
'2# Steering Gear Phase Fail',                       //106
'2# Steering Gear Over Load',                        //107
'2# Steering Gear Oil Low Level',                    //108
'2# Steering Gear Filter Diff. Press. High',         //109
'2# Steering Gear Oil Temp. High',                   //110

'E/R CO2 Release Alarm',                             //111
'Stern Tube(PS) Bearing Temp. High',                 //112
'Stern Tube(SB) Bearing Temp. High',                 //113
'Fuel Conditioning Module Common Alarm',             //114
'Composite Boiler Common Alarm',                     //115
'AC Compressor Common Alarm',                        //116
'Sewage Treatment Unit Level High',                  //117
'Quick-Close Valve Control Air Pres. Low',           //118
'S/T(SB) L.O. Gravity Tank Level Low',               //119
'No.1. HFO Separator Starter Fail',                  //120
'No.2. HFO Separator Starter Fail',                  //121
'No.1. L.O. Separator Starter Fail',                 //122
'No.2. L.O. Separator Starter Fail',                 //123
'H.F.O. Overflow Tank Level High',                   //124
'Dirty H.F.O. Tank Level High',                      //125
'No.1 M.G.O. Service Tank Level Low',                //126
'No.2 M.G.O. Service Tank Level Low',                //127
'H.F.O. Service Tank Level Low',                     //128


//Group 5

'H.F.O. Tank (PS) Level High',                       //129
'H.F.O. Tank (SB) Level High',                       //130
'H.F.O. Tank Center High Level',                     //131
'EGR MGO Tank Level Low',                            //132
'Boiler F.O. Service Tank Level Low',                //133
'Boilter MGO Service Tank Level Low',                //134
'OWS Common ALarm',                                  //135
'H.F.O. Settling Tank Level Low',                    //136
'H.F.O. Sludge Tank Level High',                     //137
'MGO Tank (SB) Level High',                          //138
'L.O. Sludge Tank Level High',                       //139
'Dirty L.O. Tank Level High',                        //140
'S/T L.O. Gravity Tank Level Low',                   //141
'Bilge Water Hold Tank Level High',                  //142
'E/R Bilge Well(PS) Bilge Water Level High',         //143
'E/R Bilge Well(SB) Bilge Water Level High',         //144
'E/R Gearbox(PS) Bilge Water Level High',            //145
'E/R Gearbox(SB) Bilge Water Level High',            //146
'Fore F.W. Tank(PS) Level High',                     //147
'Fore F.W. Tank(PS) Level High',                     //148
'EMCY Fire Pump Room Bilge Water Level High',        //149
'Aft Tunnel Bilge Water Level High',                 //150
'3# Hold Bilger(PS) Level High',                     //151
'3# Hold Bilger(SB) Level High',                     //152
'2# Hold Bilger(PS) Level High',                     //153
'2# Hold Bilger(SB) Level High',                     //154
'1# Hold Bilger(PS) Level High',                     //155
'1# Bold Bilger(SB) Level High',                     //156
'E/R Alarm Relay Box Power Fail',                    //157
'No.3. Aux Diesel L.O. Pres. Low',                   //158
'Boiler Flame Fault',                                //159
'L.O. Stern Tube Tank Low Level'                     //160
);

ANumber : array[1..160] of integer = (
101,102,103,104,105,
301,302,303,304,305,
306,307,308,309,310,
311,312,313,314,315,
316,317,318,319,320,
321,324,325,326,704,
705,706,

201,202,203,204,205,
401,402,403,404,405,
406,407,408,409,410,
411,412,413,414,415,
416,417,418,419,420,
421,424,425,426,701,
707,708,

328,329,330,428,429,
430,501,502,503,504,
505,506,507,508,509,
510,511,512,513,514,
515,516,517,518,519,
520,521,601,602,603,
822,823,

650,651,652,653,654,
655,656,660,661,662,
663,664,665,666,670,
801,802,803,804,805,
806,808,812,813,814,
815,816,817,818,819,
820,821,

901,902,903,904,905,
906,907,908,909,910,
911,912,913,914,915,
916,917,918,919,920,
921,922,923,924,925,
926,927,928,929,930,
931,932

);
var
ALabel:array[1..160] of TLabel;
AShape:array[1..160] of TPanel;
AStatus:array[1..160] of byte;
ASNormal:array[1..160] of byte;
ASAck:array[1..160] of byte;
ASAlarm:array[1..160] of byte;
AStatusUpdate:array[1..160] of byte;

implementation

end.

