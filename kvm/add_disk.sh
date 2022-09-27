#!/bin/bash

qemu-img create -f qcow2 /VM/storage2.img 5G

virsh edit storage

<disk type='file' device='disk'>
   <driver name='qemu' type='qcow2' cache='none'/>
   <source file='/VM/storage2.img'/>
   <target dev='vda' bus='virtio'/>
</disk>


 <disk type='file' device='disk'>
      <driver name='qemu' type='qcow2' cache='none'/>
      <source file='/VM/storage2.img'/>
      <target dev='hdc' bus='ide'/>
      <address type='drive' controller='0' bus='1' target='0' unit='0'/>
    </disk>
