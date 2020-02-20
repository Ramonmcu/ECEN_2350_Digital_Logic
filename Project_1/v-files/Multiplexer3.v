module Multiplexer3 (z,select,out);

input z;
input select;

output out; 

reg out;

always @*
begin

	if (select == 1'b0)
		out = 1'b0;
	if (select == 1'b1)
		out = 1'b1;

end 

endmodule 