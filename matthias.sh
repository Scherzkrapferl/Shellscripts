#!/bin/bash
# Super-Skript (c) Dipl.-Ing. Philipp Necker Lolololol
# 
# Einfach nur mit lsusb einmal nachschauen wie dein usb stick heißt
# zB ein irgendwas mit HAMA oder Samsung
# und dann das skript nach dem grep verändern

lsusb | grep USBSTICK > /dev/null
OUT=$?
if [ $OUT -eq 0 ];then
	echo "device exists!"
	rmdir ...
	sleep 2
	cp ...
else
	echo "no device!"
fi
