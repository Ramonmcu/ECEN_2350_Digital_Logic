module LEDlighter(Case,A,B,C,D,LED);

input [1:0] Case;
output reg A,B,C,D,LED;

always @(Case)
begin
if(Case==2'b00)
begin
A = 1;
B = 0;
C = 0;
D = 0;
LED = 0;
end
else if(Case==2'b01)
begin
A = 0;
B = 1;
C = 0;
D = 0;
LED = 0;
end
else if(Case==2'b10)
begin
A = 0;
B = 0;
C = 1;
D = 0;
LED = 1;
end
else if(Case==2'b11) 
begin
A = 0;
B = 0;
C = 0;
D = 1;
LED = 1;
end
end

endmodule
