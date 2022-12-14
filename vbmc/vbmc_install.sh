#!/bin/bash
yum -y install python3 python3-pip libvirt-devel gcc python3-devel ipmitool net-tools
pip3 install -U pip
pip3 install virtualbmc







:<<'END'
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
END
## process running error: rm -rf /root/.vbmc/master.pid


ssh-keygen -t rsa
read -p "kvm ip : " ip
read -p "kvm hostname : " host
read -p "kvm password : " passwd
echo "$ip $host " >> /etc/hosts

ssh-copy-id root@$host

echo "ipmi's username -> irmc or ilo login ID "
read -p "ipmi's username : " username
read -p "ipmi's password : " password
read -p "host1's name : " host1
read -p "host1's port1 : " port1

read -p "host2's name : " host2
read -p "host2's port2 : " port2
vbmcd


firewall-cmd --permanent --add-port=$port1/udp
firewall-cmd --permanent --add-port=$port2/udp
firewall-cmd --reload

vbmc add --username $username --password $password --port $port1 --libvirt-uri qemu+ssh://root@$host/system $host1
vbmc add --username $username --password $password --port $port2 --libvirt-uri qemu+ssh://root@$host/system $host2

vbmc start $host1
vbmc start $host2

vbmc list


netstat -anup |grep -i $port1
netstat -anup |grep -i $port2

