#!/bin/bash

ORANGE="\e[38;5;208m"
WHITE="\e[97m"
RESET="\e[0m"

BASE="/var/www/Quilo-bot"


clear


echo -e "${ORANGE}"
echo "================================"
echo "        Quilo Bot Update"
echo "================================"
echo -e "${RESET}"


cd $BASE || exit 1


LOCAL_VERSION=$(cat version.json 2>/dev/null | grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+')


git fetch origin main


REMOTE_VERSION=$(git show origin/main:version.json 2>/dev/null | grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+')



echo -e "${WHITE}Current version:${ORANGE} $LOCAL_VERSION${RESET}"

echo -e "${WHITE}Latest version:${ORANGE} $REMOTE_VERSION${RESET}"


echo ""


if [ "$LOCAL_VERSION" = "$REMOTE_VERSION" ]; then

echo -e "${ORANGE}Your system is up to date${RESET}"

exit 0

fi


echo -e "${ORANGE}New version available!${RESET}"

echo ""

read -p "Update now? (y/n): " ANSWER



if [ "$ANSWER" = "y" ]; then


echo -e "${ORANGE}Updating system...${RESET}"


git pull origin main


chown -R www-data:www-data $BASE


echo -e "${ORANGE}Update completed successfully${RESET}"


else

echo "Update cancelled"

fi
