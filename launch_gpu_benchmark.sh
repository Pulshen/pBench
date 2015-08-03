#!/bin/bash
clear
echo Let install libraries
sh core/gpu_setup_bench.sh
echo Let me test your GPU
figlet GPU
echo -n "Choose what GPU u have (nvidia/optimus/amd/intel) "
read item
case "$item" in
    optimus) echo "Writed «optimus» testing"
      primusrun glxgears
        ;;
    nvidia) echo "Writed «nvidia» testing"
      glxgears
        ;;
    amd) echo "Writed «amd» testing"
      glxgears
	    ;;
    intel) echo "Writed «intel» testing"
      glxgears
        ;;
    *) echo "Ничего не ввели. Ожидание ввода"
        ;;
esac
