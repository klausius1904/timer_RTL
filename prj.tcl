project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE example1.bdf
set_global_assignment -name VERILOG_FILE time_conv.v
set_global_assignment -name VERILOG_FILE time_manager2.v
set_global_assignment -name VERILOG_FILE cronometru.v
set_global_assignment -name VERILOG_FILE hexa_display.v
set_global_assignment -name VERILOG_FILE binary_to_BCD.v
set_global_assignment -name VERILOG_FILE bram.v
set_global_assignment -name SDC_FILE example1.sdc

set_global_assignment -name TOP_LEVEL_ENTITY cronometru
set_location_assignment -to clk PIN_AH10

set_location_assignment PIN_B8 -to rst_b   ;# PUSH BUTTON[0]

set_location_assignment PIN_C14	-to display1[6]; # TO SEG 6
set_location_assignment PIN_E15	-to display1[5]; # TO SEG 5
set_location_assignment PIN_C15	-to display1[4]; # TO SEG 4
set_location_assignment PIN_C16	-to display1[3]; # TO SEG 3
set_location_assignment PIN_E16	-to display1[2]; # TO SEG 2
set_location_assignment PIN_D17	-to display1[1]; # TO SEG 1
set_location_assignment PIN_C17	-to display1[0]; # TO SEG 0

set_location_assignment PIN_C13 -to saved_operation[0]; 
set_location_assignment PIN_E14 -to saved_operation[1];
set_location_assignment PIN_D14 -to saved_operation[2];


set_location_assignment PIN_C18	-to display2[6]; # TO SEG 6
set_location_assignment PIN_D18	-to display2[5]; # TO SEG 5
set_location_assignment PIN_E18	-to display2[4]; # TO SEG 4
set_location_assignment PIN_B16	-to display2[3]; # TO SEG 3
set_location_assignment PIN_A17	-to display2[2]; # TO SEG 2
set_location_assignment PIN_A18	-to display2[1]; # TO SEG 1
set_location_assignment PIN_B17	-to display2[0]; # TO SEG 0

set_location_assignment PIN_B20	-to display3[6]; # TO SEG 6
set_location_assignment PIN_A20	-to display3[5]; # TO SEG 5
set_location_assignment PIN_B19	-to display3[4]; # TO SEG 4
set_location_assignment PIN_A21	-to display3[3]; # TO SEG 3
set_location_assignment PIN_B21	-to display3[2]; # TO SEG 2
set_location_assignment PIN_C22	-to display3[1]; # TO SEG 1
set_location_assignment PIN_B22	-to display3[0]; # TO SEG 0

set_location_assignment PIN_F21	-to display4[6]; # TO SEG 6
set_location_assignment PIN_E22	-to display4[5]; # TO SEG 5
set_location_assignment PIN_E21	-to display4[4]; # TO SEG 4
set_location_assignment PIN_C19	-to display4[3]; # TO SEG 3
set_location_assignment PIN_C20	-to display4[2]; # TO SEG 2
set_location_assignment PIN_D19	-to display4[1]; # TO SEG 1
set_location_assignment PIN_E17	-to display4[0]; # TO SEG 0

set_location_assignment PIN_C10 -to operation[0];
set_location_assignment PIN_C11 -to operation[1];
set_location_assignment PIN_D12 -to operation[2];

set_location_assignment PIN_P11  -to clk  ;

load_package flow
execute_flow -compile

project_close
