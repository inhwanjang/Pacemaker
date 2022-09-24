#!/bin/bash
touch /result
cd /etc/sysconfig/network-scripts/
cp ifcfg-ens33 ifcfg-ens33.backup
echo "DEVICE=ens33" > ifcfg-ens33
echo "ONBOOT=yes" >> ifcfg-ens33
echo "BRIDGE=br0" >> ifcfg-ens33

touch ifcfg-br0
echo "TYPE=Bridge
BOOTPROTO=none
IPADDR=192.168.0.150
NETMASK=255.255.255.0
GATEWAY=192.168.0.1
DNS1=8.8.8.8
DEVICE=br0
ONBOOT=yes
" >> ifcfg-br0
systemctl restart network
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
brctl show >> /result

yum -y install qemu-kvm libvirt virt-install bridge-utils virt-manager wget
systemctl start libvirtd && systemctl enable libvirtd
mkdir /VM
mkdir /iso

echo "This is two node cluster configuration"
read -p "continue ? : " answer
if [ $answer == yes ];then
bash ./nodecreate.sh

fi
wget -P /iso/ http://mirror.navercorp.com/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-DVD-2009.iso 
##size=GB / ram = MB
read -p "node name : " node
virt-install --name $node --ram 2048 \
--disk path=/VM/$node.img,size=15 --vcpus 1 \
--os-type linux --network bridge=br0 --graphics none \
--console pty,target_type=serial --location \
/iso/CentOS-7-x86_64-DVD-2009.iso \
--extra-args 'console=ttyS0,115200n8 serial'

read -p "node name: " node
virt-install --name $node --ram 2048 \
--disk path=/VM/$node.img,size=15 --vcpus 1 \
--os-type linux --network bridge=br0 --graphics none \
--console pty,target_type=serial --location \
/iso/CentOS-7-x86_64-DVD-2009.iso \
--extra-args 'console=ttyS0,115200n8 serial'
