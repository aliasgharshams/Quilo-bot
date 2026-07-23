#!/bin/bash

ORANGE="\e[38;5;208m"
WHITE="\e[97m"
RESET="\e[0m"

BASE="/var/www/Quilo-bot"


clear


echo -e "${ORANGE}"
echo "================================"
echo "        Quilo Bot Install"
echo "================================"
echo -e "${RESET}"


if [ "$EUID" -ne 0 ]; then

echo "Run as root"

exit 1

fi



echo -e "${ORANGE}Updating system...${RESET}"

apt update -y


echo -e "${ORANGE}Installing requirements...${RESET}"


apt install -y \
apache2 \
mariadb-server \
php \
php-mysql \
php-curl \
php-mbstring \
php-json \
certbot \
python3-certbot-apache \
curl \
unzip



echo -e "${ORANGE}Requirements installed${RESET}"

sleep2

echo ""

echo -e "${ORANGE}Database setup${RESET}"


DB_NAME="quilo"
DB_USER="quilo_user"
DB_PASS="Quilo@123456"



echo -e "${ORANGE}Creating database...${RESET}"


mysql <<EOF

CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';

GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';

FLUSH PRIVILEGES;

EOF



echo -e "${ORANGE}Database created${RESET}"



echo ""

echo -e "${ORANGE}Importing database...${RESET}"


if [ -f "$BASE/quilo_backup_before_clean.sql" ]; then


mysql $DB_NAME < "$BASE/quilo_backup_before_clean.sql"


echo -e "${ORANGE}Database imported${RESET}"


else


echo "SQL backup file not found"


fi




echo ""


echo -e "${ORANGE}Bot information${RESET}"


read -p "Telegram Bot Token: " BOT_TOKEN


read -p "Admin Telegram ID: " ADMIN_ID


read -p "Domain (example.com): " DOMAIN


read -p "Bot Username (without @): " BOT_USERNAME

echo ""

echo -e "${ORANGE}Creating config file...${RESET}"


cat > $BASE/app/config/config.php <<EOF
<?php

return [

    "app_name" => "Quilo-bot",

    "version" => "1.0.0",


    "app" => [

        "url" => "https://$DOMAIN"

    ],


    "telegram" => [

        "token" => "$BOT_TOKEN",

        "admin_id" => "$ADMIN_ID"

    ],


    "bot" => [

        "username" => "$BOT_USERNAME"

    ],


    "db" => [

        "host" => "localhost",

        "name" => "quilo",

        "user" => "quilo_user",

        "pass" => "Quilo@123456"

    ]

];

EOF


echo -e "${ORANGE}Config created${RESET}"



echo ""


echo -e "${ORANGE}Fixing permissions...${RESET}"


chown -R www-data:www-data $BASE

chmod -R 755 $BASE


echo -e "${ORANGE}Permissions OK${RESET}"

echo ""

echo -e "${ORANGE}Creating Apache VirtualHost...${RESET}"


cat > /etc/apache2/sites-available/quilo.conf <<EOF
<VirtualHost *:80>

    ServerName $DOMAIN

    DocumentRoot $BASE/public


    <Directory $BASE/public>

        AllowOverride All

        Require all granted

    </Directory>


    ErrorLog \${APACHE_LOG_DIR}/quilo_error.log

    CustomLog \${APACHE_LOG_DIR}/quilo_access.log combined


</VirtualHost>
EOF



echo -e "${ORANGE}Enabling site...${RESET}"


a2enmod rewrite

a2ensite quilo.conf


systemctl reload apache2



echo -e "${ORANGE}Apache configured${RESET}"

echo ""

echo -e "${ORANGE}Installing SSL certificate...${RESET}"


certbot --apache \
-d $DOMAIN \
--non-interactive \
--agree-tos \
-m admin@$DOMAIN


echo ""


echo -e "${ORANGE}Setting Telegram webhook...${RESET}"


curl -s "https://api.telegram.org/bot$BOT_TOKEN/setWebhook?url=https://$DOMAIN/index.php"


echo ""


echo -e "${ORANGE}Testing website...${RESET}"


HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}" https://$DOMAIN/index.php)



if [ "$HTTP_CODE" = "200" ]; then

echo -e "${ORANGE}"
echo "======================================"
echo "   Quilo Bot Installed Successfully"
echo "======================================"
echo -e "${RESET}"


else

echo "Website returned HTTP $HTTP_CODE"

fi


echo ""

sleep 3


bash $BASE/installer/ui.sh
