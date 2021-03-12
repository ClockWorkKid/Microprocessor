module SAP_1(from_BUS, to_BUS, register, enable_load, enable_output, clock);
  
  input enable_load, enable_output, clock;
  input [7:0] from_BUS;
  
  output reg[7:0] register;
  output tri[7:0] to_BUS;
  
  assign to_BUS = enable_output ? register : 8'bZZZZZZZZ;

  always @(posedge clock) begin
    
    if (enable_load == 1'b0)
      register <= from_BUS;

  end
    
endmodule
