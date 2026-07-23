#!/bin/bash


ORANGE="\e[38;5;208m"
WHITE="\e[97m"
RESET="\e[0m"


BASE="/var/www/Quilo-bot"
CONFIG="$BASE/app/config/config.php"


clear


echo -e "${ORANGE}"
echo "=============================="
echo "        Delete Quilo Bot"
echo "=============================="
echo -e "${RESET}"


read -p "Are you sure? (yes/no): " CONFIRM


if [ "$CONFIRM" != "yes" ]; then

echo "Cancelled"

sleep 2

bash "$BASE/installer/ui.sh"

exit

fi



if [ -f "$CONFIG" ]; then


TOKEN=$(grep 'token' $CONFIG | head -1 | cut -d'"' -f4)


if [ ! -z "$TOKEN" ]; then


echo -e "${ORANGE}Removing Telegram webhook...${RESET}"


curl -s "https://api.telegram.org/bot$TOKEN/deleteWebhook"


echo ""

fi


fi



echo -e "${ORANGE}Removing bot files...${RESET}"


rm -rf "$BASE/app"


rm -rf "$BASE/public"



echo ""

echo -e "${ORANGE}Bot deleted successfully${RESET}"


sleep 3


bash "$BASE/installer/ui.sh"
