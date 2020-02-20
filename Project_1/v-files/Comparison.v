module Comparison(x,y,mode,OF,Out);

	input [3:0]x, y;
	input [1:0]mode;
	input OF;
	
	output [8:0]Out;
	
	wire [8:0]ew;
	wire [8:0]gw;
	wire [8:0]lw;
	wire [8:0]mw;
	
	assign ew[8] = OF;
	assign gw[8] = OF;
	assign lw[8] = OF;
	assign mw[8] = OF;
	
	EQUAL_gate E1 (.x(x[3:0]),.y(y[3:0]),.list(ew));
	GREATER_gate G1(.x(x[3:0]),.y(y[3:0]),.list(gw));
	LESSTHAN_gate L1(.x(x[3:0]),.y(y[3:0]),.list(lw));
	MAX_gate M1(.x(x[3:0]),.y(y[3:0]),.list(mw));
	
	Multiplexer M2(.f1(ew),.f2(gw),.f3(lw),.f4(mw),.select(mode),.out(Out));
	
endmodule

module EQUAL_gate(x,y,list);

input [3:0]x;
input [3:0]y;

output reg [7:0]list;

always @* begin

if (x==y)

	list[7:0] = 8'b00000001;
else 
	list[7:0] = 8'b00000000;

end

endmodule

module GREATER_gate(x,y,list);

input [3:0]x;
input [3:0]y;

output reg [7:0]list;

always @* begin

if (x>y)
	list[7:0] = 8'b00000001;
else 
	list[7:0] = 8'b00000000;
	
end

endmodule

module LESSTHAN_gate(x,y,list);

input [3:0]x;
input [3:0]y;

output reg [7:0]list;

always @* begin

if (x<y) 
	list[7:0] = 8'b00000001;
else 
	list[7:0] = 8'b00000000;
	
end
	
endmodule 

module MAX_gate(x,y,list);

input [3:0]x;
input [3:0]y;

output reg [7:0]list;

always @* begin

if (x>y)
	list[7:0] = { 4'b0000 ,x[3:0]};
else 
	list[7:0] = { 4'b0000, y[3:0]};
	
end

endmodule