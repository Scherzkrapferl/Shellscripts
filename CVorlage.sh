#!/bin/bash

clear
echo "#################################"
echo "# Vorlagen creator Version 1.0C #"
echo "#################################"
echo ""

if [ "$1" == "-c" ]
then
    mode=1
elif [ "$1" == "-s" ]
then
    mode=2
else
    mode=3
fi

if [ "$mode" -gt 2 ]
then
    echo "Error. No options used."
    echo ""
    echo "Possible options:"
    echo "-c ... create"
    echo "-s ... silent mode"
    echo ""
    echo "exit..."
    exit
fi

if [ "$2" == "" ]
then
    echo "(Enter "quit" to exit)"
    echo ""
	echo "Enter filename:"
	read file
	if [ "$file" == "quit" ]
    then
        clear
        exit
	fi
	touch $file && echo "File $file created."
else
	touch $2 && echo "File $2 created."
    file=$2
fi


echo " "

echo "Author:"
read author
echo " "
clear
echo "# (c) $year $author. All rights reserved" >> $file

if [ "$1" != "-s" ]
then
    echo "year:"
    read year
    echo " "
    clear

    echo "Enter application name:"
    read name
    echo " "
    clear

    echo "Version:"
    read version
    echo " "
    clear

    echo "Short description:"
    read description
    clear

    echo "#" >> $file
    echo "# Name: $name" >> $file
    echo "# Version: $version" >> $file
    echo "#" >> $file
    echo "# Description: $description" >> $file
fi


echo "" >> $file
echo "#include <stdlib.h>" >> $file
echo "#include <stdio.h>" >> $file
echo "" >> $file
echo "int main() {" >> $file
echo "" >> $file
echo "return 0;" >> $file
echo "}" >> $file

echo "created."
sleep 2
echo ""
echo "Quit in 3.."
sleep 1
echo "2.."
sleep 1
echo "1.."
sleep 1
echo "quit." 

clear
