#!/bin/bash

cd /tmp

mkdir /opt/zabbix-proxy-sqlite3

mkdir /opt/zabbix-proxy-sqlite3/enc

wget -O /opt/zabbix-proxy-sqlite3/docker-compose.yml https://raw.githubusercontent.com/linuxbuh/zabbix-proxy/main/sqlite3/zabbix-proxy-sqlite3-5.0-docker-compose.yml

systemctl stop zabbix-proxy

systemctl disable zabbix-proxy

apt-get remove -y zabbix-proxy

systemctl stop zabbix-proxy-mysql

systemctl disable zabbix-proxy-mysql

apt-get remove -y zabbix-proxy-mysql

yum remove -y zabbix-proxy zabbix-proxy-mysql

apt-get install -y docker docker-compose git

yum install -y docker docker-compose git

systemctl enable docker

systemctl restart docker

systemctl status docker

git clone https://github.com/linuxbuh/zabbix-proxy.git

cp /tmp/zabbix-proxy/sqlite3/zabbix_proxy.psk /opt/zabbix-proxy-sqlite3/enc/zabbix_proxy.psk

cd /opt/zabbix-proxy-sqlite3

docker-compose up -d

docker ps

docker-compose logs