# Set the clock frequency in MHz
create_clock -period 10 [get_ports clk]

# Set the clock uncertainty
set_clock_uncertainty 1 [get_clocks clk]


# Run the physical implementation tools
place_design
route_design

# Report timing results
report_timing_summary