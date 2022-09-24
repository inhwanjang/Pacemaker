#!/bin/bash

yum install qemu-kvm libvirt virt-install bridge-utils virt-manager wget
systemctl start libvirtd && systemctl enable libvirtd
mkdir /VM
mkdir /iso
wget -P /iso/ http://mirror.navercorp.com/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-DVD-2009.iso
##size=GB / ram = MB

