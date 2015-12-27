#!/bin/bash
echo -n "Are the packages installed subversion git g++ libncurses5-dev zlib1g-dev gawk figlet libssl libssl-dev? (Y/N/) "
read item
case "$item" in
    Y|y) echo "Continuing preparation"
        ;;
    N|n) echo "Start the installation"
      sudo apt-get install subversion git g++ libncurses5-dev zlib1g-dev gawk figlet make libssl-dev
        ;;
    *) echo "Ничего не ввели. Ожидание ввода"
        ;; esac
cd PulshenWRT
make prereq
make menuconfig
figlet Done!
