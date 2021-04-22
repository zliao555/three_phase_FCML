`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2017 10:44:48 AM
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


module SPI_SerialV2(
        input wire clk, 				//input reference clock
		  input wire spi_clk,			//spi clock
        input wire spi_cs,				//spi chip select
        input wire spi_out, 			//from master
        output reg [47:0]spi_rdata 	//store in fpga
    );
    
reg unsigned [6:0] CurrentState_p;
reg unsigned [47:0] spi_data_out;
reg unsigned [1:0] spi_clkstate;
reg unsigned [1:0] spi_catch;


initial begin 
	spi_data_out <= 0;
	CurrentState_p <= 6'd47;
end

always @ (posedge clk)
begin
	if(spi_cs == 0)
	begin
		if(spi_clk == 1)
		begin
			spi_clkstate = 1;			
		end
		else if(spi_clkstate == 1)
		begin
			spi_catch <= 1'b1;
			spi_clkstate <= 1'b0;
		end
		
		if(spi_catch == 1)
		begin
			case (CurrentState_p)
			
			7'd47: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd46: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd45: begin 
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
		 
			7'd44: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd43: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd42: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end

			7'd41: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end

			7'd40: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd39: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd38: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd37: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd36: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd35: begin 
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
		 
			7'd34: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd33: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd32: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end

			7'd31: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end

			7'd30: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd29: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd28: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd27: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd26: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd25: begin 
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
		 
			7'd24: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			7'd23: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd22: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end

			7'd21: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end

			7'd20: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
		
			7'd19: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd18: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd17: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd16: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd15: begin 
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
		 
			7'd14: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd13: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd12: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end

			7'd11: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end

			7'd10: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd9: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd8: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd7: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd6: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd5: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd4: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd3: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd2: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd1: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			spi_catch <= 1'b0;
			end
			
			7'd0: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= 7'd47;
			spi_catch <= 1'b0;
			end
			
			endcase 
		end
	end
	else
	begin
		spi_clkstate <= 1'b0;
		spi_catch <= 1'b0;
		spi_rdata <= spi_data_out;
	end
end


    
endmodule
