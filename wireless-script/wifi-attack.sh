#!/bin/bash

#color var
RED='\033[0;31m'
NC='\033[0m'
Y='\033[1;33m'

############### main-manue #################
function main(){
	if [ -e /sbin/airmon-ng ]
	then
		echo $(clear)
		figlet -c WiFi-Hacking | lolcat
		echo ""
		echo -e "${RED}what you want me to do${NC}?"
		echo ""
		echo -e "${Y}1.${NC} ${RED}to only create fake ap type${NC} ${Y}fap${NC}" #done
		echo -e "${Y}2.${NC} ${RED}to capture a handshake file type${NC} ${Y}handshake${NC}"
		echo -e "${Y}3.${NC} ${RED}to crack a psswd of a hand shake file type${NC} ${Y}.cap${NC}"
		echo -e "${Y}4.${NC} ${RED}to enable monitor mode in wlan0 type${NC} ${Y}mon${NC}" #done
		echo -e "${Y}5.${NC} ${RED}to scan for vulnerability of a device type${NC} ${Y}recon${NC}" #done
		echo -e "${Y}6.${NC} ${RED}to scen for xss vulnerability tyrp${NC} ${Y}xsscan${NC}"
		echo -e "${Y}2.${NC} ${RED}to start a xss website using Beef${NC} ${Y}StartXSS${NC}" 
		echo -e "${Y}7.${NC} ${RED}to restore wireless interface type${NC} ${Y}disable_mon${NC}" #done
    echo -e "${Y}1.${NC} ${RED}to perform a DoS attack type ${NC} ${Y}dos${NC}"
		echo -e "${Y}8.${NC} ${RED}to go back type${NC} ${Y}0${NC}"
    echo ""

else
		{
		echo $(apt install airmon-ng)
		}&> dev/null
		echo "installing dependencies"
		sleep 1
		air-ng
fi

while read -p "Enter :" wifi; do
if [ "$wifi" == fap ]
	then
	#fake AP start
		function sfap(){
		sleep 2
		{
		airbase-ng wlan0mon --essid $ap &
		}&> /dev/null
		echo "your Fake AP is created successfully "
		sleep 3
		sleep 2
		bash /opt/Easy-Script/wireless-script/wifi-attack.sh
		}

		#fake AP
		function fap(){
		echo $(clear)
		figlet Fake-AP
		echo ""
		read -p "Enter the name For your Fake AP :" ap
		sleep 1
		sfap
		}
		fap
	else
if [ "$wifi" == ".cap" ]
	then
		bash /opt/Easy-Script/wireless-script/crack.sh
	else
if [ "$wifi" == "mon" ]
	then
		function mon(){
	spinner() {
	    local i sp n
	    sp='/-\|'
	    n=${#sp}
	    printf ' '
	    while sleep 0.1; do
	        printf "%s\b" "${sp:i++%n:1}"
	    done
	}

	printf 'Puttng interface into monitor mode '
	spinner &
	{
	airmon-ng check kill
	airmon-ng start wlan0  # Enable monitor mode
	sleep 4 #after some hard work sleaping is important
	}&> /dev/null
	kill "$!" # kill the spinner
	printf '\n'
	bash /opt/Easy-Script/wireless-script/wifi-attack.sh
	}
	mon
else
	if [ "$wifi" == "recon" ]
		then
			#also recon
	function scan(){
	bash /opt/Easy-Script/recon/recon.sh $name
	}

	#recon
	function recon(){
		echo $(clear)
		figlet recon
		echo ""
		read -p "Enter your target ip :" name
		scan
		}
		recon
else
	if [ "$wifi" == "disable_mon" ]
		then
			#disale monitor mode
	function disable_mon(){
	spinner() {
	    local i sp n
	    sp='/-\|'
	    n=${#sp}
	    printf ' '
	    while sleep 0.1; do
	        printf "%s\b" "${sp:i++%n:1}"
	    done
	}

	printf 'Restoring your freacking wireless interface '
	spinner &
	{
	airmon-ng stop wlan0mon
	systemctl start NetworkManager # Disable Monitor mode
	sleep 4 #after some hard work sleaping is important
	}&> /dev/null
	kill "$!" # kill the spinner
	printf '\n'
	main
	}
	disable_mon
		else
			if [ "$wifi" == "0" ]
				then
					#back func
				function 0(){
						exit
				}
				0
			else
				if [ "$wifi" == "handshake" ]
					then
						bash /opt/Easy-Script/wireless-script/captur.sh
					else
						if [ "$wifi" == "xsscan" ]
							then
								python3 /opt/Easy-Script/wireless-script/xss-scan.py
              elif [ "$wifi" == "dos" ]
              then
                python3 /opt/Easy-Script/wireless-script/DDoS.py
				elif ["$wifi" == "StartXSS"]
				then 
					echo -e "${RED}Comming ${NC}${Y}Soon${NC}"
							else
								clear
								echo -e "${RED}Invalid ${NC}${Y}Command${NC}"
								sleep 3
								main
				   fi		fi
			  fi
		 fi
	fi
fi
fi
fi
done
}
main
