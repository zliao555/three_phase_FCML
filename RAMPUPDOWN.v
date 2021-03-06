module RAMPUPDOWN(clk,rst,dpwm_angle,ramp_ref);
`include "param.v"

// this ramp has range of -450 to +450 for 10 level inverter: [(+450) - (-450)] / 9 = 100
// the phase angle is initialized at master reset

input clk;	// input reference clock
input rst;	// master reset

input unsigned [10:0] dpwm_angle;	// dpwm phase angle
output unsigned [10:0] ramp_ref;	// reference ramp
reg unsigned [10:0] counter;	// incremental counter for ramp generation
reg unsigned dir;
//reg unsigned [10:0] shift;
//reg unsigned dir_shift;

initial begin
//	if(dpwm_angle > PRD) begin
//		shift <= (PRD - dpwm_angle);
//		dir_shift <= 1'b1;
//	end
//	else begin
//		shift <= dpwm_angle;
//		dir_shift <= 1'b0;
//	end
	dir <= 1'b0;
	counter <= 1'b0;
end

always@(posedge clk)	// update reference ramp at clock positive edge
begin
	if(rst == 0)	// reset
	begin
		if(dpwm_angle > PRD) begin
			counter <= (2*PRD - dpwm_angle);
//			dir <= 1'b1;
		end
		else begin
			counter <= dpwm_angle;
//			dir <= 1'b0;
		end
//		counter <= ((dpwm_angle > PRD) & (2*PRD - dpwm_angle)) | (~(dpwm_angle > PRD) & dpwm_angle);
		dir <= (dpwm_angle > PRD);
	end
	else
	begin
		if(dir == 0)
		begin
			if(counter <= (PRD - 2'b10)) begin
				counter <= counter + 1'b1;
			end
			else begin
				counter <= counter + 1'b1;
				dir <= 1'b1;
			end
		end
		else begin
			if(counter >= 2'b10) begin
				counter <= counter - 1'b1;
			end
			else begin
				counter <= counter - 1'b1;
				dir <= 1'b0;
			end
		end
	end
end

assign ramp_ref = counter;

endmodule
