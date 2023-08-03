# Define the clock signal and its period
create_clock -period 10 [get_ports clk]

# Set the clock uncertainty (optional)
set_clock_uncertainty 1 [get_clocks clk]





