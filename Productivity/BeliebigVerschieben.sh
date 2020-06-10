#!/bin/bash

# (c) 2016 Philipp Necker. All rights reserved
#
# Name des Programms: BeliebigVerschieben.sh
# Version: 1.0
#
# Dieses Skript dient zum verschieben mehrerer Dateien bestimmter Dateiendung.
# Dabei wird ein Ordner mit gleichem Namen erzeugt.

pfad=$(pwd)
echo " "
echo "##############################################################"
echo " "
echo "Willkommen!"
echo "Dieses Skript automatisiert das Verschieben von beliebigen Dateien."
echo " "
echo "--------------------------------------------------------------"
echo " "

echo "Dateiendung eingeben: (z.B.: pdf)"
read answer
echo " "
echo "--------------------------------------------------------------"

mkdir -p $answer
mv *.$answer $pfad/$answer
		
echo " "		
echo "Alle Dateien der Endung .$answer  wurden verschoben in den Ordner $answer verschoben."
echo " "
echo "--------------------------------------------------------------"		
sp=$(du -h $pfad/$answer | awk '{ print $1 }')
echo " "
echo "Der erstellte Ordner hat folgende Größe: $sp"
echo " "
echo "##############################################################"
echo " "
