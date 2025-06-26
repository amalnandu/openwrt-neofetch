#
# SPDX-License-Identifier: GPL-2.0-only
#
include $(TOPDIR)/rules.mk

PKG_NAME:=openwrt-neofetch
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Amal Ganesh <amalnanduwork@gmail.com>
PKG_LICENSE:=GPL-2.0-only
PKG_SOURCE:=
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Lightweight Neofetch for OpenWrt
  URL:=https://github.com/you/openwrt-neofetch
endef

define Package/$(PKG_NAME)/description
A tiny shell script that prints OpenWrt ASCII art plus host, OS,
kernel, uptime, CPU, memory, storage and shell.
endef

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
    # copy your script into the build folder
	$(CP) $(CURDIR)/src/neo $(PKG_BUILD_DIR)/
endef

define Build/Compile
    # Nothing to compile
	true
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/neo $(1)/usr/bin/neo
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

