#!/bin/bash

qemu-img create -f qcow2 /VM/storage2.img 5G

virsh edit storage

<disk type='file' device='disk'>
   <driver name='qemu' type='qcow2' cache='none'/>
   <source file='/VM/storage2.img'/>
   <target dev='vda' bus='virtio'/>
</disk>
