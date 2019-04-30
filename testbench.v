`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2019 09:25:59 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clock;
    reg            reset;
    //reg            mod_cs;
    reg    [3:0]   dig0;
    reg    [3:0]   dig1;
    reg    [3:0]   dig2;
    reg    [3:0]   dig3;
    wire   [3:0]   cathod;
    wire   [7:0]   led_code;
    
    seven_seg dut (
        clock,
        reset,
        //mod_cs,
        dig0,
        dig1,
        dig2,
        dig3,
        cathod,
        led_code
    );
    
    
initial begin
    reset   =   0;
    clock   =   0;
    //mod_cs  =   1;
    dig0    =   0;
    dig1    =   0; 
    dig2    =   0;
    dig3    =   0; 
end

always begin
    #5; clock = ~clock;
end

initial begin
    #100; reset = 1'b1;
    #100; reset = 1'b0;
    #100; 
    
    //mod_cs = 1'b0; 
    
    #100;
    new_seg (4'h0, 4'h1, 4'h2, 4'h3);

end 
    
task new_seg;
    input [3:0] num0;
    input [3:0] num1;
    input [3:0] num2;
    input [3:0] num3;
        begin
            dig0 = num0;
            dig1 = num1;
            dig2 = num2;
            dig3 = num3;
        end
endtask
    
endmodule
