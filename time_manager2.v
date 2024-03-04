`define IDLE  3'b000
`define START 3'b001
`define STOP  3'b010
`define RESET 3'b100
`define SAVE_MEMORY 3'b101

module time_manager(input clk, rst_b, output reg[7:0] sec, output reg[7:0] min, input [2:0] operation, output reg [2:0] saved_operation, output reg we, output reg [9:0] address_op);
	
	reg reset_req_next, reset_req_reg;
	reg we_next;
	reg[9:0] addr_op_next;
	reg[7:0] cnt_next;
	reg[7:0] min_next;
	reg[2:0] state_reg, state_next;
	reg[2:0] saved_operation_next;
	always@(posedge clk or negedge rst_b)begin
		if(!rst_b)begin
			sec<=0;
			min<=0;
			state_reg <= `IDLE;
			reset_req_reg <=0;
			saved_operation <= 0;
			address_op <= 0;
			we<=0;
		end

		else begin
			sec<=cnt_next;
			min<=min_next;
			state_reg<=state_next;
			reset_req_reg<=reset_req_next;
			saved_operation <= saved_operation_next;
			address_op <= addr_op_next;
		end
	end
	always@(*) begin
		state_next = state_reg;
		cnt_next = sec;
		min_next = min;
		reset_req_next = reset_req_reg;
		saved_operation_next = saved_operation;
		addr_op_next = address_op;
		we_next = we;
		case(state_reg)
			`IDLE: begin
				we_next = 0;
				if(operation == 3'b001)begin
					cnt_next = reset_req_reg?8'd0:sec;
					min_next = reset_req_reg?8'd0:min;
					state_next = `SAVE_MEMORY;
					reset_req_next = 1'b0;
					
				end
				if(operation == 3'b100)begin
					cnt_next = sec;
					min_next = min;
					state_next = `SAVE_MEMORY;
				end
				
			end
			`START: begin
					we_next = 0;
					reset_req_next = 1'b0;
					cnt_next = sec+1;
					if(sec == 59) begin
						cnt_next = 0;
						min_next = min + 1;
					end
					if(min == 59 && sec == 59) begin
						cnt_next = 0;
						min_next = 0;
					end
					case(operation)
						3'b100: state_next = `SAVE_MEMORY;
						3'b000: state_next = `SAVE_MEMORY;
						3'b010: state_next = `SAVE_MEMORY;
					endcase

			end
			`STOP: begin
				we_next = 0;
				reset_req_next = 1'b0;
				state_next = `SAVE_MEMORY;
			end
			`RESET: begin
				we_next = 0;
				cnt_next = sec;
				reset_req_next = 1'b1;
				state_next = `SAVE_MEMORY;
			end
			`SAVE_MEMORY: begin
				addr_op_next = (address_op + 1)%10;
				we_next = 1;
				saved_operation_next = operation;
				state_next = operation;
			end
		endcase	

	end
endmodule
