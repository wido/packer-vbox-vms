#!/bin/bash
set -e

echo "Fixing GRUB"
cat >>/etc/default/grub <<TOGRUB
GRUB_RECORDFAIL_TIMEOUT=10
GRUB_CMDLINE_LINUX_DEFAULT="\$(echo \$GRUB_CMDLINE_LINUX_DEFAULT | sed 's/\(quiet\|splash\|nomodeset\)//g') quiet"
GRUB_CMDLINE_LINUX="\$(echo \$GRUB_CMDLINE_LINUX | sed 's/\(quiet\|splash\|nomodeset\)//g') nomodeset"
TOGRUB
update-grub2

echo "Updating Apt"
apt-get update

echo "Installing packages"
apt-get -y install chrony attr vim ntpdate curl htop ncdu screen jq

echo "Cleaning up Apt"
apt-get clean

echo "Configuring SSH keys"
mkdir /root/.ssh
chmod 701 /root/.ssh
touch /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
wget -O - https://widodh.o.auroraobjects.eu/pubkey >> /root/.ssh/authorized_keys

echo "Installing HWE kernel"
apt-get update
apt-get -y install linux-virtual-hwe-16.04
apt-get clean
