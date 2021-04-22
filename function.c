#include "function.h"

float LPF30Hz(float out_LPF_prev, float input)
{
    float out_LPF;
    out_LPF = 0.99624425 * out_LPF_prev + 0.0037557523 * input;
    return out_LPF;
}

float PID(float out_PID_prev, float err, float err_prev, float Kp, float KiTs)
{
    float out_PID;
    out_PID = out_PID_prev + Kp*(err - err_prev) + KiTs * err;
    //out_PID = y + b0 * x + b1 * x_prev;
    return out_PID;
}

float limit(float input, float max, float min)
{
    float out_limit;
    out_limit = __fmax(input,min);
    out_limit = __fmin(out_limit,max);
    return out_limit;
}
