EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 2100 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS83" H 2100 3200 50  0001 C CNN
	1    2100 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0146
U 1 1 5F28BDD6
P 2400 2400
F 0 "#PWR0146" H 2400 2250 50  0001 C CNN
F 1 "+5V" H 2415 2573 50  0000 C CNN
F 2 "" H 2400 2400 50  0001 C CNN
F 3 "" H 2400 2400 50  0001 C CNN
	1    2400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2400 2400 2400
$Comp
L power:GND #PWR0147
U 1 1 5F28C95E
P 2100 4000
F 0 "#PWR0147" H 2100 3750 50  0001 C CNN
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
L power:GND #PWR0154
U 1 1 5F2AA639
P 1400 2600
F 0 "#PWR0154" H 1400 2350 50  0001 C CNN
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
NoConn ~ 2600 3200
$EndSCHEMATC
