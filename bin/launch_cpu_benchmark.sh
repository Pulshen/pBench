#!/bin/bash
echo Welcome to benchmark!
cd ../PulshenWRT*
figlet CPU bench
echo =====================================
echo 1 Automatic detection of cpu cores
echo "2 Manual write(numbers of cores)"
echo =====================================
echo -n "Choose an action: "
read item
case "$item" in
  1) echo Detected $(nproc) cores, starting benchmark testing
  START=$(date +%s)
  make ${MAKEFLAGS="-j$(nproc)"} V=-1
  ;;
  2) echo -n "How much u have cpu cores: "
  read cores
  START=$(date +%s)
  echo "Compilation stated on $cores cores"
  make ${MAKEFLAGS="-j$cores"} V=-1
  ;;
  *) echo "Unknown symbol"
  ;;
esac
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
