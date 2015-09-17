#!/bin/bash
echo Welcome to installer of this benchmark!
echo -n "Select a language for the installation and the installation program (1english/2russian)"
read item
case "$item" in
    eng|1) echo "Selected English version"
      sh english_setup.sh
        ;;
    rus|2) echo "Выбран русский язык для установки"
      sh russian_setup.sh
        ;;
    *) echo "Ничего не ввели. Ожидание ввода"
            ;;
esac