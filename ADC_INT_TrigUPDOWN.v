module ADC_INT_TrigUPDOWN(clk,rst,dpwm_angle,dpwm_s,updateo);

// dpwm_duty must be fed in at positive clock edge so it is stable at negative clock edge
// reset signal must be inserted at negative clock edge so the ramp initial values are loaded properly

input clk;
input rst;
input unsigned [10:0] dpwm_angle;
output dpwm_s;
output updateo;
wire unsigned dpwm_s_temp;
wire unsigned [10:0] ramp_ref;
reg unsigned adc; 
reg unsigned [3:0] counter;
reg unsigned adcout; 
reg [2:0] dpwm_s_tempr;
reg update;
always @ (posedge clk) dpwm_s_tempr <= {dpwm_s_tempr[1:0],dpwm_s_temp}; 
wire dpwm_s_tempre = (dpwm_s_tempr[2:1] == 2'b01);
wire dpwm_s_tempfe = (dpwm_s_tempr[2:1] == 2'b10);
// pipe positive edge
RAMPUPDOWN inst_ramp(
.clk(clk),
.rst(rst),
.dpwm_angle(dpwm_angle),
.ramp_ref(ramp_ref));

// pipe negative edge
COMP inst_compADC(
.clk(clk),
.rst(rst),
.ramp_ref(ramp_ref),
.dpwm_duty(11'd484),            
.dpwm(dpwm_s_temp));
//COMP inst_compADC(
//.clk(clk),
//.rst(rst),
//.ramp_ref(ramp_ref),
//.dpwm_duty(11'd100),
//.dpwm(dpwm_s_temp));
always @ (negedge clk)
begin
	if(ramp_ref <= 11'd2)
	begin
		update = 1'b1;
	end
	else
		update = 1'b0;
end
//always@(posedge clk)
//begin
//	if(counter < 4'd9)
//	begin
//		counter <= counter + (1'b1 & dpwm_s_tempre);
//		if(dpwm_s_tempfe)
//			adcout <= 0;
//	end
//	else
//	begin
//		counter <= 4'd0;
//		adcout <= 1;
//	end
//end

// pipe positive edge
//assign dpwm_s = (adcout & dpwm_s_temp);
assign dpwm_s = dpwm_s_temp;
assign updateo = update;
endmodule