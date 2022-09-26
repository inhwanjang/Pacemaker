#!/bin/bash

yum -y install targetcli



echo "cd /backstores/block" | targetcli
echo "create dev=/dev/vda1 name=vda1" | targetcli
echo "cd /iscsi " | targetcli
echo "create wwn=iqn.2022-09.com.example:servers" | targetcli

echo "cd /iscsi/iqn.2022-09.com.example:servers/tpg1/acls " | targetcli
echo "create wwn=iqn.2022-09.com.example:ha1.hb.com " | targetcli 
echo "create wwn=iqn.2022-09.com.example:ha2.hb.com" | targetcli




