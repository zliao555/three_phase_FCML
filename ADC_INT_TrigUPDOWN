module ADC_INT_Trig(clk,rst,intlv_phase,dpwm_duty,dpwm_angle,dpwm_s);

// dpwm_duty must be fed in at positive clock edge so it is stable at negative clock edge
// reset signal must be inserted at negative clock edge so the ramp initial values are loaded properly

input clk;
input rst;
input intlv_phase;
input unsigned [10:0] dpwm_duty;
input unsigned [10:0] dpwm_angle;

output dpwm_s;

wire unsigned [10:0] ramp_ref;

reg unsigned [10:0] o_dpwm_duty;

// pipe positive edge
RAMP inst_ramp(
.clk(clk),
.rst(rst),
.intlv_phase(intlv_phase),
.dpwm_angle(dpwm_angle),
.ramp_ref(ramp_ref));

always @ (negedge clk)
begin
	if(ramp_ref == 0)
	begin
		o_dpwm_duty <= dpwm_duty;
	end
end

// pipe negative edge
COMPADC inst_compADC(
.clk(clk),
.rst(rst),
.ramp_ref(ramp_ref),
.dpwm_duty(o_dpwm_duty),
.dpwm(dpwm_s));

// pipe positive edge

endmodule