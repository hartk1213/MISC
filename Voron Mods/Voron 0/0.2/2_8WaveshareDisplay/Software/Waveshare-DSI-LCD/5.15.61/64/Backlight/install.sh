#!/bin/bash

if [ "$1" = "install" ]
then
	sudo chmod 777 WS_xinchDSI_Backlight_arm64 WS_xinchDSI_Backlight_arm64.desktop
	sudo cp WS_xinchDSI_Backlight_arm64 WS_xinchDSI_Backlight_arm64.desktop WS_xinchDSI_Backlight_arm64.png /usr/share/applications/
	echo "copy WS_xinchDSI_Backlight_arm64 file to /usr/share/application/"
elif [ "$1" = "uninstall" ]
then
	cd /usr/share/applications/
	sudo rm WS_xinchDSI_Backlight_arm64 WS_xinchDSI_Backlight_arm64.desktop WS_xinchDSI_Backlight_arm64.png
	cd ~
	echo "remove WS_xinchDSI_Backlight_arm64 files in /usr/share/applications/"
else
	sudo chmod 777 WS_xinchDSI_Backlight_arm64 WS_xinchDSI_Backlight_arm64.desktop
	sudo cp WS_xinchDSI_Backlight_arm64 WS_xinchDSI_Backlight_arm64.desktop WS_xinchDSI_Backlight_arm64.png /usr/share/applications/
	echo "copy WS_xinchDSI_Backlight_arm64 file to /usr/share/application/"
fi
