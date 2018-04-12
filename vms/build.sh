#!/bin/sh
set -e

cd $(dirname $0)

find build -type f -name '*.ova' -delete
find build -type f -name '*.ovf' -delete
find build -type f -name '*.vmdk' -delete
find build -type f -name '*.vdi' -delete

PACKER_CACHE_DIR="../packer/.packer_cache" packer build ubuntu1604.json
