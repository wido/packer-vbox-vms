#!/bin/sh
set -e

echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

echo "cleaning up udev rules"
touch /etc/udev/rules.d/70-persistent-net.rules
chattr +i /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/

echo "removing history"
unset HISTFILE
