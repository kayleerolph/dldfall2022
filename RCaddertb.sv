`timescale 1ns / 1ps
module tb ();

   logic    [3:0] a;
   logic 	[3:0] b;
   logic 	c;
   logic 	[3:0] sum;
   logic    [3:0] Sum_Correct;
   logic        Cout;
   logic        clk;   
   
  // instantiate device under test
   RCadder dut (a, b, c, sum, Cout);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end

  integer handle3;
  integer desc3;
  integer i;
  assign Sum_Correct = a+b+c;

    initial
	begin

	handle3 = $fopen("rca.out");
	desc3 = handle3;
	#2500 $finish;
	

	end

    initial
	begin

	for (i=0; i<128; i=i+1)
		begin
		@(posedge clk)
		begin
		  a = $random;
		  b = $random;
		  c = 1'b0;
		end
		@(negedge clk)
		begin
		$fdisplay(desc3,"%h %h || %h| %h | %b", a, b, sum, Sum_Correct, (sum == Sum_Correct));
		end
	end
	end



   
endmodule
