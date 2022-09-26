#!/bin/bash

echo " iscsi 연결 명령어 " 

echo " 진행하시겠습니까? "



yum -y install iscsi-initiator-utils
ssh root@ha2.hb "yum -y install iscsi-initiator-utils"
echo "InitiatorName=iqn.2022-09.com.example:ha1.hb" > /etc/iscsi/initiatorname.iscsi

ssh root@ha2.hb "echo \"InitiatorName=iqn.2022-09.com.example:ha2.hb\" > /etc/iscsi/initiatorname.iscsi"


systemctl restart iscsid 
ssh root@ha2.hb "systemctl restart iscsid";

iscsiadm -m discovery -t st -p 192.168.0.117
iscsiadm -m discovery -t st -p 192.168.0.118

iscsiadm -m node -T iqn.2022-09.com.example:servers -p 192.168.0.117 -l
iscsiadm -m node -T iqn.2022-09.com.example:servers -p 192.168.0.118 -l


ssh root@ha2.hb "iscsiadm -m discovery -t st -p 192.168.0.117"
ssh root@ha2.hb "iscsiadm -m discovery -t st -p 192.168.0.118"
ssh root@ha2.hb "iscsiadm -m node -T iqn.2022-09.com.example:servers -p 192.168.0.117 -l"
ssh root@ha2.hb "iscsiadm -m node -T iqn.2022-09.com.example:servers -p 192.168.0.118 -l"

lsblk

ssh root@ha2.hb "lsblk"
