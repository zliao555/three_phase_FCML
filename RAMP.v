module RAMP(clk,rst,intlv_phase,dpwm_angle,ramp_ref);
`include "param.v"

// this ramp has range of -450 to +450 for 10 level inverter: [(+450) - (-450)] / 9 = 100
// the phase angle is initialized at master reset

input clk;	// input reference clock
input rst;	// master reset
input intlv_phase;

input unsigned [10:0] dpwm_angle;	// dpwm phase angle

output unsigned [10:0] ramp_ref;	// reference ramp

reg unsigned [10:0] counter;	// incremental counter for ramp generation

always@(posedge clk)	// update reference ramp at clock positive edge
begin
	if(rst == 0)	// reset
	begin
		if(intlv_phase == 0)
		begin
			counter <= dpwm_angle;
		end
		else
		begin
			counter <= dpwm_angle + (dpwm_angle >> 1);
		end
	end
	else
	begin
		if(counter < up)
		begin
			counter <= counter + 1'b1;
		end
		else
		begin
			counter <= down;
		end
	end
end

assign ramp_ref = counter;

endmodule
