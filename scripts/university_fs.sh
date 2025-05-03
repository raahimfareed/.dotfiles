#! /bin/bash

ip=172.16.0.15

if [[ -z "$1" ]]; then
	printf "Please provide a name or path!\nUsage: mount_uni path_to_mount.\n"
	exit 1
fi

[ ! -d "/mnt/university/$1" ] && sudo mkdir -p /mnt/university/$1

sudo mount -t cifs //$ip/$1\$ /mnt/university/$1 -o username=bse203039

