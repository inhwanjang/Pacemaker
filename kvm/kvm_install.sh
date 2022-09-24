#!/bin/bash
myfunction(){
read -p "continue ? [y/n] : " answer
case $answer in
  [y]* ) bash ./node_create.sh;;
  [n]* ) echo "Bye";;
  * ) echo " only y or n " &&  myfunction;;
esac
}
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
wget -P /iso/ http://mirror.navercorp.com/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-DVD-2009.iso 
echo "This is two node cluster configuration"
myfunction
