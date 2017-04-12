#!/bin/bash

# Update- und Installations-Skript für Debian-basierte Linux Systeme

DIALOG=${DIALOG=whiptail}
xsize=50
ysize=10

xsizebig=79
ysizebig=20

xsizesmall=30
ysizesmall=5

## INTRO
#
$DIALOG --title " Updater für Debian " --backtitle "Version 1.0 - (c) 2016 Philipp Necker" --clear \
		--yesno "Hierbei handelt es sich nur um eine Testversion eines TUI Updaters auf Basis von APT. Sind sie einverstanden?" \
		--no-button "Beenden" $ysize $xsize
case $? in
	0)	;;	# weiter
	1)	echo "Beenden"; exit
		;;
	225) echo "ERROR0"; exit
		;;
esac


## PAKETLISTEN
#
$DIALOG --title " Updater für Debian " --clear \
		--yesno "Wollen Sie die Paketlisten aktualisieren und gegebenenfalls Updates Installieren?" $ysize $xsize

case $? in
	0)	cmd1=$(sudo apt-get update && sudo apt-get upgrade -y);
		$DIALOG --title " Updater für Debian " --msgbox "$cmd1" $ysizebig $xsizebig --scrolltext;
		$DIALOG --title " Updater für Debian " --clear \
				--yesno "Ein Update wurde Durchgeführt. Wollen Sie ein Programm installieren?" $ysize $xsize;
		case $? in
			0)	input1=$($DIALOG --title " Updater für Debian " \
					--inputbox "Programmname zur Suche eingeben:" $ysize $xsize 3>&1 1>&2 2>&3);
				cmd2=$(apt-cache search $input1);
				$DIALOG --title " Updater für Debian " --msgbox "$cmd2" $ysizebig $xsizebig --scrolltext;
				input2=$($DIALOG --title " Updater für Debian " \
					--inputbox "Programmname zur Installation eingeben:" $ysize $xsize 3>&1 1>&2 2>&3);
				exitstatus=$?	# an dieser stelle damit nicht exitstatus von cmd3 verwendet wird
				cmd3=$(sudo apt-get install $input2 -y);
				if [ $exitstatus = 0 ]; then
					echo "Programm installiert."; echo $exitstatus;
				else
					echo "Programm wird beendet.";
				fi
				;;
			1)	$DIALOG --title " Updater für Debian " --msgbox "Das Programm wird beendet." $ysize $xsize;
				clear; exit;
				;;	
		esac
		;;
	1)	$DIALOG --title " Updater für Debian " --msgbox "Das Programm wird beendet." $ysize $xsize;
		clear; exit
		;;

esac
