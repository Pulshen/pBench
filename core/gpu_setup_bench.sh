#!/bin/bash
echo -n "Are the packages installed mesa-utils (Y/N/) "
read item
case "$item" in
    Y|y) echo "continue"
        ;;
    N|n) echo "start the installation"
      sudo apt-get install mesa-utils figlet
        ;;
    *) echo "Ничего не ввели. Ожидание ввода"
        ;;
esac
figlet Done!
