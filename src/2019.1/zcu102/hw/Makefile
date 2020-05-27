ifneq ($(shell basename "$${XILINX_VIVADO}"),2019.1)
$(error The Vivado 2019.1 environment must be sourced first.)
endif

PLATFORM_DIR := ../../../../platforms/2019.1/zcu102

.PHONY: all install clean

build:
	vivado -mode batch -source build.tcl

install:
	cp zcu102.dsa $(PLATFORM_DIR)/hw

clean:
	rm -fr zcu102 NA .Xil vivado*.jou vivado*.log vivado*.str bdf zcu102.dsa prj
