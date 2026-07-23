#!/bin/bash


ORANGE="\e[38;5;208m"
WHITE="\e[97m"
RESET="\e[0m"


CONFIG="/var/www/Quilo-bot/app/config/config.php"


clear


echo -e "${ORANGE}"
echo "=============================="
echo "       Edit Quilo Config"
echo "=============================="
echo -e "${RESET}"


if [ ! -f "$CONFIG" ]; then

echo "Config file not found!"

exit 1

fi



read -p "New Telegram Token: " TOKEN

read -p "New Admin ID: " ADMIN

read -p "New Domain: " DOMAIN

read -p "New Bot Username: " USERNAME



cat > $CONFIG <<EOF
<?php

return [

"app_name"=>"Quilo-bot",

"version"=>"1.0.0",

"app"=>[

"url"=>"https://$DOMAIN"

],


"telegram"=>[

"token"=>"$TOKEN",

"admin_id"=>"$ADMIN"

],


"bot"=>[

"username"=>"$USERNAME"

],


"db"=>[

"host"=>"localhost",

"name"=>"quilo",

"user"=>"quilo_user",

"pass"=>"Quilo@123456"

]

];

EOF



echo ""

echo -e "${ORANGE}Config updated successfully${RESET}"


sleep 2


bash /var/www/Quilo-bot/installer/ui.sh
