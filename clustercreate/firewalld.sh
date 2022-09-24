#!/bin/bash
firewall-cmd --permanent --add-service=high-availability ; firewall-cmd --reload
systemctl start pcsd ; systemctl enable pcsd

#read -p " hacluster 의 비밀변호를 입력하십시오:" haclusterpasswd
#passwd --stdin hacluster $haclusterpasswd
