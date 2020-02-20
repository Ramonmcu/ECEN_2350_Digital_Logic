module Arithmetic(x,y,mode,OF,Out);

input [3:0]x;
input [3:0]y;
input [1:0]mode;
input OF;

output [8:0]Out;

wire [8:0]add;
wire [8:0]sub;
wire [8:0]mult;
wire [8:0]div;

wire [7:0]z;
wire cout;

//reg [10:0]LEDcontrol;

assign z[7:4] = x[3:0];

assign z[3:0] = y[3:0];


AdderSubtractor Add1 (.x(x[3:0]),.y(y[3:0]),.cin(1'b0),.sum(add),.Cout(cout),.OF(add[8]));//will run it issue with seven seg if i assign carry ass 5 ele in binary array 

AdderSubtractor Add2 (.x(x[3:0]),.y(y[3:0]),.cin(1'b1),.sum(sub),.Cout(cout),.OF(sub[8]));//will run it issue with seven seg if i assign carry ass 5 ele in binary array

Multiple_operation Mult1 (.z(z[7:0]),.out(mult),.Overflow(mult[8]));

Divide_operation Div1 (.z(z[7:0]),.out(div));


Multiplexer M3 (.f1(add),.f2(sub),.f3(mult),.f4(div),.select(mode),.out(Out));

endmodule 

module AdderSubtractor(x,y,cin,sum,Cout,OF);

input [7:0] x,y;
input cin;

output [7:0] sum;
output Cout;
output OF;

wire [3:0] ynew;
wire c1,c2,c3;

//reg [3:0]sum;

//assign sum[7:4] = 4'b0000; 

assign ynew[0] = y[0]^cin;
assign ynew[1] = y[1]^cin;
assign ynew[2] = y[2]^cin;
assign ynew[3] = y[3]^cin;


fourbitAdder AD1(x,ynew,sum,cin,Cout,OF);

endmodule

module fourbitAdder(a,b,sum,cin,cout,Overflow);

input [3:0] a,b;
input cin;

output [3:0] sum;
output cout;
output Overflow;

reg Overflow;
wire c1,c2,c3;

TwoBitFullAdder s1 (.A(a[0]),.B(b[0]),.Cin(cin),.Sout(sum[0]),.Cout(c1));
TwoBitFullAdder s2 (.A(a[1]),.B(b[1]),.Cin(c1),.Sout(sum[1]),.Cout(c2));
TwoBitFullAdder s3 (.A(a[2]),.B(b[2]),.Cin(c2),.Sout(sum[2]),.Cout(c3));
TwoBitFullAdder s4 (.A(a[3]),.B(b[3]),.Cin(c3),.Sout(sum[3]),.Cout(cout));

always @*
begin 
	if ( cout ^ c3 == 1'b1)
		Overflow = 1'b1;
	else 
		Overflow = 1'b0;
end 
endmodule

module TwoBitFullAdder(A,B,Cin,Sout,Cout);

input A,B,Cin;

output Sout,Cout;

wire S1,C1,C2;

XORR_gate O1 (.x(A),.y(B),.z(S1));

ANDD_gate A1 (.x(A),.y(B),.z(C1));

ANDD_gate A2 (.x(S1),.y(Cin),.z(C2));

XORR_gate O2(.x(S1),.y(Cin),.z(Sout));

ORR_gate O3 (.x(C1),.y(C2),.z(Cout));

endmodule 

module ORR_gate(x,y,z);
input x,y;
output z;
assign z = x|y;
endmodule

module ANDD_gate(x,y,z);
input x,y;
output z;
assign z = x&y;
endmodule

module XORR_gate(x,y,z);
input x,y;
output z;
assign z = x^y;
endmodule


module Multiple_operation(z,out,Overflow);

input [7:0]z;

output [7:0]out;
output Overflow;

reg [7:0]out;
reg Overflow;

always @* 
begin
	if (z > 8'b01111111)
	 begin
		out[7:0] = 8'b00000000;
		Overflow=1'b1;
	 end
	else
	 begin
		out[7:0] = z[7:0] << 1;
		Overflow=1'b0;
	 end
end 
endmodule

module Divide_operation(z,out);

input [7:0]z;

output [7:0]out;

reg [7:0]out;

always @ *
begin

out[7:0] = z[7:0] >> 1;

end 

endmodule 

