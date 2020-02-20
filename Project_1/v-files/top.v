module top(sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8,sw9,key0,key1,Hex0,Hex1,Hex2,Hex3,Hex4,Hex5,LED0,LED1,LED2,LED3,LED4,LED5,LED6,LED7,LED8,LED9);

input sw0;
input sw1;
input sw2;
input sw3;
input sw4;
input sw5;
input sw6;
input sw7;
input sw8;
input sw9;
input key0;
input key1;


reg [1:0]select;

output [7:0]Hex0;
output [7:0]Hex1;
output [7:0]Hex2;
output [7:0]Hex3;
output [7:0]Hex4;
output [7:0]Hex5;

output LED0;
output LED1;
output LED2;
output LED3;
output LED4;
output LED5;
output LED6;
output LED7;
output LED8;
output LED9;

//assign LED0 = 1'b0;//truns off all leds
assign LED1 = 1'b0;
assign LED2 = 1'b0;
assign LED3 = 1'b0;
assign LED4 = 1'b0;
assign LED5 = 1'b0;
assign LED6 = 1'b0;
//assign LED7 = 1'b0;
//assign LED8 = 1'b0;
assign LED9 = 1'b0;

reg [10:0]z;

always @ *
begin
	z[10] = 1'b0;
	z[9] = sw9;
	z[8] = sw8;
	z[7] = sw7;
	z[6] = sw6;
	z[5] = sw5;
	z[4] = sw4;
	z[3] = sw3;
	z[2] = sw2;
	z[1] = sw1;
	z[0] = sw0;

end 

wire [1:0]m3in;

assign m3in[1] = 1'b1;

assign m3in[0] = 1'b0;

Multiplexer3 M6 (.z(m3in[1:0]),.select(select[0]),.out(LED7));

Multiplexer3 M7 (.z(m3in[1:0]),.select(select[1]),.out(LED8));

always @*
begin
	
	if(key0 == 2'b00)
	select[0] = ~select[0];
	
end
 
always @*
begin

	if (key1 == 2'b00)
	select[1] =  ~select[1];

end

wire [8:0]out;
//wire OFIND;

Multiplexer2 M5 (.z(z[10:0]),.select(select[1:0]),.Out(out[8:0]));

wire [7:0]ssout0;
wire [7:0]ssout1;
wire [7:0]ssout2;
wire [7:0]ssout3;
wire [7:0]ssout4;
wire [7:0]ssout5;

assign LED0 = out[8];

SevenSegment SS0 (.SS(out[3:0]),.parts(ssout0[7:0]));
SevenSegment SS1 (.SS(out[7:4]),.parts(ssout1[7:0]));
SevenSegment SS2 (.SS(4'b0000),.parts(ssout2[7:0]));
SevenSegment SS3 (.SS(4'b0000),.parts(ssout3[7:0]));
SevenSegment SS4 (.SS(4'b0000),.parts(ssout4[7:0]));
SevenSegment SS5 (.SS(4'b0000),.parts(ssout5[7:0]));

assign Hex0[7] = ssout0[0];
assign Hex0[6] = ssout0[1];
assign Hex0[5] = ssout0[2];
assign Hex0[4] = ssout0[3];
assign Hex0[3] = ssout0[4];
assign Hex0[2] = ssout0[5];
assign Hex0[1] = ssout0[6];
assign Hex0[0] = ssout0[7];

assign Hex1[7] = ssout1[0];
assign Hex1[6] = ssout1[1];
assign Hex1[5] = ssout1[2];
assign Hex1[4] = ssout1[3];
assign Hex1[3] = ssout1[4];
assign Hex1[2] = ssout1[5];
assign Hex1[1] = ssout1[6];
assign Hex1[0] = ssout1[7];

assign Hex2[7] = ssout2[0];
assign Hex2[6] = ssout2[1];
assign Hex2[5] = ssout2[2];
assign Hex2[4] = ssout2[3];
assign Hex2[3] = ssout2[4];
assign Hex2[2] = ssout2[5];
assign Hex2[1] = ssout2[6];
assign Hex2[0] = ssout2[7];

assign Hex3[7] = ssout3[0];
assign Hex3[6] = ssout3[1];
assign Hex3[5] = ssout3[2];
assign Hex3[4] = ssout3[3];
assign Hex3[3] = ssout3[4];
assign Hex3[2] = ssout3[5];
assign Hex3[1] = ssout3[6];
assign Hex3[0] = ssout3[7];

assign Hex4[7] = ssout4[0];
assign Hex4[6] = ssout4[1];
assign Hex4[5] = ssout4[2];
assign Hex4[4] = ssout4[3];
assign Hex4[3] = ssout4[4];
assign Hex4[2] = ssout4[5];
assign Hex4[1] = ssout4[6];
assign Hex4[0] = ssout4[7];

assign Hex5[7] = ssout5[0];
assign Hex5[6] = ssout5[1];
assign Hex5[5] = ssout5[2];
assign Hex5[4] = ssout5[3];
assign Hex5[3] = ssout5[4];
assign Hex5[2] = ssout5[5];
assign Hex5[1] = ssout5[6];
assign Hex5[0] = ssout5[7];

endmodule 