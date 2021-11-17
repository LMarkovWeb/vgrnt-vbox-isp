#!/bin/bash

THIS=`readlink -f "${BASH_SOURCE[0]}"`
DIR=`dirname "${THIS}"`

cd $DIR

sudo chpasswd <<<"root:root"

sudo echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config

sudo systemctl restart sshd.service

echo 'Uptade packages'
sudo dnf makecache -y
sudo dnf update -y

dnf install wget mc -y

echo 'Install ISP Manager'
wget -P /tmp/ispmanager http://download.ispsystem.com/install.sh

sudo sh /tmp/ispmanager/install.sh ISPmanager --ispmgr6<< 'EOF'
yes
no
s
1
EOF
# Would you like to disable SELinux right now (yes/no)?
# Reboot is requred to complete the configuration of SELinux
# Which version would you like to install ?
# What version do you want to install

rm -rf /usr/local/mgr5/etc/ispmgr.lic

sudo reboot