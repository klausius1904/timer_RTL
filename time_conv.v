	module time_converter #(parameter CLOCK_FREQ=25000000)(input clk, rst_b,
output reg clk_conv);

	localparam s = 5'b11101;
		
	reg [24:0] cnt_reg, cnt_next;
	reg clk_conv_next;

	always@(posedge clk or negedge rst_b) begin

		if(!rst_b)begin
			cnt_reg<=0;
			clk_conv<=0;
		end
		else begin
			cnt_reg <= cnt_next;
			clk_conv <= clk_conv_next;
		end
	end

	always@(*)begin
		cnt_next = cnt_reg;
		clk_conv_next = clk_conv;
		if(cnt_reg == CLOCK_FREQ)begin
			clk_conv_next=~clk_conv;
			cnt_next = 0;
		end
		else cnt_next=cnt_reg+1;

	end
	
endmodule
