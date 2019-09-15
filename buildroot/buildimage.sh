#!/bin/bash

if [[ -z "$BUILDROOT_HOME" ]]; then
  echo "BUILDROOT_HOME environment variable missing!"
  exit
fi

# add the dtb image to the end of the kernel so that it can be found by the kernel on boot
cat $BUILDROOT_HOME/output/images/zImage $BUILDROOT_HOME/output/images/exynos4412-n8000.dtb > $BUILDROOT_HOME/output/images/zImage_w_dtb

# create the boot image via abootimg, copy the bootimg-n8000.cfg to the build root dir first
abootimg --create $BUILDROOT_HOME/output/images/bootbr.img \
	-f bootimg-n8000.cfg \
	-k $BUILDROOT_HOME/output/images/zImage_w_dtb \
	-r $BUILDROOT_HOME/output/images/rootfs.ext2.xz

adb push $BUILDROOT_HOME/output/images/bootbr.img /external_sdcard

