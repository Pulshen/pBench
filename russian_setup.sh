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
figlet Getting sources
git clone https://github.com/Pulshen/PulshenWRT_ChaosChamer.git
cd PulshenWRT_ChaosChamer
./scripts/feeds update -a
./scripts/feeds install -a
make prereq
make menuconfig
figlet Done!
