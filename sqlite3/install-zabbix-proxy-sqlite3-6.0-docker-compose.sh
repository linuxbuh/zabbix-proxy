#!/bin/bash

cd /tmp

mkdir /opt/zabbix-proxy-sqlite3

mkdir /opt/zabbix-proxy-sqlite3/enc

cp -f /opt/zabbix-proxy-sqlite3/docker-compose.yml /tmp/zabbix-proxy/sqlite3/zabbix-proxy-sqlite3-6.0-docker-compose.yml

apt-get install docker docker-compose

yum install docker docker-compose

systemctl enable docker

systemctl restart docker

systemctl status docker

cp /tmp/zabbix-proxy/sqlite3/zabbix_proxy.psk /opt/zabbix-proxy-sqlite3/enc/zabbix_proxy.psk

cd /opt/zabbix-proxy-sqlite3

docker-compose up -d

docker ps

docker-compose logs