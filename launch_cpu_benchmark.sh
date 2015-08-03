#!/bin/bash
echo Let me download sources and libraries
sh core/cpu_setup_bench.sh
echo Начинаем тестировать
START=$(date +%s)
cd pbench_wrt
figlet CPU
echo -n "How many of your processor threads? (1/2/4/6/8) "
read item
case "$item" in
    j1|1) echo "Ввели «j1/1» We begin to compile into one stream"
      make tools/install V=-1
        ;;
    j2|2) echo "Ввели «j2/2» We begin to compile in two streams"
      make tools/install -j2 V=-1
        ;;
    j4|4) echo "Ввели «j4/4» compilation starts in four streams"
      make tools/install -j4 V=-1
	    ;;
    j6|6) echo "Ввели «j6/6» We start a compilation of six streams"
      make tools/install -j6 V=-1
        ;;
    j8|8) echo "Ввели «j8/8» start a compilation of eight streams"
      make tools/install -j8 V=-1
	    ;;
    *) echo "Ничего не ввели. Ожидание ввода"
            ;;
esac
END=$(date +%s)
DIFF=$(( ( $END - $START)*5 ))
touch result.log
echo "Your processor scored $DIFF parrots"
echo "Your processor scored $DIFF parrots" >> result.log 
echo Right now we clean the benchmark to be able to test more
cd -
rm -rf pbench_wrt
echo Thank you for using
