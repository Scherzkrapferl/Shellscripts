#!/bin/bash

clear;
echo ""
echo "########################################"
echo "#                                      #"
echo "#           Update - Skript            #"
echo "#                                      #"
echo "#       (c) Philipp Necker 2016        #"
echo "#                                      #"
echo "#          All rights reserved.        #"
echo "#                                      #"
echo "########################################"
echo "#                                      #"
echo "# Dieses Update-Skript führt           #"
echo "# automatisch das Updaten der          #"
echo "# Paketlisten, sowie das Installieren  #"
echo "# neuer Programmversionen aus.         #"
echo "#                                      #"
echo "# Zusätzlich besteht die Möglichkeit   #"
echo "# weitere Software automatisiert       #"
echo "# zu installieren.                     #"
echo "#                                      #"
echo "# - Philipp Necker, 09.08.2016         #"
echo "#                                      #"
echo "########################################"
echo ""
echo "Press any key to continue..."
read tmp
clear;

echo "Soll ein Update der Paketlisten durchgeführt werden? [Y/N]"
read answer0
if [ "$answer0" = "y" ]
	then clear;
		echo "Das Updaten der Paketlisten wird nun durchgeführt..."
		echo ""
		sudo apt-get update
		clear;
		echo "Das Updaten der Paketlisten war erfolgreich!"
		echo ""
fi
sleep 2;
clear;


echo "Wollen sie nun das System updaten? [Y/N]"
read answer
if [ "$answer" = "y" ]
	then sudo apt-get upgrade
		echo ""
		echo "Das Update wurde durchgeführt"
		echo ""
	elif [ "$answer" != "y" ]
		then echo ""
		echo "Es wird kein Update durchgeführt."
fi
sleep 1;
clear;


df / -h | grep sda1 | awk '{ print "Derzeit haben Sie " $4 "B Speicherplatz verfügbar." }'
tmp="$(df / -h | grep sda1 |awk '{ print $4 "B" }' )"	# Variable für Ursprünglichen Speicherplatz
echo "Wollen Sie das System aufräumen? [Y/N]"
read answer2
if [ "$answer2" = "y" ]
	then sudo apt-get autoremove
		sudo apt-get clean
		sudo apt-get autoclean
		echo ""
		echo "Das System wurde aufgeräumt."
		df / -h | grep sda1 |awk '{ print "Derzeit haben Sie " $4 "B Speicherplatz verfügbar."}'
		echo "Speicherplatz verfügbar vor dem Aufräumen: $tmp"
		sleep 4;
	elif [ "$answer2" != "y" ]
		then echo ""
		echo "System wird nicht aufgeräumt."
		sleep 1;
fi
clear;

echo "Wollen sie zusätzliche Software installieren? [Y/N]"
read answer3
if [ "$answer3" = "y" ]
	then echo ""
		echo "Paketnamen zur Suche eingeben:"
		read pkg
		echo ""
		echo "Folgende Pakete sind zur Installation verfügbar:"
		echo ""
		apt-cache search $pkg
		echo ""
		echo "Paketname zur Installation eigeben: [Press q for new search]"
		read choice
		
		if [ "$choice" = "q" ]
			then echo "Paketnamen zur Suche eingeben:"
			read pkg
			echo ""
			echo "Folgende Pakete sind zur Installation verfügbar:"
			echo ""
			apt-cache search $pkg
			echo ""
			echo "Paketname zur Installation eigeben:"
			read choice
		fi
		sudo apt-get install $choice && clear && echo "Das Paket $choice wurde installiert"
		echo ""
	elif [ "$answer3" != "y" ]
		then echo ""
		echo ""
fi
sleep 2;
clear;


echo "Das Skript wird nun beendet."
sleep 2;
clear;

