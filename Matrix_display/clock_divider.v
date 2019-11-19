// //////////////////////////////////////
// Author: 	Daniel Ball 					//
// Date: 	Aug 30, 2019					//
// Project:	variable_clock_divider  	//
// Contact: daniel.s.ball@gmail.com 	//
// //////////////////////////////////////


// limit (parameter): the number of postive edges 
// of the input clock before the output clock toggles
// output frequency will be input/(limit*2)

// example:
// clock_divider #(50) clock_div_50M_to_500K(clock50MHZ, clock500KHZ);

module clock_divider(
    input input_clock,
    output reg output_clock
    );

	parameter limit;	// used as the clock divider
	reg [25:0] count = 0;
	
	always@(posedge input_clock)begin
		count = count + 1; 
		if(count == limit) begin
				count <= 0;
				output_clock <= ~output_clock;
		end
	end
endmodule
