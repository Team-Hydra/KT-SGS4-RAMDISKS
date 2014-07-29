#!/system/bin/sh

echo 578000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk;
echo 4 > /sys/class/kgsl/kgsl-3d0/min_pwrlevel;

#enable oc
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/enable_oc;
echo 1 > /sys/devices/system/cpu/cpu1/cpufreq/enable_oc;
echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/enable_oc;
echo 1 > /sys/devices/system/cpu/cpu3/cpufreq/enable_oc;

#Set Min/Max Mhz speed and booted flag to set Super Max
echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
echo 2457600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;
echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq;
echo 2457600 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq;
echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq;
echo 2457600 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq;
echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq;
echo 2457600 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq;
