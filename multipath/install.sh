#!/bin/bash
my_function(command){
command
ssh root@ha2.hb "$command"
}
command="yum install device-mapper-multipath"
my_function(command)
command="mpathconf --enable"
my_function(command)

vi /etc/multipath.conf
devnode "^vd[a-z]"

partprobe

# 블랙리스트 작성
systemctl restart multipathd ; systemctl enable multipathd

lsblk
lsblk

volumelist언제 하냐?
