`timescale 1ns / 1ps
module stimulus ();

   logic  clk;
   logic  reset;
   logic [63:0] seed;

   logic Fgrid;
   



  
  assign seed = 64'h0412_6424_0034_3C28;
   
   
   // Instantiate DUT
    GOL dut(clk, reset, seed, Fgrid);   
   
   // Setup the clock to toggle every 1 time units 
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end 
   
   initial 
     begin      
	#0   reset = 1'b1;
	#41  reset = 1'b0;	
     end

endmodule // FSM_tb

