#!/bin/bash


function start_cracking(){
{
if [ "$wordlist" == "" ]
then
echo "Guessing Password"
{
aircrack-ng $cap -w /usr/share/wordlists/rockyou.txt -l password.lst
}&> /dev/null
cat password.lst
else
{
aircrack-ng $cap -w $wordlist -l password.lst
}&> /dev/null
echo "your Password is..."
echo ""
sleep 2
cat password.lst
sleep 2
echo ""
echo "if you cannot see the password open the password.lst file  "
sleep 5
fi
}
}


function crack(){
echo $(clear)
figlet -c Crack-WiFi-Password | lolcat
if [ -e /bin/aircrack-ng ]
then
	read -p "Enter the path for your handshake cap file " cap
	read -p "Enter the path for your Wordlist hit Enter for Default wordlist(rockyou.txt) :" wordlist
	sleep 2
	start_cracking
else
spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

printf 'Bitch what are you locking at I am installing some dependencies '
spinner &
{
apt install aircrack-ng  # Enable monitor mode
sleep 4 #after some hard work sleaping is important
}&> /dev/null
kill "$!" # kill the spinner
printf '\n'

fi
}

crack
