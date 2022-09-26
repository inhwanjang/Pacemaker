yum -y install targetcli



echo "cd /backstores/block" | targetcli
echo "create dev=/dev/vda1 name=vda1" | targetcli
echo "cd /iscsi " | targetcli
echo "create wwn=iqn.2022-09.com.example:servers" | targetcli

echo "cd /iscsi/iqn.2022-09.com.example:servers/tpg1/acls" | targetcli
echo "create wwn=iqn.2022-09.com.example:ha1.hb" | targetcli 
echo "create wwn=iqn.2022-09.com.example:ha2.hb" | targetcli
echo "cd /iscsi/iqn.2022-09.com.example:servers/tpg1/luns " | targetcli
echo "create /backstores/block/vda1" | targetcli


firewall-cmd --permanent --add-port=3260/tcp && firewall-cmd --reload
systemctl start target && systemctl enable target



