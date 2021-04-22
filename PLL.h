#ifndef PLL_H_
#define PLL_H_

#define PI2      6.283185307179586
#define Intrgral 0.00001    //1/50k Integral=>y = y + x*dt
#define InvPI2 0.159154943091895
//#define LPF_a1  0.99624425
//#define LPF_b0  0.0037557523

// 1P1Z ILoop


typedef struct {
    // Coefficients
    float32 LPF_a1;
    float32 LPF_b0;
    float32 PID_Kp;
    float32 PID_KiTs;

    // Output saturation limits
    float32 PID_Max;
    float32 PID_IMin;
    float32 PID_Min;
}PLL_Coeffs;

typedef struct {
    // Inputs
    float32 Vin1;
    float32 Vin2;
    float32 Vin3;

    // Internal values
    float32 pllcosth;
    float32 pllsinth;
    float32 pllcos2th;
    float32 pllsin2th;
    float32 pllVa;
    float32 pllVb;
    float32 pllVdp1;
    float32 pllVqp1;
    float32 pllVdn1;
    float32 pllVqn1;
    float32 pllVdp2;
    float32 pllVqp2;
    float32 pllVqp2_prev;
    float32 pllVdn2;
    float32 pllVqn2;
    float32 pllVdp2f;
    float32 pllVdp2f_prev;
    float32 pllVqp2f;
    float32 pllVqp2f_prev;
    float32 pllVdn2f;
    float32 pllVdn2f_prev;
    float32 pllVqn2f;
    float32 pllVqn2f_prev;
    float32 pllfreq;
    float32 pllfreq_prev;

    // Output values
    float32 Vs1;
    float32 plltheta;
}PLL_Vars;

/**
 * Calculates a second order control law with IIR filter and programmable output saturation.
 * @param CNTL_1P1Z_CLA_C_Coeffs structure with proper coefficient values.
 * @param CNTL_1P1Z_CLA_C_Vars structure with internal & output values.
 * @return CNTL_1P1Z_CLA_C_Vars Out parameter.
 */
#define PLL_C(v, k)                                                                     \
        /* Calculate cos sin*/                                                          \
        k.pllcosth = __cospuf32(__div2pif32(k.plltheta));                                            \
        k.pllsinth = __sinpuf32(__div2pif32(k.plltheta));                                            \
        k.pllcos2th = 2*k.pllcosth*k.pllcosth - 1;                                      \
        k.pllsin2th = 2*k.pllsinth*k.pllcosth;                                          \
        /*alpha beta*/                                                                      \
        k.pllVa = 0.666667*(k.Vin1-0.5*(k.Vin2+k.Vin3));                                        \
        k.pllVb = 0.666667*0.866025*(k.Vin2-k.Vin3);                                        \
        k.pllVdp1 = k.pllcosth*k.pllVa + k.pllsinth*k.pllVb;                                \
        k.pllVqp1 =-k.pllsinth*k.pllVa + k.pllcosth*k.pllVb;                                \
        k.pllVdn1 = k.pllcosth*k.pllVa - k.pllsinth*k.pllVb;                                \
        k.pllVqn1 = k.pllsinth*k.pllVa + k.pllcosth*k.pllVb;                                    \
        /*dq positive negative*/                                                             \
        k.pllVdp2 = k.pllVdp1 - k.pllcos2th*k.pllVdn2f - k.pllsin2th*k.pllVqn2f;             \
        k.pllVqp2 = k.pllVqp1 + k.pllsin2th*k.pllVdn2f - k.pllcos2th*k.pllVqn2f;             \
        k.pllVdn2 = k.pllVdn1 - k.pllcos2th*k.pllVdp2f + k.pllsin2th*k.pllVqp2f;             \
        k.pllVqn2 = k.pllVqn1 - k.pllsin2th*k.pllVdp2f - k.pllcos2th*k.pllVqp2f;             \
        /*LPF30Hz*/                                                                         \
        k.pllVdp2f = v.LPF_a1 * k.pllVdp2f_prev + v.LPF_b0 * k.pllVdp2;                     \
        k.pllVdp2f_prev = k.pllVdp2f;                                                           \
                                                                                              \
        k.pllVqp2f = v.LPF_a1 * k.pllVqp2f_prev + v.LPF_b0 * k.pllVqp2;                         \
        k.pllVqp2f_prev = k.pllVqp2f;                                                         \
                                                                                            \
        k.pllVdn2f = v.LPF_a1 * k.pllVdn2f_prev + v.LPF_b0 * k.pllVdn2;                     \
        k.pllVdn2f_prev = k.pllVdn2f;                                                           \
                                                                                              \
        k.pllVqn2f = v.LPF_a1 * k.pllVqn2f_prev + v.LPF_b0 * k.pllVqn2;                           \
        k.pllVqn2f_prev = k.pllVqn2f;                                                           \
        /*PID*/                                                                                 \
        k.pllfreq = k.pllfreq_prev + v.PID_Kp * (k.pllVqp2 - k.pllVqp2_prev) + v.PID_KiTs * k.pllVqp2;                      \
        k.pllfreq = __fmax(k.pllfreq,v.PID_Min);                                                \
        k.pllfreq = __fmin(k.pllfreq,v.PID_Max);                                                \
        k.pllfreq_prev = k.pllfreq;                                                             \
        k.pllVqp2_prev = k.pllVqp2;                                                             \
        /* Update error values */                                                               \
        k.plltheta += Intrgral * k.pllfreq;                                                     \
        k.plltheta = k.plltheta - (k.plltheta > PI2) * PI2 + (k.plltheta < 0) * PI2;            \
        k.Vs1 = k.pllVdp2f;
/*
 * Initial values for CNTL_1P1Z_CLA_C structures.
 */
#define PLL_VARS_INIT(k)                    \
        /* Initialize variables */          \
        k.Vin1 = 0;                             \
        k.Vin2 = 0;                             \
        k.Vin3 = 0;                             \
                                            \
        /* Internal values*/                \
        k.pllcosth = 0;                          \
        k.pllsinth = 0;                          \
        k.pllcos2th = 0;                          \
        k.pllsin2th = 0;                          \
        k.pllVa = 0;                            \
        k.pllVb = 0;                            \
        k.pllVdp1 = 0;                          \
        k.pllVqp1 = 0;                          \
        k.pllVdn1 = 0;                          \
        k.pllVqn1 = 0;                          \
        k.pllVdp2 = 0;                          \
        k.pllVqp2 = 0;                          \
        k.pllVqp2_prev = 0;                     \
        k.pllVdn2 = 0;                          \
        k.pllVqn2 = 0;                          \
        k.pllVdp2f = 0;                         \
        k.pllVdp2f_prev = 0;                    \
        k.pllVqp2f = 0;                         \
        k.pllVqp2f_prev = 0;                    \
        k.pllVdn2f = 0;                         \
        k.pllVdn2f_prev = 0;                    \
        k.pllVqn2f = 0;                         \
        k.pllVqn2f_prev = 0;                    \
        k.pllfreq = 0;                          \
        k.pllfreq_prev = 0;                     \
                                            \
        /*Output values*/                   \
        k.Vs1 = 0;                              \
        k.plltheta = 0;

#define PLL_COEFF_INIT(v)       \
        /* Initialize coefficients */       \
        v.LPF_a1 = 0.9981185908;                \
        v.LPF_b0 = 0.0018814092;              \
        v.PID_Kp = 1.308996939;               \
        v.PID_KiTs = 0.001453930041591;       \
                                            \
        /* Output saturation limits*/       \
        v.PID_Max = 1000;                     \
        v.PID_IMin = -1000;                   \
        v.PID_Min = -1000;

#endif /* PLL_H_ */
