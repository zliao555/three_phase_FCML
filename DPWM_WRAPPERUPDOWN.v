// DPWM wrapper aggregates the individual cells into a single phase. Gate signals can be thought of as the s and sB buses.
	module DPWM_WRAPPERUPDOWN(clk,rst,shflag,dpwm_duty,dpwm_s,dpwm_sb,PWMEN);
`include "param.v"

input clk;
input rst;
input shflag;
input unsigned [10:0] dpwm_duty;
input PWMEN;

output [4:0] dpwm_s;
output [4:0] dpwm_sb;

DPWMUPDOWN inst_dpwm_0(
.clk(clk),
.rst(rst),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_0),
.dpwm_angle_s(dpwm_angle_0_s),
.shflag(shflag),
.dpwm_s(dpwm_s[0]),
.dpwm_sb(dpwm_sb[0]));

DPWMUPDOWN inst_dpwm_1(
.clk(clk),
.rst(rst),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_1),
.dpwm_angle_s(dpwm_angle_1_s),
.shflag(shflag),
.dpwm_s(dpwm_s[1]),
.dpwm_sb(dpwm_sb[1]));

DPWMUPDOWN inst_dpwm_2(
.clk(clk),
.rst(rst),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_2),
.dpwm_angle_s(dpwm_angle_2_s),
.shflag(shflag),
.dpwm_s(dpwm_s[2]),
.dpwm_sb(dpwm_sb[2]));

DPWMUPDOWN inst_dpwm_3(
.clk(clk),
.rst(rst),
.dpwm_duty(dpwm_duty),
	.dpwm_angle(dpwm_angle_3),
.dpwm_angle_s(dpwm_angle_3_s),
.shflag(shflag),
.dpwm_s(dpwm_s[3]),
.dpwm_sb(dpwm_sb[3]));

DPWMUPDOWN inst_dpwm_4(
.clk(clk),
.rst(rst),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_4),
.dpwm_angle_s(dpwm_angle_4_s),
.shflag(shflag),
.dpwm_s(dpwm_s[4]),
.dpwm_sb(dpwm_sb[4]));

endmodule