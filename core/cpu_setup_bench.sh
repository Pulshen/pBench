#!/bin/bash
echo -n "Are the packages installed subversion git g++ libncurses5-dev zlib1g-dev gawk figlet? (Y/N/) "
read item
case "$item" in
    Y|y) echo "continue"
        ;;
    N|n) echo "start the installation"
      sudo apt-get install subversion git g++ libncurses5-dev zlib1g-dev gawk figlet make
        ;;
    *) echo "Ничего не ввели. Ожидание ввода"
        ;; esac
figlet Getting sources
svn co svn://svn.openwrt.org/openwrt/branches/barrier_breaker pbench_wrt
cd pbench_wrt
./scripts/feeds update -a
./scripts/feeds install -a
make prereq
make menuconfig
figlet Done!
