#!/bin/bash
echo "Virtualmachine create"

myfunction(){
read -p "clone ? [y/n] : " answer
case $answer in
  [y]* ) read -p "how many clone? [number]" clone;;
  [n]* ) echo "only one virtual machine create";;
  * ) echo " only y or n " &&  myfunction;;
esac
}
myfunction

read -p "node name : " node
virt-install --name $node --ram 2048 \
--disk path=/VM/$node.img,size=15 --vcpus 1 \
--os-type linux --network bridge=br0 --graphics none \
--console pty,target_type=serial --location \
/iso/CentOS-7-x86_64-DVD-2009.iso \
--extra-args 'console=ttyS0,115200n8 serial'

virt-clone --original $node --name $node-2 --file /VM/$node-2.img 
