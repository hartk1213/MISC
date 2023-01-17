#Set up the script to run the interpreter
#!/bin/bash

SCREEN_TYPE_ALL=(
	"2_8INCH"
	"4INCH"
	"7INCH"
	"10_1INCH_8INCH"
	"10_1INCH"
	"7_9INCH"
	"11_9INCH"
	"10_1INCH_"
	"10_1INCH_8INCH_MIPI"
)

I2C_TYPE_ALL=(
	"I2C0" 
	"I2C1"
)

Type_print(){
	echo SCREEN_TYPE: ${SCREEN_TYPE_ALL[@]} 
	echo I2C_TYPE: ${I2C_TYPE_ALL[@]} 
}

if [ $# -ne 2 ]; then
	echo The script runs with two parameters in the following format
	echo sudo ./$0 SCREEN_TYPE I2C_TYPE
	Type_print
	exit 1
fi
Type_print

#----------------------------------------Set up to use that screen driver START----------------------------------------
#Print supported SCREEN_TYPE
SCREEN_TYPE=${SCREEN_TYPE_ALL[@]} 
#echo This driver supports SCREEN_TYPE is ${SCREEN_TYPE[@]} 


SCREEN_TYPE_SIZE=${#SCREEN_TYPE[*]}
#echo This driver supports SCREEN_TYPE num is $SCREEN_TYPE_SIZE


#Find if the parameters match the DSI SCREEN_TYPE
SCREEN_TYPE_PARAM="$1"


SCREEN_TYPE_i=0
SCREEN_TYPE_INDEX=255
for i in ${SCREEN_TYPE[@]} 
do  
	if [ "$SCREEN_TYPE_PARAM" = "$i" ];then
		SCREEN_TYPE_INDEX=$SCREEN_TYPE_i
#		echo "Correctly matched to the SCREEN_TYPE list $SCREEN_TYPE_INDEX"
	fi
	let SCREEN_TYPE_i++
done  

if [ $SCREEN_TYPE_INDEX -eq 255 ]; then
	printf "The parameter is not found in the SCREEN_TYPE list. Check whether the parameter is correct  \n"
	exit 1
fi

DRIVE_PARAM1="SCREEN_type=$SCREEN_TYPE_INDEX"
#echo DRIVE_PARAM1=$DRIVE_PARAM1
#-----------------------------------------Set up to use that screen driver END-----------------------------------------



#-------------------------------------------Set up to use that I2C bus START-------------------------------------------
#Print supported I2C_TYPE
I2C_TYPE=${I2C_TYPE_ALL[@]} 
#echo This driver supports I2C_TYPE is ${I2C_TYPE[@]} 


I2C_TYPE_SIZE=${#I2C_TYPE[*]}
#echo This driver supports I2C_TYPE num is $I2C_TYPE_SIZE


#Find if the parameters match the DSI I2C_TYPE
I2C_TYPE_PARAM="$2"


I2C_TYPE_i=0
I2C_TYPE_INDEX=255
for i in ${I2C_TYPE[@]} 
do  
	if [ "$I2C_TYPE_PARAM" = "$i" ];then
		I2C_TYPE_INDEX=$I2C_TYPE_i
#		echo "Correctly matched to the I2C_TYPE list $I2C_TYPE_INDEX"
	fi
	let I2C_TYPE_i++
done  

if [ $I2C_TYPE_INDEX -eq 255 ]; then
	printf "The parameter is not found in the I2C_TYPE list. Check whether the parameter is correct  \n"
	exit 1
fi

if [ $I2C_TYPE_INDEX -eq 0 ]; then
	I2C_TYPE_INDEX=10
fi
if [ $I2C_TYPE_INDEX -eq 1 ]; then
	I2C_TYPE_INDEX=1
fi
DRIVE_PARAM2="I2C_bus=$I2C_TYPE_INDEX"
#echo DRIVE_PARAM2=$DRIVE_PARAM2
echo $DRIVE_PARAM1,$DRIVE_PARAM2
#--------------------------------------------Set up to use that I2C bus END--------------------------------------------


Hardware_PATH="/proc/device-tree/model"
Hardware_Message(){

	if grep -q "Raspberry Pi 4" $Hardware_PATH ; then
		ret=1
	elif grep -q "Raspberry Pi Compute Module 4" $Hardware_PATH ; then
		ret=2
	elif grep -q "Raspberry Pi 3" $Hardware_PATH ; then
		ret=3
	elif grep -q "Raspberry Pi Compute Module 3" $Hardware_PATH ; then
		ret=4
	else
		ret=255
	fi
	
	echo ${ret}
}
 

Hardware_Message_Value=`Hardware_Message`


if [ $Hardware_Message_Value -eq 1 ]; then
	printf "The raspberry PI hardware platform is pi4\n"
	cd ./pi4
elif [ $Hardware_Message_Value -eq 2 ]; then
	printf "The raspberry PI hardware platform is CM4\n"
	cd ./pi4
elif [ $Hardware_Message_Value -eq 3 ]; then
	printf "The raspberry PI hardware platform is pi3\n"
	cd ./pi3
elif [ $Hardware_Message_Value -eq 4 ]; then
	printf "The raspberry PI hardware platform is CM3\n"
	cd ./pi3
else
	printf "The raspberry PI hardware platform is not supported\n"
fi

if [ $Hardware_Message_Value -ne 255 ]; then
	sudo chmod 777 WS_xinchDSI.sh
	sudo ./WS_xinchDSI.sh $DRIVE_PARAM1 $DRIVE_PARAM2
fi

 

