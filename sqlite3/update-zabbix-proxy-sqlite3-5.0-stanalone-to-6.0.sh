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

PAKATGES=zabbix-release zabbix-agent zabbix-agent2 zabbix-proxy zabbix-proxy-sqlite3 zabbix-proxy-mysql zabbix-proxy-pgsql zabbix-sql-scripts

systemctl stop zabbix-proxy
			
systemctl stop zabbix-agent
			
systemctl stop zabbix-agent2

wget -O /tmp/install-zabbix-proxy-sqlite3-stanalone-6.0.sh https://raw.githubusercontent.com/linuxbuh/zabbix-proxy/main/sqlite3/install-zabbix-proxy-sqlite3-stanalone-6.0.sh

#Устанавливаем какие пакеты качать для Debian и Ubuntu
	if [ $PAKETMANAGER = DEB ]; then
		  						
			apt-get remove $PAKATGES
			
	fi

#Устанавливаем какие пакеты качать для Rhel? Centos и производных
	if [ $PAKETMANAGER = RPM ]; then
	  	
			yum remove $PAKATGES
			
			rm -f /etc/yum.repos.d/zabbix.repo
				
	fi

rm -f /var/lib/zabbix/zabbix_proxy_db
			
rm -f /usr/share/doc/zabbix-proxy-sqlite3/*
			
exec bash /tmp/install-zabbix-proxy-sqlite3-stanalone-6.0.sh
