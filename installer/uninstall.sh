#!/bin/bash


ORANGE="\e[38;5;208m"
WHITE="\e[97m"
RESET="\e[0m"


BASE="/var/www/Quilo-bot"
CONFIG="$BASE/app/config/config.php"


clear


echo -e "${ORANGE}"
echo "=============================="
echo "      Quilo Full Uninstall"
echo "=============================="
echo -e "${RESET}"


echo "WARNING:"
echo "This will remove Quilo completely."
echo ""


read -p "Continue? (yes/no): " CONFIRM


if [ "$CONFIRM" != "yes" ]; then

echo "Cancelled"

sleep 2

bash "$BASE/installer/ui.sh"

exit

fi



# Remove webhook

if [ -f "$CONFIG" ]; then


TOKEN=$(grep 'token' $CONFIG | head -1 | cut -d'"' -f4)


if [ ! -z "$TOKEN" ]; then

echo -e "${ORANGE}Removing Telegram webhook...${RESET}"

curl -s "https://api.telegram.org/bot$TOKEN/deleteWebhook"

echo ""

fi


fi



# Remove database

echo -e "${ORANGE}Removing database...${RESET}"


mysql -e "DROP DATABASE IF EXISTS quilo;"

mysql -e "DROP USER IF EXISTS 'quilo_user'@'localhost';"

mysql -e "FLUSH PRIVILEGES;"



# Remove apache config

echo -e "${ORANGE}Removing Apache config...${RESET}"


rm -f /etc/apache2/sites-enabled/quilo.conf

rm -f /etc/apache2/sites-available/quilo.conf


systemctl reload apache2



# Remove files

echo -e "${ORANGE}Removing Quilo files...${RESET}"


rm -rf "$BASE"



echo ""

echo -e "${ORANGE}Quilo removed successfully${RESET}"
