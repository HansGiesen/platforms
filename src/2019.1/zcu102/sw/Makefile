ifneq ($(PETALINUX_VER),2019.1)
$(error The Petalinux 2019.1 environment must be sourced first.)
endif

PLATFORM_DIR := ../../../../platforms/2019.1/zcu102

.PHONY: build install clean

build:
	mkdir -p project-spec/hw-description
	petalinux-config --get-hw-description ../hw --silentconfig
	umask 0022 && petalinux-build

install:
	cp images/linux/bl31.elf $(PLATFORM_DIR)/sw/linux/boot
	cp images/linux/pmufw.elf $(PLATFORM_DIR)/sw/linux/boot
	cp images/linux/zynqmp_fsbl.elf $(PLATFORM_DIR)/sw/linux/boot/fsbl.elf
	cp images/linux/u-boot.elf $(PLATFORM_DIR)/sw/linux/boot
	cp images/linux/image.ub $(PLATFORM_DIR)/sw/linux/linux_a53/image
	rm -fr $(PLATFORM_DIR)/sw/linux/linux_a53/sysroot/*
	tar -xzf images/linux/rootfs.tar.gz -C $(PLATFORM_DIR)/sw/linux/linux_a53/sysroot

clean:
	rm -fr project-spec/hw-description build images/linux project-spec/meta-plnx-generated componenets/plnx_workspace .petalinux/webtalk
	rm -f */*/config.old */*/rootfs_config.old .petalinux/usage_statistics*
