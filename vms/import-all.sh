#!/bin/bash
set -e

VBOX_DATA_DIR="${HOME}/VirtualBox VMs"

cd `dirname $0`

for VM in $(find build/ -name '*.ova'); do
    VBoxManage import $VM
done
