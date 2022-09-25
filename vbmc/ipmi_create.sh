#!/bin/bash
ssh-keygen -t rsa
read -p "kvm ip : " ip
read -p "kvm hostname : " host
echo "$ip $host " >> /etc/hosts

ssh-copy-id root@$host


read -p "username : " username
read -p "password : " password
read -p "host1 : " host1
read -p "host1's port1 : " port1

read -p "host2 : " host2
read -p "host2's port2 : " port2
vbmcd


vbmc add --username $username --password $password --port $port1 --libvirt-uri qemu+ssh://root@$host/system $host1
vbmc add --username $username --password $password --port $port2 --libvirt-uri qemu+ssh://root@$host/system $host2

vbmc start $host1
vbmc start $host2

vbmc list
