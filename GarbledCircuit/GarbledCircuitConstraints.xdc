set_property PACKAGE_PIN G22 [get_ports clk]
set_property PACKAGE_PIN AW27 [get_ports rst]

create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]