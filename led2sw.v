module led2sw(output [3:0]led_o, input rst, input clk);


reg q_reg;
reg [25:0] cnt_reg, cnt_nxt;
reg [3:0] shift_reg, shift_nxt;
reg clk_d;

parameter MAX = 26'd50000000;



always @(posedge clk_d)
	if (!rst)
	begin
		q_reg <= 0;
		shift_reg<=0;
	end
	else
	begin
		q_reg <= ~q_reg;
		shift_reg<=shift_nxt;
	end

//comb for shift
always @(q_reg, shift_reg)
begin
	shift_nxt = {q_reg,shift_reg[3:1]};
	
end

always @(posedge clk, negedge rst)
	if (!rst)
		cnt_reg <= 0;
	else
		cnt_reg <= cnt_nxt;

always @(cnt_reg)
begin
	cnt_nxt  =cnt_reg;
	clk_d = 1'b0;
	if (cnt_reg == MAX)
	begin
		cnt_nxt = 0;
		clk_d = 1'b1;
	end
	else
		cnt_nxt = cnt_reg+1;
end

assign led_o = shift_reg;

endmodule