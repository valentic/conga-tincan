################################################################################
#
# python-datatransport
#
################################################################################

PYTHON_DATATRANSPORT_VERSION = 3.0.19
PYTHON_DATATRANSPORT_SOURCE = datatransport-$(PYTHON_DATATRANSPORT_VERSION).tar.gz
PYTHON_DATATRANSPORT_SITE = https://files.pythonhosted.org/packages/6f/b0/4ce1bd4a6d3f190b0e47278b5a7fbc003a8ee8d6d25b6f33b8e8f9b48855
PYTHON_DATATRANSPORT_SETUP_TYPE = pep517
PYTHON_DATATRANSPORT_LICENSE = GNU General Public License v3 (GPLv3)
PYTHON_DATATRANSPORT_LICENSE_FILES = LICENSE

PYTHON_DATATRANSPORT_BASEDIR=/opt/transport

define PYTHON_DATATRANSPORT_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(PYTHON_DATATRANSPORT_PKGDIR)/datatransport.service -t $(TARGET_DIR)/usr/lib/systemd/system
	$(INSTALL) -D -m 0644 $(PYTHON_DATATRANSPORT_PKGDIR)/datatransport-firstboot.service -t $(TARGET_DIR)/usr/lib/systemd/system
endef

define PYTHON_DATATRANSPORT_INSTALL_EXTRA
	$(INSTALL) -D -m 0755 $(@D)/contrib/bash/_transportctl -t $(TARGET_DIR)/etc/bash_completion.d
endef

PYTHON_DATATRANSPORT_INSTALL_TARGET_HOOKS += PYTHON_DATATRANSPORT_INSTALL_EXTRA

define PYTHON_DATATRANSPORT_USERS
    transport -1 transport -1 ! $(PYTHON_DATATRANSPORT_BASEDIR) /bin/sh dialout,lock,wheel,video
endef

define PYTHON_DATATRANSPORT_PERMISSIONS
	$(PYTHON_DATATRANSPORT_BASEDIR) r -1 transport transport - - - - -
    $(PYTHON_DATATRANSPORT_BASEDIR) d 775 transport transport - - - - -
    $(PYTHON_DATATRANSPORT_BASEDIR)/etc d 2775 transport transport - - - - -
    $(PYTHON_DATATRANSPORT_BASEDIR)/groups d 2775 transport transport - - - - -
endef

$(eval $(python-package))
