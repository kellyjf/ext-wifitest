# ext-wifitest

This is a BR2_EXTERNAL directory to be used in building a wifi test device on a Raspberry PI3.

### Building

1. git clone git://git.busybox.net/buildroot wifitest
2. git clone https://github.com/kellyjf/ext-wifitest
3. git clone https://github.com/RPi-Distro/firmware-nonfree 
3. cd wifitest
4. make BR2_EXTERNAL=../ext-wifitest wifitest_defconfig
5. make

### Gotchas
1. After running makeconfig or linux-makeconfig, do "make saveconfigs" and (cd ../ext-wifitest; git status) to see if you need to share anything
2. After a git-pull in ../ext-wifitest, do "make wifitest_defconfig" again to pick up new packags
3.

### Burn a card
1 dd if=output/images/sdcard.img of=/dev/sd${WHATEVER} bs=2M

### Where stuff is
<pre>
.
├── board
│   ├── device_table.txt                               # Application directories, ownership and permission
│   ├── genimage-raspberrypi0.cfg
│   ├── genimage-raspberrypi2.cfg
│   ├── genimage-raspberrypi3.cfg                      # What goes on the card;  include dtb overlays
│   ├── genimage-raspberrypi.cfg
│   ├── linux_defconfig                                # Kernel config file---adds wifi device support
│   ├── post-build.sh                                  # Edits to cmdlne.txt, config.txt
│   ├── post-image.sh                                  # Force selection of raspberrypi3
│   └── users.txt                                      # Useradds
├── Config.in
├── configs
│   └── wifitest_defconfig                             # Package selection
├── external.mk
├── overlay
│   ├── etc
│   │   ├── network
│   │   │   └── interfaces                             # Ethernet config
│   │   ├── sudoers                                    # Give wheel group sudo/nopasswd
│   │   └── wpa_supplicant.conf                        # Wifi SSID and password
│   └── lib
│       └── firmware
│           └── brcm                                   # Raspberry Pi3 onboard wifi firmware
│               ├── brcmfmac43430-sdio.bin           
│               └── brcmfmac43430-sdio.txt

</pre>
