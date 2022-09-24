#!/bin/bash
echo " Two node cluster ..."
echo "10seconds...if you won't that you pause ctrl + c"
sleep 10;

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

read -p "node name: " node
virt-install --name $node --ram 2048 \
--disk path=/VM/$node.img,size=15 --vcpus 1 \
--os-type linux --network bridge=br0 --graphics none \
--console pty,target_type=serial --location \
/iso/CentOS-7-x86_64-DVD-2009.iso \
--extra-args 'console=ttyS0,115200n8 serial'
