#!/bin/bash
<disk type='file' device='disk'>
      <driver name='qemu' type='qcow2'/>
      <source file='/VM/storage2.img'/>
      <target dev='vda' bus='virtio'/>
</disk>
