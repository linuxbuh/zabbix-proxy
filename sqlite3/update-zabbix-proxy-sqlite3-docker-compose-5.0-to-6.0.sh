#!/bin/bash

cd /opt/zabbix-proxy-sqlite3

docker-compose stop

cd /

rm -f /opt/zabbix-proxy-sqlite3

mkdir /opt/zabbix-proxy-sqlite3

wget -O /opt/zabbix-proxy-sqlite3/docker-compose.yml https://raw.githubusercontent.com/linuxbuh/zabbix-proxy/main/sqlite3/zabbix-proxy-sqlite3-6.0-docker-compose.yml

git clone https://github.com/linuxbuh/zabbix-proxy.git

cp /root/zabbix-proxy/sqlite3/zabbix_proxy.psk /opt/zabbix-proxy-sqlite3/enc/zabbix_proxy.psk

cd /opt/zabbix-proxy-sqlite3

docker-compose up -d

docker ps

docker-compose logs