// Produces the transpose of a square matrix at the output
module matrix_transpose (A, A_transpose);

// Default is 3x3 matrix with an 8-bit integer for each element
parameter MATRIX_SIZE=3, WORD_LENGTH=8;

input [WORD_LENGTH-1:0] A[0:MATRIX_SIZE-1][0:MATRIX_SIZE-1];
output [WORD_LENGTH-1:0] A_transpose[0:MATRIX_SIZE-1][0:MATRIX_SIZE-1];

// Simply swap the X,Y coordinates of each element
integer x, y;
always_comb begin
  for(x=0; x<MATRIX_SIZE; x=x+1)
    for(y=0; y<MATRIX_SIZE; y=y+1)
      A_transpose[x][y] = A[y][x];
end

endmodule // matrix_transpose
