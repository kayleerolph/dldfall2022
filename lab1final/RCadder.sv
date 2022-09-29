module fulladder (input  logic a, b, c, output logic sum, Cout);
   
  assign sum = a^b^c;
  assign Cout = a&b|a&c|b&c;
   
endmodule

module RCadder (input logic [3:0] a, b, input logic Cin, output logic [3:0] Sum, output logic Cout);
logic c1, c2, c3;
 
fulladder fa1 (a[0], b[0], 1'b0, Sum[0],c1);

fulladder fa2 (a[1], b[1], c1, Sum[1],c2);

fulladder fa3 (a[2], b[2], c2, Sum[2],c3);

fulladder fa4 (a[3], b[3], c3, Sum[3],Cout);

endmodule
