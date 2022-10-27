module FSM (clk, reset, left, right, LC, LB, LA, RA, RB, RC);

   input logic  clk;
   input logic  reset;
   input logic 	left;
   input logic 	right;
   
   output logic LC;
   output logic LB;
   output logic LA;
   output logic RA;
   output logic RB;
   output logic RC;

   typedef enum 	logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
         nextstate = ((left == 1 & right == 1) ? S7 :  (left == 1 ? S1 : (right == 1 ? S4 : S0)));
	  LC <= 1'b0;
    LB <= 1'b0;
    LA <= 1'b0;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;	  
	 // if (left) nextstate <= S0;
	 // else   nextstate <= S1;
       end

       S1: begin
	  LA <= 1'b1;
    LB <= 1'b0;
    LC <= 1'b0;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;

	   nextstate <= S2;
	  
       end

       S2: begin
    LA <= 1'b1;
    LB <= 1'b1;
    LC <= 1'b0;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;
      nextstate <= S3;
    
       end
S3: begin
    LA <= 1'b1;
    LB <= 1'b1;
    LC <= 1'b1;
    RA <= 1'b0;
    RB <= 1'b0;
    RC <= 1'b0;
      nextstate <= S0;
end
S4: begin
    LA <= 1'b0;
    LB <= 1'b0;
    LC <= 1'b0;
    RA <= 1'b1;
    RB <= 1'b0;
    RC <= 1'b0;
      nextstate <= S5;
end
S5: begin
    LA <= 1'b0;
    LB <= 1'b0;
    LC <= 1'b0;
    RA <= 1'b1;
    RB <= 1'b1;
    RC <= 1'b0;
      nextstate <= S6;
end
S6: begin
    LA <= 1'b0;
    LB <= 1'b0;
    LC <= 1'b0;
    RA <= 1'b1;
    RB <= 1'b1;
    RC <= 1'b1;
      nextstate <= S0;
end

 S7: begin
	  LA <= 1'b1;
    LB <= 1'b0;
    LC <= 1'b0;
    RA <= 1'b1;
    RB <= 1'b0;
    RC <= 1'b0;

	   nextstate <= S8;
	  
       end
 S8: begin
	  LA <= 1'b1;
    LB <= 1'b1;
    LC <= 1'b0;
    RA <= 1'b1;
    RB <= 1'b1;
    RC <= 1'b0;

	   nextstate <= S9;
	  
       end
  S9: begin
	  LA <= 1'b1;
    LB <= 1'b1;
    LC <= 1'b1;
    RA <= 1'b1;
    RB <= 1'b1;
    RC <= 1'b1;

	   nextstate <= S0;
	  
       end



    default: begin  	  
	  nextstate <= S0;
       end
     endcase
   
endmodule
