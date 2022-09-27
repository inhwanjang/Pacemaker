#!/bin/bash




virsh net-list --all

vi internal1.xml

<network>
 <name>internal1</name>
 <bridge name='virbr1'/>
</network>

virsh net-define internal1.xml

virsh net-autostart internal1
virsh net-start internal1

<interface type='network'>
 <source network='internal1'/>
 <model type='virtio'/>
</interface>

systemctl restart libvirtd
