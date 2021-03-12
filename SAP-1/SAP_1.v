module SAP_1(A, B, operation, enable_output, S);
  
  input [7:0] A, B;
  input operation, enable_output;
  
  output [7:0] S;
  wire [7:0] temp;
  
  assign temp = operation ? A - B : A + B;
  assign S = enable_output ? temp : 8'bZZZZZZZZ;

endmodule
