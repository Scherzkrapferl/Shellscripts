#!/bin/bash

# Skript zur suchen von Pakten mit anschließender Installations-
# Möglichkeit.

## Sollte auf Dialog umgestellt werden

clear

# Einführung
echo "############ Paket-Such & -Installations-Skript ############"
sudo apt-get update
clear
echo "############################################################"
echo ""
echo "Geben Sie Namen oder Beschreibung des Paketes"
echo "Ihrer Suche ein:"
echo ""

# Einlesen des Paketnamens
read answer
echo ""
echo "############################################################"
echo ""

# Suche nach Paketen
echo "Folgende Pakete konnten gefunden Werden:"
echo "------------------------------------------------------------"
apt-cache search $answer
echo "------------------------------------------------------------"
echo ""
echo "Wollen Sie eines dieser Pakete installieren? [Y/N]"
echo ""
read answer2

# Installation von Paketen
if [ "$answer2" = "y" ]
	then echo ""
		echo "Geben Sie den Paketnamen ein:"
		echo ""
		read answer3
		sudo apt-get install $answer3 && echo "" && echo "Programm wurde erfolgreich installiert"
	else echo ""
		echo "Keine Pakete werden installiert."
		echo ""
		echo "Programm wird beendet"
		sleep 1;
		clear		
fi
