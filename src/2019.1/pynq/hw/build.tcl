set_param board.repoPaths ./pynq-z1
source pynq.tcl
launch_runs impl_1 -to_step write_bitstream
write_dsa pynq.dsa
