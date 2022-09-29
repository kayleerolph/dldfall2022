module silly (input  logic a, b, c, output logic sum, Cout);
   
  assign sum = a^b^c;  // sets output sum to  a XOR b XOR c
   assign Cout = a&b|a&c|b&c; // sets output Cout to (a AND b) OR (a AND c) OR (b AND c)
   
endmodule
