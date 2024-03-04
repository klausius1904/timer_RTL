module BRAM #(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 10) (input [DATA_WIDTH-1:0] data_in, input[ADDR_WIDTH-1:0] adr_in, input clk, we, output reg [DATA_WIDTH-1:0] data_out);
	
	reg[DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
	always@(posedge clk) begin
		if(we) begin
			ram[adr_in] <= data_in;
		end
		data_out <= ram[adr_in];
	end
endmodule
