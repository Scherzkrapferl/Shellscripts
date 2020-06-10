#/!bin/bash

## Mounten von USB-Sticks per terminal

# 1.) Mountpoint erzeugen:

	sudo mkdir /media/pi/UNTITLED
	sudo mkdir /media/pi/UNTITLED2

# 2.) Devices suchen
	sudo fdisk -l

# 3.) mounten
	sudo mount /dev/sda1 /media/pi/UNTITLED
	sudo mount /dev/sdb /media/pi/UNTITLED2

## Unmounten

#	sudo unmount /media/pi/UNTITLED
#	sudo unmount /media/pi/UNTITLED2
