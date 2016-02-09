#!/bin/bash
echo Welcome to benchmark!
cd ../PulshenWRT*
figlet CPU bench
echo ===================================================
echo Choose how many your processor have
echo 1/2/4/6/8 or 16
echo Use autodetection(0)
echo ====================================================
START=$(date +%s)
echo -n "Choose an action"
read item
case "$item" in
    j1|1) echo "Writed «j1/1» We begin to compile into one stream"
      make tools/install V=-1
        ;;
    j2|2) echo "Writed «j2/2» We begin to compile in two streams"
      make tools/install -j3 V=-1
        ;;
    j4|4) echo "Writed «j4/4» compilation starts in four streams"
      make tools/install -j5 V=-1
	    ;;
    j6|6) echo "Writed «j6/6» We start a compilation of six streams"
      make tools/install -j7 V=-1
        ;;
    j8|8) echo "Writed «j8/8» start a compilation of eight streams"
      make tools/install -j9 V=-1
	    ;;
    j16|16) echo "Writed «j16/16» start a compilation of sixteen streams"
      make tools/install -j17 V=-1
		;;
    0) echo "Detecting all theards"
      make ${MAKEFLAGS="-j$(nproc)"} V=-1
                ;;
    *) echo "Nothing entered. Waiting for input"
            ;;
esac
END=$(date +%s)
DIFF=$(( ( $END - $START)/5*2 ))
cd ..
touch result.log
echo "Your processor scored $DIFF points"
echo "Your processor scored $DIFF points" >> result.log 
echo Right now we clean the benchmark to be able to test more later
cd PulshenWRT*
make dirclean
echo Thank you for using
