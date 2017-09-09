# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II 64-Bit Version 13.0.0 Build 156 04/24/2013 SJ Web Edition
# File: E:\fpga_ZX\led_flow\code\led_flow.tcl
# Generated on: Mon Jul 17 22:48:14 2017

package require ::quartus::project

set_location_assignment PIN_N1 -to rst_n
set_location_assignment PIN_M10 -to top_led_flow[3]
set_location_assignment PIN_M8 -to top_led_flow[2]
set_location_assignment PIN_P8 -to top_led_flow[1]
set_location_assignment PIN_E1 -to clk
set_location_assignment PIN_T12 -to top_led_flow[0]
