#!/bin/bash

function wrt {
  mkdir PulshenWRT_build
  git clone git@github.com:lede-project/source.git PulshenWRT_build
  git clone git@github.com:Sudokamikaze/PulshenWRT.git
  cp PulshenWRT/configs_default/config_lede_trunk PulshenWRT_build/.config
  rm -rf PulshenWRT
  cd PulshenWRT_build
  ./scripts/feeds update -a && ./scripts/feeds install -a
  make menuconfig
}

echo -n "Install libs for building? Y/n: "
read libs
case "$libs" in
  y|Y) echo "Installing..."
  eval $(grep ID= /etc/os-release)
  if [ $ID == arch ]; then sudo pacman -S --needed dmidecode figlet subversion asciidoc bash bc binutils bzip2 fastjar flex git gcc-multilib util-linux gawk intltool zlib make cdrkit ncurses openssl patch perl-extutils-makemaker rsync sdcc unzip wget gettext libxslt boost libusb bin86 sharutils b43-fwcutter findutils
elif [ $ID == ubuntu ]; then sudo apt-get install dmidecode figlet subversion git g++ libncurses5-dev zlib1g-dev gawk libssl-dev
elif [ $ID == debian ]; then sudo apt-get install dmidecode figlet subversion git g++ libncurses5-dev zlib1g-dev gawk libssl-dev
  else
   echo Unsuported distro, u may install there libs manualy.
  fi
  echo Done!
  ;;
  n|N)
  ;;
esac

wrt
echo Done!
