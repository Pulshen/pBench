#!/bin/bash
echo "Installing libs for compiling"
echo ======================
echo "1. ArchLinux(PACMAN)"
echo "2. Debian based(APT)"
echo "3. Ignore"
echo =======================
echo -n "Choose an action: "
read item
case "$item" in
    1) echo "Preparing to install utils"
       sudo pacman -S --needed dmidecode subversion asciidoc bash bc binutils bzip2 fastjar flex git gcc util-linux gawk intltool zlib make cdrkit ncurses openssl patch perl-extutils-makemaker rsync sdcc unzip wget gettext libxslt boost libusb bin86 sharutils b43-fwcutter findutils
        ;;
    2) echo "Starting APT..."
       sudo apt-get install dmidecode subversion git g++ libncurses5-dev zlib1g-dev gawk figlet make libssl-dev
        ;;
    3) echo "Ignoring installing lib procedure"
        ;;
    *) echo "Error, unknown symbol"
            ;;
esac
mkdir PulshenWRT_build
git clone git@github.com:lede-project/source.git PulshenWRT_build
git clone git@github.com:Sudokamikaze/PulshenWRT.git
cp PulshenWRT/configs_default/config_lede_trunk PulshenWRT_build/.config
rm -rf PulshenWRT
cd PulshenWRT_build
./scripts/feeds update -a && ./scripts/feeds install -a
make menuconfig
echo Done!
