module DEADTIME(clk,rst,dpwm,dpwm_s,dpwm_sb);

input clk;	// input reference clock
input rst;	// master reset
input dpwm; // input dpwm

output dpwm_s;	// output dpwm
output dpwm_sb;	// output complement dpwm

reg [3:0] delay_0;	// delay line
reg [3:0] delay_1;	// delay line

// using non-overlap clock generator with NAND gate

always@(posedge clk)	// latch delay at the clock positive edge
begin  
//	delay_0[2] <= delay_0[1];
//	delay_0[1] <= delay_0[0]; 
//	delay_0[0] <= ~((dpwm) & (delay_1[2]));	// choose delay value index for deadtime (can be unsymmetrical)
//	delay_0[4] <= delay_0[3];
//	delay_0[3] <= delay_0[2];
	delay_0[2] <= delay_0[1];
	delay_0[1] <= delay_0[0]; 
	delay_0[0] <= dpwm;	// choose delay value index for deadtime (can be unsymmetrical)
	
end

always@(posedge clk)	// latch delay at the clock positive edge
begin 
//	delay_1[2] <= delay_1[1];
//	delay_1[1] <= delay_1[0];
//	delay_1[0] <= ~((~dpwm) & (delay_0[2]));	// choose delay value index for deadtime (can be unsymmetrical)
//	delay_1[3] <= delay_1[2];
	delay_1[2] <= delay_1[1];
	delay_1[1] <= delay_1[0];
	delay_1[0] <= (~dpwm);	// choose delay value index for deadtime (can be unsymmetrical)
end

//assign dpwm_s = ~delay_0[0];
//assign dpwm_sb = ~delay_1[0];

assign dpwm_s = delay_0[2] & dpwm;
assign dpwm_sb = (delay_1[2]) & (~dpwm);

endmodule