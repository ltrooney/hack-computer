EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
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
L 74xx:74LS83 U21
U 1 1 5F28A8FB
P 2100 3200
F 0 "U21" H 2100 4181 50  0000 C CNN
F 1 "74LS83" H 2100 4090 50  0000 C CNN
F 2 "" H 2100 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS83" H 2100 3200 50  0001 C CNN
	1    2100 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F28BDD6
P 2400 2400
F 0 "#PWR?" H 2400 2250 50  0001 C CNN
F 1 "+5V" H 2415 2573 50  0000 C CNN
F 2 "" H 2400 2400 50  0001 C CNN
F 3 "" H 2400 2400 50  0001 C CNN
	1    2400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2400 2400 2400
$Comp
L power:GND #PWR?
U 1 1 5F28C95E
P 2100 4000
F 0 "#PWR?" H 2100 3750 50  0001 C CNN
F 1 "GND" H 2105 3827 50  0000 C CNN
F 2 "" H 2100 4000 50  0001 C CNN
F 3 "" H 2100 4000 50  0001 C CNN
	1    2100 4000
	1    0    0    -1  
$EndComp
Text GLabel 1600 3700 0    50   Input ~ 0
MUX_1_OUT_0
Text GLabel 1600 3600 0    50   Input ~ 0
MUX_1_OUT_1
Text GLabel 1600 3500 0    50   Input ~ 0
MUX_1_OUT_2
Text GLabel 1600 3400 0    50   Input ~ 0
MUX_1_OUT_3
Text GLabel 1600 3200 0    50   Input ~ 0
MUX_2_OUT_0
Text GLabel 1600 3100 0    50   Input ~ 0
MUX_2_OUT_1
Text GLabel 1600 3000 0    50   Input ~ 0
MUX_2_OUT_2
Text GLabel 1600 2900 0    50   Input ~ 0
MUX_2_OUT_3
Text GLabel 2600 3000 2    50   Input ~ 0
ADD_OUT_3
Text GLabel 2600 2900 2    50   Input ~ 0
ADD_OUT_2
Text GLabel 2600 2800 2    50   Input ~ 0
ADD_OUT_1
Text GLabel 2600 2700 2    50   Input ~ 0
ADD_OUT_0
$Comp
L 74xx:74LS83 U22
U 1 1 5F28FE55
P 4550 3200
F 0 "U22" H 4550 4181 50  0000 C CNN
F 1 "74LS83" H 4550 4090 50  0000 C CNN
F 2 "" H 4550 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS83" H 4550 3200 50  0001 C CNN
	1    4550 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F28FE5F
P 4850 2400
F 0 "#PWR?" H 4850 2250 50  0001 C CNN
F 1 "+5V" H 4865 2573 50  0000 C CNN
F 2 "" H 4850 2400 50  0001 C CNN
F 3 "" H 4850 2400 50  0001 C CNN
	1    4850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2400 4850 2400
$Comp
L power:GND #PWR?
U 1 1 5F28FE6A
P 4550 4000
F 0 "#PWR?" H 4550 3750 50  0001 C CNN
F 1 "GND" H 4555 3827 50  0000 C CNN
F 2 "" H 4550 4000 50  0001 C CNN
F 3 "" H 4550 4000 50  0001 C CNN
	1    4550 4000
	1    0    0    -1  
$EndComp
Text GLabel 4050 3700 0    50   Input ~ 0
MUX_1_OUT_4
Text GLabel 4050 3600 0    50   Input ~ 0
MUX_1_OUT_5
Text GLabel 4050 3500 0    50   Input ~ 0
MUX_1_OUT_6
Text GLabel 4050 3400 0    50   Input ~ 0
MUX_1_OUT_7
Text GLabel 4050 3200 0    50   Input ~ 0
MUX_2_OUT_4
Text GLabel 4050 3100 0    50   Input ~ 0
MUX_2_OUT_5
Text GLabel 4050 3000 0    50   Input ~ 0
MUX_2_OUT_6
Text GLabel 4050 2900 0    50   Input ~ 0
MUX_2_OUT_7
Text GLabel 5050 3000 2    50   Input ~ 0
ADD_OUT_7
Text GLabel 5050 2900 2    50   Input ~ 0
ADD_OUT_6
Text GLabel 5050 2800 2    50   Input ~ 0
ADD_OUT_5
Text GLabel 5050 2700 2    50   Input ~ 0
ADD_OUT_4
$Comp
L 74xx:74LS83 U23
U 1 1 5F2945A3
P 7100 3200
F 0 "U23" H 7100 4181 50  0000 C CNN
F 1 "74LS83" H 7100 4090 50  0000 C CNN
F 2 "" H 7100 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS83" H 7100 3200 50  0001 C CNN
	1    7100 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2945AD
P 7400 2400
F 0 "#PWR?" H 7400 2250 50  0001 C CNN
F 1 "+5V" H 7415 2573 50  0000 C CNN
F 2 "" H 7400 2400 50  0001 C CNN
F 3 "" H 7400 2400 50  0001 C CNN
	1    7400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2400 7400 2400
$Comp
L power:GND #PWR?
U 1 1 5F2945B8
P 7100 4000
F 0 "#PWR?" H 7100 3750 50  0001 C CNN
F 1 "GND" H 7105 3827 50  0000 C CNN
F 2 "" H 7100 4000 50  0001 C CNN
F 3 "" H 7100 4000 50  0001 C CNN
	1    7100 4000
	1    0    0    -1  
$EndComp
Text GLabel 6600 3700 0    50   Input ~ 0
MUX_1_OUT_8
Text GLabel 6600 3600 0    50   Input ~ 0
MUX_1_OUT_9
Text GLabel 6600 3500 0    50   Input ~ 0
MUX_1_OUT_10
Text GLabel 6600 3400 0    50   Input ~ 0
MUX_1_OUT_11
Text GLabel 6600 3200 0    50   Input ~ 0
MUX_2_OUT_8
Text GLabel 6600 3100 0    50   Input ~ 0
MUX_2_OUT_9
Text GLabel 6600 3000 0    50   Input ~ 0
MUX_2_OUT_10
Text GLabel 6600 2900 0    50   Input ~ 0
MUX_2_OUT_11
Text GLabel 7600 3000 2    50   Input ~ 0
ADD_OUT_11
Text GLabel 7600 2900 2    50   Input ~ 0
ADD_OUT_10
Text GLabel 7600 2800 2    50   Input ~ 0
ADD_OUT_9
Text GLabel 7600 2700 2    50   Input ~ 0
ADD_OUT_8
$Comp
L 74xx:74LS83 U24
U 1 1 5F2945CE
P 9550 3200
F 0 "U24" H 9550 4181 50  0000 C CNN
F 1 "74LS83" H 9550 4090 50  0000 C CNN
F 2 "" H 9550 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS83" H 9550 3200 50  0001 C CNN
	1    9550 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F2945D8
P 9850 2400
F 0 "#PWR?" H 9850 2250 50  0001 C CNN
F 1 "+5V" H 9865 2573 50  0000 C CNN
F 2 "" H 9850 2400 50  0001 C CNN
F 3 "" H 9850 2400 50  0001 C CNN
	1    9850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2400 9850 2400
$Comp
L power:GND #PWR?
U 1 1 5F2945E3
P 9550 4000
F 0 "#PWR?" H 9550 3750 50  0001 C CNN
F 1 "GND" H 9555 3827 50  0000 C CNN
F 2 "" H 9550 4000 50  0001 C CNN
F 3 "" H 9550 4000 50  0001 C CNN
	1    9550 4000
	1    0    0    -1  
$EndComp
Text GLabel 9050 3700 0    50   Input ~ 0
MUX_1_OUT_12
Text GLabel 9050 3600 0    50   Input ~ 0
MUX_1_OUT_13
Text GLabel 9050 3500 0    50   Input ~ 0
MUX_1_OUT_14
Text GLabel 9050 3400 0    50   Input ~ 0
MUX_1_OUT_15
Text GLabel 9050 3200 0    50   Input ~ 0
MUX_2_OUT_12
Text GLabel 9050 3100 0    50   Input ~ 0
MUX_2_OUT_13
Text GLabel 9050 3000 0    50   Input ~ 0
MUX_2_OUT_14
Text GLabel 9050 2900 0    50   Input ~ 0
MUX_2_OUT_15
Text GLabel 10050 3000 2    50   Input ~ 0
ADD_OUT_15
Text GLabel 10050 2900 2    50   Input ~ 0
ADD_OUT_14
Text GLabel 10050 2800 2    50   Input ~ 0
ADD_OUT_13
Text GLabel 10050 2700 2    50   Input ~ 0
ADD_OUT_12
$Comp
L power:GND #PWR?
U 1 1 5F2AA639
P 1400 2600
F 0 "#PWR?" H 1400 2350 50  0001 C CNN
F 1 "GND" H 1405 2427 50  0000 C CNN
F 2 "" H 1400 2600 50  0001 C CNN
F 3 "" H 1400 2600 50  0001 C CNN
	1    1400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2600 1400 2450
Wire Wire Line
	1400 2450 1600 2450
Wire Wire Line
	1600 2450 1600 2700
Wire Wire Line
	2600 3200 3250 3200
Wire Wire Line
	3250 2700 4050 2700
Wire Wire Line
	5050 3200 5700 3200
Wire Wire Line
	8250 2700 9050 2700
NoConn ~ 10050 3200
NoConn ~ 6150 3750
NoConn ~ 6350 3150
Wire Wire Line
	8250 3200 7600 3200
Wire Wire Line
	8250 2700 8250 3200
Wire Wire Line
	5700 2700 5700 3200
Wire Wire Line
	5700 2700 6600 2700
Wire Wire Line
	3250 2700 3250 3200
$EndSCHEMATC