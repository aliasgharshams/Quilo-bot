#!/bin/bash

LOGFILE="/var/log/quilo-install.log"

exec > >(tee -a $LOGFILE)
exec 2>&1


ORANGE='\033[38;5;208m'
WHITE='\033[1;37m'
RESET='\033[0m'

VERSION=$(cat VERSION 2>/dev/null || echo "1.1.0")

clear

echo -e "$ORANGE"

cat <<'EOF'

   ┌──────────────────────────────────────────────────────────────┐
   │                                                              │
   │            ██████╗ ██╗   ██╗██╗██╗      ██████               │
   │           ██╔═══██╗██║   ██║██║██║     ██╔═══██║             │
   │           ██║   ██║██║   ██║██║██║     ██║   ██║             │
   │           ██║▄▄ ██║██║   ██║██║██║     ██║   ██║             │
   │           ╚██████╔╝╚██████╔╝██║███████╗╚██████╔╝             │ 
   │            ╚═══██╗ ╚═════╝ ╚═╝╚══════╝ ╚═════╝               │
   │                ██║                                           │
   │                ╚═╝                                           │
   └──────────────────────────────────────────────────────────────┘
EOF

echo -e "$RESET"

 
echo -e "$ORANGE   ┌───────────────┐  ┌───────────────┐  ┌────────────────────────┐$RESET"
echo -e "$ORANGE   │$RESET$WHITE Version $VERSION $ORANGE│$RESET  $ORANGE│$RESET $WHITE Quilo $WHITE BOT   $ORANGE│$RESET  $ORANGE│$RESET$WHITE Support:@Quilo_support $ORANGE│$RESET $RESET"
echo -e "$ORANGE   └───────────────┘  └───────────────┘  └────────────────────────┘$RESET"


  echo ""

echo -e   "$ORANGE   ┌─────────────────────────$WHITE MAIN MENU$ORANGE ──────────────────────────┐$RESET"
echo -e "$ORANGE   │$RESET                                                              $ORANGE│$RESET"
echo -e "$ORANGE   │$RESET$ORANGE 1.$RESET$WHITE Install Bot $RESET                                              $ORANGE│$RESET"
echo -e "$ORANGE   │$RESET$ORANGE 2.$RESET$WHITE Update Bot $RESET                                               $ORANGE│$RESET"
echo -e "$ORANGE   │$RESET$ORANGE 3.$RESET$WHITE Backup $RESET                                                   $ORANGE│$RESET"
echo -e "$ORANGE   │$RESET$ORANGE 4.$RESET$WHITE Restore  $RESET                                                 $ORANGE│$RESET"
echo -e "$ORANGE   │$RESET$ORANGE 5.$RESET$WHITE Uninstall Bot $RESET                                            $ORANGE│$RESET"
echo -e "$ORANGE   │$RESET$ORANGE 6.$RESET$WHITE Exit $RESET                                                     $ORANGE│$RESET"
echo -e "$ORANGE   └──────────────────────────────────────────────────────────────┘$RESET"

  echo ""
echo -ne "$WHITE Enter option: $RESET"

read choice

case $choice in

1|2|3|4|5|6)
    ;;
    
*)
    echo ""
    echo -e "$ORANGE Invalid option! Please select 1-6$RESET"
    sleep 2
    exec "$0"
    ;;

esac

#################################
# BACKUP
#################################

if [ "$choice" = "3" ]; then


echo ""
echo "Creating Quilo Backup..."


BACKUP_DIR="/var/backups/quilo"

mkdir -p $BACKUP_DIR


DATE=$(date +"%Y-%m-%d_%H-%M-%S")


echo "Exporting database..."


mysqldump quilo > /tmp/quilo_database.sql



echo "Compressing backup..."


mkdir -p /tmp/quilo_backup


cp /tmp/quilo_database.sql /tmp/quilo_backup/


cp -r /var/www/Quilo-bot /tmp/quilo_backup/



tar -czf \
$BACKUP_DIR/quilo_backup_$DATE.tar.gz \
-C /tmp quilo_backup



rm -rf /tmp/quilo_backup


echo ""

echo "Backup completed ✅"

echo ""

echo "Saved file:"
echo "$BACKUP_DIR/quilo_backup_$DATE.tar.gz"


exit

fi




#################################
# RESTORE
#################################

if [ "$choice" = "4" ]; then


echo ""

echo "Available backups:"


BACKUP_DIR="/var/backups/quilo"


FILES=($BACKUP_DIR/*.tar.gz)


COUNT=${#FILES[@]}


if [ "$COUNT" = "0" ]; then

echo "No backup found"

exit

fi



for i in "${!FILES[@]}"
do

echo "$((i+1))) ${FILES[$i]}"

done



echo ""

read -p "Select backup number: " NUMBER



SELECTED=${FILES[$((NUMBER-1))]}



echo ""

echo "Restoring:"

echo "$SELECTED"



echo ""

read -p "Continue? (yes/no): " CONFIRM



if [ "$CONFIRM" != "yes" ]; then

echo "Cancelled"

exit

fi



rm -rf /tmp/quilo_restore


mkdir -p /tmp/quilo_restore



tar -xzf $SELECTED -C /tmp/quilo_restore



rm -rf /var/www/Quilo-bot


cp -r /tmp/quilo_restore/quilo_backup/Quilo-bot \
/var/www/Quilo-bot



echo "Restoring database..."


mysql quilo < \
/tmp/quilo_restore/quilo_backup/quilo_database.sql



chown -R www-data:www-data /var/www/Quilo-bot


systemctl reload apache2


echo ""

echo "Restore completed ✅"


exit

fi

#################################
# UPDATE
#################################

if [ "$choice" = "2" ]; then


echo ""

echo "Updating Quilo Bot..."

cd /var/www/Quilo-bot



echo "Creating safety backup..."


mkdir -p /var/backups/quilo


tar -czf \
/var/backups/quilo/update_$(date +%Y-%m-%d_%H-%M-%S).tar.gz \
/var/www/Quilo-bot



echo "Pulling latest version..."


git pull origin main



chown -R www-data:www-data /var/www/Quilo-bot


systemctl reload apache2



echo ""

echo "Update completed ✅"


exit

fi






#################################
# INSTALL
#################################

if [ "$choice" = "1" ]; then


echo ""

echo "Starting installation..."



apt update -y



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




echo ""

echo "Downloading Quilo Bot..."



cd /var/www


rm -rf Quilo-bot


git clone \
https://github.com/aliasgharshams/Quilo-bot.git \
Quilo-bot



cd /var/www/Quilo-bot





echo ""

echo "Bot information"



read -p "Bot Token: " BOT_TOKEN

read -p "Admin Telegram ID: " ADMIN_ID

read -p "Bot Username: " BOT_USERNAME

read -p "Domain: " DOMAIN





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
],

"db"=>[
"host"=>"localhost",
"name"=>"quilo",
"user"=>"root",
"pass"=>""
]

];

EOF






echo ""

echo "Creating database..."



mysql < installer/database.sql




echo ""

echo "Configuring Apache..."



sed "s/DOMAIN_PLACEHOLDER/$DOMAIN/g" \
installer/apache.conf \
> /etc/apache2/sites-available/quilo.conf



a2ensite quilo.conf


a2enmod rewrite



systemctl reload apache2






echo ""

echo "Installing SSL..."



certbot --apache \
-d $DOMAIN \
--non-interactive \
--agree-tos \
-m admin@$DOMAIN






echo ""

echo "Setting webhook..."



curl -F "url=https://$DOMAIN/index.php" \
"https://api.telegram.org/bot$BOT_TOKEN/setWebhook"





chown -R www-data:www-data /var/www/Quilo-bot




echo ""

echo "=============================="

echo "Quilo Installed Successfully"

echo "Domain: https://$DOMAIN"

echo "=============================="


exit

fi






#################################
# UNINSTALL
#################################

if [ "$choice" = "5" ]; then



echo ""

echo "Uninstall Quilo Bot"



read -p "Are you sure? (yes/no): " CONFIRM



if [ "$CONFIRM" != "yes" ]; then

echo "Cancelled"

exit

fi



rm -rf /var/www/Quilo-bot



a2dissite quilo.conf



rm -f /etc/apache2/sites-available/quilo.conf



systemctl reload apache2



echo ""

echo "Quilo removed ✅"



exit

fi
