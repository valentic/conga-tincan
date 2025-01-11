################################################################################
#
# tincan-network 
#
################################################################################

TINCAN_NETWORK_VERSION = v1.6.4
TINCAN_NETWORK_SITE = $(call github,valentic,tincan-network,$(TINCAN_NETWORK_VERSION))
TINCAN_NETWORK_LICENSE = GPL-3.0+ 
TINCAN_NETWORK_LICENSE_FILES = LICENSE

define TINCAN_NETWORK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/local/bin
	$(INSTALL) -D -m 0755 $(@D)/v1/client/bin/* $(TARGET_DIR)/usr/local/bin
 	cp -a $(@D)/v1/client/etc/tincan $(TARGET_DIR)/etc
	echo "$(BR2_PACKAGE_TINCAN_NETWORK_GROUP)" > $(TARGET_DIR)/etc/tincan/data/group
	echo "$(BR2_PACKAGE_TINCAN_NETWORK_SERVER)" > $(TARGET_DIR)/etc/tincan/data/server
endef

define TINCAN_NETWORK_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(@D)/v1/client/systemd/* $(TARGET_DIR)/usr/lib/systemd/system
	$(INSTALL) -D -m 0644 $(TINCAN_NETWORK_PKGDIR)/50-tincan-network.preset \
		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-tincan-network.preset
endef

define TINCAN_NETWORK_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(@D)/v1/client/cron/* $(TARGET_DIR)/etc/cron.d
endef

$(eval $(generic-package))
