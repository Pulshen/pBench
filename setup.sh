#!/bin/bash
echo ======================
echo 1 "ArchLinux(PACMAN)"
echo 2 "Debian based(APT)"
echo =======================
echo -n "Choose an action: "
read item
case "$item" in
    1) echo "Preparing to install utils"
       sudo pacman -S --needed subversion asciidoc bash bc binutils bzip2 fastjar flex git gcc util-linux gawk intltool zlib make cdrkit ncurses openssl patch perl-extutils-makemaker rsync sdcc unzip wget gettext libxslt boost libusb bin86 sharutils b43-fwcutter findutils
        ;;
    2) echo "Starting APT..."
       sudo apt-get install subversion git g++ libncurses5-dev zlib1g-dev gawk figlet make libssl-dev
        ;;
    *) echo "Error, unknown symbol"
            ;;
esac
mkdir PulshenWRT_build
git clone git://git.openwrt.org/15.05/openwrt.git PulshenWRT_build
git clone git@github.com:Sudokamikaze/PulshenWRT.git
cp PulshenWRT/configs_default/config_cc PulshenWRT_build/.config
rm -rf PulshenWRT
cd PulshenWRT_build
./scripts/feeds update -a
./scripts/feeds install -a
make prereq
echo Done!
