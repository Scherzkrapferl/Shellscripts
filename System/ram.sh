#!/bin/bash

## Show free RAM

clear

echo "############################################################"
echo ""
echo "------ Arbeitsspeicher ------"
echo ""
free -h | grep Mem | awk '{ print "RAM: " $4 "/" $2 " frei - " $3 " genutzt " }'
echo ""
echo "------ Festplattenspeicher ------"
echo ""
df -h | grep sda | awk '{ print $1 ": " $3 "/" $2}'
echo ""
echo "------ CPU ------"
echo ""
cat /proc/cpuinfo | grep name
echo ""
echo "############################################################"
