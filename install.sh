#!/bin/bash

ORANGE="\e[38;5;208m"
WHITE="\e[97m"
RESET="\e[0m"


BASE_DIR="/var/www/Quilo-bot"
INSTALLER_DIR="$BASE_DIR/installer"


clear


echo -e "${ORANGE}"

cat "$INSTALLER_DIR/logo.txt"

echo -e "${RESET}"


echo ""

echo -e "${ORANGE}Starting Quilo Bot Installer...${RESET}"

sleep 1


# Check root

if [ "$EUID" -ne 0 ]; then

    echo -e "${ORANGE}Please run installer as root${RESET}"

    exit 1

fi



# Create installer folders

mkdir -p "$INSTALLER_DIR"



# Check packages

check_package(){

if ! command -v $1 &> /dev/null
then

    echo -e "${ORANGE}Installing $1...${RESET}"

    apt update -y

    apt install $1 -y

fi

}



echo ""

echo -e "${WHITE}Checking requirements...${RESET}"


check_package php
check_package mysql
check_package apache2


echo ""


echo -e "${ORANGE}Requirements OK${RESET}"


sleep 2



# Start UI

bash "$INSTALLER_DIR/ui.sh"
