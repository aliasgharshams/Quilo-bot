#!/bin/bash

LOGFILE="/var/log/quilo-install.log"

exec > >(tee -a $LOGFILE)
exec 2>&1


ORANGE='\033[38;5;208m'
WHITE='\033[1;37m'
GREEN='\033[1;32m'
RED='\033[1;31m'
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

while true
do

echo -ne "$WHITE Enter option: $RESET"

read -r choice </dev/tty

case "$choice" in

1|2|3|4|5|6)
    break
    ;;

*)
    echo ""
    echo -e "$ORANGE Invalid option! Please select 1-6$RESET"
    ;;

esac

done

case $choice in

1)
    choice=1
    ;;

2)
    choice=2
    ;;

3)
    choice=3
    ;;

4)
    choice=4
    ;;

5)
    choice=5
    ;;

6)
    exit 0
    ;;

*)
    echo ""
    echo -e "$ORANGE Invalid option! Please select 1-6$RESET"
    sleep 2
read -p "

Press Enter to return menu..." < /dev/tty

 exec "$(realpath "$0")"
    ;;

esac


#################################
# BACKUP
#################################

if [ "$choice" = "3" ]; then


echo -e "$ORANGE"
echo "Creating Quilo Backup..."
echo -e "$RESET"


BACKUP_DIR="/var/backups/quilo"

mkdir -p $BACKUP_DIR


DATE=$(date +"%Y-%m-%d_%H-%M-%S")


echo -e "$WHITE Exporting database...$RESET"

mysqldump quilo > /tmp/quilo_database.sql



echo -e "$WHITE Compressing backup...$RESET"


mkdir -p /tmp/quilo_backup


cp /tmp/quilo_database.sql /tmp/quilo_backup/


cp -r /var/www/Quilo-bot /tmp/quilo_backup/



tar -czf \
$BACKUP_DIR/quilo_backup_$DATE.tar.gz \
-C /tmp quilo_backup



rm -rf /tmp/quilo_backup


echo ""

echo -e "$GREEN Backup completed ✅ $RESET"

echo ""

echo -e "$WHITE Saved file:$RESET"

echo -e "$ORANGE $BACKUP_DIR/quilo_backup_$DATE.tar.gz $RESET"


read -p "Press Enter to return menu..." < /dev/tty

exec "$(realpath "$0")"

fi



#################################
# RESTORE
#################################

if [ "$choice" = "4" ]; then


echo ""

echo -e "$ORANGE Available backups:$RESET"


BACKUP_DIR="/var/backups/quilo"


FILES=($BACKUP_DIR/*.tar.gz)


COUNT=${#FILES[@]}


if [ "$COUNT" = "0" ]; then

echo -e "$RED No backup found $RESET"

read -p "Press Enter to return menu..."

exec "$(realpath "$0")"

fi



for i in "${!FILES[@]}"
do

echo -e "$WHITE $((i+1))) ${FILES[$i]} $RESET"

done



echo ""

read -p "Select backup number: " NUMBER



SELECTED=${FILES[$((NUMBER-1))]}



echo ""

echo -e "$ORANGE Restoring:$RESET"

echo "$SELECTED"



echo ""

read -p "Continue? (yes/no): " CONFIRM < /dev/tty



if [ "$CONFIRM" != "yes" ]; then

echo -e "$RED Cancelled $RESET"

read -p "Press Enter to return menu..." < /dev/tty

exec "$(realpath "$0")"

fi



rm -rf /tmp/quilo_restore


mkdir -p /tmp/quilo_restore



tar -xzf $SELECTED -C /tmp/quilo_restore



rm -rf /var/www/Quilo-bot


cp -r /tmp/quilo_restore/quilo_backup/Quilo-bot \
/var/www/Quilo-bot



echo -e "$WHITE Restoring database...$RESET"


mysql quilo < \
/tmp/quilo_restore/quilo_backup/quilo_database.sql



chown -R www-data:www-data /var/www/Quilo-bot


systemctl reload apache2


echo ""

echo -e "$GREEN Restore completed ✅ $RESET"


read -p "Press Enter to return menu..." < /dev/tty

exec "$(realpath "$0")"

fi


#################################
# UPDATE
#################################

if [ "$choice" = "2" ]; then


echo ""

echo -e "$ORANGE Updating Quilo Bot... $RESET"


cd /var/www/Quilo-bot



echo -e "$WHITE Creating safety backup...$RESET"


mkdir -p /var/backups/quilo


tar -czf \
/var/backups/quilo/update_$(date +%Y-%m-%d_%H-%M-%S).tar.gz \
/var/www/Quilo-bot



echo -e "$WHITE Pulling latest version...$RESET"


git pull origin main



chown -R www-data:www-data /var/www/Quilo-bot


systemctl reload apache2



echo ""

echo -e "$GREEN Update completed ✅ $RESET"


read -p "Press Enter to return menu..." < /dev/tty

exec "$(realpath "$0")"

fi




#################################
# INSTALL
#################################

if [ "$choice" = "1" ]; then


echo ""

echo -e "$ORANGE Starting installation...$RESET"



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

echo -e "$WHITE Downloading Quilo Bot...$RESET"



cd /var/www


rm -rf Quilo-bot


git clone \
https://github.com/aliasgharshams/Quilo-bot.git \
Quilo-bot



cd /var/www/Quilo-bot





echo ""

echo -e "$WHITE Bot information$RESET"



read -p "Bot Token: " BOT_TOKEN

read -p "Admin Telegram ID: " ADMIN_ID

read -p "Bot Username: " BOT_USERNAME

read -p "Domain: " DOMAIN





cat > app/config/config.php <<EOF
<?php

return [

"version"=>"1.2.4",

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

echo -e "$WHITE Creating database...$RESET"


mysql < installer/database.sql




echo ""

echo -e "$WHITE Configuring Apache...$RESET"



sed "s/DOMAIN_PLACEHOLDER/$DOMAIN/g" \
installer/apache.conf \
> /etc/apache2/sites-available/quilo.conf



a2ensite quilo.conf


a2enmod rewrite



systemctl reload apache2






echo ""

echo -e "$WHITE Installing SSL...$RESET"



certbot --apache \
-d $DOMAIN \
--non-interactive \
--agree-tos \
-m admin@$DOMAIN






echo ""

echo -e "$WHITE Setting webhook...$RESET"



curl -F "url=https://$DOMAIN/index.php" \
"https://api.telegram.org/bot$BOT_TOKEN/setWebhook"





chown -R www-data:www-data /var/www/Quilo-bot




echo ""

echo "=============================="

echo -e "$GREEN Quilo Installed Successfully ✅ $RESET"

echo -e "$ORANGE Domain: https://$DOMAIN $RESET"

echo "=============================="


read -p "Press Enter to return menu..." < /dev/tty

exec "$(realpath "$0")"

fi

#################################
# UNINSTALL
#################################

if [ "$choice" = "5" ]; then


echo ""

echo -e "$ORANGE Uninstall Quilo Bot $RESET"



read -p "Are you sure? (yes/no): " CONFIRM < /dev/tty

if [ "$CONFIRM" != "yes" ]; then

echo "Cancelled"

read -p "Press Enter to return menu..." < /dev/tty

exec "$(realpath "$0")"

fi

rm -rf /var/www/Quilo-bot


echo ""

echo -e "$WHITE Removing Quilo files...$RESET"


rm -rf /var/www/Quilo-bot



echo -e "$WHITE Disabling Apache site...$RESET"


a2dissite quilo.conf 2>/dev/null



rm -f /etc/apache2/sites-available/quilo.conf



systemctl reload apache2



echo ""

echo -e "$GREEN Quilo removed successfully ✅ $RESET"

read -p "Press Enter to return menu..." < /dev/tty

exit 0


fi
