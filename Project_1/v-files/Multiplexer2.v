module Multiplexer2 (z,select,Out);

input [10:0]z;
input [1:0]select;

output [8:0]Out;

reg [8:0]Out;
wire [8:0]Out1;
wire [8:0]Out2;
wire [8:0]Out3;

Logical L1(z[7:4],z[3:0],z[9:8],z[10],Out1);

Arithmetic Ar1(z[7:4],z[3:0],z[9:8],z[10],Out2);

Comparison C1(z[7:4],z[3:0],z[9:8],z[10],Out3);


always @*
begin 
	
	if ( select == 2'b00 )
	Out = Out1;
		 
	if ( select == 2'b01 )
	Out = Out2;
	
	if ( select == 2'b10 )
	Out = Out3;
	
	if (select == 2'b11)
	Out = 4'b0000;
	
end 

endmodule 