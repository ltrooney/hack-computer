EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
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
L 74xx:74LS32 U33
U 2 1 5F411975
P 6650 3950
F 0 "U33" H 6650 4275 50  0000 C CNN
F 1 "74LS32" H 6650 4184 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6650 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6650 3950 50  0001 C CNN
	2    6650 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U33
U 1 1 5F40E946
P 6650 3300
F 0 "U33" H 6650 3625 50  0000 C CNN
F 1 "74LS32" H 6650 3534 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6650 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6650 3300 50  0001 C CNN
	1    6650 3300
	1    0    0    -1  
$EndComp
Text GLabel 6350 3200 0    50   Input ~ 0
OUT_0
Text GLabel 6350 3400 0    50   Input ~ 0
OUT_1
Text GLabel 6350 3850 0    50   Input ~ 0
OUT_2
Text GLabel 6300 4050 0    50   Input ~ 0
OUT_3
$Comp
L power:+5V #PWR0171
U 1 1 5F43260B
P 8700 2700
F 0 "#PWR0171" H 8700 2550 50  0001 C CNN
F 1 "+5V" H 8715 2873 50  0000 C CNN
F 2 "" H 8700 2700 50  0001 C CNN
F 3 "" H 8700 2700 50  0001 C CNN
	1    8700 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0172
U 1 1 5F43310B
P 8700 3700
F 0 "#PWR0172" H 8700 3450 50  0001 C CNN
F 1 "GND" H 8705 3527 50  0000 C CNN
F 2 "" H 8700 3700 50  0001 C CNN
F 3 "" H 8700 3700 50  0001 C CNN
	1    8700 3700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U34
U 5 1 5F435343
P 9550 3200
F 0 "U34" H 9780 3246 50  0000 L CNN
F 1 "74LS32" H 9780 3155 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 9550 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 9550 3200 50  0001 C CNN
	5    9550 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0173
U 1 1 5F43537D
P 9550 2700
F 0 "#PWR0173" H 9550 2550 50  0001 C CNN
F 1 "+5V" H 9565 2873 50  0000 C CNN
F 2 "" H 9550 2700 50  0001 C CNN
F 3 "" H 9550 2700 50  0001 C CNN
	1    9550 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0174
U 1 1 5F435387
P 9550 3700
F 0 "#PWR0174" H 9550 3450 50  0001 C CNN
F 1 "GND" H 9555 3527 50  0000 C CNN
F 2 "" H 9550 3700 50  0001 C CNN
F 3 "" H 9550 3700 50  0001 C CNN
	1    9550 3700
	1    0    0    -1  
$EndComp
NoConn ~ 8650 4300
NoConn ~ 8650 4500
NoConn ~ 9250 4400
Wire Wire Line
	6950 3300 6950 3500
Wire Wire Line
	6950 3950 6950 3700
$Comp
L 74xx:74LS32 U33
U 5 1 5F418C6B
P 8700 3200
F 0 "U33" H 8930 3246 50  0000 L CNN
F 1 "74LS32" H 8930 3155 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8700 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8700 3200 50  0001 C CNN
	5    8700 3200
	1    0    0    -1  
$EndComp
Text GLabel 7550 3600 2    50   Input ~ 0
ZR
$Comp
L 74xx:74LS02 U35
U 1 1 5F4D9FF3
P 7250 3600
F 0 "U35" H 7250 3925 50  0000 C CNN
F 1 "74LS02" H 7250 3834 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7250 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 7250 3600 50  0001 C CNN
	1    7250 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U35
U 2 1 5F4E6F07
P 8950 5050
F 0 "U35" H 8950 5375 50  0000 C CNN
F 1 "74LS02" H 8950 5284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8950 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 8950 5050 50  0001 C CNN
	2    8950 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U35
U 3 1 5F4EE300
P 9700 5050
F 0 "U35" H 9700 5375 50  0000 C CNN
F 1 "74LS02" H 9700 5284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 9700 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 9700 5050 50  0001 C CNN
	3    9700 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U35
U 4 1 5F4F211C
P 10450 5050
F 0 "U35" H 10450 5375 50  0000 C CNN
F 1 "74LS02" H 10450 5284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 10450 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 10450 5050 50  0001 C CNN
	4    10450 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U35
U 5 1 5F4F5C27
P 10400 3200
F 0 "U35" H 10630 3246 50  0000 L CNN
F 1 "74LS02" H 10630 3155 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 10400 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 10400 3200 50  0001 C CNN
	5    10400 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0175
U 1 1 5F50C1FF
P 10400 2700
F 0 "#PWR0175" H 10400 2550 50  0001 C CNN
F 1 "+5V" H 10415 2873 50  0000 C CNN
F 2 "" H 10400 2700 50  0001 C CNN
F 3 "" H 10400 2700 50  0001 C CNN
	1    10400 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0176
U 1 1 5F50D47F
P 10400 3700
F 0 "#PWR0176" H 10400 3450 50  0001 C CNN
F 1 "GND" H 10405 3527 50  0000 C CNN
F 2 "" H 10400 3700 50  0001 C CNN
F 3 "" H 10400 3700 50  0001 C CNN
	1    10400 3700
	1    0    0    -1  
$EndComp
NoConn ~ 8650 4950
NoConn ~ 8650 5150
NoConn ~ 9250 5050
NoConn ~ 9400 4950
NoConn ~ 9400 5150
NoConn ~ 10000 5050
NoConn ~ 10150 5150
NoConn ~ 10750 5050
NoConn ~ 10150 4950
Text GLabel 7200 4500 2    50   Input ~ 0
NG
Wire Wire Line
	6350 4050 6350 4500
Wire Wire Line
	6350 4500 7200 4500
$Comp
L 74xx:74LS32 U34
U 4 1 5F43534D
P 8950 4400
F 0 "U34" H 8950 4725 50  0000 C CNN
F 1 "74LS32" H 8950 4634 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8950 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8950 4400 50  0001 C CNN
	4    8950 4400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
