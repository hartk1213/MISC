# Stealthburner Toolhead Board #
This is the update to the Afterburner toolhead board for the CW2 extruder and Stealthburner 

# BOM standard version [here](Production%20Files/StealthburnerPCB/Standard)
    Molex Part Numbers
    436500200 (x2) 
    430450200 (x1)
    430451400 (x1) 

    JST-PH 4pin (x1)
    JST-PH 3pin (x3)
    JST-PH 3pin 90deg (x1)
    JST-PH 2pin 90deg (x2)
    BAT85 (x1)
    
# BOM 2 piece version [here](Production%20Files/StealthburnerPCB/2%20Piece)
    Molex Part Numbers
    436500200 (x2) 
    430450200 (x1)
    430451400 (x1) 

    JST-PH 4pin (x1)
    JST-PH 3pin (x3)
    BAT85 (x1)
    
    2x4 right angle female header (2.54 pitch) (x1)
    2x4 straigh male pins (2.54 pitch) (x1)


 [Purchase Here from PCBWAY](https://www.pcbway.com/project/shareproject/Stealthburner_Toolhead_PCB_b8da3a40.html)

    Pinout 
    24V  - HE0 +V 
    GND  - PSU -V (NOT MAINS GND)
    PROBE  - Probe/Klicky Signal Pin
    HE0  - Hotend Heater -V
    5V   - 5V 
    PCF  - Part Cooling Fan -V
    HEF  - Hotend Cooling Fan -V
    AGND - Hotend Thermistor -V
    TH0  - Hotend Thermistor Signal Pin (TH0)
    AUX  - Auxillary 
    S1A  - Red Stepper Wire
    S2A  - Green Stepper Wire
    S1B  - Blue Stepper Wire
    S2B  - Black Stepper Wire 
    LED  - Neopixel Data Pin
    FS  - ERCF Filament sensor 
    
    
    
## Options for Aux Pin ##
the aux pin can be used for a couple different things , it can be used for an X endstop on the toolhead if you are going with the umbililcal , to do this you need to wire up the x endstop as shown here 

 ![Here](Images/Wiring/SB_PCB_AUX_XES.png)

the aux pin can also be used as a header for a plugged in chamber thermistor , to do this you need to wire the thermistor up as shown here

![Here](Images/Wiring/SB_PCB_AUX_CT.png)






