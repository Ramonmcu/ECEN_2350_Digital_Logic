module Project2_top(out,clk50M,Start,Stop,Reset,Switch,SS0,SS1,SS2,SS3,SS4,SS5,LED0,LED1,LED2,,LED3,LED4,LED5,LED6,LED7,LED8,LED9);

//dont think we need switch...
input Start;
input Reset;
input Stop;
input Switch;
input clk50M;

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

//assign LED1=0;
//assign LED2=0;
//assign LED3=0;
//assign LED4=0;
//assign LED5=0;
//assign LED6=0;
///assign LED7=0;
//assign LED8=0;
//assign LED9=0;


wire A,B,C,D,LED;

output [6:0]SS0;
output [6:0]SS1;
output [6:0]SS2;
output [6:0]SS3;
output [6:0]SS4;
output [6:0]SS5;

wire [3:0]SG0;
wire [3:0]SG1;
wire [3:0]SG2;
wire [3:0]SG3;
wire [3:0]SG4;
wire [3:0]SG5;

wire[6:0]dec0;
wire[6:0]dec1;
wire[6:0]dec2;
wire[6:0]dec3;
wire[6:0]dec4;
wire[6:0]dec5;

wire [3:0]current0;
wire [3:0]current1;
wire [3:0]current2;
wire [3:0]current3;
wire [3:0]current4;
wire [3:0]current5;

reg [1:0]state=2'b00;

reg highscore0=9;
reg highscore1=9;
reg highscore2=9;
reg highscore3=9;
reg highscore4=9;
reg highscore5=9;

 
wire clk1_out1;

wire LSFR_out;

//wire LSFR_out2=0;

wire num=13'b1010101010100;

wire temp;



reg select;

output wire [1:0]out;


Clk_Divider c1(clk50M,	clk1_out);

LSFR  LSFR1(.start(out),.num(num),.clk(clk1_out),.out(LSFR_out),.temp(temp));

//assign num=temp;

StateMachine s1(clk1_out,Reset,Start,Stop,LSFR_out,out);

LEDlighter(out,A,B,C,D,LED);

assign LED1=A;
assign LED2=B;
assign LED3=C;
assign LED4=D;

assign LED0=LED;

//mux M1(highscore0,current0,out,SG0);
//mux M2(highscore1,current1,out,SG1);
//mux M3(highscore2,current2,out,SG2);
//mux M4(highscore3,current3,out,SG3);
//mux M5(highscore4,current4,out,SG4);
//mux M6(highscore5,current5,out,SG5);

BCD_Counter C1(.clk(clk1_out),.Rbutton(Reset),.en(out),.S0(SG0),.S1(SG1),.S2(SG2),.S3(SG3),.S4(SG4),.S5(SG5));
//state 1
BCD_encoder B0(SG0,dec0);
BCD_encoder B1(SG1,dec1);
BCD_encoder B2(SG2,dec2);
BCD_encoder B3(SG3,dec3);
BCD_encoder B4(SG4,dec4);
BCD_encoder B5(SG5,dec5);

assign SS0=dec0;
assign SS1=dec1;
assign SS2=dec2;
assign SS3=dec3;
assign SS4=dec4;
assign SS5=dec5;



 
endmodule 