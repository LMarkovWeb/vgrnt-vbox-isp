#!/bin/bash

THIS=`readlink -f "${BASH_SOURCE[0]}"`
DIR=`dirname "${THIS}"`

cd $DIR

sudo chpasswd <<<"root:root"

sudo echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config

sudo systemctl restart sshd.service

echo 'Download VM Manager ver.6 in /tmp/'
curl -O http://download.ispsystem.com/6/installer/vm/vm
chmod +x vm

sestatus
echo 'Disable Selinux'
echo "SELINUX=disabled" > /etc/selinux/config;

echo 'Reboot VM'
reboot