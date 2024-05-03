module counter (
	input			clk,
	input			rst,

	input			i_en,
	output	[31:0]	o_count
);
	reg		[31:0]	r_counter;

	always @(posedge clk) begin
		if (rst) begin
			r_counter	<=	0;
		end else begin
			if (i_en) begin
				r_counter	<=	r_counter + 1;
			end
		end
	end

	assign	o_count = r_counter;

endmodule