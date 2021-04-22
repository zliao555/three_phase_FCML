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


module SPI_Serial(
        input wire clk, 				//input reference clock
		  input wire spi_clk,			//spi clock
        input wire spi_cs,				//spi chip select
        input wire spi_out, 			//from master
        output reg [47:0]spi_rdata 	//store in fpga
    );
    
reg unsigned [5:0] CurrentState_p;
reg unsigned [47:0] spi_data_out;


initial begin 
	spi_data_out <= 0;
	CurrentState_p <= 6'd47;
end

always @ (posedge spi_clk) begin 
	if(spi_cs == 0) begin
			case (CurrentState_p)
			
			6'd47: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd46: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd45: begin 
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
		 
			6'd44: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			6'd43: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd42: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end

			6'd41: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end

			6'd40: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd39: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd38: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd37: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd36: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd35: begin 
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
		 
			6'd34: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd33: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd32: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end

			6'd31: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end

			6'd30: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd29: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd28: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd27: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd26: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd25: begin 
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
		 
			6'd24: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			6'd23: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd22: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end

			6'd21: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end

			6'd20: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd19: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd18: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd17: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd16: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd15: begin 
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
		 
			6'd14: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd13: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd12: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end

			6'd11: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end

			6'd10: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd9: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd8: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd7: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd6: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd5: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd4: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd3: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd2: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd1: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= CurrentState_p - 1'b1;
			end
			
			6'd0: begin
			spi_data_out[CurrentState_p] <= spi_out;
			CurrentState_p <= 6'd47;
			end
			
			endcase 
		end
end

always @ (posedge clk) begin
   if(spi_cs == 1) begin
		spi_rdata <= spi_data_out;
	end
end
    
endmodule
