//parameter file
//phase shift for dpwm
parameter unsigned [10:0] dpwm_angle_0 = 11'd100;
parameter unsigned [10:0] dpwm_angle_1 = 11'd300;
parameter unsigned [10:0] dpwm_angle_2 = 11'd500;
parameter unsigned [10:0] dpwm_angle_3 = 11'd700;
parameter unsigned [10:0] dpwm_angle_4 = 11'd900;

parameter unsigned [10:0] dpwm_angle_0_s = 11'd0;
parameter unsigned [10:0] dpwm_angle_1_s = 11'd200;
parameter unsigned [10:0] dpwm_angle_2_s = 11'd400;
parameter unsigned [10:0] dpwm_angle_3_s = 11'd600;
parameter unsigned [10:0] dpwm_angle_4_s = 11'd800;


//ramp counter boundary
parameter unsigned [10:0] up = 11'd1999;
parameter unsigned [10:0] PRD = 11'd500;
parameter unsigned [10:0] down = 11'd0;
//duty
parameter unsigned [10:0] duty = 11'd250;
//modulation index
parameter signed [10:0] index = 10'd485;

