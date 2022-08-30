#!/bin/bash

cd /root

rpm -ivh https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-release-6.0-2.el7.noarch.rpm

yum install zabbix-agent zabbix-proxy-sqlite3 zabbix-sql-scripts

gunzip /usr/share/doc/zabbix-proxy-sqlite3-6.0.8/schema.sql.gz

mkdir /var/lib/zabbix
touch /var/lib/zabbix/zabbix_proxy_db
chown -R zabbix:zabbix /var/lib/zabbix

sqlite3 /var/lib/zabbix/zabbix_proxy_db < /usr/share/doc/zabbix-proxy-sqlite3-6.0.8/schema.sql

yum install git

git clone https://github.com/linuxbuh/zabbix-proxy.git

cp /root/zabbix-proxy/sqlite3/zabbix_proxy.conf /etc/zabbix/zabbix_proxy.conf
cp /root/zabbix-proxy/sqlite3/zabbix_proxy.psk /etc/zabbix/zabbix_proxy.psk

ufw allow 10050:10051/tcp
ufw allow 10050:10051/udp

systemctl enable zabbix-proxy

systemctl restart zabbix-proxy

systemctl status zabbix-proxy