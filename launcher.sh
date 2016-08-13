#!/bin/bash
figlet Sudokamikaze Benchmark
echo "Sudo is needed for checking enabled HT or not."
HTSTAT=$(sudo dmidecode -t processor)
DATEFF=$(date +%Y-%m-%d:%H:%M:%S)
echo ===========Main Menu================
echo "1. CPU - CPU benchmark"
echo "2. HDD - Read/Write test"
echo ====================================
echo "3. SETUP - Setup for CPU benchmark"
echo ====================================
echo -n "Choose an action: "
read item
if [ $item == "1" ]; then
echo " "
elif [ $item == "2" ]; then
  sync; dd if=/dev/zero of=tempfile bs=1M count=1024; sync && rm tempfile && exit
elif [ $item == "3" ]; then
./setup.sh
else
  echo "Error"
  exit 1
fi
cd PulshenWRT*
figlet CPU bench
echo -n "HT Status: "
echo "$HTSTAT" | grep -q "HTT "
if [ $? -eq 0 ];then
  echo "Enabled"
else
  echo "Disabled"
fi
echo =====================================
echo "1. Automatic detection of cpu cores"
echo "2. Manual write(numbers of cores)"
echo =====================================
echo -n "Choose an action: "
read bench
case "$bench" in
  1) echo Detected $(nproc) cores, starting benchmark testing
  START=$(date +%s)
  make tools/install ${MAKEFLAGS="-j$(nproc)"} V=-1
  ;;
  2) echo -n "How much u have cpu cores: "
  read cores
  START=$(date +%s)
  echo "Compilation stated on $cores cores"
  make tools/install ${MAKEFLAGS="-j$cores"} V=-1
  ;;
  *) echo "Unknown symbol"
  ;;
esac
END=$(date +%s)
DIFF=$(( ( $END - $START)/5 *2 ))
touch result.log
echo "Your processor scored $DIFF points"
echo "$DATEFF Your processor scored $DIFF points" >> result.log
notify-send --expire-time=1000 "pBench" "Your processor scored $DIFF points"
mv result.log ../
echo Cleaning buildroot
make dirclean
make prereq
echo "Complete"
