ifneq ($(shell basename "$${XILINX_VIVADO}"),2019.1)
$(error The Vivado 2019.1 environment must be sourced first.)
endif

PLATFORM_DIR := ../../../../platforms/2019.1/pynq

.PHONY: build install clean

build:
	wget https://github.com/cathalmccabe/pynq-z1_board_files/raw/master/pynq-z1.zip
	unzip pynq-z1.zip
	vivado -mode batch -source build.tcl
	# Hack to avoid a crash
	unzip pynq.dsa prj/rebuild.tcl
	sed -i '/board_part_repo_paths/d' prj/rebuild.tcl
	zip pynq.dsa prj/rebuild.tcl

install:
	cp pynq.dsa $(PLATFORM_DIR)/hw

clean:
	rm -fr pynq NA .Xil vivado*.jou vivado*.log vivado*.str pynq-z1 pynq-z1.zip pynq.dsa prj
