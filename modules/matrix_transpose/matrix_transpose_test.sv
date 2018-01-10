module matrix_transpose_test;

logic [7:0] in[2:0][2:0];
logic [7:0] out[2:0][2:0];

matrix_transpose mt(in, out);

logic [7:0] x, y;

initial begin
	for (x=0; x<3; x=x+1) begin
		for (y=0; y<3; y=y+1) begin
			in[x][y] = x;
		end
	end
end
endmodule