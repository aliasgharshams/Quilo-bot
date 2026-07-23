#!/bin/bash

ORANGE="\e[38;5;208m"
WHITE="\e[97m"
RESET="\e[0m"

clear


# LOGO

echo -e "${ORANGE}"

echo -e "${ORANGE}"

echo "╭───────────────────────────────────────────────────────────────────────────╮"

while IFS= read -r line
do

LEN=${#line}
SPACE=$(( (75-LEN)/2 ))

printf "│%${SPACE}s%s%$((75-SPACE-LEN))s│\n" "" "$line" ""

done < /var/www/Quilo-bot/installer/logo.txt

echo "╰───────────────────────────────────────────────────────────────────────────╯"

echo -e "${RESET}"
echo -e "${RESET}"


echo ""


# INFO BOX

echo -e "${ORANGE}+----------------------+ +----------------------+ +----------------------+${RESET}"

echo -e "${ORANGE}|${RESET}     ${WHITE}Version 0.1.0${RESET}      ${ORANGE}|${RESET}      ${ORANGE}Quilo${WHITE} bot${RESET}       ${ORANGE}|${RESET} ${WHITE}Support: @Quilo_support${RESET} ${ORANGE}|${RESET}"

echo -e "${ORANGE}+----------------------+ +----------------------+ +----------------------+${RESET}"


echo -e "${ORANGE}"

echo "╭──────────────────────────── MAIN MENU ─────────────────────────────╮"

echo "│                                                                    │"

echo -e "│  ${ORANGE}1.${WHITE} Install Bot                                                   ${ORANGE}│"

echo -e "│  ${ORANGE}2.${WHITE} Delete Bot                                                    ${ORANGE}│"

echo -e "│  ${ORANGE}3.${WHITE} Edit Config                                                   ${ORANGE}│"

echo -e "│  ${ORANGE}4.${WHITE} Uninstall                                                     ${ORANGE}│"

echo -e "│  ${ORANGE}5.${WHITE} Exit                                                          ${ORANGE}│"

echo "│                                                                    │"

echo "╰────────────────────────────────────────────────────────────────────╯"

echo -e "${RESET}"

echo ""

echo -ne "${ORANGE}> ${WHITE}Enter option: ${RESET}"

read option


case $option in


1)

bash /var/www/Quilo-bot/installer/installer.sh

;;


2)

bash /var/www/Quilo-bot/installer/delete.sh

;;


3)

bash /var/www/Quilo-bot/installer/edit_config.sh

;;


4)

bash /var/www/Quilo-bot/installer/uninstall.sh

;;


5)

clear

echo "Bye..."

exit 0

;;


*)

echo "Invalid option"

sleep 2

bash /var/www/Quilo-bot/installer/ui.sh

;;

esac
