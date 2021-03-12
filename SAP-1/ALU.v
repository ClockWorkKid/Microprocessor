// SAP-1 ALU Design

/*
ALU adds numbers when operation == 0, subtracts B from accumulator A when operation == 1

ALU outputs data to bus when enable_output == 1

Combinational circuit, clock not required
*/

module ALU(A, B, operation, enable_output, S);
  
  input [7:0] A, B;
  input operation, enable_output;
  
  output [7:0] S;
  wire [7:0] temp;
  
  assign temp = operation ? A - B : A + B;
  assign S = enable_output ? temp : 8'bZZZZZZZZ;

endmodule
