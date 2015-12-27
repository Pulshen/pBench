#!/bin/bash
echo Welcome to benchmark!
cd ../PulshenWRT
figlet CPU bench
START=$(date +%s)
echo -n "How many of your processor threads? (1/2/4/6/8/16) "
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
	*) echo "Nothing entered. Waiting for input"
            ;;
esac
END=$(date +%s)
DIFF=$(( ( $END - $START)*5 ))
cd ..
touch result.log
echo "Your processor scored $DIFF parrots"
echo "Your processor scored $DIFF parrots" >> result.log 
echo Right now we clean the benchmark to be able to test more
cd PulshenWRT_ChaosChamer
make dirclean
echo Thank you for using
