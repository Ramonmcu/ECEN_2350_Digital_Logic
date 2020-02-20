module BCD_encoder( bcd, leds,);

input [3:0]bcd;

 

output [6:0]leds; 

reg [6:0]leds; 

always @(bcd) 
	case(bcd)
		0: leds = ~7'b1111110;
		1: leds = ~7'b0110000;
		2: leds = ~7'b1101101;
		3: leds = ~7'b1111001;
		4: leds = ~7'b0110011;
		5: leds = ~7'b1011011;
		6: leds = ~7'b1011111;
		7: leds = ~7'b1110000;
		8: leds = ~7'b1111111;
		9: leds = ~7'b1111011;
		10: leds = 7'b0110000;
		11: leds = 7'b1111010;
		12: leds = ~7'b1111110;
		13: leds =  7'b1111111;
	endcase 
endmodule 
