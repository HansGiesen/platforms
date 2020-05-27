ifneq ($(shell basename "$${XILINX_VIVADO}"),2019.1)
$(error The Vivado 2019.1 environment must be sourced first.)
endif

PLATFORM_DIR := ../../../../platforms/2019.1/ultra96

.PHONY: all install clean

build:
	git clone https://github.com/Avnet/bdf.git
	vivado -mode batch -source build.tcl
	# Hack to avoid a crash
	unzip ultra96.dsa prj/rebuild.tcl
	sed -i '/board_part_repo_paths/d' prj/rebuild.tcl
	zip ultra96.dsa prj/rebuild.tcl

install:
	cp ultra96.dsa $(PLATFORM_DIR)/hw

clean:
	rm -fr ultra96 NA .Xil vivado*.jou vivado*.log vivado*.str bdf ultra96.dsa prj
