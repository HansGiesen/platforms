ifneq ($(shell basename "$${XILINX_VIVADO}"),2019.1)
$(error The Vivado 2019.1 environment must be sourced first.)
endif

PLATFORM_DIR := ../../../../platforms/2019.1/zcu102

.PHONY: build install clean

build:
	sds++ -c -o hello.o hello.cxx -sds-pf $(PLATFORM_DIR)
	sds++ --remote_ip_cache ./ip_cache -o test.elf ./hello.o -dmclkid 0 -sds-pf $(PLATFORM_DIR) -rebuild-hardware

install:
	cp _sds/.llvm/apsys_0.xml $(PLATFORM_DIR)/sw/prebuilt
	cp _sds/.llvm/partitions.xml $(PLATFORM_DIR)/sw/prebuilt
	cp _sds/swstubs/portinfo.c $(PLATFORM_DIR)/sw/prebuilt
	cp _sds/swstubs/portinfo.h $(PLATFORM_DIR)/sw/prebuilt
	cp _sds/p0/vpl/system.hdf $(PLATFORM_DIR)/sw/prebuilt
	cp _sds/p0/vpl/system.bit $(PLATFORM_DIR)/sw/prebuilt

clean:
	rm -fr hello.o ip_cache sd_card _sds .Xil test*
