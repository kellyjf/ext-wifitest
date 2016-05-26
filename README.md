# ext-wifitest

This is a BR2_EXTERNAL directory to be used in building a wifi test device on a Raspberry PI3.

## Building

1. git clone git://git.busybox.net/buildroot wifitest
2. git clone https://github.com/kellyjf/ext-wifitest
3. git clone https://github.com/RPi-Distro/firmware-nonfree 
3. cd wifitest
4. make BR2_EXTERNAL=../ext-wifitest wifitest_defconfig
5. make
