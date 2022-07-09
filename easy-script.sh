#!/bin/bash

echo $(clear)

#color var
RED='\033[0;31m'
NC='\033[0m'
Y='\033[1;33m'

function main(){
echo $(clear)
echo -e "$Y _____    _    ______   __   ____   ____ ____  ___ ____ _____ $NC"
echo -e "$Y| ____|  / \  / ___\ \ / /  / ___| / ___|  _ \|_ _|  _ \_   _|$NC"
echo -e "$Y|  _|   / _ \ \___  \ V /___\___ \| |   | |_) || || |_) || |  $NC"
echo -e "$Y| |___ / ___ \ ___) || ||____|__) | |___|  _ < | ||  __/ | |  $NC"
echo -e "$Y|_____/_/   \_\____/ |_|    |____/ \____|_| \_\___|_|    |_|  $NC"
echo ""
echo ""
echo "What you want me to Do?"
echo ""
echo -e "${RED}1.${NC} to make your terminal like you are hacking type ${Y}cmatrix/hollywood${NC}"
echo -e "${RED}2.${NC} to install some payload creater or vuln scanner type ${Y}tool${NC}"
echo -e "${RED}3.${NC} to do wireless attack type ${Y}air-ng${NC}"
# echo -e "${RED}4.${NC} to create payloads type ${Y}exploits${NC}" removed because of issues
echo -e "${RED}5.${NC} to exit form the script type ${Y}exit${NC}"
echo -e "${RED}6.${NC} for credits type ${Y}creds${NC}"
echo ""
}
main
while read -p "Enter :" name; do

if [ "$name" == "cmatrix" ]
	then
		cmatrix
	else
		if [ "$name" == "hollywood" ]
			then
				hollywood
			else
				if [ "$name" == "tool" ]
					then
						bash /opt/Easy-Script/tool.sh
					else
						if [ "$name" == "air-ng" ]
							then
								bash /opt/Easy-Script/wireless-script/wifi-attack.sh
							else
								if [ "$name" == "exit" ]
									then
										exit
									else
										if [ "$name" == "creds" ]
											then
												bash /opt/Easy-Script/creds/creds.sh
											else
												if [ "$name" == "exploits" ]
												then
													bash /opt/Easy-Script/exploits/exploit-main.sh
												else
												clear
												echo -e "${RED}ERROR${NC}:	${Y}invalid input${NC}"
												sleep 3
												main
										fi
									fi
								fi
						fi
				fi
		fi
fi
done
main
