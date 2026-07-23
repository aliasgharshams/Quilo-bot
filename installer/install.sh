#!/bin/bash

clear

echo "================================"
echo "          QUILO"
echo "       QUILO ENGINE"
echo "          بات فارسی"
echo "================================"
echo ""

echo "1) Install Bot"
echo "2) Delete Bot"
echo ""

read -p "Select: " choice


if [ "$choice" = "1" ]; then

echo ""
echo "Starting installation..."
echo ""


echo "[1/6] Updating system..."

apt update -y


echo "[2/6] Installing requirements..."

apt install -y \
php \
php-mysql \
php-curl \
mysql-server \
apache2 \
certbot \
python3-certbot-apache \
git \
curl


echo "[3/6] Creating folders..."

mkdir -p /var/www/Quilo-bot


echo "[4/6] Bot information"

read -p "Bot Token: " BOT_TOKEN

read -p "Admin Telegram ID: " ADMIN_ID

read -p "Bot Username (without @): " BOT_USERNAME

read -p "Domain: " DOMAIN



echo ""
echo "Saving configuration..."

mkdir -p app/config


cat > app/config/config.php <<EOF
<?php

return [

"version"=>"0.1.0",

"app"=>[
"url"=>"https://$DOMAIN"
],

"telegram"=>[
"token"=>"$BOT_TOKEN",
"admin_id"=>"$ADMIN_ID",
"username"=>"$BOT_USERNAME"
]

];

EOF


echo "[5/6] Setting permissions..."

chown -R www-data:www-data /var/www/Quilo-bot


echo "[6/6] Done"

echo ""

echo "Quilo installed successfully"

echo "Domain: https://$DOMAIN"


fi



if [ "$choice" = "2" ]; then


echo "Deleting Quilo..."

rm -rf /var/www/Quilo-bot

echo "Deleted"



fi
