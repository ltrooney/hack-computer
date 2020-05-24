EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
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
L Connector:Conn_01x16_Male J1
U 1 1 5ED26DAE
P 4300 2050
F 0 "J1" H 3900 2100 50  0000 C CNN
F 1 "Conn_01x16_Male" H 3900 2000 50  0000 C CNN
F 2 "" H 4300 2050 50  0001 C CNN
F 3 "~" H 4300 2050 50  0001 C CNN
	1    4300 2050
	1    0    0    -1  
$EndComp
Text GLabel 4500 1350 2    50   Input ~ 0
X_0
Text GLabel 4500 1450 2    50   Input ~ 0
X_1
Text GLabel 4500 1550 2    50   Input ~ 0
X_2
Text GLabel 4500 1650 2    50   Input ~ 0
X_3
Text GLabel 4500 1750 2    50   Input ~ 0
X_4
Text GLabel 4500 1850 2    50   Input ~ 0
X_5
Text GLabel 4500 1950 2    50   Input ~ 0
X_6
Text GLabel 4500 2050 2    50   Input ~ 0
X_7
Text GLabel 4500 2150 2    50   Input ~ 0
X_8
Text GLabel 4500 2250 2    50   Input ~ 0
X_9
Text GLabel 4500 2350 2    50   Input ~ 0
X_10
Text GLabel 4500 2450 2    50   Input ~ 0
X_11
Text GLabel 4500 2550 2    50   Input ~ 0
X_12
Text GLabel 4500 2650 2    50   Input ~ 0
X_13
Text GLabel 4500 2750 2    50   Input ~ 0
X_14
Text GLabel 4500 2850 2    50   Input ~ 0
X_15
Text GLabel 4500 3550 2    50   Input ~ 0
Y_0
Text GLabel 4500 3650 2    50   Input ~ 0
Y_1
Text GLabel 4500 3750 2    50   Input ~ 0
Y_2
Text GLabel 4500 3850 2    50   Input ~ 0
Y_3
Text GLabel 4500 3950 2    50   Input ~ 0
Y_4
Text GLabel 4500 4050 2    50   Input ~ 0
Y_5
Text GLabel 4500 4150 2    50   Input ~ 0
Y_6
Text GLabel 4500 4250 2    50   Input ~ 0
Y_7
Text GLabel 4500 4350 2    50   Input ~ 0
Y_8
Text GLabel 4500 4450 2    50   Input ~ 0
Y_9
Text GLabel 4500 4550 2    50   Input ~ 0
Y_10
Text GLabel 4500 4650 2    50   Input ~ 0
Y_11
Text GLabel 4500 4750 2    50   Input ~ 0
Y_12
Text GLabel 4500 4850 2    50   Input ~ 0
Y_13
Text GLabel 4500 4950 2    50   Input ~ 0
Y_14
Text GLabel 4500 5050 2    50   Input ~ 0
Y_15
$Comp
L Connector:Conn_01x06_Male J2
U 1 1 5ED5F4A3
P 4300 5900
F 0 "J2" H 3900 5900 50  0000 C CNN
F 1 "Conn_01x06_Male" H 3900 5800 50  0000 C CNN
F 2 "" H 4300 5900 50  0001 C CNN
F 3 "~" H 4300 5900 50  0001 C CNN
	1    4300 5900
	1    0    0    -1  
$EndComp
Text GLabel 4500 5700 2    50   Input ~ 0
ZX
Text GLabel 4500 5800 2    50   Input ~ 0
NX
Text GLabel 4500 5900 2    50   Input ~ 0
ZY
Text GLabel 4500 6000 2    50   Input ~ 0
NY
Text GLabel 4500 6100 2    50   Input ~ 0
F
Text GLabel 4500 6200 2    50   Input ~ 0
NO
$Sheet
S 12100 400  1300 200 
U 5EEBD170
F0 "X Input Multiplex Stage" 50
F1 "XMultiplex.sch" 50
$EndSheet
$Sheet
S 12100 900  1250 200 
U 5EEBD85A
F0 "Y Input Multiplex Stage" 50
F1 "YMultiplex.sch" 50
$EndSheet
$Sheet
S 12100 1300 1300 200 
U 5EEBDE2D
F0 "And Logic" 50
F1 "And.sch" 50
$EndSheet
$Sheet
S 12100 1750 1350 200 
U 5EEBE245
F0 "Add Logic" 50
F1 "Add.sch" 50
$EndSheet
$Sheet
S 12100 2200 1350 200 
U 5EEBE5D5
F0 "And-Add Multiplex Stage" 50
F1 "AndAddMultiplex.sch" 50
$EndSheet
$Sheet
S 12100 2650 1350 250 
U 5EEBE963
F0 "Sign Logic" 50
F1 "Sign.sch" 50
$EndSheet
$Comp
L Connector:Conn_01x16_Male J4
U 1 1 5F56E4FF
P 6250 2050
F 0 "J4" H 6222 2024 50  0000 R CNN
F 1 "Conn_01x16_Male" H 6222 1933 50  0000 R CNN
F 2 "" H 6250 2050 50  0001 C CNN
F 3 "~" H 6250 2050 50  0001 C CNN
	1    6250 2050
	-1   0    0    -1  
$EndComp
Text GLabel 6050 1350 0    50   Input ~ 0
OUT_0
Text GLabel 6050 1450 0    50   Input ~ 0
OUT_1
Text GLabel 6050 1550 0    50   Input ~ 0
OUT_2
Text GLabel 6050 1650 0    50   Input ~ 0
OUT_3
Text GLabel 6050 1750 0    50   Input ~ 0
OUT_4
Text GLabel 6050 1850 0    50   Input ~ 0
OUT_5
Text GLabel 6050 1950 0    50   Input ~ 0
OUT_6
Text GLabel 6050 2050 0    50   Input ~ 0
OUT_7
Text GLabel 6050 2150 0    50   Input ~ 0
OUT_8
Text GLabel 6050 2250 0    50   Input ~ 0
OUT_9
Text GLabel 6050 2350 0    50   Input ~ 0
OUT_10
Text GLabel 6050 2450 0    50   Input ~ 0
OUT_11
Text GLabel 6050 2550 0    50   Input ~ 0
OUT_12
Text GLabel 6050 2650 0    50   Input ~ 0
OUT_13
Text GLabel 6050 2750 0    50   Input ~ 0
OUT_14
Text GLabel 6050 2850 0    50   Input ~ 0
OUT_15
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5F576115
P 6250 3550
F 0 "J5" H 6222 3524 50  0000 R CNN
F 1 "Conn_01x02_Male" H 6222 3433 50  0000 R CNN
F 2 "" H 6250 3550 50  0001 C CNN
F 3 "~" H 6250 3550 50  0001 C CNN
	1    6250 3550
	-1   0    0    -1  
$EndComp
Text GLabel 6050 3650 0    50   Input ~ 0
NG
Text GLabel 6050 3550 0    50   Input ~ 0
ZR
$Comp
L Connector:Conn_01x16_Male J3
U 1 1 5ED4A02F
P 4300 4250
F 0 "J3" H 3900 4300 50  0000 C CNN
F 1 "Conn_01x16_Male" H 3900 4200 50  0000 C CNN
F 2 "" H 4300 4250 50  0001 C CNN
F 3 "~" H 4300 4250 50  0001 C CNN
	1    4300 4250
	1    0    0    -1  
$EndComp
Wire Notes Line
	3450 3000 4800 3000
Wire Notes Line
	4800 3000 4800 950 
Wire Notes Line
	3450 950  4800 950 
Wire Notes Line
	3450 950  3450 3000
Text Notes 3800 1100 0    50   ~ 0
Input X Connector
Wire Notes Line
	4800 5200 4800 3150
Wire Notes Line
	3450 3150 4800 3150
Wire Notes Line
	3450 3150 3450 5200
Text Notes 3800 3300 0    50   ~ 0
Input Y Connector
Wire Notes Line
	3450 5200 4800 5200
Wire Notes Line
	3450 5350 4800 5350
Text Notes 3700 5500 0    50   ~ 0
Control Input Connector
Wire Notes Line
	3450 5350 3450 6350
Wire Notes Line
	3450 6350 4800 6350
Wire Notes Line
	4800 6350 4800 5350
Wire Notes Line
	7000 3000 7000 950 
Wire Notes Line
	5650 950  7000 950 
Wire Notes Line
	5650 950  5650 3000
Text Notes 6000 1100 0    50   ~ 0
Output Connector
Wire Notes Line
	5650 3000 7000 3000
Wire Notes Line
	5650 3200 5650 3800
Wire Notes Line
	5650 3800 7050 3800
Wire Notes Line
	7050 3800 7050 3200
Wire Notes Line
	7050 3200 5650 3200
Text Notes 6100 3350 0    50   ~ 0
Output Flags
$EndSCHEMATC
