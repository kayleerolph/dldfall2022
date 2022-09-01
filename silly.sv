module silly (input  logic a, b, c, output logic sum, Cout);
   
  assign sum = a^b^c;
  assign Cout = a&b|a&c|b&c;
   
endmodule
