// SAP-1 Output Register Design

/*
Register loads 8 bits from bus using the from_BUS bits when enable_load == LOW

Register data always available on output 8 bits display 
*/

module Register_output(from_BUS, register, enable_load, clock);
  
  input enable_load, clock;
  input [7:0] from_BUS;
  
  output reg[7:0] register;
  
  always @(posedge clock) begin
    
    if (enable_load == 1'b0)
      register <= from_BUS;

  end
    
endmodule
