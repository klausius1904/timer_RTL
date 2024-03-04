//Set CLOCK_FREQ TO 2500 FOR MILISECOND
//Set CLOCK_FREQ TO 2500000 FOR SECOND
module time_converter #(parameter CLOCK_FREQ = 2500000)(input clk, rst_b, en, 
output clk_conv);

	localparam IDLE= 2'b00;
	localparam CONVERTING = 2'b01;
	localparam OUT = 2'b10;

	localparam s = 5'b11000;
		
	reg [1:0] state_reg, state_next;
	reg [s-1:0] cnt_reg, cnt_next;
	reg clk_conv_reg, clk_conv_next;

	always@(posedge clk or negedge rst_b) begin

		if(!rst_b)begin
			state_reg <= IDLE;
			cnt_reg<=0;
			clk_conv_reg<=0;
		end
		else begin
			state_reg <= state_next;
			cnt_reg <= cnt_next;
		clk_conv_reg <= clk_conv_next;
		end
	end

	always@(*)begin
		state_next = state_reg;
		cnt_next = cnt_reg;
		clk_conv_next = clk_conv_reg;
		case(state_reg) 
			IDLE:
				begin
					clk_conv_next = 0;
					cnt_next = 0;
					state_next = CONVERTING ;
				end
			CONVERTING :
				begin
					if( cnt_reg != CLOCK_FREQ )begin 
					cnt_next = cnt_reg + 1;
					end
					else state_next = OUT; 
				end
			OUT:
				begin
					clk_conv_next = 1'b1;
					state_next = IDLE;
				end
		endcase	
	end
	assign clk_conv = clk_conv_reg;
	
endmodule
