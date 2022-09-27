#!/bin/bash
##############################################################
line(){
echo "#######################################################"
echo "#######################################################"
}
#############################################################
line
echo "HA 클러스터 구성 script"
line
#############################################################
echo "사전 설정 진행합니다."
read -p "node1의 HB IP: " ip1
read -p "node1의 hostname: " host1
read -p "node1의 Service IP: " ip3
read -p "node2의 HB IP: " ip2
read -p "node2의 hostname: " host2
read -p "node2의 service IP: " ipv4
read -p "vip : " vip
#############################################################
echo "keygen을 설정합니다."
ssh_mkdir="mkdir ~/.ssh"
ssh_chmod="chmod 700 ~/.ssh"
ssh-keygen -t rsa 
key=$(cat ~/.ssh/id_rsa.pub)
echo "$ip2의 비밀번호를 입력하세요"
echo "$ip2 키 구성"
ssh root@$ip2 "$ssh_mkdir && $ssh_chmod && echo $key >> ~/.ssh/authorized_keys"


#############################################################
echo "hosts파일을 수정합니다."
echo "$ip1 $host1.hb" >> /etc/hosts 
echo "$ip2 $host2.hb" >> /etc/hosts 
echo "$ip3 $host1" >> /etc/hosts
echo "$ip4 $host2" >> /etc/hosts
ssh root@$ip2 "echo "$ip1 $host1" >> /etc/hosts"
ssh root@$ip2 "echo "$ip2 $host2" >> /etc/hosts"
#############################################################
clear
#############################################################
#############################################################
clear
#############################################################
echo "ISO 파일 마운트 확인"
script='check_mount.sh'
./check_mount.sh
echo "$host2 설정"
cat $script | ssh root@$ip2 "sh"
#############################################################
clear
#############################################################
echo "cd.repo파일 확인"
script='check_repo.sh'
./check_repo.sh
echo "$host2 설정"
cat $script | ssh root@$ip2 "sh"
#############################################################
clear
#############################################################
echo "Package를 설치합니다."
echo "pcs pacemaker corosync를 설치합니다"
script='install.sh'
./install.sh
cat $script | ssh root@$ip2 "sh"

#############################################################
clear

#############################################################
#firewalld 설정 및 hacluster pass 설정"
echo "방화벽 설정 및 서비스 시작 " 

script='firewalld.sh'
./firewalld.sh
cat $script | ssh root@$ip2 "sh"
#############################################################
clear

#############################################################
#read -p "$ip1의 hacluster의 비밀번호를 입력하세요: " num1

#echo $num1 | passwd --stdin hacluster

#read -p "$ip2의 hacluster의 비밀번호를 입력하세요: " num2
#ssh root@$ip2 "echo $num2 | passwd --stdin hacluster"



read -p "$ip1의 hacluster의 비밀번호를 입력하세요: " num1

echo $num1 | passwd --stdin hacluster

read -p "$ip2의 hacluster의 비밀번호를 입력하세요: " num2
echo "num2="$num2" " >> hacluster_passwd.sh

echo "echo $num2 | passwd --stdin hacluster" >> hacluster_passwd.sh


script="hacluster_passwd.sh"
cat $script | ssh root@$ip2 "sh"

#############################################################


#############################################################
echo "클러스터 권한을 인증합니다."
pcs cluster auth -u hacluster -p $num2 "$host1.hb" "$host2.hb"
#############################################################

#############################################################
echo "클러스터 구성"
read -p "설정할 클러스터의 이름을 입력 하세요 : " name
pcs cluster setup --start --name $name "$host1.hb" "$host2.hb"
#############################################################


