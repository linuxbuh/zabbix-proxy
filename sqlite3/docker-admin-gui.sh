#!/bin/bash

echo
echo -e "\e[1;31;42mУпроаление Docker контейнером\e[0m"
echo
PS3='Выберите (нажмите цифру - Посмотреть логи 1, остановить 2, запустить 3, перезапустить 4, войти в оборочку 5 ): '
echo
select VIBOR in "Логи" "Остановить" "Запустить" "Перезапустить" "Облочка"
do
  echo
  echo -e "\e[1;34;4mВы выбрали $VIBOR\e[0m"
  echo
  break
done
#
#Проверка
if [[ -z "$VIBOR" ]];then
    echo  -e "\e[31mВы не выбрали\e[0m"
    exit 1
fi
#

if [ $VIBOR = "Логи" ]; then
    echo
    echo -e "\e[1;31mВы выбрали $VIBOR.\e[0m"
    echo
    docker-compose logs
fi

if [ $VIBOR = "Остановить" ]; then
    echo
    echo -e "\e[1;31mВы выбрали $VIBOR.\e[0m"
    echo
    docker-compose stop
fi

if [ $VIBOR = "Запустить" ]; then
    echo
    echo -e "\e[1;31mВы выбрали $VIBOR.\e[0m"
    echo
    docker-compose start
fi

if [ $VIBOR = "Перезапустить" ]; then
    echo
    echo -e "\e[1;31mВы выбрали $VIBOR.\e[0m"
    echo
    docker-compose restart
fi

if [ $VIBOR = "Облочка" ]; then
    echo
    echo -e "\e[1;31mВы выбрали $VIBOR.\e[0m"
    echo
    docker exec -it zabbixproxysqlite3_zabbix-proxy_1 /bin/bash
fi

