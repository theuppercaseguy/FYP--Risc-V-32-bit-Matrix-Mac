set_property SRC_FILE_INFO {cfile:E:/UNI/FYP/FYP--Risc-V-32-bit-Matrix-Mac/Project/Single_Cycle_Processor_V_2.0/Single_Cycle_Processor_V_2.0.srcs/constrs_1/new/Timing_Constraint.xdc rfile:../../../Single_Cycle_Processor_V_2.0.srcs/constrs_1/new/Timing_Constraint.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_clock_uncertainty 1 [get_clocks clk]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
place_design
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
route_design
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
report_timing_summary
