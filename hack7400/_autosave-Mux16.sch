EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
U 1 1 5EEB24B2
P 2450 3550
AR Path="/5EEB24B2" Ref="U?"  Part="1" 
AR Path="/5EE88FD8/5EEB24B2" Ref="U?"  Part="1" 
F 0 "U?" H 2450 4631 50  0000 C CNN
F 1 "74LS157" H 2450 4540 50  0000 C CNN
F 2 "" H 2450 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2450 3550 50  0001 C CNN
	1    2450 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEB24B8
P 2450 4650
AR Path="/5EEB24B8" Ref="#PWR?"  Part="1" 
AR Path="/5EE88FD8/5EEB24B8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 4400 50  0001 C CNN
F 1 "GND" H 2455 4477 50  0000 C CNN
F 2 "" H 2450 4650 50  0001 C CNN
F 3 "" H 2450 4650 50  0001 C CNN
	1    2450 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEB24BE
P 2700 2650
AR Path="/5EEB24BE" Ref="#PWR?"  Part="1" 
AR Path="/5EE88FD8/5EEB24BE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 2500 50  0001 C CNN
F 1 "+5V" H 2715 2823 50  0000 C CNN
F 2 "" H 2700 2650 50  0001 C CNN
F 3 "" H 2700 2650 50  0001 C CNN
	1    2700 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2650 2700 2650
Wire Wire Line
	1950 3050 1900 3050
Wire Wire Line
	1900 3050 1900 3350
Wire Wire Line
	1950 3350 1900 3350
Connection ~ 1900 3350
Wire Wire Line
	1900 3350 1900 3650
Wire Wire Line
	1950 3650 1900 3650
Connection ~ 1900 3650
Wire Wire Line
	1900 3650 1900 3950
Wire Wire Line
	1950 3950 1900 3950
Connection ~ 1900 3950
Wire Wire Line
	1900 3950 1900 4250
Wire Wire Line
	1850 2950 1950 2950
Wire Wire Line
	1850 3250 1950 3250
Wire Wire Line
	1850 3550 1950 3550
Wire Wire Line
	1850 3850 1950 3850
Wire Wire Line
	1950 4250 1900 4250
Connection ~ 1900 4250
Text GLabel 1450 4150 0    50   Input ~ 0
ZX
Wire Wire Line
	1450 4150 1600 4150
Text GLabel 1850 3850 0    50   Input ~ 0
X_3
Text GLabel 1850 3550 0    50   Input ~ 0
X_2
Text GLabel 1850 3250 0    50   Input ~ 0
X_1
Text GLabel 1850 2950 0    50   Input ~ 0
X_0
Text GLabel 2950 2950 2    50   Input ~ 0
MUX_1_OUT_0
Text GLabel 2950 3250 2    50   Input ~ 0
MUX_1_OUT_1
Text GLabel 2950 3550 2    50   Input ~ 0
MUX_1_OUT_2
Text GLabel 2950 3850 2    50   Input ~ 0
MUX_1_OUT_3
$Comp
L 74xx:74LS157 U?
U 1 1 5EEB24E0
P 4650 3550
AR Path="/5EEB24E0" Ref="U?"  Part="1" 
AR Path="/5EE88FD8/5EEB24E0" Ref="U?"  Part="1" 
F 0 "U?" H 4650 4631 50  0000 C CNN
F 1 "74LS157" H 4650 4540 50  0000 C CNN
F 2 "" H 4650 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 4650 3550 50  0001 C CNN
	1    4650 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEB24E6
P 4900 2650
AR Path="/5EEB24E6" Ref="#PWR?"  Part="1" 
AR Path="/5EE88FD8/5EEB24E6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4900 2500 50  0001 C CNN
F 1 "+5V" H 4915 2823 50  0000 C CNN
F 2 "" H 4900 2650 50  0001 C CNN
F 3 "" H 4900 2650 50  0001 C CNN
	1    4900 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2650 4900 2650
Wire Wire Line
	4150 3050 4100 3050
Wire Wire Line
	4100 3050 4100 3350
Wire Wire Line
	4150 3350 4100 3350
Connection ~ 4100 3350
Wire Wire Line
	4100 3350 4100 3650
Wire Wire Line
	4150 3650 4100 3650
Connection ~ 4100 3650
Wire Wire Line
	4100 3650 4100 3950
Wire Wire Line
	4150 3950 4100 3950
Connection ~ 4100 3950
Wire Wire Line
	4100 3950 4100 4250
Wire Wire Line
	4050 2950 4150 2950
Wire Wire Line
	4050 3250 4150 3250
Wire Wire Line
	4050 3550 4150 3550
Wire Wire Line
	4050 3850 4150 3850
Wire Wire Line
	4150 4250 4100 4250
Connection ~ 4100 4250
Text GLabel 4050 3850 0    50   Input ~ 0
X_7
Text GLabel 4050 3550 0    50   Input ~ 0
X_6
Text GLabel 4050 3250 0    50   Input ~ 0
X_5
Text GLabel 4050 2950 0    50   Input ~ 0
X_4
Text GLabel 5150 2950 2    50   Input ~ 0
MUX_1_OUT_4
Text GLabel 5150 3250 2    50   Input ~ 0
MUX_1_OUT_5
Text GLabel 5150 3550 2    50   Input ~ 0
MUX_1_OUT_6
Text GLabel 5150 3850 2    50   Input ~ 0
MUX_1_OUT_6
$Comp
L 74xx:74LS157 U?
U 1 1 5EEB2506
P 6850 3550
AR Path="/5EEB2506" Ref="U?"  Part="1" 
AR Path="/5EE88FD8/5EEB2506" Ref="U?"  Part="1" 
F 0 "U?" H 6850 4631 50  0000 C CNN
F 1 "74LS157" H 6850 4540 50  0000 C CNN
F 2 "" H 6850 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 6850 3550 50  0001 C CNN
	1    6850 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEB250C
P 7100 2650
AR Path="/5EEB250C" Ref="#PWR?"  Part="1" 
AR Path="/5EE88FD8/5EEB250C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7100 2500 50  0001 C CNN
F 1 "+5V" H 7115 2823 50  0000 C CNN
F 2 "" H 7100 2650 50  0001 C CNN
F 3 "" H 7100 2650 50  0001 C CNN
	1    7100 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2650 7100 2650
Wire Wire Line
	6350 3050 6300 3050
Wire Wire Line
	6300 3050 6300 3350
Wire Wire Line
	6350 3350 6300 3350
Connection ~ 6300 3350
Wire Wire Line
	6300 3350 6300 3650
Wire Wire Line
	6350 3650 6300 3650
Connection ~ 6300 3650
Wire Wire Line
	6300 3650 6300 3950
Wire Wire Line
	6350 3950 6300 3950
Connection ~ 6300 3950
Wire Wire Line
	6300 3950 6300 4250
Wire Wire Line
	6250 2950 6350 2950
Wire Wire Line
	6250 3250 6350 3250
Wire Wire Line
	6250 3550 6350 3550
Wire Wire Line
	6250 3850 6350 3850
Wire Wire Line
	6350 4250 6300 4250
Connection ~ 6300 4250
Text GLabel 6250 3850 0    50   Input ~ 0
X_11
Text GLabel 6250 3550 0    50   Input ~ 0
X_10
Text GLabel 6250 3250 0    50   Input ~ 0
X_9
Text GLabel 6250 2950 0    50   Input ~ 0
X_8
Text GLabel 7350 2950 2    50   Input ~ 0
MUX_1_OUT_8
Text GLabel 7350 3250 2    50   Input ~ 0
MUX_1_OUT_9
Text GLabel 7350 3550 2    50   Input ~ 0
MUX_1_OUT_10
Text GLabel 7350 3850 2    50   Input ~ 0
MUX_1_OUT_11
$Comp
L 74xx:74LS157 U?
U 1 1 5EEB252C
P 9100 3550
AR Path="/5EEB252C" Ref="U?"  Part="1" 
AR Path="/5EE88FD8/5EEB252C" Ref="U?"  Part="1" 
F 0 "U?" H 9100 4631 50  0000 C CNN
F 1 "74LS157" H 9100 4540 50  0000 C CNN
F 2 "" H 9100 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 9100 3550 50  0001 C CNN
	1    9100 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EEB2532
P 9350 2650
AR Path="/5EEB2532" Ref="#PWR?"  Part="1" 
AR Path="/5EE88FD8/5EEB2532" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9350 2500 50  0001 C CNN
F 1 "+5V" H 9365 2823 50  0000 C CNN
F 2 "" H 9350 2650 50  0001 C CNN
F 3 "" H 9350 2650 50  0001 C CNN
	1    9350 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 2650 9350 2650
Wire Wire Line
	8600 3050 8550 3050
Wire Wire Line
	8550 3050 8550 3350
Wire Wire Line
	8600 3350 8550 3350
Connection ~ 8550 3350
Wire Wire Line
	8550 3350 8550 3650
Wire Wire Line
	8600 3650 8550 3650
Connection ~ 8550 3650
Wire Wire Line
	8550 3650 8550 3950
Wire Wire Line
	8600 3950 8550 3950
Connection ~ 8550 3950
Wire Wire Line
	8550 3950 8550 4250
Wire Wire Line
	8500 2950 8600 2950
Wire Wire Line
	8500 3250 8600 3250
Wire Wire Line
	8500 3550 8600 3550
Wire Wire Line
	8500 3850 8600 3850
Wire Wire Line
	8600 4250 8550 4250
Connection ~ 8550 4250
Text GLabel 8500 3850 0    50   Input ~ 0
X_15
Text GLabel 8500 3550 0    50   Input ~ 0
X_14
Text GLabel 8500 3250 0    50   Input ~ 0
X_13
Text GLabel 8500 2950 0    50   Input ~ 0
X_12
Text GLabel 9600 2950 2    50   Input ~ 0
MUX_1_OUT_12
Text GLabel 9600 3250 2    50   Input ~ 0
MUX_1_OUT_13
Text GLabel 9600 3550 2    50   Input ~ 0
MUX_1_OUT_14
Text GLabel 9600 3850 2    50   Input ~ 0
MUX_1_OUT_15
Wire Wire Line
	1600 4150 1600 4900
Wire Wire Line
	8350 4900 8350 4150
Connection ~ 1600 4150
Wire Wire Line
	1600 4150 1950 4150
Wire Wire Line
	8350 4150 8600 4150
Wire Wire Line
	6050 4150 6050 4900
Wire Wire Line
	6050 4150 6350 4150
Wire Wire Line
	3600 4900 3600 4150
Wire Wire Line
	3600 4150 4150 4150
Wire Wire Line
	1600 4900 3600 4900
Wire Wire Line
	6050 4900 8350 4900
Wire Wire Line
	3600 4900 6050 4900
Connection ~ 3600 4900
Connection ~ 6050 4900
Wire Wire Line
	2450 4650 2450 4600
Wire Wire Line
	2450 4600 1900 4600
Connection ~ 2450 4600
Wire Wire Line
	2450 4600 2450 4550
Wire Wire Line
	1900 4250 1900 4600
$Comp
L power:GND #PWR?
U 1 1 5EEB2565
P 4650 4650
AR Path="/5EEB2565" Ref="#PWR?"  Part="1" 
AR Path="/5EE88FD8/5EEB2565" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4650 4400 50  0001 C CNN
F 1 "GND" H 4655 4477 50  0000 C CNN
F 2 "" H 4650 4650 50  0001 C CNN
F 3 "" H 4650 4650 50  0001 C CNN
	1    4650 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4650 4650 4600
Wire Wire Line
	4650 4600 4100 4600
Wire Wire Line
	4100 4250 4100 4600
Connection ~ 4650 4600
Wire Wire Line
	4650 4600 4650 4550
Wire Wire Line
	6300 4250 6300 4600
Wire Wire Line
	6850 4600 6850 4550
Connection ~ 6850 4600
Wire Wire Line
	6850 4600 6300 4600
Wire Wire Line
	6850 4650 6850 4600
$Comp
L power:GND #PWR?
U 1 1 5EEB2575
P 6850 4650
AR Path="/5EEB2575" Ref="#PWR?"  Part="1" 
AR Path="/5EE88FD8/5EEB2575" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6850 4400 50  0001 C CNN
F 1 "GND" H 6855 4477 50  0000 C CNN
F 2 "" H 6850 4650 50  0001 C CNN
F 3 "" H 6850 4650 50  0001 C CNN
	1    6850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 4600 9100 4550
Connection ~ 9100 4600
Wire Wire Line
	9100 4600 8550 4600
Wire Wire Line
	9100 4650 9100 4600
$Comp
L power:GND #PWR?
U 1 1 5EEB257F
P 9100 4650
AR Path="/5EEB257F" Ref="#PWR?"  Part="1" 
AR Path="/5EE88FD8/5EEB257F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9100 4400 50  0001 C CNN
F 1 "GND" H 9105 4477 50  0000 C CNN
F 2 "" H 9100 4650 50  0001 C CNN
F 3 "" H 9100 4650 50  0001 C CNN
	1    9100 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4250 8550 4600
$EndSCHEMATC
