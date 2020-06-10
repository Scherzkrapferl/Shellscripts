#!/bin/bash

# (c) 2016 Philipp Necker. All rights reserved
#
# Name des Programms: PDFVerschieben.sh
# Version: 1.0
#
# Skript zum Verschieben von meheren PDF Dateien

pfad=$(pwd)
echo " "
echo "##############################################################"
echo " "
echo "Willkommen!"
echo "Dieses Skript automatisiert das Verschieben von PDF Dateien."
echo " "
echo "--------------------------------------------------------------"
#echo "Sie befinden sich in Folgendem Ordner: $test"

echo "Folgende PDF-Dateien befinden sich im aktuellen Ordner:"
ls | grep .pdf
status=$?	# Return Variable abspeichern. (wenn !=0 dann etwas vorhanden)

echo " "
echo "--------------------------------------------------------------"


if [ "$status" != "0" ]
	then echo "Es sind keine PDF-Dateien vorhanden!"
		echo " "
		echo "Abbruch..."
		echo "##############################################################"
		echo " "
		exit
fi

echo "Wollen Sie die PDF-Dateien in einem Ordner zusammenfassen? J/N"
read answer
echo " "
echo "--------------------------------------------------------------"


if [ "$answer" = "j" ]
	then mkdir -p $pfad/PDF
		mv *.pdf $pfad/PDF
		
		cd $pfad/PDF
		ls -la > indexPDF.txt
		
		echo "Alle Dateien wurden verschoben."
        echo " "
		echo "Folgende Index-Datei wurde dabei erzeugt:"
		echo " "
        echo "--------------------------------------------------------------"

		cat indexPDF.txt
		
		spPDF=$(du -h | awk '{ print $1 }')
        echo "--------------------------------------------------------------"
		echo " "
		echo "Der erstellte Ordner hat folgende Größe: $spPDF"
        echo " "
		cd ..

		echo "Wollen sie den Ordner behalten (J), oder alle Dateien gesammelt löschen (N)?"
		read answer2
		
		if [ "$answer2" != "n" ]
			then echo " "
			echo "Ordner wird behalten."
		else echo " "
            echo "Der Ordner PDF wird inklusive Inhalt gelöscht."
            echo " "
			rm -rf $pfad/PDF && echo "Löschen erfolgreich."
		fi

		echo " "
		echo "Programm wird nun beendet..."
		echo " "

elif [ "$answer" = "n" ]
	then echo "PDF-Dateien werden nicht zusammengefasst."
		echo " "
		echo "Abbruch..."

else echo "Eingabe fehlerhaft. Abbruch..."
fi
echo "##############################################################"
echo " "
