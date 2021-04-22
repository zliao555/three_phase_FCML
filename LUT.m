clear all;
close all;
clc;

range_out = 135; % peak value of the sin/cos signal: always use a value which is exact multiple of 2/9 to an exact number
index = 485; % modulation index

% range_out = 500 is 100khz with 100Mhz crystal
% nearest factor of 2/9 is 504

% range_out = 250 is 200khz with 100Mhz crystal
% nearest factor of 2/9 is 252

% range_out = 139 is 180khz with 50Mhz crystal
% nearest factor of 2/9 is 135

b_in = 10; % number of input angle bits (signed)
b_out = 10; % number of output bits (signed)
range_in = 2 ^ b_in - 1; % range of the resolver in decimal
p = 4; % cycles per one angular rotation

for i=0:range_in
    angle = mod(round(i * p),range_in);
    theta = angle / range_in * 2 * pi;
%     cosine(i + 1) = 0.5 + round(range_out * (cos(theta) + 1) / 2) - (range_out + 1) / 2;
%     sine(i + 1) = 0.5 + round(range_out * (sin(theta) + 1) / 2) - (range_out + 1) / 2;
    cosine(i + 1) = range_out * cos(theta) * 0.9;
    sine(i + 1) = range_out * sin(theta) * 0.9;
%     cosine(i + 1) = range_out * sawtooth(theta,0.5);
%     sine(i + 1) = range_out * sawtooth(theta,0.5);
end

fileID = fopen('LUT.v','w');
fprintf(fileID,'module LUT(angle,sin,cos);\r\n');
str = ['input [',int2str(b_in - 1),':0] angle;\r\n'];
fprintf(fileID,str);
str = ['output signed [',int2str(b_out - 1),':0] sin;\r\n'];
fprintf(fileID,str);
str = ['output signed [',int2str(b_out - 1),':0] cos;\r\n'];
fprintf(fileID,str);
str = ['reg signed [',int2str(b_out - 1),':0] sin;\r\n'];
fprintf(fileID,str);
str = ['reg signed [',int2str(b_out - 1),':0] cos;\r\n'];
fprintf(fileID,str);
str = ['always@(angle)\r\n'];
fprintf(fileID,str);
str = ['case(angle)\r\n'];
fprintf(fileID,str);

for i = 0:range_in
    if((sine(i + 1) >= 0) && (cosine(i + 1) >= 0))
        str = [int2str(b_in),'''d',int2str(i),':\r\n begin\r\n sin = ',int2str(b_out),'''d',int2str(abs(sine(i + 1))),';\r\n cos = ',int2str(b_out),'''d',int2str(abs(cosine(i + 1))),';\r\n end\r\n'];
        fprintf(fileID,str);
    elseif((sine(i + 1) >= 0) && (cosine(i + 1) < 0))
        str = [int2str(b_in),'''d',int2str(i),':\r\n begin\r\n sin = ',int2str(b_out),'''d',int2str(abs(sine(i + 1))),';\r\n cos = -',int2str(b_out),'''d',int2str(abs(cosine(i + 1))),';\r\n end\r\n'];
        fprintf(fileID,str);
    elseif((sine(i + 1) < 0) && (cosine(i + 1) >= 0))
        str = [int2str(b_in),'''d',int2str(i),':\r\n begin\r\n sin = -',int2str(b_out),'''d',int2str(abs(sine(i + 1))),';\r\n cos = ',int2str(b_out),'''d',int2str(abs(cosine(i + 1))),';\r\n end\r\n'];
        fprintf(fileID,str);
    else
        str = [int2str(b_in),'''d',int2str(i),':\r\n begin\r\n sin = -',int2str(b_out),'''d',int2str(abs(sine(i + 1))),';\r\n cos = -',int2str(b_out),'''d',int2str(abs(cosine(i + 1))),';\r\n end\r\n'];
        fprintf(fileID,str);
    end
end

fprintf(fileID,'endcase\r\n');
fprintf(fileID,'endmodule');
fclose(fileID);

i = 0:1:range_in;
hold on
plot(i,cosine,i,sine)
legend('COSINE','SINE')
xlabel('Index')
ylabel('Magnitude')
grid on
hold off

step = range_out * 2 / 9;
phase_0 = -range_out;
phase_1 = phase_0 + step;
phase_2 = phase_1 + step;
phase_3 = phase_2 + step;
phase_4 = phase_3 + step;
phase_5 = phase_4 + step;
phase_6 = phase_5 + step;
phase_7 = phase_6 + step;
phase_8 = phase_7 + step;

fileID = fopen('param.v','w');
fprintf(fileID,'//parameter file\r\n');
fprintf(fileID,'//phase shift for dpwm\r\n');

if(phase_0 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_0 = ',int2str(b_in),'''d',int2str(phase_0),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_0 = -',int2str(b_in),'''d',int2str(-phase_0),';\r\n'];
fprintf(fileID,str);
end

if(phase_1 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_1 = ',int2str(b_in),'''d',int2str(phase_1),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_1 = -',int2str(b_in),'''d',int2str(-phase_1),';\r\n'];
fprintf(fileID,str);
end

if(phase_2 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_2 = ',int2str(b_in),'''d',int2str(phase_2),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_2 = -',int2str(b_in),'''d',int2str(-phase_2),';\r\n'];
fprintf(fileID,str);
end

if(phase_3 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_3 = ',int2str(b_in),'''d',int2str(phase_3),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_3 = -',int2str(b_in),'''d',int2str(-phase_3),';\r\n'];
fprintf(fileID,str);
end

if(phase_4 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_4 = ',int2str(b_in),'''d',int2str(phase_4),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_4 = -',int2str(b_in),'''d',int2str(-phase_4),';\r\n'];
fprintf(fileID,str);
end

if(phase_5 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_5 = ',int2str(b_in),'''d',int2str(phase_5),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_5 = -',int2str(b_in),'''d',int2str(-phase_5),';\r\n'];
fprintf(fileID,str);
end

if(phase_6 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_6 = ',int2str(b_in),'''d',int2str(phase_6),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_6 = -',int2str(b_in),'''d',int2str(-phase_6),';\r\n'];
fprintf(fileID,str);
end

if(phase_7 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_7 = ',int2str(b_in),'''d',int2str(phase_7),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_7 = -',int2str(b_in),'''d',int2str(-phase_7),';\r\n'];
fprintf(fileID,str);
end

if(phase_8 >= 0)
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_8 = ',int2str(b_in),'''d',int2str(phase_8),';\r\n'];
fprintf(fileID,str);
else
str = ['parameter signed [',int2str(b_in - 1),':0] dpwm_angle_8 = -',int2str(b_in),'''d',int2str(-phase_8),';\r\n'];
fprintf(fileID,str);
end

fprintf(fileID,'//ramp counter boundary\r\n');

str = ['parameter signed [',int2str(b_in - 1),':0] up = ',int2str(b_in),'''d',int2str(range_out),';\r\n'];
fprintf(fileID,str);
str = ['parameter signed [',int2str(b_in - 1),':0] down = -',int2str(b_in),'''d',int2str(range_out),';\r\n'];
fprintf(fileID,str);

fprintf(fileID,'//modulation index\r\n');

str = ['parameter signed [',int2str(b_in - 1),':0] index = ',int2str(b_in),'''d',int2str(index),';\r\n'];
fprintf(fileID,str);


fclose(fileID);