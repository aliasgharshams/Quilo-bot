#!/bin/bash

set -e

echo "Updating Quilo Bot..."

cd /var/www

echo "Creating backup..."

mkdir -p /var/backups/quilo

mysqldump quilo > /var/backups/quilo/update_$(date +%Y-%m-%d_%H-%M-%S).sql

cp -r Quilo-bot /var/backups/quilo/update_files_$(date +%Y-%m-%d_%H-%M-%S)


echo "Updating files..."

cd /var/www/Quilo-bot

git fetch origin

git checkout main

git pull origin main


echo "Restoring permissions..."

chown -R www-data:www-data /var/www/Quilo-bot


echo "Restarting Apache..."

systemctl reload apache2


echo "Update completed successfully!"
