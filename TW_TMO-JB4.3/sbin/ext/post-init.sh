#!/sbin/busybox sh
#

# Remount FileSys RW
/sbin/busybox mount -t rootfs -o remount,rw rootfs

## Create the kernel data directory
if [ ! -d /data/chronic ];
then
  mkdir /data/chronic
  chmod 777 /data/chronic
fi

## Enable "post-init" ...
if [ -f /data/chronic/post-init.log ];
then
  # BackUp old post-init log
  mv /data/chronic/post-init.log /data/chronic/post-init.log.BAK
fi

# Start logging
date >/data/chronic/post-init.log
exec >>/data/chronic/post-init.log 2>&1

echo "Running Post-Init Script"

## Testing: Check for ExFat SD Card
#
SDTYPE=`blkid /dev/block/mmcblk1p1  | awk '{ print $3 }' | sed -e 's|TYPE=||g' -e 's|\"||g'`

if [ ${SDTYPE} == "exfat" ];
then
  echo "ExFat-Debug: SD-Card is type ExFAT"
  echo "ExFat-Debug: trying to mount via fuse"
  mount.exfat-fuse /dev/block/mmcblk1p1 /storage/extSdCard
else
  echo "ExFat-Debug: SD-Card is type: ${SDTYPE}"
fi

# Remount FileSys RO
/sbin/busybox mount -t rootfs -o remount,ro rootfs

#Set Max Mhz for GPU
echo 450000000 > /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/max_gpuclk

#Set governor items
echo 378000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
echo 1890000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_booted;
echo 1 > /sys/devices/system/cpu/cpufreq/ktoonsez/enable_oc;

echo $(date) END of post-init.sh
