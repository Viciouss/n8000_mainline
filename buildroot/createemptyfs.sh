#!/bin/sh

# source: https://forum.xda-developers.com/showthread.php?t=1974014

# 2k * 200 = 400kb
dd if=/dev/zero of=ext4.img bs=2k count=200

# format image with ext4
mke2fs -t ext4 ext4.img

# override file system check
tune2fs -c0 -i0 ext4.img

# now mount, create dummy file, sync, umount
mkdir tempimage
mount -o loop ext4.img tempimage
touch tempimage/init
echo "# only a dummy file" > tempimage/init
sync
umount tempimage


# xz up and we're done
xz ext4.img