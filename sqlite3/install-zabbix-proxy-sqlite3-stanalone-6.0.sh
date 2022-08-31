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

	
mkdir /var/lib/zabbix

mkdir /var/run/zabbix
			
touch /var/lib/zabbix/zabbix_proxy_db
            
chown -R zabbix:zabbix /var/lib/zabbix

chown -R zabbix:zabbix /var/run/zabbix

wget -O /tmp/install-zabbix-agent-stanalone-6.0.sh https://raw.githubusercontent.com/linuxbuh/zabbix-agent/main/linux/install-zabbix-agent-stanalone-6.0.sh

#Устанавливаем какие пакеты качать для Debian и Ubuntu
	if [ $PAKETMANAGER = DEB ]; then
		  			
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
			
			apt-get install -y zabbix-agent zabbix-proxy-sqlite3 zabbix-sql-scripts git
			
			sqlite3 /var/lib/zabbix/zabbix_proxy_db < /usr/share/doc/zabbix-proxy-sqlite3/schema.sql
	
			
	fi

#Устанавливаем какие пакеты качать для Rhel? Centos и производных
	if [ $PAKETMANAGER = RPM ]; then
		  
			mkdir /var/lib/zabbix
			
			touch /var/lib/zabbix/zabbix_proxy_db
            
			chown -R zabbix:zabbix /var/lib/zabbix
			
			yum install -y deltarpm
			
		if [ $VERSION_OSRELEASE = 9 ]; then
			
			rpm -ivh https://repo.zabbix.com/zabbix/6.0/rhel/9/x86_64/zabbix-release-6.0-3.el9.noarch.rpm
					
		fi
		
		if [ $VERSION_OSRELEASE = 8 ]; then
			
			rpm -ivh https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-release-6.0-2.el8.noarch.rpm
					
		fi
		
		if [ $VERSION_OSRELEASE = 7 ]; then
			
			rpm -ivh https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-release-6.0-2.el7.noarch.rpm
					
		fi
		
		if [ $VERSION_OSRELEASE = 6 ]; then
			
			rpm -ivh https://repo.zabbix.com/zabbix/6.0/rhel/6/x86_64/zabbix-release-6.0-2.el6.noarch.rpm
					
		fi
		
	
			yum update
			
			yum install -y zabbix-agent zabbix-proxy-sqlite3 zabbix-sql-scripts git
			
			gunzip /usr/share/doc/zabbix-proxy-sqlite3-6.0.8/schema.sql.gz
			
			sqlite3 /var/lib/zabbix/zabbix_proxy_db < /usr/share/doc/zabbix-proxy-sqlite3-6.0.8/schema.sql
			
			
	fi

			
git clone https://github.com/linuxbuh/zabbix-proxy.git
			
cp -f /tmp/zabbix-proxy/sqlite3/zabbix_proxy.conf /etc/zabbix/zabbix_proxy.conf
			
cp -f /tmp/zabbix-proxy/sqlite3/zabbix_proxy.psk /etc/zabbix/zabbix_proxy.psk
			
systemctl start zabbix-proxy

systemctl status zabbix-proxy

exec bash /tmp/install-zabbix-agent-stanalone-6.0.sh