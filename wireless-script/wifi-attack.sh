#!/bin/bash

# Color variables
RED='\033[0;31m'
NC='\033[0m'
Y='\033[1;33m'

# Function to create a fake AP
function create_fake_ap() {
  echo $(clear)
  figlet -c WiFi-Hacking | lolcat
  echo ""
  echo -e "${RED}What do you want to do?${NC}"
  echo ""
  echo -e "${Y}1.${NC} ${RED}Create Fake AP${NC}"     # done
  echo -e "${Y}2.${NC} ${RED}Capture Handshake File${NC}"  # done
  echo -e "${Y}3.${NC} ${RED}Crack Password of Handshake File${NC}"
  echo -e "${Y}4.${NC} ${RED}Enable Monitor Mode${NC}"     # done
  echo -e "${Y}5.${NC} ${RED}Scan for Vulnerability of a Device${NC}"  # done
  echo -e "${Y}6.${NC} ${RED}Scan for XSS Vulnerability${NC}"
  echo -e "${Y}7.${NC} ${RED}Restore Wireless Interface${NC}"  # done
  echo -e "${Y}8.${NC} ${RED}Start a Xss Website with Beef${NC}"
  echo -e "${Y}9.${NC} ${RED}Go Back${NC}"
  echo ""

  while read -p "Enter: " wifi; do
    case $wifi in
      1 | fap)
        create_fake_ap
        ;;
      2 | handshake)
        bash /opt/Easy-Script/wireless-script/captur.sh
        ;;
      3 | .cap)
        bash /opt/Easy-Script/wireless-script/crack.sh
        ;;
      4 | mon)
        enable_monitor_mode
        ;;
      5 | recon)
        scan_for_vulnerability
        ;;
      6 | xsscan)
        python3 /opt/Easy-Script/wireless-script/xss-scan.py
        ;;
      7 | disable_mon)
        disable_monitor_mode
        ;;
	  8 | StartXSS)
	  	startxss
		;; 
      9 | 0)
        exit
        ;;
      *)
        clear
        echo -e "${RED}Invalid Command${NC}"
        sleep 3
        create_fake_ap
        ;;
    esac
  done
}

# Function to enable monitor mode
function enable_monitor_mode() {
  spinner "Putting interface into monitor mode" "airmon-ng check kill; airmon-ng start wlan0" 4
  bash /opt/Easy-Script/wireless-script/wifi-attack.sh
}

function startxss(){
	echo "comming soon"
}

# Function to disable monitor mode
function disable_monitor_mode() {
  spinner "Restoring your wireless interface" "airmon-ng stop wlan0mon; systemctl start NetworkManager" 4
  main
}

# Function to scan for vulnerability
function scan_for_vulnerability() {
  echo $(clear)
  figlet recon
  echo ""
  read -p "Enter your target IP: " name
  bash /opt/Easy-Script/recon/recon.sh $name
}

# Function to create a loading spinner
function spinner() {
  local message=$1
  local command=$2
  local duration=$3

  printf "$message"
  {
    $command
  } &>/dev/null &

  local pid=$!
  spin='-\|/'

  for i in $(seq 1 $duration); do
    sleep 0.1
    printf "\b${spin:i++%4:1}"
  done

  wait $pid
  printf "\n"
}

function main() {
  if command -v airmon-ng &>/dev/null; then
    air-ng
  else
    spinner "Installing dependencies..." "apt install -y airmon-ng" 3
  fi

  create_fake_ap
}



# Start the script
main
