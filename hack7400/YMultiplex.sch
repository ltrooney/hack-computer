EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS157 U?
U 1 1 5F1A5968
P 2100 2100
AR Path="/5F1A5968" Ref="U?"  Part="1" 
AR Path="/5EEBD170/5F1A5968" Ref="U?"  Part="1" 
AR Path="/5EEBD85A/5F1A5968" Ref="U9"  Part="1" 
F 0 "U9" H 2100 3181 50  0000 C CNN
F 1 "74LS157" H 2100 3090 50  0000 C CNN
F 2 "" H 2100 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2100 2100 50  0001 C CNN
	1    2100 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1A596E
P 2100 3200
AR Path="/5F1A596E" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A596E" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A596E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2100 2950 50  0001 C CNN
F 1 "GND" H 2105 3027 50  0000 C CNN
F 2 "" H 2100 3200 50  0001 C CNN
F 3 "" H 2100 3200 50  0001 C CNN
	1    2100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1600 1550 1600
Wire Wire Line
	1550 1600 1550 1900
Wire Wire Line
	1600 1900 1550 1900
Connection ~ 1550 1900
Wire Wire Line
	1550 1900 1550 2200
Wire Wire Line
	1600 2200 1550 2200
Connection ~ 1550 2200
Wire Wire Line
	1550 2200 1550 2500
Wire Wire Line
	1600 2500 1550 2500
Connection ~ 1550 2500
Wire Wire Line
	1550 2500 1550 2800
Wire Wire Line
	1500 1500 1600 1500
Wire Wire Line
	1500 1800 1600 1800
Wire Wire Line
	1500 2100 1600 2100
Wire Wire Line
	1500 2400 1600 2400
Wire Wire Line
	1600 2800 1550 2800
Connection ~ 1550 2800
Text GLabel 1500 2400 0    50   Input ~ 0
Y_3
Text GLabel 1500 2100 0    50   Input ~ 0
Y_2
Text GLabel 1500 1800 0    50   Input ~ 0
Y_1
Text GLabel 1500 1500 0    50   Input ~ 0
Y_0
Text GLabel 3500 1300 2    50   Input ~ 0
MUX_2_OUT_0
Text GLabel 3500 1900 2    50   Input ~ 0
MUX_2_OUT_1
Text GLabel 3500 2500 2    50   Input ~ 0
MUX_2_OUT_2
Text GLabel 3500 3100 2    50   Input ~ 0
MUX_2_OUT_3
Wire Wire Line
	2100 3200 2100 3150
Wire Wire Line
	2100 3150 1550 3150
Connection ~ 2100 3150
Wire Wire Line
	2100 3150 2100 3100
Wire Wire Line
	1550 2800 1550 3150
$Comp
L 74xx:74LS86 U?
U 1 1 5F1A5992
P 3200 1300
AR Path="/5EEBD170/5F1A5992" Ref="U?"  Part="1" 
AR Path="/5EEBD85A/5F1A5992" Ref="U13"  Part="1" 
F 0 "U13" H 3200 1625 50  0000 C CNN
F 1 "74LS86" H 3200 1534 50  0000 C CNN
F 2 "" H 3200 1300 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3200 1300 50  0001 C CNN
	1    3200 1300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 2 1 5F1A5998
P 3200 1900
AR Path="/5EEBD170/5F1A5998" Ref="U?"  Part="2" 
AR Path="/5EEBD85A/5F1A5998" Ref="U13"  Part="2" 
F 0 "U13" H 3200 2225 50  0000 C CNN
F 1 "74LS86" H 3200 2134 50  0000 C CNN
F 2 "" H 3200 1900 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3200 1900 50  0001 C CNN
	2    3200 1900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 3 1 5F1A599E
P 3200 2500
AR Path="/5EEBD170/5F1A599E" Ref="U?"  Part="3" 
AR Path="/5EEBD85A/5F1A599E" Ref="U13"  Part="3" 
F 0 "U13" H 3200 2825 50  0000 C CNN
F 1 "74LS86" H 3200 2734 50  0000 C CNN
F 2 "" H 3200 2500 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3200 2500 50  0001 C CNN
	3    3200 2500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 4 1 5F1A59A4
P 3200 3100
AR Path="/5EEBD170/5F1A59A4" Ref="U?"  Part="4" 
AR Path="/5EEBD85A/5F1A59A4" Ref="U13"  Part="4" 
F 0 "U13" H 3200 3425 50  0000 C CNN
F 1 "74LS86" H 3200 3334 50  0000 C CNN
F 2 "" H 3200 3100 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3200 3100 50  0001 C CNN
	4    3200 3100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 5 1 5F1A59AA
P 8850 2200
AR Path="/5EEBD170/5F1A59AA" Ref="U?"  Part="5" 
AR Path="/5EEBD85A/5F1A59AA" Ref="U13"  Part="5" 
F 0 "U13" H 9080 2246 50  0000 L CNN
F 1 "74LS86" H 9080 2155 50  0000 L CNN
F 2 "" H 8850 2200 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 8850 2200 50  0001 C CNN
	5    8850 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1A59B0
P 2350 1200
AR Path="/5F1A59B0" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A59B0" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A59B0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 1050 50  0001 C CNN
F 1 "+5V" H 2365 1373 50  0000 C CNN
F 2 "" H 2350 1200 50  0001 C CNN
F 3 "" H 2350 1200 50  0001 C CNN
	1    2350 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1200 2350 1200
$Comp
L power:GND #PWR?
U 1 1 5F1A59B7
P 8850 2700
AR Path="/5F1A59B7" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A59B7" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A59B7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8850 2450 50  0001 C CNN
F 1 "GND" H 8855 2527 50  0000 C CNN
F 2 "" H 8850 2700 50  0001 C CNN
F 3 "" H 8850 2700 50  0001 C CNN
	1    8850 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1A59BD
P 8850 1700
AR Path="/5F1A59BD" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A59BD" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A59BD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8850 1550 50  0001 C CNN
F 1 "+5V" H 8865 1873 50  0000 C CNN
F 2 "" H 8850 1700 50  0001 C CNN
F 3 "" H 8850 1700 50  0001 C CNN
	1    8850 1700
	1    0    0    -1  
$EndComp
Text GLabel 2700 3200 0    50   Input ~ 0
NY
Wire Wire Line
	2700 3200 2800 3200
Wire Wire Line
	2800 3200 2800 2600
Wire Wire Line
	2800 1400 2900 1400
Connection ~ 2800 3200
Wire Wire Line
	2800 3200 2900 3200
Wire Wire Line
	2800 2000 2900 2000
Connection ~ 2800 2000
Wire Wire Line
	2800 2000 2800 1400
Wire Wire Line
	2800 2600 2900 2600
Connection ~ 2800 2600
Wire Wire Line
	2800 2600 2800 2000
Wire Wire Line
	2600 2100 2700 2100
Wire Wire Line
	2600 1500 2600 1200
Wire Wire Line
	2600 2400 2600 3000
Wire Wire Line
	2700 2100 2700 2400
Wire Wire Line
	2600 1200 2900 1200
Wire Wire Line
	2600 1800 2900 1800
Wire Wire Line
	2600 3000 2900 3000
Wire Wire Line
	2700 2400 2900 2400
Wire Wire Line
	1100 2700 1600 2700
Text GLabel 1100 2700 0    50   Input ~ 0
ZY
$Comp
L 74xx:74LS157 U?
U 1 1 5F1A59D9
P 5600 2150
AR Path="/5F1A59D9" Ref="U?"  Part="1" 
AR Path="/5EEBD170/5F1A59D9" Ref="U?"  Part="1" 
AR Path="/5EEBD85A/5F1A59D9" Ref="U10"  Part="1" 
F 0 "U10" H 5600 3231 50  0000 C CNN
F 1 "74LS157" H 5600 3140 50  0000 C CNN
F 2 "" H 5600 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 5600 2150 50  0001 C CNN
	1    5600 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1A59DF
P 5600 3250
AR Path="/5F1A59DF" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A59DF" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A59DF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5600 3000 50  0001 C CNN
F 1 "GND" H 5605 3077 50  0000 C CNN
F 2 "" H 5600 3250 50  0001 C CNN
F 3 "" H 5600 3250 50  0001 C CNN
	1    5600 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1650 5050 1650
Wire Wire Line
	5050 1650 5050 1950
Wire Wire Line
	5100 1950 5050 1950
Connection ~ 5050 1950
Wire Wire Line
	5050 1950 5050 2250
Wire Wire Line
	5100 2250 5050 2250
Connection ~ 5050 2250
Wire Wire Line
	5050 2250 5050 2550
Wire Wire Line
	5100 2550 5050 2550
Connection ~ 5050 2550
Wire Wire Line
	5050 2550 5050 2850
Wire Wire Line
	5000 1550 5100 1550
Wire Wire Line
	5000 1850 5100 1850
Wire Wire Line
	5000 2150 5100 2150
Wire Wire Line
	5000 2450 5100 2450
Wire Wire Line
	5100 2850 5050 2850
Connection ~ 5050 2850
Text GLabel 5000 2450 0    50   Input ~ 0
Y_7
Text GLabel 5000 2150 0    50   Input ~ 0
Y_6
Text GLabel 5000 1850 0    50   Input ~ 0
Y_5
Text GLabel 5000 1550 0    50   Input ~ 0
Y_4
Text GLabel 7000 1350 2    50   Input ~ 0
MUX_2_OUT_4
Text GLabel 7000 1950 2    50   Input ~ 0
MUX_2_OUT_5
Text GLabel 7000 2550 2    50   Input ~ 0
MUX_2_OUT_6
Text GLabel 7000 3150 2    50   Input ~ 0
MUX_2_OUT_7
Wire Wire Line
	5600 3250 5600 3200
Wire Wire Line
	5600 3200 5050 3200
Connection ~ 5600 3200
Wire Wire Line
	5600 3200 5600 3150
Wire Wire Line
	5050 2850 5050 3200
$Comp
L 74xx:74LS86 U?
U 1 1 5F1A5A03
P 6700 1350
AR Path="/5EEBD170/5F1A5A03" Ref="U?"  Part="1" 
AR Path="/5EEBD85A/5F1A5A03" Ref="U14"  Part="1" 
F 0 "U14" H 6700 1675 50  0000 C CNN
F 1 "74LS86" H 6700 1584 50  0000 C CNN
F 2 "" H 6700 1350 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6700 1350 50  0001 C CNN
	1    6700 1350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 2 1 5F1A5A09
P 6700 1950
AR Path="/5EEBD170/5F1A5A09" Ref="U?"  Part="2" 
AR Path="/5EEBD85A/5F1A5A09" Ref="U14"  Part="2" 
F 0 "U14" H 6700 2275 50  0000 C CNN
F 1 "74LS86" H 6700 2184 50  0000 C CNN
F 2 "" H 6700 1950 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6700 1950 50  0001 C CNN
	2    6700 1950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 3 1 5F1A5A0F
P 6700 2550
AR Path="/5EEBD170/5F1A5A0F" Ref="U?"  Part="3" 
AR Path="/5EEBD85A/5F1A5A0F" Ref="U14"  Part="3" 
F 0 "U14" H 6700 2875 50  0000 C CNN
F 1 "74LS86" H 6700 2784 50  0000 C CNN
F 2 "" H 6700 2550 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6700 2550 50  0001 C CNN
	3    6700 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 4 1 5F1A5A15
P 6700 3150
AR Path="/5EEBD170/5F1A5A15" Ref="U?"  Part="4" 
AR Path="/5EEBD85A/5F1A5A15" Ref="U14"  Part="4" 
F 0 "U14" H 6700 3475 50  0000 C CNN
F 1 "74LS86" H 6700 3384 50  0000 C CNN
F 2 "" H 6700 3150 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6700 3150 50  0001 C CNN
	4    6700 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1A5A1B
P 5850 1250
AR Path="/5F1A5A1B" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5A1B" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5A1B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5850 1100 50  0001 C CNN
F 1 "+5V" H 5865 1423 50  0000 C CNN
F 2 "" H 5850 1250 50  0001 C CNN
F 3 "" H 5850 1250 50  0001 C CNN
	1    5850 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1250 5850 1250
Text GLabel 6200 3250 0    50   Input ~ 0
NY
Wire Wire Line
	6200 3250 6300 3250
Wire Wire Line
	6300 3250 6300 2650
Wire Wire Line
	6300 1450 6400 1450
Connection ~ 6300 3250
Wire Wire Line
	6300 3250 6400 3250
Wire Wire Line
	6300 2050 6400 2050
Connection ~ 6300 2050
Wire Wire Line
	6300 2050 6300 1450
Wire Wire Line
	6300 2650 6400 2650
Connection ~ 6300 2650
Wire Wire Line
	6300 2650 6300 2050
Wire Wire Line
	6100 2150 6200 2150
Wire Wire Line
	6100 1550 6100 1250
Wire Wire Line
	6100 2450 6100 3050
Wire Wire Line
	6200 2150 6200 2450
Wire Wire Line
	6100 1250 6400 1250
Wire Wire Line
	6100 1850 6400 1850
Wire Wire Line
	6100 3050 6400 3050
Wire Wire Line
	6200 2450 6400 2450
Wire Wire Line
	4600 2750 5100 2750
Text GLabel 4600 2750 0    50   Input ~ 0
ZY
$Comp
L 74xx:74LS157 U?
U 1 1 5F1A5A38
P 2200 4900
AR Path="/5F1A5A38" Ref="U?"  Part="1" 
AR Path="/5EEBD170/5F1A5A38" Ref="U?"  Part="1" 
AR Path="/5EEBD85A/5F1A5A38" Ref="U11"  Part="1" 
F 0 "U11" H 2200 5981 50  0000 C CNN
F 1 "74LS157" H 2200 5890 50  0000 C CNN
F 2 "" H 2200 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2200 4900 50  0001 C CNN
	1    2200 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1A5A3E
P 2200 6000
AR Path="/5F1A5A3E" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5A3E" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5A3E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2200 5750 50  0001 C CNN
F 1 "GND" H 2205 5827 50  0000 C CNN
F 2 "" H 2200 6000 50  0001 C CNN
F 3 "" H 2200 6000 50  0001 C CNN
	1    2200 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4400 1650 4400
Wire Wire Line
	1650 4400 1650 4700
Wire Wire Line
	1700 4700 1650 4700
Connection ~ 1650 4700
Wire Wire Line
	1650 4700 1650 5000
Wire Wire Line
	1700 5000 1650 5000
Connection ~ 1650 5000
Wire Wire Line
	1650 5000 1650 5300
Wire Wire Line
	1700 5300 1650 5300
Connection ~ 1650 5300
Wire Wire Line
	1650 5300 1650 5600
Wire Wire Line
	1600 4300 1700 4300
Wire Wire Line
	1600 4600 1700 4600
Wire Wire Line
	1600 4900 1700 4900
Wire Wire Line
	1600 5200 1700 5200
Wire Wire Line
	1700 5600 1650 5600
Connection ~ 1650 5600
Text GLabel 1600 5200 0    50   Input ~ 0
Y_11
Text GLabel 1600 4900 0    50   Input ~ 0
Y_10
Text GLabel 1600 4600 0    50   Input ~ 0
Y_9
Text GLabel 1600 4300 0    50   Input ~ 0
Y_8
Text GLabel 3600 4100 2    50   Input ~ 0
MUX_2_OUT_8
Text GLabel 3600 4700 2    50   Input ~ 0
MUX_2_OUT_9
Text GLabel 3600 5300 2    50   Input ~ 0
MUX_2_OUT_10
Text GLabel 3600 5900 2    50   Input ~ 0
MUX_2_OUT_11
Wire Wire Line
	2200 6000 2200 5950
Wire Wire Line
	2200 5950 1650 5950
Connection ~ 2200 5950
Wire Wire Line
	2200 5950 2200 5900
Wire Wire Line
	1650 5600 1650 5950
$Comp
L 74xx:74LS86 U?
U 1 1 5F1A5A62
P 3300 4100
AR Path="/5EEBD170/5F1A5A62" Ref="U?"  Part="1" 
AR Path="/5EEBD85A/5F1A5A62" Ref="U15"  Part="1" 
F 0 "U15" H 3300 4425 50  0000 C CNN
F 1 "74LS86" H 3300 4334 50  0000 C CNN
F 2 "" H 3300 4100 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3300 4100 50  0001 C CNN
	1    3300 4100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 2 1 5F1A5A68
P 3300 4700
AR Path="/5EEBD170/5F1A5A68" Ref="U?"  Part="2" 
AR Path="/5EEBD85A/5F1A5A68" Ref="U15"  Part="2" 
F 0 "U15" H 3300 5025 50  0000 C CNN
F 1 "74LS86" H 3300 4934 50  0000 C CNN
F 2 "" H 3300 4700 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3300 4700 50  0001 C CNN
	2    3300 4700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 3 1 5F1A5A6E
P 3300 5300
AR Path="/5EEBD170/5F1A5A6E" Ref="U?"  Part="3" 
AR Path="/5EEBD85A/5F1A5A6E" Ref="U15"  Part="3" 
F 0 "U15" H 3300 5625 50  0000 C CNN
F 1 "74LS86" H 3300 5534 50  0000 C CNN
F 2 "" H 3300 5300 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3300 5300 50  0001 C CNN
	3    3300 5300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 4 1 5F1A5A74
P 3300 5900
AR Path="/5EEBD170/5F1A5A74" Ref="U?"  Part="4" 
AR Path="/5EEBD85A/5F1A5A74" Ref="U15"  Part="4" 
F 0 "U15" H 3300 6225 50  0000 C CNN
F 1 "74LS86" H 3300 6134 50  0000 C CNN
F 2 "" H 3300 5900 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3300 5900 50  0001 C CNN
	4    3300 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1A5A7A
P 2450 4000
AR Path="/5F1A5A7A" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5A7A" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5A7A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 3850 50  0001 C CNN
F 1 "+5V" H 2465 4173 50  0000 C CNN
F 2 "" H 2450 4000 50  0001 C CNN
F 3 "" H 2450 4000 50  0001 C CNN
	1    2450 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4000 2450 4000
Text GLabel 2800 6000 0    50   Input ~ 0
NY
Wire Wire Line
	2800 6000 2900 6000
Wire Wire Line
	2900 6000 2900 5400
Wire Wire Line
	2900 4200 3000 4200
Connection ~ 2900 6000
Wire Wire Line
	2900 6000 3000 6000
Wire Wire Line
	2900 4800 3000 4800
Connection ~ 2900 4800
Wire Wire Line
	2900 4800 2900 4200
Wire Wire Line
	2900 5400 3000 5400
Connection ~ 2900 5400
Wire Wire Line
	2900 5400 2900 4800
Wire Wire Line
	2700 4900 2800 4900
Wire Wire Line
	2700 4300 2700 4000
Wire Wire Line
	2700 5200 2700 5800
Wire Wire Line
	2800 4900 2800 5200
Wire Wire Line
	2700 4000 3000 4000
Wire Wire Line
	2700 4600 3000 4600
Wire Wire Line
	2700 5800 3000 5800
Wire Wire Line
	2800 5200 3000 5200
Wire Wire Line
	1200 5500 1700 5500
Text GLabel 1200 5500 0    50   Input ~ 0
ZY
$Comp
L 74xx:74LS157 U?
U 1 1 5F1A5A97
P 5600 4900
AR Path="/5F1A5A97" Ref="U?"  Part="1" 
AR Path="/5EEBD170/5F1A5A97" Ref="U?"  Part="1" 
AR Path="/5EEBD85A/5F1A5A97" Ref="U12"  Part="1" 
F 0 "U12" H 5600 5981 50  0000 C CNN
F 1 "74LS157" H 5600 5890 50  0000 C CNN
F 2 "" H 5600 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 5600 4900 50  0001 C CNN
	1    5600 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1A5A9D
P 5600 6000
AR Path="/5F1A5A9D" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5A9D" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5A9D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5600 5750 50  0001 C CNN
F 1 "GND" H 5605 5827 50  0000 C CNN
F 2 "" H 5600 6000 50  0001 C CNN
F 3 "" H 5600 6000 50  0001 C CNN
	1    5600 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4400 5050 4400
Wire Wire Line
	5050 4400 5050 4700
Wire Wire Line
	5100 4700 5050 4700
Connection ~ 5050 4700
Wire Wire Line
	5050 4700 5050 5000
Wire Wire Line
	5100 5000 5050 5000
Connection ~ 5050 5000
Wire Wire Line
	5050 5000 5050 5300
Wire Wire Line
	5100 5300 5050 5300
Connection ~ 5050 5300
Wire Wire Line
	5050 5300 5050 5600
Wire Wire Line
	5000 4300 5100 4300
Wire Wire Line
	5000 4600 5100 4600
Wire Wire Line
	5000 4900 5100 4900
Wire Wire Line
	5000 5200 5100 5200
Wire Wire Line
	5100 5600 5050 5600
Connection ~ 5050 5600
Text GLabel 5000 4900 0    50   Input ~ 0
Y_14
Text GLabel 5000 4600 0    50   Input ~ 0
Y_13
Text GLabel 5000 4300 0    50   Input ~ 0
Y_12
Text GLabel 7000 4100 2    50   Input ~ 0
MUX_2_OUT_12
Text GLabel 7000 4700 2    50   Input ~ 0
MUX_2_OUT_13
Text GLabel 7000 5300 2    50   Input ~ 0
MUX_2_OUT_14
Text GLabel 7000 5900 2    50   Input ~ 0
MUX_2_OUT_15
Wire Wire Line
	5600 6000 5600 5950
Wire Wire Line
	5600 5950 5050 5950
Connection ~ 5600 5950
Wire Wire Line
	5600 5950 5600 5900
Wire Wire Line
	5050 5600 5050 5950
$Comp
L 74xx:74LS86 U?
U 1 1 5F1A5AC1
P 6700 4100
AR Path="/5EEBD170/5F1A5AC1" Ref="U?"  Part="1" 
AR Path="/5EEBD85A/5F1A5AC1" Ref="U16"  Part="1" 
F 0 "U16" H 6700 4425 50  0000 C CNN
F 1 "74LS86" H 6700 4334 50  0000 C CNN
F 2 "" H 6700 4100 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6700 4100 50  0001 C CNN
	1    6700 4100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 2 1 5F1A5AC7
P 6700 4700
AR Path="/5EEBD170/5F1A5AC7" Ref="U?"  Part="2" 
AR Path="/5EEBD85A/5F1A5AC7" Ref="U16"  Part="2" 
F 0 "U16" H 6700 5025 50  0000 C CNN
F 1 "74LS86" H 6700 4934 50  0000 C CNN
F 2 "" H 6700 4700 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6700 4700 50  0001 C CNN
	2    6700 4700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 3 1 5F1A5ACD
P 6700 5300
AR Path="/5EEBD170/5F1A5ACD" Ref="U?"  Part="3" 
AR Path="/5EEBD85A/5F1A5ACD" Ref="U16"  Part="3" 
F 0 "U16" H 6700 5625 50  0000 C CNN
F 1 "74LS86" H 6700 5534 50  0000 C CNN
F 2 "" H 6700 5300 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6700 5300 50  0001 C CNN
	3    6700 5300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 4 1 5F1A5AD3
P 6700 5900
AR Path="/5EEBD170/5F1A5AD3" Ref="U?"  Part="4" 
AR Path="/5EEBD85A/5F1A5AD3" Ref="U16"  Part="4" 
F 0 "U16" H 6700 6225 50  0000 C CNN
F 1 "74LS86" H 6700 6134 50  0000 C CNN
F 2 "" H 6700 5900 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6700 5900 50  0001 C CNN
	4    6700 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1A5AD9
P 5850 4000
AR Path="/5F1A5AD9" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5AD9" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5AD9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5850 3850 50  0001 C CNN
F 1 "+5V" H 5865 4173 50  0000 C CNN
F 2 "" H 5850 4000 50  0001 C CNN
F 3 "" H 5850 4000 50  0001 C CNN
	1    5850 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4000 5850 4000
Text GLabel 6200 6000 0    50   Input ~ 0
NY
Wire Wire Line
	6200 6000 6300 6000
Wire Wire Line
	6300 6000 6300 5400
Wire Wire Line
	6300 4200 6400 4200
Connection ~ 6300 6000
Wire Wire Line
	6300 6000 6400 6000
Wire Wire Line
	6300 4800 6400 4800
Connection ~ 6300 4800
Wire Wire Line
	6300 4800 6300 4200
Wire Wire Line
	6300 5400 6400 5400
Connection ~ 6300 5400
Wire Wire Line
	6300 5400 6300 4800
Wire Wire Line
	6100 4900 6200 4900
Wire Wire Line
	6100 4300 6100 4000
Wire Wire Line
	6100 5200 6100 5800
Wire Wire Line
	6200 4900 6200 5200
Wire Wire Line
	6100 4000 6400 4000
Wire Wire Line
	6100 4600 6400 4600
Wire Wire Line
	6100 5800 6400 5800
Wire Wire Line
	6200 5200 6400 5200
Wire Wire Line
	4600 5500 5100 5500
Text GLabel 4600 5500 0    50   Input ~ 0
ZY
$Comp
L 74xx:74LS86 U?
U 5 1 5F1A5AF6
P 10150 2200
AR Path="/5EEBD170/5F1A5AF6" Ref="U?"  Part="5" 
AR Path="/5EEBD85A/5F1A5AF6" Ref="U14"  Part="5" 
F 0 "U14" H 10380 2246 50  0000 L CNN
F 1 "74LS86" H 10380 2155 50  0000 L CNN
F 2 "" H 10150 2200 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 10150 2200 50  0001 C CNN
	5    10150 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1A5AFC
P 10150 2700
AR Path="/5F1A5AFC" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5AFC" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5AFC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10150 2450 50  0001 C CNN
F 1 "GND" H 10155 2527 50  0000 C CNN
F 2 "" H 10150 2700 50  0001 C CNN
F 3 "" H 10150 2700 50  0001 C CNN
	1    10150 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1A5B02
P 10150 1700
AR Path="/5F1A5B02" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5B02" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5B02" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10150 1550 50  0001 C CNN
F 1 "+5V" H 10165 1873 50  0000 C CNN
F 2 "" H 10150 1700 50  0001 C CNN
F 3 "" H 10150 1700 50  0001 C CNN
	1    10150 1700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 5 1 5F1A5B08
P 8850 5050
AR Path="/5EEBD170/5F1A5B08" Ref="U?"  Part="5" 
AR Path="/5EEBD85A/5F1A5B08" Ref="U15"  Part="5" 
F 0 "U15" H 9080 5096 50  0000 L CNN
F 1 "74LS86" H 9080 5005 50  0000 L CNN
F 2 "" H 8850 5050 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 8850 5050 50  0001 C CNN
	5    8850 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1A5B0E
P 8850 5550
AR Path="/5F1A5B0E" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5B0E" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5B0E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8850 5300 50  0001 C CNN
F 1 "GND" H 8855 5377 50  0000 C CNN
F 2 "" H 8850 5550 50  0001 C CNN
F 3 "" H 8850 5550 50  0001 C CNN
	1    8850 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1A5B14
P 8850 4550
AR Path="/5F1A5B14" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5B14" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5B14" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8850 4400 50  0001 C CNN
F 1 "+5V" H 8865 4723 50  0000 C CNN
F 2 "" H 8850 4550 50  0001 C CNN
F 3 "" H 8850 4550 50  0001 C CNN
	1    8850 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 5 1 5F1A5B1A
P 10150 5050
AR Path="/5EEBD170/5F1A5B1A" Ref="U?"  Part="5" 
AR Path="/5EEBD85A/5F1A5B1A" Ref="U16"  Part="5" 
F 0 "U16" H 10380 5096 50  0000 L CNN
F 1 "74LS86" H 10380 5005 50  0000 L CNN
F 2 "" H 10150 5050 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 10150 5050 50  0001 C CNN
	5    10150 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F1A5B20
P 10150 5550
AR Path="/5F1A5B20" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5B20" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5B20" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10150 5300 50  0001 C CNN
F 1 "GND" H 10155 5377 50  0000 C CNN
F 2 "" H 10150 5550 50  0001 C CNN
F 3 "" H 10150 5550 50  0001 C CNN
	1    10150 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1A5B26
P 10150 4550
AR Path="/5F1A5B26" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD170/5F1A5B26" Ref="#PWR?"  Part="1" 
AR Path="/5EEBD85A/5F1A5B26" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10150 4400 50  0001 C CNN
F 1 "+5V" H 10165 4723 50  0000 C CNN
F 2 "" H 10150 4550 50  0001 C CNN
F 3 "" H 10150 4550 50  0001 C CNN
	1    10150 4550
	1    0    0    -1  
$EndComp
Text GLabel 5000 5200 0    50   Input ~ 0
X_15
$EndSCHEMATC
