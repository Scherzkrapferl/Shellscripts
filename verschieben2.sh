#!/bin/bash

cd /home/philipp/Downloads/PDF;

# Interaktive Eingabe, if-Abfrage
echo "Ordner Namens 1 erstellen?"
echo Ihre Antwort, n/j:
read answer
echo Ihre Antwort war: $answer
# if [ "$answer" = "j" ]
if [ "$answer" != "n" ]
  then mkdir /home/philipp/Downloads/PDF/1 
  else echo "Verzeichnis wird nicht erstellt."
fi
echo Ordner wurde erstellt

echo "Dateien in diesen Ordner Verschieben?"
echo Ihre Antwort, n/j:
read answer
echo Ihre Antwort war: $answer
# if [ "$answer" = "j" ]
if [ "$answer" != "n" ]
  then mv *.pdf /home/philipp/Downloads/PDF/1
  else echo "Dateien werden nicht verschoben."
fi
echo Dateien wurden verschoben

sleep 5



chmod u+rwx ./verschieben2.sh
