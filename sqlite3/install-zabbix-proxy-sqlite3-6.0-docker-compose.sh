#!/bin/bash

cd /root

mkdir /opt/zabbix-proxy-sqlite3

mkdir /opt/zabbix-proxy-sqlite3/enc

wget -O /opt/zabbix-proxy-sqlite3/docker-compose.yml https://raw.githubusercontent.com/linuxbuh/zabbix-proxy/main/sqlite3/zabbix-proxy-sqlite3-6.0-docker-compose.yml

apt-get install docker docker-compose git

yum install docker docker-compose git

systemctl enable docker

systemctl restart docker

systemctl status docker

git clone https://github.com/linuxbuh/zabbix-proxy.git

cp /root/zabbix-proxy/sqlite3/zabbix_proxy.psk /opt/zabbix-proxy-sqlite3/enc/zabbix_proxy.psk

cd /opt/zabbix-proxy-sqlite3

docker-compose up -d

docker ps

docker-compose logs