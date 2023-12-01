#!/bin/bash

log_file="/var/log/easy_script.log"

log() {
  echo "[Easy Script] $1" >> "$log_file"
}

check_root() {
  if [ "$EUID" -ne 0 ]; then
    log "Please run this script as root."
    exit 1
  fi
}

make_opt_es_dir() {
  mkdir -p /opt/Easy-Script
  log "Created /opt/Easy-Script directory."
  echo "bruh something is not right lemme fix it"
  sleep 1
  echo "Fixed. Run the script again."
}

create_launcher() {
  echo "Creating Launcher..."
  chmod +x install/es
  mv install/es /usr/local/bin/
  sleep 2
  echo "Done now you can remove this folder"
  echo "type es to run the script"
  echo "this tool is installed in /opt/Easy-Script/ if you want to remove this tool cd to the install dir and run uninstall.sh"
  sleep 5
}

uninstall_sh() {
  echo "Creating uninstall.sh ..."
  mv install/uninstall.sh /opt/Easy-Script
  create_launcher
}

install_dependencies() {
  log "Installing dependencies."
  if [ "$(lsb_release -is)" == "Arch" ]; then
    pacman -S --noconfirm lolcat toilet figlet cowsay
  else
    apt-get -y install lolcat toilet figlet cowsay
  fi
}

create_loading_bar() {
  local duration=$1
  local progress_char="."
  local width=20

  for ((i = 0; i < width; i++)); do
    echo -n "${progress_char}"
    sleep "$duration"
  done
  echo
}

install() {
  if [ -e /opt/Easy-Script ]; then
    mv exploits /opt/Easy-Script && mv creds /opt/Easy-Script/ && mv recon /opt/Easy-Script
    mv wireless-script /opt/Easy-Script
    mv easy-script.sh /opt/Easy-Script/ && mv tool.sh /opt/Easy-Script/ && mv recon /opt/Easy-Script
    mkdir -p /opt/Easy-Script/Cap

    echo "Moving files..."
    create_loading_bar 0.1
    clear
    echo "Installing Easy-Script..."
    create_loading_bar 0.1
    clear
    install_dependencies
    uninstall_sh
  else
    make_opt_es_dir
  fi
}

check_root
install
