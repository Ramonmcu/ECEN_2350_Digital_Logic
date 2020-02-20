module Clk_Divider(clk,clkout);

input clk;

output clkout; 

reg clkout; 

reg [15:0]counter;

parameter n=25000;

always @(posedge clk)
	begin 
		if (counter == n)
			begin 
	        clkout=~clkout;
			  counter=0;
			end 
		else 
			begin
		     counter=counter+1;
			end 
 
	
	end 


endmodule 