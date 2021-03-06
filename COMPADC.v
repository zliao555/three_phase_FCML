module COMPADC(clk,rst,ramp_ref,dpwm_duty,dpwm);

input clk;	// input reference clock
input rst;	// master reset
input unsigned [10:0] ramp_ref;	// reference ramp
input unsigned [10:0] dpwm_duty;	// dpwm phase duty

output dpwm;	// dpwm

reg dpwm_toggle; // temp register for dpwm toggling

always@(negedge clk)	// compare the duty cycle with the ramp at negative edge
begin
	if(rst == 0)
	begin
		dpwm_toggle <= 0;	// reset
	end
	else
	begin
		if(dpwm_duty < ramp_ref)
		begin
			dpwm_toggle <= 1;
		end
		else
		begin
			dpwm_toggle <= 0;
		end
	end
end

assign dpwm = dpwm_toggle;

endmodule