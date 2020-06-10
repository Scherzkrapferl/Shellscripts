#!/bin/bash


echo "Enter input file:"
read filename
#n=1

echo "- Count total page numbers -"

while read -r line; do
# echo $line

#echo $line>>scanned.txt
echo $line
pdfinfo $line | grep Pages
echo "---"

#pdf=$(pdfinfo $line >> tmp.txt)
#pdfinfo < $line


# echo "---" >> tmp.txt
# echo "Line No. $n : $line"
# n=$((n+1))

done < $filename

