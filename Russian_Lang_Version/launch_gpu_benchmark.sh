#!/bin/bash
clear
echo Давайте установим нужные библиотеки
sh core/gpu_setup_bench.sh
echo Начинаем тестировать
figlet GPU
echo -n "Выберите какой у вас производитель видеокарты (nvidia/optimus/amd/intel) "
read item
case "$item" in
    optimus) echo "Ввели «optimus» начинаем тест"
      primusrun glxgears
        ;;
    nvidia) echo "Ввели «j2/2» начинаем тест"
      glxgears
        ;;
    amd) echo "Ввели «j4/4» начинаем тест"
      glxgears
	    ;;
    intel) echo "Ввели «intel» начинаем тест"
      glxgears
        ;;
    *) echo "Ничего не ввели. Ожидание ввода"
        ;;
esac
