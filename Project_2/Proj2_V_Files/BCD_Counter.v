module BCD_Counter(clk,Rbutton,en,S0,S1,S2,S3,S4,S5);

input clk;
input [1:0]en;

input Rbutton;

output [3:0]S0 = 0;
output [3:0]S1 = 0;
output [3:0]S2 = 0;
output [3:0]S3 = 0;
output [3:0]S4 = 0;
output [3:0]S5 = 0;

reg [3:0]S0;
reg [3:0]S1;
reg [3:0]S2;
reg [3:0]S3;
reg [3:0]S4;
reg [3:0]S5;

always @(posedge clk)
		begin 
			if(en==2'b00 || en==2'b01)
			begin 
				S0 = 0;
				S1 = 0;
				S2 = 0;
				S3 = 0;
				S4 = 0;
				S5 = 0;
			end 
			else if (en==2'b10)
			begin
				if(S0 == 4'b1001)
				begin 
					S0 <= 0;
					if(S1 == 4'b1001)
					begin
						S1 <= 0;
						if(S2 == 4'b1001)
						begin
							S2 <= 0;
							if(S3 == 4'b1001)
							begin
								S3 <= 0;
								if(S4 == 4'b1001)
								begin
									S4 <=0;
									if(S5==4'b1001)
									begin
										S5<=10;
										if(S5== 10)
										begin
											S4<=11;
											if(S4==11);
											begin
												S3<=11;
												if(S3==11)
												begin
													S2<=12;
													if(S2==12)
													begin
														S1<=11;
														if(S1==11)
															S0<=13;
														end 
													end 
												end 
											end
										end 
									else 
										S5<=S5+1;
									end 
								else 
									S4 <= S4+1;
								end 
							else 
								S3<=S3+1;
							end
						else 
							S2<=S2+1;
						end
					else 
						S1 <= S1+1;
					end
				else 
					S0<= S0+1;
					end  
					end
endmodule 
