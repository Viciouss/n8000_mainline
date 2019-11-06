#!/bin/sh

if [[ -z "$1" ]]; then
  echo "You need to specify the target directory on the device to which the system image will be pushed to!"
  exit
fi

echo "Copying new file system to device at $targetdir"
adb push $BUILDROOT_HOME/output/images/rootfs.ext2 $1

echo "Mounting new file system to /tmp/newsystem"
adb shell rm -rf /tmp/newsystem
adb shell mkdir /tmp/newsystem
adb shell mount -o loop $1/rootfs.ext2 /tmp/newsystem

echo "Mouting current system partition"
adb shell rm -rf /tmp/oldsystem
adb shell mkdir /tmp/oldsystem
adb shell mount /dev/block/platform/dw_mmc/by-name/SYSTEM /tmp/oldsystem

echo "Copying new files to the system directory"
adb shell rm -rf /tmp/oldsystem/*
adb shell cp -av /tmp/newsystem/* /tmp/oldsystem
adb shell sync
adb shell umount /tmp/oldsystem
adb shell umount /tmp/newsystem

echo "Done!"
