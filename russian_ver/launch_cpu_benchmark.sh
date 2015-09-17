#!/bin/bash
echo Добро пожаловать в бенчмарк!
cd ../PulshenWRT_ChaosChamer
figlet CPU bench
START=$(date +%s)
echo -n "Сколько у вас потоков процессора? (1/2/4/6/8/16) "
read item
case "$item" in
    j1|1) echo "Ввели «j1/1» начинаем компиляцию в один поток"
      make tools/install V=-1
        ;;
    j2|2) echo "Ввели «j2/2» начинаем компляцию в два потока"
      make tools/install -j3 V=-1
        ;;
    j4|4) echo "Ввели «j4/4» начинаем компиляцию в четыре потока"
      make tools/install -j5 V=-1
	    ;;
    j6|6) echo "Ввели «j6/6» начинаем компиляцию в шесть потокок"
      make tools/install -j7 V=-1
        ;;
    j8|8) echo "Ввели «j8/8» начинаем компиляцию в восемь потоков"
      make tools/install -j9 V=-1
	    ;;
	j16|16) echo "Ввели «j16/16» начинаем компиляцию в шестнадцать потоков"
      make tools/install -j17 V=-1
		;;
    *) echo "Ничего не ввели. Ожидание ввода"
            ;;
esac
END=$(date +%s)
DIFF=$(( ( $END - $START)*5 ))
cd ..
touch result.log
echo "Ваш процессор набрал $DIFF папугаев"
echo "Ваш процессор набрал $DIFF папугаев" >> result.log 
echo Щас проведем чистку бенчмарка чтобы можно было тестировать еще 
cd PulshenWRT_ChaosChamer
make dirclean
echo Спасибо за использовани
