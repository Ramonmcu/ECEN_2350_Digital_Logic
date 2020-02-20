module Multiplexer(f1,f2,f3,f4,select,out);

input [8:0]f1;
input [8:0]f2;
input [8:0]f3;
input [8:0]f4;

input [1:0]select;

output [8:0]out;

reg [8:0]out;

always @*

begin 
	if ( select == 2'b00 )
	out = f1;
		
	if ( select == 2'b01 )
	out = f2;
	
	if ( select == 2'b10 )
	out  = f3;
	
	if ( select == 2'b11 )
	out = f4;
	
end 

endmodule 
