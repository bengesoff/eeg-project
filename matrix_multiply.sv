// C=AB
module matrix_multiply
#(
	parameter MATRIX_SIZE=3,
	parameter WORD_LENGTH=8
)
(
	input logic [WORD_LENGTH-1:0] A[0:MATRIX_SIZE-1][0:MATRIX_SIZE-1],
	input logic [WORD_LENGTH-1:0] B[0:MATRIX_SIZE-1][0:MATRIX_SIZE-1],
	output logic [WORD_LENGTH-1:0] C[0:MATRIX_SIZE-1][0:MATRIX_SIZE-1]
);

integer x, y, z;
always_comb begin
  for(x=0; x<MATRIX_SIZE; x=x+1)
    for(y=0; y<MATRIX_SIZE; y=y+1) begin
      C[x][y] = 0;
	for(z=0; z<MATRIX_SIZE; z=z+1)
      	  C[x][y] = C[x][y] + (A[x][z]*B[z][y]);
    end
end

endmodule // matrix_multiply
