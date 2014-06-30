#!/system/bin/sh

#Set Min/Max Mhz speed and booted flag to set Super Max
echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
echo 2457600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;
echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq;
echo 2457600 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq;
echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq;
echo 2457600 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq;
echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq;
echo 2457600 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq;

#enable oc
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/enable_oc;
echo 1 > /sys/devices/system/cpu/cpu1/cpufreq/enable_oc;
echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/enable_oc;
echo 1 > /sys/devices/system/cpu/cpu3/cpufreq/enable_oc;
