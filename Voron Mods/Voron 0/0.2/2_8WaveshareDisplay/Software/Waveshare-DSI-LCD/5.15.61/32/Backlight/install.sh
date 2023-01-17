#!/bin/bash

if [ "$1" = "install" ]
then
	sudo chmod 777 WS_xinchDSI_Backlight_armhf WS_xinchDSI_Backlight_armhf.desktop
	sudo cp WS_xinchDSI_Backlight_armhf WS_xinchDSI_Backlight_armhf.desktop WS_xinchDSI_Backlight_armhf.png /usr/share/applications/
	echo "copy WS_xinchDSI_Backlight_armhf file to /usr/share/application/"
elif [ "$1" = "uninstall" ]
then
	cd /usr/share/applications/
	sudo rm WS_xinchDSI_Backlight_armhf WS_xinchDSI_Backlight_armhf.desktop WS_xinchDSI_Backlight_armhf.png
	cd ~
	echo "remove WS_xinchDSI_Backlight_armhf files in /usr/share/applications/"
else
	sudo chmod 777 WS_xinchDSI_Backlight_armhf WS_xinchDSI_Backlight_armhf.desktop
	sudo cp WS_xinchDSI_Backlight_armhf WS_xinchDSI_Backlight_armhf.desktop WS_xinchDSI_Backlight_armhf.png /usr/share/applications/
	echo "copy WS_xinchDSI_Backlight_armhf file to /usr/share/application/"
fi
