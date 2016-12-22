#!/bin/bash

echo "##########"
echo " "
echo "Zufallsgenerator"
# Definition eines random Integers der Maximal 10 ist
myvar=$(echo "$[RANDOM%10+1]")

# Ausgabe der Zahl
#echo $myvar

case $myvar in
	1) echo "one" ;;
	2) echo "two" ;;
	3) echo "three" ;;
	4) echo "four" ;;
	5) echo "five" ;;
	6) echo "six" ;;
	7) echo "seven" ;;
	8) echo "eight" ;;
	9) echo "nine" ;;
	10) echo "ten" ;;
	*) echo "INVALID NUMBER!" ;;
esac

echo " "
echo "##########"
