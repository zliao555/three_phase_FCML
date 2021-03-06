module NASA(clk,spi_clkin,spi_MOSIin,spi_csin,gha,gla,ghb,glb,ghc,glc,dpwm_sADC,ramp_refoo,dutyx,spi_clkino,spi_MOSIino,spi_csino,spi_clkstateoo,SPISendout);
`include "param.v"

input clk;
input spi_clkin;
input spi_MOSIin;
input spi_csin;

output [4:0] gha;
output [4:0] gla;
output [4:0] ghb;
output [4:0] glb;
output [4:0] ghc;
output [4:0] glc;
output [10:0] ramp_refoo;
output dpwm_sADC;
output [32:0] dutyx;
output spi_clkino;
output spi_MOSIino;
output spi_csino;
output spi_clkstateoo;
output SPISendout;

assign spi_clkino = spi_clkin;
assign spi_MOSIino = spi_MOSIin;
assign spi_csino = spi_csin;

wire unsigned [32:0] dpwm_duty;

reg rst_bounce;

reg [9:0] watchdog = 0;

reg rst = 0;


always@(posedge clk)
begin
	watchdog <= watchdog + 1'b1;
	if(watchdog[9] == 1)
	begin
		rst <= 1;
	end
end

always@(negedge clk)
begin
	if(rst == 1)
		rst_bounce <= 1'b1;
	else
		rst_bounce <= 0;
end

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

SPI_SerialV3 inst_spi_serial(
.clk(clk_100),
.spi_clk(spi_clkin),
.spi_cs(spi_csin),
.spi_out(spi_MOSIin),
.spi_rdata(dpwm_duty),
.spi_clkstateo(spi_clkstateoo),
.testo(SPISendout));

assign dutyx = dpwm_duty;

DPWM_WRAPPERUPDOWN inst_dpwmwrapper_phase_A(
.clk(clk_100),
.rst(rst_bounce),
.dpwm_duty(dpwm_duty[32:22]),//dpwm_duty[42:32]
.dpwm_s(dpwm_sA),
.dpwm_sb(dpwm_sAn));

DPWM_WRAPPERUPDOWN inst_dpwmwrapper_phase_B(
.clk(clk_100),
.rst(rst_bounce),
.dpwm_duty(dpwm_duty[21:11]),//dpwm_duty[26:16]
.dpwm_s(dpwm_sB),
.dpwm_sb(dpwm_sBn));

DPWM_WRAPPERUPDOWN inst_dpwmwrapper_phase_C(
.clk(clk_100),
.rst(rst_bounce),
.dpwm_duty(dpwm_duty[10:0]),//dpwm_duty[10:0]
.dpwm_s(dpwm_sC),
.dpwm_sb(dpwm_sCn));

/*always @ (posedge clk)
begin
	ADCpwm <= dpwm_duty[42:32] >> 1;
end*/

ADC_INT_TrigUPDOWN inst_ADC_INT_Trig(
.clk(clk_100),
.rst(rst_bounce),
.dpwm_angle(dpwm_angle_4),
.dpwm_s(dpwm_sADC),
.ramp_ref(ramp_refoo));

assign gha = dpwm_sA;
assign gla = dpwm_sAn;

assign ghb = dpwm_sB;
assign glb = dpwm_sBn;

assign ghc = dpwm_sC;
assign glc = dpwm_sCn;

endmodule