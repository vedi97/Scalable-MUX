/***************************************************************************
 *** 									 ***
 *** ECE 526 L Experiment #6 		Vedi Ghahremanyans, Spring, 2022 ***
 *** 									 ***
 *** Experiment #6 Scalable MUX		         		 	 ***
 *** 								   	 ***
 ***************************************************************************
 *** Filename: MUX_SC_tb.v 		   Created by Vedi GH, 3/07/2022 ***
 *** --- revision history, if any, goes here --- 			 ***
 ***************************************************************************
 *** Scalable MUX Test Bench with 4 instances: (8013)                    ***
 *** Widths of the 4 instances are going to be: 1(defualt), 8,1,1,3.  	 ***
 ***************************************************************************/
`timescale 1 ns/ 1 ns
module MUX_SC_tb;
//In/Out that are going to be tested
	reg	[7:0] A,B;
	reg	SEL;
	wire 	[7:0]OUT4;
	wire 	[2:0]OUT3;
	wire 	OUT2;
	wire 	OUT1;

//Instances
MUX_SC MUXSC1(.A(A[0]), .B(B[0]), .SEL(SEL), .OUT(OUT1));			//Default: 1
MUX_SC MUXSC2(.A(A[0]), .B(B[0]), .SEL(SEL), .OUT(OUT2));			//Student ID digit: 1							
MUX_SC #(.SIZE(3)) MUXSC3(.A(A[2:0]), .B(B[2:0]), .SEL(SEL), .OUT(OUT3));	//Student ID digit: 3
defparam MUXSC4.SIZE = 8;							//SIZE = 8 for MUXSC4
MUX_SC MUXSC4(.A(A), .B(B), .SEL(SEL), .OUT(OUT4));				//Student ID digit: 8

//Monitor
	initial begin
		$monitor("%d:....A= %b, B= %b, SEL= %b.....|.....OUT1= %b, OUT2= %b, OUT3= %b, OUT4= %b", $time, A,B,SEL,OUT1,OUT2,OUT3,OUT4);
		end

//Test Cases: 
initial begin
	$vcdpluson;
	$display("\n");
	$display("\n");
	$display("\n");
	$display("\n						TEST CASES");
	$display("------------------------------------------------------------------------------------------------------------------");
	$display("\nSel = 0:");		//SEL=0 ==> A is the output
	A = 8'b10000110;
	B = 8'b00110011;
	SEL = 1'b0;

	#10 $display("\nSel = 1:");	//SEL=1 ==> B is the output
	A = 8'b10000110;
	B = 8'b00110011;
	SEL = 1'b1;

//Test cases when SEL = 1'bx
	#10 $display("\nSel = X, A and B Share All the Bits");	//SEL=1'bx ==> A=B
	A = 8'b11100111;
	B = 8'b11100111;
	SEL = 1'bx;

	#10 $display("\nSel = X, A and B Don't Share Any Bit");	//SEL=1'bx ==> A != B
	A = 8'b11100111;
	B = 8'b00011000;
	SEL = 1'bx;

	#10 $display("\nSel = X, A and B Share Some Bits");	//SEL=1'bx ==> A != B in some bits
	A = 8'b11100111;
	B = 8'b11001001;
	SEL = 1'bx;

	#10
	$display("\n------------------------------------------------------------------------------------------------------------------");
	$display("\n");
	$display("\n");
	$display("\n");

	#10 $finish;
	end
endmodule	
