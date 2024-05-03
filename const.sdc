set_units -time ns

# clock signal period setting
create_clock -name main_clock -period 10.0 [get_ports {clk}]

# Delay parameter
set_output_delay -clock main_clock -max 8 [all_output]
set_output_delay -clock main_clock -min -3 [all_output]
set_input_delay -clock main_clock -max 4 [all_input]
set_input_delay -clock main_clock -min 2 [all_input]
