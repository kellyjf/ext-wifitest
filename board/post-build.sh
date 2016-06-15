#!/bin/sh

set -u
set -e

# Add a console on tty1
grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab

sed -i '/^kernel/d' ${BINARIES_DIR}/rpi-firmware/config.txt
sed -i '/^device_tree/d' ${BINARIES_DIR}/rpi-firmware/config.txt
sed -i '/^dtoverlay/d' ${BINARIES_DIR}/rpi-firmware/config.txt
sed -i '1 i\
kernel=u-boot.bin\
device_tree=rpi3-headless.dtb' ${BINARIES_DIR}/rpi-firmware/config.txt 

