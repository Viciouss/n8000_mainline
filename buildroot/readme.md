## what's in here?

# createemptyfs.sh

This script creates an empty ext4 partition to be used as a initrd dummy image.

# pushboot.sh

Assembles a boot image from zImage_w_dtb in the buildroot directory.

# pushsystem.sh

Push a system image to the device location given as parameter, e.g. /external_sd

The image will be mounted and all files will be copied over to the system partition.