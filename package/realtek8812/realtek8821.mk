################################################################################
#
# rtl8812au
#
################################################################################

REALTEK8812_VERSION = 38b565af37a8dfe535991cdc6afb94723c229f00
REALTEK8812_SITE = $(call github,gnab,rtl8812au,$(REALTEK8812_VERSION))
REALTEK8812_LICENSE = GPLv2, proprietary (rtl8812au.bin firmware)
REALTEK8812_LICENSE_FILES = COPYING

REALTEK8812_MODULE_MAKE_OPTS = \
	CONFIG_RTL8812AU_8821AU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	USER_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN

define REALTEK8812_FIRMWARE_INSTALL
	mkdir -p $(TARGET_DIR)/lib/firmware/rtlwifi/
	$(INSTALL) -D -m 0644 $(@D)/firmware/* $(TARGET_DIR)/lib/firmware/rtlwifi/
endef

#REALTEK8812_POST_INSTALL_TARGET_HOOKS += REALTEK8812_FIRMWARE_INSTALL

$(eval $(kernel-module))
$(eval $(generic-package))
