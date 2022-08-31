#!/bin/bash

cd /tmp

#Определяем дистрибутив
source /etc/os-release
#source /tmp/os-release
OSRELEASE=$ID
IDLIKE_OSRELEASE=$ID_LIKE
VERSION_OSRELEASE=$VERSION_ID

echo -e "\e[1;33;4;44mВаш дистрибутив LINUX - $OSRELEASE\e[0m"

	if [ $OSRELEASE = debian ]; then
	    PAKET=deb
	    PAKETMANAGER=DEB
	fi
	
	if [ $OSRELEASE = ubuntu ]; then
	    PAKET=deb
	    PAKETMANAGER=DEB
	fi
	
	if [ $OSRELEASE = rhel ]; then
	    PAKET=rpm
	    PAKETMANAGER=RPM
	fi

	if [ $OSRELEASE = fedora ]; then
	    PAKET=rpm
	    PAKETMANAGER=RPM
	fi
	
	if [ $OSRELEASE = centos ]; then
	    PAKET=rpm
	    PAKETMANAGER=RPM
	fi
	
	if [ $OSRELEASE = almalinux ]; then
	    PAKET=rpm
	    PAKETMANAGER=RPM
	fi



systemctl stop zabbix-proxy
			
systemctl stop zabbix-agent
			
systemctl stop zabbix-agent2

#Устанавливаем какие пакеты качать для Debian и Ubuntu
	if [ $PAKETMANAGER = DEB ]; then
		
		apt-get remove -y zabbix-proxy-sqlite3 zabbix-proxy zabbix-agent2
		
		rm -Rf /etc/apt/sources.list.d/zabbix.list
		
		if [ $VERSION_OSRELEASE = 11 ]; then
			
			wget -O /tmp/zabbix-release_6.0-3%2Bdebian11_all.deb https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-3%2Bdebian11_all.deb

			dpkg -i /tmp/zabbix-release_6.0-3%2Bdebian11_all.deb
			
		fi
		
		if [ $VERSION_OSRELEASE = 10 ]; then
			
			wget -O /tmp/zabbix-release_6.0-3%2Bdebian10_all.deb https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-3%2Bdebian10_all.deb

			dpkg -i /tmp/zabbix-release_6.0-3%2Bdebian10_all.deb
			
		fi
		
		if [ $VERSION_OSRELEASE = 9 ]; then
			
			wget -O /tmp/zabbix-release_6.0-3%2Bdebian9_all.deb https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-3%2Bdebian9_all.deb

			dpkg -i /tmp/zabbix-release_6.0-3%2Bdebian9_all.deb
			
		fi
		
		if [ $VERSION_OSRELEASE = 22.04 ]; then
			
			wget -O /tmp/zabbix-release_6.0-3%2Bubuntu22.04_all.deb https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3%2Bubuntu22.04_all.deb

			dpkg -i /tmp/zabbix-release_6.0-3%2Bubuntu22.04_all.deb
			
		fi
		
		if [ $VERSION_OSRELEASE = 20.04 ]; then
			
			wget -O /tmp/zabbix-release_6.0-3%2Bubuntu20.04_all.deb https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3%2Bubuntu20.04_all.deb

			dpkg -i /tmp/zabbix-release_6.0-3%2Bubuntu20.04_all.deb
			
		fi
		
		if [ $VERSION_OSRELEASE = 18.04 ]; then
			
			wget -O /tmp/zabbix-release_6.0-3%2Bubuntu18.04_all.deb https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3%2Bubuntu18.04_all.deb

			dpkg -i /tmp/zabbix-release_6.0-3%2Bubuntu18.04_all.deb
			
		fi
		
		if [ $VERSION_OSRELEASE = 16.04 ]; then
			
			wget -O /tmp/zabbix-release_6.0-3%2Bubuntu16.04_all.deb https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3%2Bubuntu16.04_all.deb

			dpkg -i /tmp/zabbix-release_6.0-3%2Bubuntu16.04_all.deb
			
		fi
		
		if [ $VERSION_OSRELEASE = 14.04 ]; then
			
			wget -O /tmp/zabbix-release_6.0-3%2Bubuntu14.04_all.deb https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3%2Bubuntu14.04_all.deb

			dpkg -i /tmp/zabbix-release_6.0-3%2Bubuntu14.04_all.deb
			
		fi
			
			apt-get update
			
			apt-get remove -y zabbix-agent2
			
			apt-get install --only-upgrade -y zabbix-agent zabbix-proxy-sqlite3 zabbix-sql-scripts git zabbix-proxy
			
	fi

#Устанавливаем какие пакеты качать для Rhel? Centos и производных
	if [ $PAKETMANAGER = RPM ]; then
	  	
		yum remove -y zabbix-proxy zabbix-proxy-sqlite3 zabbix-release zabbix-agent2
		
		yum install -y deltarpm pcre2
		
		if [ $VERSION_OSRELEASE = 9 ]; then
			
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-release-6.0-3.el9.noarch.rpm
		
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-proxy-sqlite3-6.0.8-release1.el9.x86_64.rpm
			
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-sql-scripts-6.0.8-release1.el9.noarch.rpm
					
		fi
		
		if [ $VERSION_OSRELEASE = 8 ]; then
			
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-release-6.0-2.el8.noarch.rpm
			
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-proxy-sqlite3-6.0.8-release1.el8.x86_64.rpm
			
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-sql-scripts-6.0.8-release1.el8.noarch.rpm
					
		fi
		
		if [ $VERSION_OSRELEASE = 7 ]; then
			
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-release-6.0-2.el7.noarch.rpm
			
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-proxy-sqlite3-6.0.8-release1.el7.x86_64.rpm
			
			rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-sql-scripts-6.0.8-release1.el7.noarch.rpm
					
		fi
					
	fi
	
git clone https://github.com/linuxbuh/zabbix-proxy.git
			
cp -f /tmp/zabbix-proxy/sqlite3/zabbix_proxy.conf /etc/zabbix/zabbix_proxy.conf
			
cp -f /tmp/zabbix-proxy/sqlite3/zabbix_proxy.psk /etc/zabbix/zabbix_proxy.psk

systemctl start zabbix-proxy
			
systemctl status zabbix-proxy

wget -O /tmp/update-zabbix-agent-stanalone-5.0-to-6.0.sh https://raw.githubusercontent.com/linuxbuh/zabbix-agent/main/linux/update-zabbix-agent-stanalone-5.0-to-6.0.sh

exec bash /tmp/update-zabbix-agent-stanalone-5.0-to-6.0.sh
			

