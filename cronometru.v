module cronometru(input clk, rst_b, output [6:0] display1, output[6:0] display2, output [6:0] display3, output[6:0] display4, input[2:0] operation, output[2:0] saved_operation);
	wire clk_conv;
	wire [2:0] opcode;
	wire [7:0] leds;
	wire [7:0] min;
	wire [7:0]bin_to_BCD1;
	wire [7:0]bin_to_BCD2;
	wire [9:0]address_op;
	wire we; 

	time_converter this_conv(.clk(clk), .rst_b(rst_b), .clk_conv(clk_conv));
	
	time_manager this_manager(.clk(clk_conv),.rst_b(rst_b), .sec(leds), .min(min), .operation(operation), .saved_operation(opcode), .we(we), .address_op(address_op));
	
	BRAM #(.DATA_WIDTH(3), .ADDR_WIDTH(10)) bram_op(.clk(clk_conv), .data_in(opcode), .adr_in(address_op), .we(1), .data_out(saved_operation));
	
	BINARY_TO_BCD this_BCD1(.in(leds), .out(bin_to_BCD1));
	BINARY_TO_BCD this_BCD2(.in(min), .out(bin_to_BCD2));
	
	hexa this_hexa1(.bin(bin_to_BCD1[3:0]), .hex(display1));
	hexa this_hexa2(.bin(bin_to_BCD1[7:4]), .hex(display2));
	
	hexa this_hexa3(.bin(bin_to_BCD2[3:0]), .hex(display3));
	hexa this_hexa4(.bin(bin_to_BCD2[7:4]), .hex(display4));
	
	
endmodule
