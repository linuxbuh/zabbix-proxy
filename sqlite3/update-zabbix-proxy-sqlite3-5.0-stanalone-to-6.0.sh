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
	
	if [ $IDLIKE_OSRELEASE = "rhel fedora" ]; then
	    PAKET=rpm
	    PAKETMANAGER=RPM
	fi

#Устанавливаем какие пакеты качать для Debian и Ubuntu
	if [ $PAKETMANAGER = DEB ]; then
		  
			wget -O 
			
			systemctl stop zabbix-proxy
			
			systemctl stop zabbix-agent
			
			systemctl stop zabbix-agent2

			apt-get remove zabbix-release zabbix-agent zabbix-agent2 zabbix-proxy zabbix-proxy-sqlite3 zabbix-proxy-mysql zabbix-proxy-pgsql zabbix-sql-scripts
			
			rm -f /var/lib/zabbix/zabbix_proxy_db
			
			rm -f /usr/share/doc/zabbix-proxy-sqlite3/*
			
			exec 
			
	fi

#Устанавливаем какие пакеты качать для Rhel? Centos и производных
	if [ $PAKETMANAGER = RPM ]; then
		  
			systemctl stop zabbix-agent
			
			systemctl stop zabbix-agent2
			
			systemctl stop zabbix-proxy

			yum remove zabbix-release zabbix-agent zabbix-agent2 zabbix-proxy zabbix-proxy-sqlite3 zabbix-proxy-mysql zabbix-proxy-pgsql zabbix-sql-scripts
			
			rm -f /var/lib/zabbix/zabbix_proxy_db
			
			rm -f /usr/share/doc/zabbix-proxy-sqlite3/*
			
			touch /var/lib/zabbix/zabbix_proxy_db
            
			chown -R zabbix:zabbix /var/lib/zabbix
			
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
			
			yum install zabbix-agent zabbix-proxy-sqlite3 zabbix-sql-scripts
			
			gunzip /usr/share/doc/zabbix-proxy-sqlite3-6.0.8/schema.sql.gz
			
			sqlite3 /var/lib/zabbix/zabbix_proxy_db < /usr/share/doc/zabbix-proxy-sqlite3-6.0.8/schema.sql
			
			git clone https://github.com/linuxbuh/zabbix-proxy.git
			
			cp -f /tmp/zabbix-proxy/sqlite3/zabbix_proxy.conf /etc/zabbix/zabbix_proxy.conf
			
			cp -f /tmp/zabbix-proxy/sqlite3/zabbix_proxy.psk /etc/zabbix/zabbix_proxy.psk
			
			systemctl start zabbix-proxy

			systemctl status zabbix-proxy
			
			git clone https://github.com/linuxbuh/zabbix-agent.git

			cp -f /root/zabbix-agent/linux/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf

			service zabbix-agent restart

			service zabbix-agent status
			
	fi

