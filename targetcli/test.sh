yum install targetcli
targetcli
cd /backstores/block
create dev=/dev/sdb1 name=sdb1
cd /iscsi
create wwn=iqn.2022-09.com.example:servers
cd iqn.2022-09.com.example:servers/tpg1/acls
create wwn=iqn.2022-09.com.example:ha1.hb.com
create wwn=iqn.2022-09.com.example:ha2.hb.com

cd /iscsi/iqn.2022-08.com.example:servers/tpgl/luns
create /backstores/block/sdb1
exit
firewall-cmd --permanent --add-port=3260/tcp && firewall-cmd --reload
systemctl start target && systemctl enable target

ha1 , ha2 )

yum -y install iscsi-initiator-utils


