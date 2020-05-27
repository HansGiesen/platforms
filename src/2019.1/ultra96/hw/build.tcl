set_param board.repoPaths ./bdf/ultra96v2
source ultra96.tcl
launch_runs impl_1 -to_step write_bitstream
write_dsa ultra96.dsa
