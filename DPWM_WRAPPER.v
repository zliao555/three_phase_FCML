// DPWM wrapper aggregates the individual cells into a single phase. Gate signals can be thought of as the s and sB buses.
module DPWM_WRAPPER(clk,rst,intlv_phase,dpwm_duty,dpwm_s,dpwm_sb);
`include "param.v"

input clk;
input rst;
input intlv_phase;
input signed [10:0] dpwm_duty;

output [4:0] dpwm_s;
output [4:0] dpwm_sb;

DPWM inst_dpwm_0(
.clk(clk),
.rst(rst),
.intlv_phase(intlv_phase),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_0),
.dpwm_s(dpwm_s[0]),
.dpwm_sb(dpwm_sb[0]));

DPWM inst_dpwm_1(
.clk(clk),
.rst(rst),
.intlv_phase(intlv_phase),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_1),
.dpwm_s(dpwm_s[1]),
.dpwm_sb(dpwm_sb[1]));

DPWM inst_dpwm_2(
.clk(clk),
.rst(rst),
.intlv_phase(intlv_phase),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_2),
.dpwm_s(dpwm_s[2]),
.dpwm_sb(dpwm_sb[2]));

DPWM inst_dpwm_3(
.clk(clk),
.rst(rst),
.intlv_phase(intlv_phase),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_3),
.dpwm_s(dpwm_s[3]),
.dpwm_sb(dpwm_sb[3]));

DPWM inst_dpwm_4(
.clk(clk),
.rst(rst),
.intlv_phase(intlv_phase),
.dpwm_duty(dpwm_duty),
.dpwm_angle(dpwm_angle_4),
.dpwm_s(dpwm_s[4]),
.dpwm_sb(dpwm_sb[4]));

endmodule