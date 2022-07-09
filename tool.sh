#!/bin/bash

function install_default
	{
		if [[ "$foldname" == "" ]]
		then
			testgit=$(echo "$gitlink" | grep ".git")
			if [[ "$testgit" == "" ]]
			then
				foldname=$(echo "$gitlink" | cut -d '/' -f5)
			else
				foldname=$(echo "$gitlink" | cut -d '/' -f2 | cut -d '.' -f1)
			fi
		fi
		if [[ -d "/root/"$foldname"" ]]
		then
			if [[ "$NOCONFIRM" == 1 ]]
			then
					if [[ "$foldname" != "" ]]
					then
						echo -e ""$YS"Removing: "$foldname""$CE""
						rm -r /root/"$foldname"
						cd
						git clone $gitlink
						cd "$foldname"
						return 1
					fi
			else
				echo -e ""$YS"Removing old and install again?"$CE" ("$YS"y"$CE"/"$YS"n"$CE")"
				read ROIN
				if [[ "$ROIN" == "y" ]]
				then
					if [[ "$foldname" != "" ]]
					then
						echo -e ""$YS"Removing: "$foldname""$CE""
						rm -r /root/"$foldname"
						cd
						git clone $gitlink
						cd "$foldname"
						return 1
					fi
				else
					return 0
				fi
			fi
		else
			cd
			git clone $gitlink
			cd "$foldname"
			return 1
		fi
	}

#color var
RED='\033[0;31m'
NC='\033[0m'
Y='\033[1;33m'

########## Main Manue ##########
function main(){
echo $(clear)
figlet Tools | lolcat
echo -e "${RED}which too you want to install${NC}"
echo -e "to install airgeddon type ${Y}airgeddon${NC}"
echo -e "to install evil-droid type ${Y}android${NC}"
echo -e "to install metasploit type ${Y}msf${NC}"
echo -e "to install Nmap type ${Y}Nmap${NC}"
echo -e "to install veil type ${Y}veil${NC}"
echo -e "to install WhatWeb type ${Y}whatweb${NC}"
echo -e "to install owasp juice-shop type ${Y}js${NC}"
echo -e "to install zphisher type ${Y}zp${NC}"
echo -e "to go back type ${RED}0${NC}"

}
main

while read -p "Enter :" name; do

############ tools #################
if [ "$name" == "airgeddon" ]
	then
		if [ -e /bin/airgeddon ]
			then
				clear
				figlet airgeddon
				echo ""
				echo -e "${RED}AIRGEDDON IS INSTALLED${NC}"
				sleep 3
				~/Easy-Script/tool.sh
			else
				clear
				{
				apt install airgeddon
				}&> /dev/null
				echo -e "${RED}installing${NC} ${Y}Airgeddon${NC}"
				bash /opt/Easy-Script/tool.sh
		fi
	else

		if [ "$name" == "msf" ]
			then
				if [ -e /bin/msfconsole ]
					then
						clear
						figlet Metasploit | lolcat
						echo ""
						echo -e "${RED}Metasploit is installed${NC}"
						sleep 3
						bash /opt/Easy-Script/tool.sh
					else
								clear
								{
								apt install metasploit-framework
								}&> /dev/null
								echo -e "${RED}installing${NC} ${Y}Metasloit${NC}"
								bash /opt/Easy-Script/tool.sh
						fi
					else
						if [ "$name" == "Nmap" ]
							then
								if [ -e /bin/nmap ]
									then
										clear
										figlet Nmap | lolcat
										echo -e "${RED}Nmap is installed${NC}"
										sleep 3
										bash /opt/Easy-Script/tool.sh
									else
									clear
									{
									apt install Nmap
									}&> /dev/null
									echo -e "${RED}installing${NC} ${Y}Nmap${NC}"
									bash /opt/Easy-Script/tool.sh
								fi
							else
								if [ "$name" == "veil" ]
									then
										if [ -e /bin/veil ]
											then
												clear
												figlet Veil | lolcat
												echo ""
												echo -e "${RED}Veil is installed${NC}"
												sleep 3
												bash /opt/Easy-Script/tool.sh
											else
												{
												apt install veil
												}&> /dev/null
												echo -e "${RED}installing${NC} ${Y}Veil${NC}"
												bash /opt/Easy-Script/tool.sh
										fi
									else
										if [ "$name" == "whatweb" ]
										then
										if [ -e /bin/veil ]
										then
											clear
											figlet What-Web | lolcat
											echo ""
											echo -e "${RED}Veil is installed"
											sleep 3
											bash /opt/Easy-Script/tool.sh
										else
											clear
											{
											apt install whatweb
											}&> /dev/null
											echo -e "${RED}installing${NC} ${Y}whatweb${NC}"
											bash /opt/Easy-Script/tool.sh
										fi
									else
										if [ "$name" == "0" ]
											then
													#back func
												function 0(){
													exit
												}
												0
											else
												if [ "$name" == "js" ] # this took me fucking 2 hour to get it work
												then
													if [ -e /root/juice-shop ]
														then
														clear
														echo -e "${Y}You Already Have Some Juice${NC}"
														sleep 3
														bash /opt/Easy-Script/tool.sh
														else
														clear
														echo -e "${RED}Making Some${NC} ${Y}Juice, yum!${NC}"
														{
															foldname="juice-shop"
															gitlink="https://github.com/juice-shop/juice-shop.git"
															install_default
															cloned=$?
															if [[ "$cloned" == 1 ]]
															then
															bash /opt/Easy-Script/tool.sh
															fi
														}&> /dev/null
													fi
												else
													if [ "$name" == "android" ] # and this also i wanna die
													then
													if [ -e /root/Evil-Droid ]
											then
												clear
												figlet Evil-Droid | lolcat
												echo ""
												echo -e "${RED}EVIL-DROID IS INSTALLED${NC}"
												sleep 3
												bash /opt/Easy-Script/tool.sh
											else
												clear
												foldname="Evil-Droid"
												gitlink="https://github.com/M4sc3r4n0/Evil-Droid.git"
												install_default
												cloned=$?
												if [[ "$cloned" == 1 ]]
												then
													chmod +x evil-droid
													bash /opt/Easy-Script/tool.sh
												fi
												fi
												else
												if [ "$name" == "zp" ]
												then
												clear
												echo -e "${RED}Comming${NC} ${Y}Soon${NC}"
												sleep 3
												bash /opt/Easy-Script/tool.sh
												else
												clear
												echo -e "${RED}Invalid${NC} ${Y}Command${NC}"
												sleep 3
												main
												fi
											fi
										fi
									fi
								fi
							fi
						fi
					fi
				fi
			done
