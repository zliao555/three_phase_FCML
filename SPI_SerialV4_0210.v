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


module SPI_SerialV4(
      input wire clk, 						//input reference clock
	   input wire spi_clk,					//spi clock
      input wire spi_cs,					//spi chip select
      input wire spi_out, 					//from master
      output wire [32:0] spi_rdata,
      output wire testo,
		output wire test1o,
		output wire test2o
//	   output wire [6:0] CurrentState_po,
//		output wire ResetO
		); 	//store in fpga

    
reg unsigned [6:0] CurrentState_p;
reg unsigned [5:0] State_filter; 
reg unsigned [32:0] spi_data_out;
reg unsigned [32:0] spi_rout;
reg send;
reg unsigned spi_clkstate;
reg unsigned test;
reg unsigned test1;
reg unsigned test2;
reg unsigned [5:0]counter;
//reg unsigned Reset;
reg unsigned [13:0] count_nnoise;
reg unsigned [13:0] cs_nnoise;
//reg unsigned StartF;
reg [2:0] spi_clkr;
always @ (posedge clk) spi_clkr <= {spi_clkr[1:0],(spi_clk  & (count_nnoise > 14'd195))}; 
wire spi_clkre = (spi_clkr[2:1] == 2'b01);
wire spi_clkfe = (spi_clkr[2:1] == 2'b10);
reg [2:0] spi_csr;
always @ (posedge clk) spi_csr <= {spi_csr[1:0],spi_cs & (cs_nnoise > 14'd6858)};
wire spi_csactive = ~spi_csr;
wire spi_startmessage = (spi_csr[2:1] == 2'b10);
wire spi_endmessage = (spi_csr[2:1] == 2'b01);
reg [1:0] spi_outr;
always @ (posedge clk) spi_outr <= {spi_outr[0], spi_out};
wire spi_out_data = spi_outr[1];

initial begin 
	spi_data_out <= 0;
	CurrentState_p <= 6'd32;
	State_filter <= 6'd0;
//	delay_count <= 0;
	test <= 1'b0;
//	state <= 1'b0;
	cs_nnoise <= 14'd0;
	count_nnoise <= 14'd0;
	send <= 1'b0;
	counter <= 7'd0;
end

always @ (posedge clk)
begin
	test1 <= (count_nnoise > 14'd195);
	test2 <= (cs_nnoise > 14'd6858);
	if(spi_startmessage)
	begin
		CurrentState_p <= 7'd0;
		test <= 1'b0;
		cs_nnoise <= 14'd0;
		count_nnoise <= 14'd0;
	end
	else if((spi_clkre) && (count_nnoise > 14'd195))
	begin
		count_nnoise <= 14'd0;
		case(CurrentState_p)
				6'd0: begin
				spi_data_out[32] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd1: begin
				spi_data_out[31] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd2: begin
				spi_data_out[30] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
					
				6'd3: begin
				spi_data_out[29] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd4: begin
				spi_data_out[28] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd5: begin
				spi_data_out[27] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd6: begin
				spi_data_out[26] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd7: begin
				spi_data_out[25] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd8: begin
				spi_data_out[24] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd9: begin
				spi_data_out[23] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd10: begin
				spi_data_out[22] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd11: begin
				spi_data_out[21] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd12: begin
				spi_data_out[20] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd13: begin
				spi_data_out[19] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd14: begin
				spi_data_out[18] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
					
				6'd15: begin
				spi_data_out[17] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
						
				6'd16: begin
				spi_data_out[16] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
							
				6'd17: begin
				spi_data_out[15] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd18: begin
				spi_data_out[14] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd19: begin
				spi_data_out[13] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd20: begin
				spi_data_out[12] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end

				
				6'd21: begin
				spi_data_out[11] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end

				6'd22: begin
				spi_data_out[10] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd23: begin
				spi_data_out[9] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd24: begin
				spi_data_out[8] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd25: begin
				spi_data_out[7] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd26: begin
				spi_data_out[6] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd27: begin
				spi_data_out[5] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd28: begin
				spi_data_out[4] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd29: begin
				spi_data_out[3] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd30: begin
				spi_data_out[2] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd31: begin
				spi_data_out[1] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd32: begin
				spi_data_out[0] <= spi_out_data;
				CurrentState_p <= CurrentState_p + 1'b1;
				end
				
				6'd33: begin
				CurrentState_p <= 6'd0;
				end
		endcase
	end
	else if(spi_endmessage && (CurrentState_p == 6'd33))
		test <= 1'b1;
	else
	begin
		count_nnoise <= count_nnoise + 1'b1;
		cs_nnoise <= cs_nnoise + 1'b1;
	end
//	else if(spi_endmessage && (CurrentState_p == 6'd33))
//	begin
//		spi_rout <= spi_data_out;
//		test <= 1'b1;
//	end
end

always @ (posedge clk)
begin
	if(spi_endmessage && (CurrentState_p == 6'd33))
	begin
		spi_rout <= spi_data_out;
	end
end
//end
//always @ (posedge spi_clk, posedge spi_cs)
//begin
//	if(spi_cs == 1)
//	begin
//		Reset <= 1'b1;
//		if(CurrentState_p == 0)
//		begin
//			test <= 1;
//			spi_rout <= spi_data_out;
//		end
//	end
//	else if(Reset == 1'b1)
//	begin
//		test <= 0;
//		Reset <= 1'b0;
//		CurrentState_p <= 6'd32;
//		spi_data_out[32] <= spi_out;
//	end
//	else
//	begin
//		CurrentState_p <= CurrentState_p - 1'b1;
//		case (CurrentState_p)	
//			
//			6'd32: begin
//			spi_data_out[31] <= spi_out;
//			end
//						
//			6'd31: begin
//			spi_data_out[30] <= spi_out;
//			end
//						
//			6'd30: begin
//			spi_data_out[29] <= spi_out;
//			end
//				
//			6'd29: begin
//			spi_data_out[28] <= spi_out;
//			end
//						
//			6'd28: begin
//			spi_data_out[27] <= spi_out;
//			end
//						
//			6'd27: begin
//			spi_data_out[26] <= spi_out;
//			end
//						
//			6'd26: begin
//			spi_data_out[25] <= spi_out;
//			end
//						
//			6'd25: begin
//			spi_data_out[24] <= spi_out;
//			end
//						
//			6'd24: begin
//			spi_data_out[23] <= spi_out;
//			end
//						
//			6'd23: begin
//			spi_data_out[22] <= spi_out;
//			end
//						
//			6'd22: begin
//			spi_data_out[21] <= spi_out;
//			end
//						
//			6'd21: begin
//			spi_data_out[20] <= spi_out;
//			end
//						
//			6'd20: begin
//			spi_data_out[19] <= spi_out;
//			end
//						
//			6'd19: begin
//			spi_data_out[18] <= spi_out;
//			end
//						
//			6'd18: begin
//			spi_data_out[17] <= spi_out;
//			end
//				
//			6'd17: begin
//			spi_data_out[16] <= spi_out;
//			end
//					
//			6'd16: begin
//			spi_data_out[15] <= spi_out;
//			end
//						
//			6'd15: begin
//			spi_data_out[14] <= spi_out;
//			end
//			
//			6'd14: begin
//			spi_data_out[13] <= spi_out;
//			end
//			
//			6'd13: begin
//			spi_data_out[12] <= spi_out;
//			end
//			
//			6'd12: begin
//			spi_data_out[11] <= spi_out;
//			end
//
//			
//			6'd11: begin
//			spi_data_out[10] <= spi_out;
//			end
//
//			6'd10: begin
//			spi_data_out[9] <= spi_out;
//			end
//			
//			6'd9: begin
//			spi_data_out[8] <= spi_out;
//			end
//			
//			6'd8: begin
//			spi_data_out[7] <= spi_out;
//			end
//			
//			6'd7: begin
//			spi_data_out[6] <= spi_out;
//			end
//			
//			6'd6: begin
//			spi_data_out[5] <= spi_out;
//			end
//			
//			6'd5: begin
//			spi_data_out[4] <= spi_out;
//			end
//			
//			6'd4: begin
//			spi_data_out[3] <= spi_out;
//			end
//			
//			6'd3: begin
//			spi_data_out[2] <= spi_out;
//			end
//			
//			6'd2: begin
//			spi_data_out[1] <= spi_out;
//			end
//			
//			6'd1: begin
//			spi_data_out[0] <= spi_out;
//			end
//			
//		endcase 
//	end
//end	
	
	
//always @ (negedge spi_clk or posedge spi_cs)
//begin
//	if(spi_cs == 1)
//	begin
//		test <= 0;
//	end
//	else
//	begin		
//		if(CurrentState_p == 0)
//		begin
//			test <= 1;
//			spi_rout <= spi_data_out;
//		end
//	end
//end

//assign CurrentState_po = CurrentState_p;
assign spi_rdata = spi_rout;
assign testo = test;
assign test1o = test1;
assign test2o = test2;
//assign spi_clkstateo = spi_clkstate;
//assign ResetO = Reset;

endmodule