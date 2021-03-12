module register_B(from_BUS, register, enable_load, clock);
  
  input enable_load, clock;
  input [7:0] from_BUS;
  
  output reg[7:0] register;
  
  always @(posedge clock) begin
    
    if (enable_load == 1'b0)
      register <= from_BUS;

  end
    
endmodule
