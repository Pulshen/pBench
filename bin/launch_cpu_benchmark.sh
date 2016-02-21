#!/bin/bash
echo Welcome to benchmark!
cd ../PulshenWRT*
figlet CPU bench
START=$(date +%s)
make ${MAKEFLAGS="-j$(nproc)"} V=-1
END=$(date +%s)
DIFF=$(( ( $END - $START)/5 *2 ))
cd ..
touch result.log
echo "Your processor scored $DIFF points"
echo "Your processor scored $DIFF points" >> result.log
notify-send --expire-time=1000 "pBench" "Your processor scored $DIFF points"
echo Cleaning buildroot
cd PulshenWRT*
make dirclean
echo complete
