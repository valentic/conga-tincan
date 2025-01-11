################################################################################
#
# zramswap 
#
################################################################################

ZRAMSWAP_VERSION = v1.0.0
ZRAMSWAP_SITE = $(ZRAMSWAP_PKGDIR)/src
ZRAMSWAP_SITE_METHOD = local
ZRAMSWAP_LICENSE = GPL-3.0+ 
ZRAMSWAP_LICENSE_FILES = LICENSE

define ZRAMSWAP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/zramswap $(TARGET_DIR)/usr/bin/zramswap
	$(INSTALL) -D -m 0644 $(@D)/zramswap.conf $(TARGET_DIR)/etc/default/zramswap
endef

define ZRAMSWAP_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(@D)/zramswap.service $(TARGET_DIR)/usr/lib/systemd/system
endef

define ZRAMSWAP_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(@D)/S04zram $(TARGET_DIR)/etc/init.d
endef

$(eval $(generic-package))
