#!/bin/bash
echo -n "Установленны ли пакеты mesa-utils (Y/N/) "
read item
case "$item" in
    Y|y) echo "Продолжаем"
        ;;
    N|n) echo "Начинаем установку"
      sudo apt-get install mesa-utils figlet
        ;;
    *) echo "Ничего не ввели. Ожидание ввода"
        ;;
esac
figlet Done!
