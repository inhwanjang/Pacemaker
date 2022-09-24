#!/bin/bash

read -p "username : " username
read -p "password : " password
read -p "host1 : " host1
read -p "host1's port1 : " port1

read -p "host2 : " host2
read -p "host2's port2 : " port2


vbmc add --username $username --password $password --port $port1 --libvirt-uri qemu:///system $host1
vbmc add --username $username --password $password --port $port2 --libvirt-uri qemu:///system $host2

vbmc start $host1
vbmc start $host2

vbmc list
