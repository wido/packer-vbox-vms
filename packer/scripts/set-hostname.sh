#!/bin/sh
set -eu

echo $1 > /etc/hostname
hostnamectl set-hostname $1
sed -i "s|base|${1}|g" /etc/hosts
