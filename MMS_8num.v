// `include "MMS_4num.v"
module MMS_8num(result, select, number0, number1, number2, number3, number4, number5, number6, number7);

	input        select;
	input  [7:0] number0;
	input  [7:0] number1;
	input  [7:0] number2;
	input  [7:0] number3;
	input  [7:0] number4;
	input  [7:0] number5;
	input  [7:0] number6;
	input  [7:0] number7;
	output reg [7:0] result; 

	wire [7:0] rst0, rst1;
	reg cmp3;

	MMS_4num cmp0(.result(rst0), .select(select), .number0(number0), .number1(number1), .number2(number2), .number3(number3));
	MMS_4num cmp1(.result(rst1), .select(select), .number0(number4), .number1(number5), .number2(number6), .number3(number7));

	always @(*) begin
		cmp3 = (rst0<rst1)? 1'b1:1'b0;
		case ({select, cmp3})
			2'b00: result = rst0;
			2'b01: result = rst1;
			2'b10: result = rst1;
			2'b11: result = rst0;
			// default: result = rst0;
		endcase
	end
endmodule