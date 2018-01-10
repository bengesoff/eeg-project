`include "../constants.sv"

module priority_encoder (
  input logic [`WORD_LENGTH-1:0] in,
  output logic [`WORD_LENGTH-1:0] out,
  output logic valid
);

integer x;

always_comb begin
  out = 0;
  valid = 0;
  for (x=`WORD_LENGTH-1; x>=0; x=x-1) begin
    if (in[x] == 1) begin
      out = x;
      valid = 1;
      break;
    end
  end
end

endmodule

