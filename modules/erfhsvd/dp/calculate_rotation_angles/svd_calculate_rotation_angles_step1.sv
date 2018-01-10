`include "../../../../constants.sv"

module svd_calculate_rotation_angles_step1 (
  input logic [`WORD_LENGTH-1:0] a,
  input logic [`WORD_LENGTH-1:0] b,
  input logic [`WORD_LENGTH-1:0] c,
  input logic [`WORD_LENGTH-1:0] d,
  output logic [`WORD_LENGTH-1:0] N1,
  output logic [`WORD_LENGTH-1:0] N2,
  output logic [`WORD_LENGTH-1:0] D1,
  output logic [`WORD_LENGTH-1:0] D2,
  output logic [`WORD_LENGTH-1:0] K1,
  output logic [`WORD_LENGTH-1:0] K2,
  output logic [1:0] D1xorN1,
  output logic [1:0] D2xorN2
);

logic [`WORD_LENGTH-1:0] cpb, dma, cmb, dpa;
logic [`WORD_LENGTH-1:0] expD1, expN1, expD2, expN2;
logic [1:0] S_N1, S_D1, S_N2, S_D2;

priority_encoder p1(.in(D1), .out(expD1));
priority_encoder p1(.in(N1), .out(expN1));
priority_encoder p1(.in(D2), .out(expD2));
priority_encoder p1(.in(N2), .out(expN2));

always_comb begin 
  // add c and b and extract sign bit, N1 is then the modulus
  cpb = c + b;
  S_N1 = (cpb[`WORD_LENGTH-1] == 1) ? -1 : 1;
  N1 = (S_N1 == -1) -cpb : cpb;

  // subtract a from d and extract sign bit, D1 is then the modulus
  dma = d - a;
  S_D1 = (dma[`WORD_LENGTH-1] == 1) ? -1 : 1;
  D1 = ((S_D1 == -1) -dma : dma) << 1;

  K1 = expD1 - expN1

  // subtract b from c and extract sign bit, N2 is then the modulus
  cmb = c - b;
  S_N2 = (cmb[`WORD_LENGTH-1] == 1) ? -1 : 1;
  N2 = (S_N2 == -1) -cmb : cmb;

  // add d and a and extract sign bit, D2 is then the modulus
  dpa = d + a;
  S_D2 = (dpa[`WORD_LENGTH-1] == 1) ? -1 : 1;
  D2 = ((S_D2 == -1) -dpa : dpa) << 1;

  K2 = expD2 - expN2;

  D1xorN1 = S_D1 ^ S_N1;
  D2xorN2 = S_D2 ^ S_N2;
end

endmodule
