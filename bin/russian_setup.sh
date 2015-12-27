#!/bin/bash
echo -n "Установленны ли пакеты subversion git g++ libncurses5-dev zlib1g-dev gawk figlet libssl-dev? (Y/N/) "
read item
case "$item" in
    Y|y) echo "Продолжаем"
        ;;
    N|n) echo "Начинаем установку"
      sudo apt-get install subversion git g++ libncurses5-dev zlib1g-dev gawk figlet make libssl-dev
        ;;
    *) echo "Ничего не ввели. Ожидание ввода"
        ;; esac
cd PulshenWRT
make prereq
make menuconfig
figlet Done!
