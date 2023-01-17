Waveshare-DSI-LCD
#Step 1: copy this folder to your pi

#Step 2: Enter uname -a in the terminal to view the kernel version and cd to the corresponding file directory
        #5.15.32
        cd 5.15.32
        #5.15.56
        #cd 5.15.56
        #5.10.103
        #cd 5.10.103

#第三步：请确定当前使用的系统是多少位的，32位系统进入32目录，64位系统进入64目录
cd 32
#cd 64

#第四步：选择您对应的型号，复制指令安装驱动，如需修改I2C0 / I2C1，请注意选择正确的拨码开关再上电使用；
#7inch DSI LCD (C) 1024×600：
sudo bash ./WS_xinchDSI_MAIN.sh 7INCH I2C1
#7.9ich DSI LCD 400×1280：
#sudo bash ./WS_xinchDSI_MAIN.sh 7_9_INCH I2C0
#11.9inch DSI LCD 320×1480：
#sudo bash ./WS_xinchDSI_MAIN.sh 11_9_INCH I2C0
#2.8inch DSI LCD 480×640：
#sudo bash ./WS_xinchDSI_MAIN.sh 2_8INCH I2C0
#4inch DSI LCD 480×800：
#sudo bash ./WS_xinchDSI_MAIN.sh 4INCH I2C0

sudo reboot
