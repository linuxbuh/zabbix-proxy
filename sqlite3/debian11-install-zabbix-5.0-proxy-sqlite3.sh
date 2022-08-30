#!/bin/bash

cd /root

wget https://repo.zabbix.com/zabbix/5.0/debian/pool/main/z/zabbix-release/zabbix-release_5.0-1%2Bbullseye_all.deb

dpkg -i zabbix-release_5.0-1%2Bbullseye_all.deb

apt-get update
apt-get install zabbix-proxy-sqlite3

gunzip /usr/share/doc/zabbix-proxy-sqlite3/schema.sql.gz

mkdir /var/lib/zabbix
touch /var/lib/zabbix/zabbix_proxy_db
chown -R zabbix:zabbix /var/lib/zabbix

sqlite3 /var/lib/zabbix/zabbix_proxy_db < /usr/share/doc/zabbix-proxy-sqlite3/schema.sql

apt install git

git clone https://github.com/linuxbuh/zabbix-proxy.git

cp /root/zabbix-proxy/sqlite3/zabbix_proxy.conf /etc/zabbix/zabbix_proxy.conf
cp /root/zabbix-proxy/sqlite3/zabbix_proxy.psk /etc/zabbix/zabbix_proxy.psk

ufw allow 10050:10051/tcp
ufw allow 10050:10051/udp

systemctl enable zabbix-proxy

systemctl restart zabbix-proxy

systemctl status zabbix-proxy