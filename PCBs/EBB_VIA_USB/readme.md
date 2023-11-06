# Are you tired of struggling with outdated 3D printer technology? Frustrated with slow, clunky communication between your 3D printer and your Raspberry PI? Well, have I got the solution for you!

### Introducing the USB Revolution! Say goodbye to old-fashioned CAN connections and embrace the future of 3D printing! 
<img src="https://github.com/hartk1213/MISC/assets/12398294/7368b85b-b240-4622-9b34-65deb0201fe2" alt="Image Description" width="400">
<img src="https://github.com/hartk1213/MISC/assets/12398294/f7b216a8-9ee8-40e4-ad54-aa98542d2d7f" alt="Image Description" width="400">

### Don't be stuck in the past with those messy wires and USB-TO-CAN boards. Upgrade to USB and watch your 3D printing dreams take flight!
<img src="https://github.com/hartk1213/MISC/assets/12398294/3acbae22-d54d-4fed-96c4-0f4d04500a41" alt="Image Description" width="400">



## Bom
Item  |Qty | Notes
 ----|----|----|
CAN Toolhead |1 | You should already have this , maybe go pull it out of the garbage since you got so frustrated with CAN and threw it away
USB C Male Breakout board |1| [Amazon](https://www.amazon.com/ANMBEST-Connector-Receptacle-Adapter-Support/dp/B09WCQKSW1/) 
USB C Female Breakout board |1| [Amazon](https://www.amazon.com/UMLIFE-Type-C-Breakout-Connector-Converter/dp/B0BL77R71Q/) ..Now you can use the female breakouts from the first link , i just prefer this style since you can mount it to a din rail and solder a JST header to it
JST Header 2-4pin (optional) |1|
M2 self tapping screws |2|


## Setup
### Step1: 
take the 4 wire umbilical you have from your CAN setup and remove the CAN-H and CAN-L wires from the 4 pin connector, solder those to the 2 middle pads on the USB-C breakout board as shown here. 

<img src="https://github.com/hartk1213/MISC/assets/12398294/02d29a8c-2d4d-4615-ac88-c18e5d50800e" alt="Image Description" width="400">

### Step2: 
solder the other end Or use the JST header if you went that route with the umbilical wiring to the breakout close to your PI 
and connect the USB-C cable 

<img src="https://github.com/hartk1213/MISC/assets/12398294/405c8f29-666c-4dec-a2f8-e0ce151cee16" alt="Image Description" width="400">

### Step3: 
flash the board with klipper to use USB just like any other controller you flash with klipper, Once you have it flashed and ready to go you need to setup the CFG. if you had CAN setup previously then all you have to do is change the mcu cfg from 

```canbus_uuid: xxxxxxxxxx``` 

to the standard 

```serial: /dev/serial/by-id/usb-Klipper_xxxxxxx```

you can find this by running the command

```ls /dev/serial/by-id```

thats it, the cfg should be identical to what you had setup with CAN, and now you should be running your toolhead via USB , welcome to the future 🤣
