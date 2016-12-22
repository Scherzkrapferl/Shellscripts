#!/bin/bash

echo " "
echo "Vorlagen creator Version 1.0"

echo "Dateinamen eingeben:"
read Datei
touch $Datei && echo "Datei $answer1 wurde erzeugt."
echo " "

echo "Autor eingeben"
read Autor
echo " "
echo "Jahr eingeben"
read Jahr
echo " "
echo "Programmnamen eingeben"
read Name
echo " "
echo "Versionsnummer eingeben"
read Version
echo " "
echo "Kurze Beschreibung eingeben"
echo " "
read Beschreibung

echo "#!/bin/bash" >> $Datei
echo " " >> $Datei
echo "# (c) $Jahr $Autor. All rights reserved" >> $Datei
echo "#" >> $Datei
echo "# Name des Programms: $Name" >> $Datei
echo "# Version: $Version" >> $Datei
echo "#" >> $Datei
echo "# Beschreibung: $Beschreibung" >> $Datei