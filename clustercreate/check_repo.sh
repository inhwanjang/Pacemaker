#!/bin/bash

bb=$(find /etc/yum.repos.d/ -name cd.repo)
if [ "${bb}" = "/etc/yum.repos.d/cd.repo" ]; then
	echo "cd.repo가 있습니다."
	echo "넘어갑니다"
else
	echo "cd.repo가 없습니다."
	echo " cd.repo를 만들겠습니다."
	sleep 1
	touch /etc/yum.repos.d/cd.repo
	echo "[cd]" >> /etc/yum.repos.d/cd.repo
	echo "name=cd" >> /etc/yum.repos.d/cd.repo
	echo "baseurl=file:///media" >> /etc/yum.repos.d/cd.repo
	echo "gpgehck=0" >> /etc/yum.repos.d/cd.repo
	echo "enabled=1" >> /etc/yum.repos.d/cd.repo
	echo "gpgkey=file:///media/RPM-GPG-KEY-CentOS-7" >> /etc/yum.repos.d/cd.repo
	mkdir /etc/yum.repos.d/backup
	mv /etc/yum.repos.d/C* /etc/yum.repos.d/backup/
fi
exit

