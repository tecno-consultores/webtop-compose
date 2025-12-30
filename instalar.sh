#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
LC_ALL=C

if [[ "$EUID" != "0" ]]; then
        echo "ERROR: Debes ser root."
        exit 1
fi

mkdir -p /var/lib/dpkg/
touch /var/lib/dpkg/lock-frontend

echo "deb https://archive.ubuntu.com/ubuntu/ noble main restricted" > /etc/apt/sources.list
echo "deb https://archive.ubuntu.com/ubuntu/ noble-updates main restricted" >> /etc/apt/sources.list
echo "deb https://archive.ubuntu.com/ubuntu/ noble universe multiverse" >> /etc/apt/sources.list
echo "deb https://archive.ubuntu.com/ubuntu/ noble-updates universe multiverse" >> /etc/apt/sources.list
echo "deb https://archive.ubuntu.com/ubuntu/ noble-security main restricted" >> /etc/apt/sources.list
echo "deb https://archive.ubuntu.com/ubuntu/ noble-security universe multiverse" >> /etc/apt/sources.list
apt update
clear
apt -y dist-upgrade
apt -y install htop nano remmina ssh xarchiver filezilla git software-properties-common gnupg2 mtr-tiny nmap smbclient net-tools wget curl
apt clean
apt -y autoremove

echo "Finalizado."
exit 0

