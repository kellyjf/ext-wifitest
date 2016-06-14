
export CONFIG_RTL8821AU=m

resync:
	(cd $(BR2_EXTERNAL); git pull)
	make wifitest_defconfig

saveall: savedefconfig linux-savedefconfig linux-update-defconfig


