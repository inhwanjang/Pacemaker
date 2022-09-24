#!/bin/bash
yum install qemu-kvm libvirt virt-install bridge-utils virt-manager
systemctl start libvirtd && systemctl enable libvirtd
mkdir /VM
virt-install --name ha1 --ram 2048 --disk path=/VM/ha1.img,size=15 --vcpus 1 --os-type linux --network bridge=virbr0--graphics none --console pty,target_type=serial --location /iso/CentOS-7.9-x86_64-DVD-2009.iso --extra-args 'console=ttyS0,115200n8 serial'
virt-install --name ha2 --ram 2048 --disk path=/VM/ha2.img,size=15 --vcpus 1 --os-type linux --network bridge=virbr0--graphics none --console pty,target_type=serial --location /iso/CentOS-7.9-x86_64-DVD-2009.iso --extra-args 'console=ttyS0,115200n8 serial'
virt-install --name storage --ram 2048 --disk path=/VM/storage.img,size=15 --vcpus 1 --os-type linux --network bridge=virbr0--graphics none --console pty,target_type=serial --location /iso/CentOS-7.9-x86_64-DVD-2009.iso --extra-args 'console=ttyS0,115200n8 serial'

