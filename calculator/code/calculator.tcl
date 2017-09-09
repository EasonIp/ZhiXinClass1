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

# Quartus II: Generate Tcl File for Project
# File: calculator.tcl
# Generated on: Sat Jul 29 23:38:29 2017

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "calculator"]} {
		puts "Project calculator is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists calculator]} {
		project_open -revision calculator calculator
	} else {
		project_new -revision calculator calculator
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone IV E"
	set_global_assignment -name DEVICE EP4CE10F17C8
	set_global_assignment -name TOP_LEVEL_ENTITY top_calculator
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 13.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "11:22:31  JULY 29, 2017"
	set_global_assignment -name LAST_QUARTUS_VERSION 13.0
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 256
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 8
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name EDA_TEST_BENCH_ENABLE_STATUS TEST_BENCH_MODE -section_id eda_simulation
	set_global_assignment -name EDA_NATIVELINK_SIMULATION_TEST_BENCH tb_top_calculator -section_id eda_simulation
	set_global_assignment -name EDA_TEST_BENCH_NAME tb_cal -section_id eda_simulation
	set_global_assignment -name EDA_DESIGN_INSTANCE_NAME NA -section_id tb_cal
	set_global_assignment -name EDA_TEST_BENCH_MODULE_NAME tb_cal -section_id tb_cal
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name EDA_TEST_BENCH_FILE tb_cal.v -section_id tb_cal
	set_global_assignment -name EDA_TEST_BENCH_NAME tb_top_calculator -section_id eda_simulation
	set_global_assignment -name EDA_DESIGN_INSTANCE_NAME NA -section_id tb_top_calculator
	set_global_assignment -name EDA_TEST_BENCH_MODULE_NAME tb_top_calculator -section_id tb_top_calculator
	set_global_assignment -name EDA_TEST_BENCH_FILE tb_top_calculator.v -section_id tb_top_calculator
	set_global_assignment -name VERILOG_FILE top_calculator.v
	set_global_assignment -name VERILOG_FILE tb_top_calculator.v
	set_global_assignment -name VERILOG_FILE seg7_v2.v
	set_global_assignment -name VERILOG_FILE key_scan.v
	set_global_assignment -name VERILOG_FILE freq.v
	set_global_assignment -name VERILOG_FILE tb_cal.v
	set_global_assignment -name VERILOG_FILE cal.v
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "2.5 V"
	set_global_assignment -name TIMEQUEST_MULTICORNER_ANALYSIS ON
	set_global_assignment -name SMART_RECOMPILE OFF
	set_location_assignment PIN_E1 -to clk
	set_location_assignment PIN_T15 -to col[3]
	set_location_assignment PIN_P15 -to col[2]
	set_location_assignment PIN_N15 -to col[1]
	set_location_assignment PIN_L15 -to col[0]
	set_location_assignment PIN_N16 -to row[3]
	set_location_assignment PIN_P16 -to row[2]
	set_location_assignment PIN_R16 -to row[1]
	set_location_assignment PIN_R14 -to row[0]
	set_location_assignment PIN_N1 -to rst_n
	set_location_assignment PIN_T4 -to seg[7]
	set_location_assignment PIN_T5 -to seg[6]
	set_location_assignment PIN_T6 -to seg[5]
	set_location_assignment PIN_T7 -to seg[4]
	set_location_assignment PIN_T8 -to seg[3]
	set_location_assignment PIN_T9 -to seg[2]
	set_location_assignment PIN_T10 -to seg[1]
	set_location_assignment PIN_T11 -to seg[0]
	set_location_assignment PIN_L6 -to sel[2]
	set_location_assignment PIN_N6 -to sel[1]
	set_location_assignment PIN_M7 -to sel[0]
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
