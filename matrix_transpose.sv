// Produces the transpose of a square matrix at the output
module matrix_transpose
#(
	parameter MATRIX_SIZE=3,
	parameter WORD_LENGTH=8
)
(
	input logic [WORD_LENGTH-1:0] A[0:MATRIX_SIZE-1][0:MATRIX_SIZE-1],
	output logic [WORD_LENGTH-1:0] A_t[0:MATRIX_SIZE-1][0:MATRIX_SIZE-1]
);

// Simply swap the X,Y coordinates of each element
integer x, y;
always_comb begin
  for(x=0; x<MATRIX_SIZE; x=x+1)
    for(y=0; y<MATRIX_SIZE; y=y+1)
      A_t[x][y] = A[y][x];
end

endmodule // matrix_transpose
