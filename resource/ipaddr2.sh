#!bin/bash

read -p "resource name : " name
read -p "vip ip : " ip
read -p "cidr_netmask : " mask
read -p "group name : " group

pcs resource create $name IPaddr2 ip=$ip cidr_netmask=$mask --group $group