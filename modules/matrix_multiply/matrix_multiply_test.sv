module matrix_multiply_test;

logic [7:0] inA[2:0][2:0];
logic [7:0] inB[2:0][2:0];
logic [7:0] out[2:0][2:0];

matrix_multiply mm(inA, inB, out);

logic [7:0] x, y;

initial begin
	for (x=0; x<3; x=x+1) begin
		for (y=0; y<3; y=y+1) begin
			inA[x][y] = x;
			inB[x][y] = y;
		end
	end
end
endmodule
