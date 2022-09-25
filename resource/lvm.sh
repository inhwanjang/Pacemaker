#!/bin/bash

echo "LVM and Filesystem resource configuration"
read -p "vgname: " vg
read -p "lvname: " lv
read -p "LVM resource name: " resource1
read -p "group name: " group
read -p "Filesystem resource name: " resource2
read -p "directory path name: " directory
read -p "filesystem : " filesytem

pcs resource create $resource1 LVM volgrpname=$vg exclusive=true --group $group

pcs resource create $resource2 Filesystem device="/dev/$vg/$lv" directory="$directory" fstype="$filesytem" --group $group
