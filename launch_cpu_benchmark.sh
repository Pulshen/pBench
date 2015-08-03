#!/bin/bash
echo Давайте установим нужные библиотеки и скачаем соурскоды
sh core/cpu_setup_bench.sh
echo Начинаем тестировать
START=$(date +%s)
cd pbench_wrt
figlet CPU
echo -n "Сколько у вас потоков процессора? (1/2/4/6/8) "
read item
case "$item" in
    j1|1) echo "Ввели «j1/1» начинаем компиляцию в один поток"
      make tools/install V=-1
        ;;
    j2|2) echo "Ввели «j2/2» начинаем компляцию в два потока"
      make tools/install -j2 V=-1
        ;;
    j4|4) echo "Ввели «j4/4» начинаем компиляцию в четыре потока"
      make tools/install -j4 V=-1
	    ;;
    j6|6) echo "Ввели «j6/6» начинаем компиляцию в шесть потокок"
      make tools/install -j6 V=-1
        ;;
    j8|8) echo "Ввели «j8/8» начинаем компиляцию в восемь потоков"
      make tools/install -j8 V=-1
	    ;;
    *) echo "Ничего не ввели. Ожидание ввода"
            ;;
esac
END=$(date +%s)
DIFF=$(( ( $END - $START)*5 ))
touch result.log
echo "Ваш процессор набрал $DIFF папугаев"
echo "Ваш процессор набрал $DIFF папугаев" >> result.log 
echo Щас проведем чистку бенчмарка чтобы можно было тестировать еще 
cd -
rm -rf pbench_wrt
echo Спасибо за использовани
