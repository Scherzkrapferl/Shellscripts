#!/bin/bash

# Update Script für debian
# Mittlerweile mit dialog versehen für die optik

DIALOG=${DIALOG=dialog}
xsize=50
ysize=20

#cache=$(apt-cache search openbox | less) # scrollen mit fn+pfeiltasten
#$DIALOG --title " Updater für Debian " --msgbox "folgende programme gefunden \n\n $cache" $ysize $xsize;


$DIALOG --title " Updater für Debian " --clear \
		--yesno "Wollen Sie die Paketlisten aktualisieren und gegebenfalls ein Update durchführen?" $ysize $xsize

case $? in
	0)	sudo apt-get update && sudo apt-get upgrade;
		$DIALOG --title " Updater für Debian " --clear \
				--yesno "Ein Update wurde Durchgeführt. Wollen Sie das Programm nun beenden?" $ysize $xsize; # Hier kein zweiter strichpunkt da sonst syntax error
		case $? in
			0)	clear; exit;;
			1)	echo "Fehler";;	
		esac;;
	1)	$DIALOG --title " Updater für Debian " --msgbox "Das Programm wird beendet." $ysize $xsize;
		clear; exit;;

esac
