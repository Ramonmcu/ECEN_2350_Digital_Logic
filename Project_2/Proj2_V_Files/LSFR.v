module LSFR(start, num, clk, out, temp);

input start;
input clk;
input [12:0] num;

output [12:0] temp;
output [12:0] out=13'b0101010101010;

//assign n = num;


wire bit;
reg [1:0] f = 01;

assign bit = num[7];

reg [12:0]temp;
reg [12:0]out;

always @ (posedge clk)
  if (out > 00) begin
  out <= out - 1;
  end
  else if (f == 01) begin
  temp[0] <= num[0];
  temp[1] <= num[1];
  temp[2] <= num[2];
  temp[3] <= num[3];
  temp[4] <= num[4];
  temp[5] <= num[5];
  temp[6] <= num[6];
  temp[7] <= num[7];
  temp[8] <= num[8];
  temp[9] <= num[9];
  temp[10] <= num[10];
  temp[11] <= num[11];
  temp[12] <= num[12];
  
  temp[1] <= temp[0];
  temp[2] <= temp[1] ^ bit;
  temp[3] <= temp[2];
  temp[4] <= temp[3] ^ bit;
  temp[5] <= temp[4];
  temp[6] <= temp[5] ^ bit;
  temp[7] <= temp[6];
  temp[8] <= temp[7] ^ bit;
  temp[9] <= temp[8];
  temp[10] <= temp[9] ^ bit;
  temp[11] <= temp[10];
  temp[12] <= temp[11];
  f <= 00;
  out <= temp;
  end   
endmodule 