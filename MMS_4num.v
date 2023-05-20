module MMS_4num(result, select, number0, number1, number2, number3);

	input        select;
	input  [7:0] number0;
	input  [7:0] number1;
	input  [7:0] number2;
	input  [7:0] number3;
	output reg [7:0] result; 

	reg cmp0, cmp1, cmp2; 
	reg [7:0] mux0, mux1;
	always @(*) begin
		// number0、1 comparison
		cmp0 = (number0 < number1) ? 1'b1:1'b0;
		case ({select, cmp0})
			2'b00: mux0 = number0;
			2'b01: mux0 = number1;
			2'b10: mux0 = number1;
			2'b11: mux0 = number0;
			// default: mux0 = number0;
		endcase

		// number2、3 comparison
		cmp1 = (number2<number3)? 1'b1:1'b0;
		case ({select, cmp1})
			2'b00: mux1 = number2;
			2'b01: mux1 = number3;
			2'b10: mux1 = number3;
			2'b11: mux1 = number2;
			// default: mux1 = number2;
		endcase

		// mux0、1 comparison
		cmp2 = (mux0<mux1)? 1'b1:1'b0;
		case ({select, cmp2})
			2'b00: result = mux0;
			2'b01: result = mux1;
			2'b10: result = mux1;
			2'b11: result = mux0;
			// default: result = mux0;
		endcase
	end
endmodule