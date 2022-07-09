#!/bin/bash

echo $(clear)
figlet Recon

if [ -z "$1" ]
then
        echo "Usage: ./recon.sh <IP>"
        exit 1
fi

printf "\n----- NMAP -----\n\n" > results

echo "Running Nmap..."
nmap $1 | tail -n +5 | head -n -3 >> results

while read line
do
        if [[ $line == *open* ]] && [[ $line == *http* ]]
        then
        echo "Running WhatWeb..."
        whatweb $1 -v > temp2
        fi
done < results

if [ -e temp1 ]
then
        printf "\n----- DIRS -----\n\n" >> results
        cat temp1 >> results
        rm temp1
fi

if [ -e temp2 ]
then
    printf "\n----- WEB -----\n\n" >> results
        cat temp2 >> results
        rm temp2
fi

cat results

read -p "Hit Enter to go back" name

if [ "$name" == "" ]
then 
bash ~/Easy-Script/wireless-script/wifi-attack.sh
else
echo "You are not supose to see this"
sleep 3
~/Easy-Script/wireless-script/wifi-attack.sh
fi
