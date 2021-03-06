`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2019 10:44:48 AM
// Design Name: 
// Module Name: spi_serial
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SPI_SerialV3(
      input wire clk, 					//input reference clock
		input wire spi_clk,				//spi clock
      input wire spi_cs,				//spi chip select
      input wire spi_out, 				//from master
      output wire [32:0] spi_rdata,
		output wire spi_clkstateo,
		output wire testo,
		output wire [5:0] CurrentState_po); //store in fpga

    
reg unsigned [5:0] CurrentState_p;
reg unsigned [5:0] State_filter; 
reg unsigned [32:0] spi_data_out;
reg unsigned [32:0] spi_rout;
reg unsigned [5:0] filt_count;
reg unsigned spi_clkstate;
reg test;

initial begin 
	spi_data_out <= 0;
	CurrentState_p <= 6'd32;
	State_filter <= 6'd33;
	filt_count <= 0;
	spi_clkstate <= 0;
	test <= 1'b0;
end

always @ (posedge clk)
begin
	if(spi_cs == 0)
	begin
		test <= 1'b0;
		filt_count <= 5'd0;
		if(spi_clk == 1)
		begin
			spi_clkstate <= 1;
		end
		else if(spi_clkstate == 1)
		begin
//			spi_catch <= 1'b1;
			case (CurrentState_p)	
		
			6'd32: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd31: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
				spi_clkstate <= 1'b0;
			end
						
			6'd30: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
				
			6'd29: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd28: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd27: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd26: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd25: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd24: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd23: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd22: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd21: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd20: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd19: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd18: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
				
			6'd17: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
					
			6'd16: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
						
			6'd15: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd14: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd13: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd12: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end

			
			6'd11: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end

			6'd10: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd9: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd8: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd7: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd6: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd5: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd4: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd3: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd2: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd1: begin
			CurrentState_p <= CurrentState_p - 1'b1;
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end
			
			6'd0: begin
			State_filter <= State_filter - 1'b1;
			spi_data_out[CurrentState_p] <= spi_out;
			spi_clkstate <= 1'b0;
			end

			endcase 
		end
	end
	else
	begin
		spi_clkstate <= 1'b0;
		
		CurrentState_p <= 6'd32;
		
		if(State_filter == 0)
		begin
			spi_rout <= spi_data_out;
			test <= 1'b1;
		end
		if(filt_count <= 5'd3)
		begin
			filt_count <= filt_count + 1'b1;
		end
		else
		begin
			State_filter <= 6'd33;			
		end
	end
end

assign CurrentState_po = State_filter;
assign spi_rdata = spi_rout;
assign testo = test;
assign spi_clkstateo = spi_clkstate;

endmodule
