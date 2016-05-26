#!/bin/sh

set -u
set -e

# Add a console on tty1
grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab

sed -i '/^dtoverlay/d' ${BINARIES_DIR}/rpi-firmware/config.txt
cat >> ${BINARIES_DIR}/rpi-firmware/config.txt <<!
dtoverlay=pi3-disable-bt
dtoverlay=pi3-miniuart-bt
!

