module hexa(input [3:0] bin, output [6:0] hex);
	reg [6:0]hex_reg;
	
	always@(bin)begin
		case(bin)
			4'b0000: hex_reg= 7'b0000001;
			4'b0001: hex_reg= 7'b1001111;
			4'b0010: hex_reg= 7'b0010010;
			4'b0011: hex_reg= 7'b0000110;
			4'b0100: hex_reg= 7'b1001100;	
			4'b0101: hex_reg= 7'b0100100;
			4'b0110: hex_reg= 7'b0100000;
			4'b0111: hex_reg= 7'b0001111;
			4'b1000: hex_reg= 7'b0000000;
			4'b1001: hex_reg= 7'b0000100;	
			4'b1010: hex_reg= 7'b0001000;
			4'b1011: hex_reg= 7'b1100000;
			4'b1100: hex_reg= 7'b0110001;
			4'b1101: hex_reg= 7'b1000010;
			4'b1110: hex_reg= 7'b0110000;
			4'b1111: hex_reg= 7'b0111000;
		endcase
	end
	assign hex = hex_reg;
		
endmodule
