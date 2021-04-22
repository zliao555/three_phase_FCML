module DPWMUPDOWN(clk,rst,dpwm_duty,dpwm_angle,dpwm_angle_s,shflag,dpwm_s,dpwm_sb);

// dpwm_duty must be fed in at positive clock edge so it is stable at negative clock edge
// reset signal must be inserted at negative clock edge so the ramp initial values are loaded properly

input clk;
input rst;
input unsigned [10:0] dpwm_duty;
input unsigned [10:0] dpwm_angle;
input unsigned [10:0] dpwm_angle_s;
input shflag;
output dpwm_s;
output dpwm_sb;

wire unsigned [10:0] ramp_ref;
wire unsigned [10:0] ramp_ref_ns;
wire unsigned [10:0] ramp_ref_s;
wire dpwm;
//reg unsigned [10:0] o_dpwm_duty;
//wire unsigned [10:0] o_dpwm_duty;
// pipe positive edge
RAMPUPDOWN inst_ramp(
.clk(clk),
.rst(rst),
.dpwm_angle(dpwm_angle),
.ramp_ref(ramp_ref_ns));

RAMPUPDOWN inst_ramp_S(
.clk(clk),
.rst(rst),
.dpwm_angle(dpwm_angle_s),
.ramp_ref(ramp_ref_s));

//o_dpwm_duty <= dpwm_duty;
//assign o_dpwm_duty = dpwm_duty;
//always @ (negedge clk)
//begin
//	if(shflag == 0) 
//	begin
//		if(ramp_ref_ns == 0)
//		begin
//			o_dpwm_duty <= dpwm_duty;
//		end
//	end
//	else 
//	begin
//		if(ramp_ref_s == 0)
//		begin
//			o_dpwm_duty <= dpwm_duty;
//		end
//	end
//end

// pipe negative edge
COMP inst_comp(
.clk(clk),
.rst(rst),
.ramp_ref(ramp_ref_ns),
.ramp_ref_s(ramp_ref_s),
.shflag(shflag),
.dpwm_duty(dpwm_duty),
.dpwm(dpwm));
 
// pipe positive edge
DEADTIME inst_deadtime(
.clk(clk),
.rst(rst),
.dpwm(dpwm),
.dpwm_s(dpwm_s),
.dpwm_sb(dpwm_sb));

endmodule