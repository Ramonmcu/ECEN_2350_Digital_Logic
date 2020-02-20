
module Logical(x,y,mode,OF,Out);

input [3:0]x;
input [3:0]y;
input [1:0]mode;
input OF;

output [8:0]Out;

wire [7:0]z;

wire [3:0]logcombo;

wire [8:0]andl;
wire [8:0]orl;
wire [8:0]xorl;
wire [8:0]notl;

assign andl[8] = OF;
assign orl[8] = OF;
assign xorl[8] = OF;
assign notl[8] = OF;

assign z[7:4] = x[3:0];

assign z[3:0] = y[3:0];


AND_gate A1 (.x(x[3:0]),.y(y[3:0]),.list(andl));

OR_gate O1 (.x(x[3:0]),.y(y[3:0]),.list(orl));

XOR_gate O2 (.x(x[3:0]),.y(y[3:0]),.list(xorl));

NOT_gate N1 (.z(z[7:0]),.list(notl));

Multiplexer M1(.f1(andl),.f2(orl),.f3(xorl),.f4(notl),.select(mode),.out(Out));

endmodule 

module AND_gate(x,y,list);

input [3:0]x;
input [3:0]y;

output [7:0]list;

reg [7:0]list;

always @* begin

 list[7:4] = 4'b0000;

 list[3:0] = x[3:0] & y[3:0];

end 

endmodule 

module OR_gate(x,y,list);

input [3:0]x;
input [3:0]y;

output [7:0]list;

reg [7:0]list;

always @* begin

 list[7:4] = 4'b0000;

 list[3:0] = x[3:0] | y[3:0];

end

endmodule 

module XOR_gate(x,y,list);

input [3:0]x;
input [3:0]y;

output [7:0]list;

reg [7:0]list;

always @* begin

 list[7:4] = 4'b0000;

 list[3:0] = x[3:0] ^ y[3:0];

end 

endmodule 

module NOT_gate(z,list);

input [7:0]z;

output [7:0]list;

reg [7:0]list;

always @* begin

 list[7:0] = ~z[7:0];

end 

endmodule 






