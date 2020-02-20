module StateMachine(clk,clear,Start,Stop,Result,z);
	input clk,clear,Start,Stop;
	input [13:0]Result;
	output reg [1:0] z;
	reg [1:0] y,Y;
	localparam	A=2'b00, B=2'b01, C=2'b10, D=2'b11;
	
	
	always @(y,Start,Stop,Result,clear)
		case(y)
			A: if(!Start)  		  Y = B;
				else  	  		  Y = A;
			B: if(Result == 0 & Start)  Y = C; 
				else       		  Y = B;
			C: if(!Stop)   		  Y = D;
				else  	  		  Y = C;
			D: if(clear)   		  Y = A;
				else		  		  Y = D;		
			endcase

			always @(posedge clear, posedge clk)
				if(clear) y <= A;
				else y <= Y;

	//output assignments			
			always @(y)
				if 		(y==A) z = A;
				else if  (y==B) z = B;
				else if  (y==C) z = C;
				else if  (y==D) z = D;	

endmodule 	