module BINARY_TO_BCD(input [7:0]in, output[7:0]out);

	reg[7:0] bcd;
	reg[3:0] i;
	
	always@(in) begin
		bcd = 0;
		for (i = 0; i < 8 ; i= i + 1) begin
			bcd = {bcd[6:0], in[7-i]};
		
			if( i < 7 && bcd[3:0] > 4)
				bcd[3:0] = bcd[3:0] + 3;
			if( i < 7 && bcd[7:4] > 4)
				bcd[7:4] = bcd[7:4] + 3;
		end	
	end

	assign out = bcd[7:0];

endmodule
