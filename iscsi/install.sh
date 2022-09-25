#!/bin/bash

yum -y install targetcli

targetcli create dev=/dev/sdb1 name=sdb1


echo "cd /backstores/block && create dev=/dev/sdb1 name=sdb1" | targetcli

echo "cd /iscsi && create wwn=iqn.2022-09.com.example:servers" | targetcli

echo "cd /iscsi/iqn.2022-09.com.example:servers/tpgl/acls '&&' create wwn=iqn.2022-09.com.example:ha1.hb.com '&&' create wwn=iqn.2022-09.com.example:ha2.hb.com" | targetcli



yum install iscsi-initiator-utils.x86_64

