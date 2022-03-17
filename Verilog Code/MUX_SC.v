/***************************************************************************
 *** Scalable Multiplexer which if SEL = 0 ==> A, SEL = 1 ==> B	 	        ***
 *** for SEL unkown or z ==> any bits for which A and B are the same 	    ***
 *** out = those bits, else, the output is x	   			                    ***
 ***************************************************************************/
`timescale 1 ns/ 1 ns

module MUX_SC(A,B,SEL,OUT);

parameter 	SIZE = 1;
integer 	i;
//Inputs/Outputs	
	input		SEL;
	input		[SIZE - 1: 0]A,B;
	output 		reg [SIZE - 1: 0]OUT;

//Start the conditions
	always @(A or B or SEL)begin	
		if 	(SEL == 1'b0)
			OUT = A;		                  //When SEL is 0 A is the output
		else if	(SEL == 1'b1)
			OUT = B;		                  //When SEL is 1 B is the output
		else begin		                	//When Sel is neither 0 nor 1:
			for (i=0; i<SIZE; i=i+1)
			if (A[i] === B[i])	          //resolve any bits for which A and B are the same
				OUT[i] = A[i];              //A and B are the same so it wouldn't matter if A[i] or B[i] is the output
			else 
			   	OUT[i] = 1'bx;          	//Any bits in conflict result in UNKOWN(X)  output
		end
		end
endmodule
