module Three_Phase_PFC(clk,spi_clkin,spi_MOSIin,spi_csin,gha,gla,ghb,glb,ghc,glc,dpwm_sADC,dpwm_sADC1,PWMEN);
`include "param.v"

input clk;
input spi_clkin;
input spi_MOSIin;
input spi_csin;
input PWMEN;

output [4:0] gha;
output [4:0] gla;
output [4:0] ghb;
output [4:0] glb;
output [4:0] ghc;
output [4:0] glc;
output dpwm_sADC;
output dpwm_sADC1;
//output testo;
//output test1o;
//output test2o;

wire unsigned [26:0] dpwm_duty_spi;
reg unsigned [26:0] dpwm_duty;
wire PWMEN1 = 1'b0;
wire updateo;
wire updateo1;

reg [4:0] gha_buf;
reg [4:0] gla_buf;
reg [4:0] ghb_buf;
reg [4:0] glb_buf;
reg [4:0] ghc_buf;
reg [4:0] glc_buf;
reg rst_bounce;
reg [9:0] watchdog = 0;
reg rst = 0;
reg flagp1;
reg flagp2;
reg flagp3;
reg shflagp2;
reg shflagp3;


//assign clko = clk;
//assign spi_clkino = spi_clkin;
//assign spi_MOSIino = spi_MOSIin;
//assign spi_csino = spi_csin;
assign gha = gha_buf;
assign gla = gla_buf;
assign ghb = ghb_buf;
assign glb = glb_buf;
assign ghc = ghc_buf;
assign glc = glc_buf;
//assign test1o = dpwm_sADC;
//assign test1o = spi_csin;
//assign test1o = spi_clkin;

always@(posedge clk)
begin
	if(~watchdog[9])
		watchdog <= watchdog + 1'b1;
end

//always@(negedge clk)
//begin
//	rst_bounce <= watchdog[9];
//end

//always@(posedge clk)
//begin
//	watchdog <= watchdog + 1'b1;
//	if(watchdog[9] == 1)
//	begin
//		rst <= 1;
//	end
//end
//
//always@(negedge clk)
//begin
//	if(rst == 1)
//		rst_bounce <= 1'b1;
//	else
//		rst_bounce <= 0;
//end

reg [17:0] angle;

/*always@(negedge clk)
begin
	angle <= angle + 1;
end

wire signed [9:0] sin;
wire signed [9:0] cos;

LUT inst_LUT(
.angle(angle[17:8]),
.sin(sin),
.cos(cos));*/


/*always@(posedge clk)
begin
	dpwm_duty <= sin * index;
end*/


wire clk_100;

pll_in inst_pll(
.inclk0(clk),
.c0(clk_100));

wire [4:0] dpwm_sA;
wire [4:0] dpwm_sAn;
wire [4:0] dpwm_sB;
wire [4:0] dpwm_sBn;
wire [4:0] dpwm_sC;
wire [4:0] dpwm_sCn;

SPI_SerialV4 inst_spi_serial(
.clk(clk_100),
.spi_clk(spi_clkin),
.spi_cs(spi_csin),
.spi_out(spi_MOSIin),
.spi_rdata(dpwm_duty_spi),
//.testo(test2o)
//.test1o(test1o),
//.test2o(test2o)
//.testo(SPISendout),
//.CurrentState_po(CurrentState_poo),
//.ResetO(Resetoo)
);

//always@(posedge clk)	// compare the duty cycle with the ramp at negative edge
//begin
//	dpwm_duty[32:22] = 11'd50;
//	dpwm_duty[21:11] = 11'd150;
//	dpwm_duty[10:0] = 11'd200;
//end
always @ (posedge clk)
begin
	if(updateo)
		dpwm_duty <= dpwm_duty_spi;
end
//assign dutyx = dpwm_duty;
always @ (posedge clk)
begin
	if(dpwm_duty[26:18] < 11'd100 || (dpwm_duty[26:18] >= 11'd200 && dpwm_duty[26:18] < 11'd300) || (dpwm_duty[26:18] >= 11'd400 && dpwm_duty[26:18] <= 11'd500))
	begin
//		flagp1 <= 0;
		if(dpwm_duty[17:9] < 11'd100 || (dpwm_duty[17:9] >= 11'd200 && dpwm_duty[17:9] < 11'd300) || (dpwm_duty[17:9] >= 11'd400 && dpwm_duty[17:9] <= 11'd500))
		begin
			shflagp2 <= 0;
		end
		else
		begin
			shflagp2 <= 1;
		end
		
		if(dpwm_duty[8:0] < 11'd100 || (dpwm_duty[8:0] >= 11'd200 && dpwm_duty[8:0] < 11'd300) || (dpwm_duty[8:0] >= 11'd400 && dpwm_duty[8:0] <= 11'd500))
		begin
			shflagp3 <= 0;
		end
		else
		begin
			shflagp3 <= 1;
		end
	end
	else
	begin
		if((dpwm_duty[17:9] >= 11'd100 && dpwm_duty[17:9] < 11'd200) || (dpwm_duty[17:9] >= 11'd300 && dpwm_duty[17:9] < 11'd400))
		begin
			shflagp2 <= 0;
		end
		else
		begin
			shflagp2 <= 1;
		end
		if((dpwm_duty[8:0] >= 11'd100 && dpwm_duty[8:0] < 11'd200) || (dpwm_duty[8:0] >= 11'd300 && dpwm_duty[8:0] < 11'd400))
		begin
			shflagp3 <= 0;
		end
		else
		begin
			shflagp3 <= 1;
		end
//		flagp1 <= 1;
	end
//	if(dpwm_duty[21:11] < 11'd100 || (dpwm_duty[21:11] >= 11'd200 && dpwm_duty[21:11] < 11'd300) || (dpwm_duty[21:11] >= 11'd400 && dpwm_duty[21:11] <= 11'd500))
//	begin
//		flagp2 <= 0;
//	end
//	else
//	begin
//		flagp2 <= 1;
//	end
//	if(dpwm_duty[11:0] < 11'd100 || (dpwm_duty[11:0] >= 11'd200 && dpwm_duty[11:0] < 11'd300) || (dpwm_duty[11:0] >= 11'd400 && dpwm_duty[11:0] <= 11'd500))
//	begin
//		flagp3 <= 0;
//	end
//	else
//	begin
//		flagp3 <= 1;
//	end
end

always @ (posedge clk)
begin
	//if(dpwm_duty[31] == 1 && dpwm_duty[20] == 1 && dpwm_duty[9] == 1)
//	if(PWMEN == 1'b1)
//	begin
		gha_buf[4] <= (dpwm_sA[4] & PWMEN);
		gha_buf[3] <= (dpwm_sA[3] & PWMEN);
		gha_buf[2] <= (dpwm_sA[2] & PWMEN);
		gha_buf[1] <= (dpwm_sA[1] & PWMEN);
		gha_buf[0] <= (dpwm_sA[0] & PWMEN);
		gla_buf[4] <= (dpwm_sAn[4] & PWMEN);
		gla_buf[3] <= (dpwm_sAn[3] & PWMEN);
		gla_buf[2] <= (dpwm_sAn[2] & PWMEN);
		gla_buf[1] <= (dpwm_sAn[1] & PWMEN);
		gla_buf[0] <= (dpwm_sAn[0] & PWMEN);

		ghb_buf[4] <= (dpwm_sB[4] & PWMEN);
		ghb_buf[3] <= (dpwm_sB[3] & PWMEN);
		ghb_buf[2] <= (dpwm_sB[2] & PWMEN);
		ghb_buf[1] <= (dpwm_sB[1] & PWMEN);
		ghb_buf[0] <= (dpwm_sB[0] & PWMEN);
		glb_buf[4] <= (dpwm_sBn[4] & PWMEN);
		glb_buf[3] <= (dpwm_sBn[3] & PWMEN);
		glb_buf[2] <= (dpwm_sBn[2] & PWMEN);
		glb_buf[1] <= (dpwm_sBn[1] & PWMEN);
		glb_buf[0] <= (dpwm_sBn[0] & PWMEN);

		ghc_buf[4] <= (dpwm_sC[4] & PWMEN);
		ghc_buf[3] <= (dpwm_sC[3] & PWMEN);
		ghc_buf[2] <= (dpwm_sC[2] & PWMEN);
		ghc_buf[1] <= (dpwm_sC[1] & PWMEN);
		ghc_buf[0] <= (dpwm_sC[0] & PWMEN);
		glc_buf[4] <= (dpwm_sCn[4] & PWMEN);
		glc_buf[3] <= (dpwm_sCn[3] & PWMEN);
		glc_buf[2] <= (dpwm_sCn[2] & PWMEN);
		glc_buf[1] <= (dpwm_sCn[1] & PWMEN);
		glc_buf[0] <= (dpwm_sCn[0] & PWMEN);
//	end
//	else
//	begin
//		gha_buf <= 0;
//		gla_buf <= 0;

//		ghb_buf <= 0;
//		glb_buf <= 0;

//		ghc_buf <= 0;
//		glc_buf <= 0;
//	end
end


DPWM_WRAPPERUPDOWN inst_dpwmwrapper_phase_A(
.clk(clk_100),
.rst(watchdog[9]),
.shflag(0),
.dpwm_duty(dpwm_duty[26:18]),//dpwm_duty[42:32]
.dpwm_s(dpwm_sA),
.dpwm_sb(dpwm_sAn));

DPWM_WRAPPERUPDOWN inst_dpwmwrapper_phase_B(
.clk(clk_100),
.rst(watchdog[9]),
.shflag(shflagp2),
//.shflag(0),
.dpwm_duty(dpwm_duty[17:9]),//dpwm_duty[26:16]
.dpwm_s(dpwm_sB),
.dpwm_sb(dpwm_sBn));

DPWM_WRAPPERUPDOWN inst_dpwmwrapper_phase_C(
.clk(clk_100),
.rst(watchdog[9]),
.shflag(shflagp3),
//.shflag(0),
.dpwm_duty(dpwm_duty[8:0]),//dpwm_duty[10:0]
.dpwm_s(dpwm_sC),
.dpwm_sb(dpwm_sCn));

/*always @ (posedge clk)
begin
	ADCpwm <= dpwm_duty[42:32] >> 1;
end*/

ADC_INT_TrigUPDOWN inst_ADC_INT_Trig0(
.clk(clk_100),
.rst(watchdog[9]),
.dpwm_angle(dpwm_angle_0),
.dpwm_s(dpwm_sADC),
.updateo(updateo)
);


//ADC_INT_TrigUPDOWN1 inst_ADC_INT_Trig1(
//.clk(clk_100),
//.rst(watchdog[9]),
//.dpwm_angle(dpwm_angle_0),
//.dpwm_s(test1o)
//);

//ADC_INT_TrigUPDOWN inst_ADC_INT_Trig1(
//.clk(clk_100),
//.rst(watchdog[9]),
//.dpwm_angle(dpwm_angle_0_s),
//.dpwm_s(dpwm_sADC1),
//.updateo(updateo1)
//);

endmodule