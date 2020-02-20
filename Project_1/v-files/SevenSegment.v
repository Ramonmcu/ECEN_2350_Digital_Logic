module SevenSegment(SS,parts);

input [3:0]SS;

output [7:0]parts;

reg [7:0]parts;

always @ *
	case(SS)
		4'b0000: parts =  8'b00000011; //8'b11111100; //0 in hex 
		4'b0001: parts =  8'b10011111; //8'b01100000; //1 in hex
		4'b0010: parts =  8'b00100101; //8'b11011010; //2 in hex
		4'b0011: parts =  8'b00001101; //8'b11110010; //3 in hex
		4'b0100: parts =  8'b10011001; //01100110; //4 in hex 
		4'b0101: parts =  8'b01001001; //10110110; //5 in hex 	
		4'b0110: parts =  8'b01000001; //10111110; //6 in hex 
		4'b0111: parts =  8'b00011111; //11100000; //7 in hex 
		4'b1000: parts =  8'b00000001; //11111110; //8 in hex 
		4'b1001: parts =  8'b00001001; //11110110; //9 in hex
		4'b1010: parts =  8'b00010001; //11101110; //10 in hex
		4'b1011: parts =  8'b11000001; //00111110; //11 in hex
		4'b1100: parts =  8'b01100011; //10011100; //12 in hex
		4'b1101: parts =  8'b10000101; //01111010; //13 in hex
		4'b1110: parts =  8'b01100001; //10011110; //14 in hex
		4'b1111: parts =  8'b01110001; //10001110; //15 in hex
	endcase
endmodule 