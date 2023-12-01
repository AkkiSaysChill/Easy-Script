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

install_dependencies() {
  log "Installing dependencies."
  if [ "$(lsb_release -is)" == "Arch" ]; then
    pacman -S lolcat toilet figlet cowsay
  else
    apt install lolcat toilet figlet cowsay
  fi
}

uninstall_sh() {
  echo "creating uninstall.sh ..."
  mv install/uninstall.sh /opt/Easy-Script
  create_launcher
}


install() {
  if [ -e /opt/Easy-Script ]; then
    # ... (similar changes for the existing code)
    
    # Adding a loading bar during the installation
    echo "Installing Easy-Script..."
    create_loading_bar 0.1

    install_dependencies
    uninstall_sh
  else
    make_opt_es_dir
  fi
}

check_root
install
