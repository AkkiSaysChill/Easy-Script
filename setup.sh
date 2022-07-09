#!/bin/bash

clear

make_opt_es_dir(){
  mkdir /opt/Easy-Script
  echo "bruh something is not right lemme fix it"
  sleep 1
  echo "Fixed run the script again"
}

create_launcher() {
  echo "Creating Launcher"
  chmod +x install/es
  mv install/es /usr/local/bin/
  sleep 2
  echo "Done now you can remove this folder"
  echo "type es to run the script"
  echo "this tool is installed in /opt/Easy-Script/ if you want to remove this tool cd to the install dir and run unistall.sh"
  sleep 5
}

uninstall_sh() {
  echo "creating uninstall.sh ..."
  mv install/uninstall.sh /opt/Easy-Script
  create_launcher
}

install() {
  if [ -e /opt/Easy-Script ]
  then
    {
    # moving dir
    mv exploits /opt/Easy-Script && mv creds /opt/Easy-Script/ && mv recon /opt/Easy-Script
    mv wireless-script /opt/Easy-Script
    # moving files
    mv easy-script.sh /opt/Easy-Script/ && mv tool.sh /opt/Easy-Script/
    mkdir /opt/Easy-Script/Cap
  } &> /dev/null
  echo "[                     ]"
  sleep 1
  clear
  echo "[>                    ]"
  sleep 2
  clear
  echo "[======>              ]"
  sleep 2
  clear
  echo "moving files..."
  sleep 4
  echo "[=================>   ]"
  sleep 2
  echo "almost done.."
  echo "[====================>] All Done"
  echo "installing depencies"
  if [ $(lsb_release -is) == "Arch" ]
  then
    pacman -S lolcat toilet figlet cowsay
  else
    apt install lolcat toilet figlet cowsay
  fi
  uninstall_sh
  else
    make_opt_es_dir
fi
}

if [[ $EUID -ne 0 ]]
then
  echo "run this using sudo"
else
  install
fi

