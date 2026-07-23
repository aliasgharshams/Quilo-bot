#!/bin/bash

ORANGE="\e[38;5;208m"
WHITE="\e[97m"
RESET="\e[0m"

BASE="/var/www/Quilo-bot"

clear


# LOGO

echo -e "${ORANGE}"

echo "╭───────────────────────────────────────────────────────────────────────────╮"

while IFS= read -r line
do

LEN=${#line}
SPACE=$(( (75-LEN)/2 ))

printf "│%${SPACE}s%s%$((75-SPACE-LEN))s│\n" "" "$line" ""

done < "$BASE/installer/logo.txt"


echo "╰───────────────────────────────────────────────────────────────────────────╯"

echo -e "${RESET}"


echo ""


# INFO BOX

echo -e "${ORANGE}+----------------------+ +----------------------+ +----------------------+${RESET}"

echo -e "${ORANGE}|${RESET}     ${WHITE}Version 0.1.0${RESET}      ${ORANGE}|${RESET}      ${ORANGE}Quilo ${WHITE}bot${RESET}       ${ORANGE}|${RESET} ${WHITE}Support: @Quilo_support${RESET} ${ORANGE}|${RESET}"

echo -e "${ORANGE}+----------------------+ +----------------------+ +----------------------+${RESET}"


echo ""


echo ""

# MAIN MENU

echo -e "${ORANGE}"

echo "╭──────────────────────────── MAIN MENU ─────────────────────────────╮"

echo -e "│                                                                    │"

echo -e "│        ${WHITE}1. Install Bot${ORANGE}                                             │"

echo -e "│        ${WHITE}2. Delete Bot${ORANGE}                                              │"

echo -e "│        ${WHITE}3. Edit Config${ORANGE}                                              │"

echo -e "│        ${WHITE}4. Update System${ORANGE}                                             │"

echo -e "│        ${WHITE}5. Uninstall${ORANGE}                                                 │"

echo -e "│        ${WHITE}6. Exit${ORANGE}                                                       │"

echo -e "│                                                                    │"

echo "╰────────────────────────────────────────────────────────────────────╯"

echo -e "${RESET}"


echo ""

echo -ne "${ORANGE}> ${WHITE}Enter option: ${RESET}"


read option


case $option in


1)

bash "$BASE/installer/install.sh"

;;


2)

bash "$BASE/installer/delete.sh"

;;


3)

bash "$BASE/installer/edit_config.sh"

;;


4)

bash "$BASE/installer/update.sh"

;;


5)

bash "$BASE/installer/uninstall.sh"

;;


6)

clear

echo "Bye..."

exit 0

;;


*)

echo "Invalid option"

sleep 2

bash "$BASE/installer/ui.sh"

;;


esac
