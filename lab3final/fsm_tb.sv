`timescale 1ns / 1ps
module stimulus ();

//(clk, reset, left, right, LC, LB, LA, RA, RB, RC);


   logic  clk;
   logic  left;
   logic  right;
   logic  reset;

   logic LC;
   logic LB;
   logic LA;
   logic RC;
   logic RB;
   logic RA;
   
   
   integer handle3;
   integer desc3;
   
   // Instantiate DUT
   FSM dut (clk, reset, left, right, LC, LB, LA, RA, RB, RC);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

   always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b %b %b || %b %b %b %b %b %b", 
		     reset, left, right, LC, LB, LA, RA, RB, RC);
     end   
   
   initial 
     begin      
	#0   reset = 1'b1;
	#41  reset = 1'b0;	
	//#0   left = 1'b0;
	//#0   right = 1'b0;
	#20  left = 1'b1;
   #0   right = 1'b0;
     #20  left = 1'b0;
     #10   right = 1'b1;
     #20 right = 1'b0;
     #20  left = 1'b1;
     #0   right = 1'b1;
     end

endmodule // FSM_tb

//simulate with modelsim and find the out file

