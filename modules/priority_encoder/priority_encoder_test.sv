`include "../constants.sv"

module priority_encoder_test;
  logic [`WORD_LENGTH-1:0] in;
  logic [`WORD_LENGTH-1:0] out;

  priority_encoder dut (.*);

  integer x;

  initial begin
    for (x=0; x<10; x=x+1) begin
      in = x;
      #10ns;
      $display("%b\t%b", in, out);
    end
  end


endmodule

