#!/bin/bash

if [ -t 0 ]; then
    exec < /dev/tty
fi

clear

echo "Downloading Quilo..."

cd /tmp

rm -rf Quilo-bot

git clone https://github.com/aliasgharshams/Quilo-bot.git

cd Quilo-bot

chmod +x installer/install.sh

exec bash installer/install.sh
