module time_manager(input clk, rst_b, output reg[7:0] sec);

	reg[7:0] cnt_next;
	always@(posedge clk or negedge rst_b)begin
		if(!rst_b)sec <=0;
		else sec<=cnt_next;
	end
	always@(*)begin
		cnt_next = sec;
		if(sec!=256)begin
			cnt_next = sec+1;
		end
		else cnt_next = 0;	
	end
endmodule
