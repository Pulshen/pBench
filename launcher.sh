#!/bin/bash
figlet Pulshens Benchmark
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
case "$item" in
    1) echo "Writed «1/cpu», launching cpu benchmark"

        ;;
    2) echo "Writed «2/HDD» launching R/W benchmark"
     sync; dd if=/dev/zero of=tempfile bs=1M count=1024; sync && rm tempfile && exit
        ;;
    3) echo launching setup interface...
    ./setup.sh
        ;;
    *) echo "Nothing entered. Waiting for input"
        ;;
esac
cd PulshenWRT*
figlet CPU bench
echo -n "HT Status: "
echo "$HTSTAT" | grep -q "HTT "
if [ $? -eq 0 ];then
  echo "HT Enabled"
else
  echo "HT Disabled"
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
  make toolchain/install ${MAKEFLAGS="-j$(nproc)"} V=-1
  ;;
  2) echo -n "How much u have cpu cores: "
  read cores
  START=$(date +%s)
  echo "Compilation stated on $cores cores"
  make toolchain/install ${MAKEFLAGS="-j$cores"} V=-1
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
echo Cleaning buildroot
cd PulshenWRT*
make dirclean
echo complete
