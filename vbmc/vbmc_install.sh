#!/bin/bash
yum -y install python3 python3-pip libvirt-devel gcc python3-devel ipmitool
pip3 install -U pip
pip3 install virtualbmc

touch /etc/systemd/system/vbmcd.service
echo "[Install]
WantedBy = multi-user.target

[Service]
BlockIOAccounting = True
CPUAccounting = True
ExecReload = /bin/kill -HUP $MAINPID
ExecStart = /usr/bin/vbmcd --foreground
Group = root
MemoryAccounting = True
PrivateDevices = False
PrivateNetwork = False
PrivateTmp = False
PrivateUsers = False
Restart = on-failure
RestartSec = 2
Slice = vbmc.slice
TasksAccounting = True
TimeoutSec = 120
Type = simple
User = root

[Unit]
After = libvirtd.service
After = syslog.target
After = network.target
Description = vbmc service
">> /etc/systemd/system/vbmcd.service
chmod 600 /etc/systemd/system/vbmcd.service
systemctl daemon-reload && systemctl start vbmcd 
systemctl enable vbmcd
systemctl status vbmcd

## process running error: rm -rf /root/.vbmc/master.pid
