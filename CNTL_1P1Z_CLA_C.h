/**
 * Second order control law using an IIR filter structure with programmable output saturation.
 * This macro uses CNTL_1P1Z_CLA_C structures to store coefficients & internal values.
 * The structures should be initialized with the supplied CNTL_1P1Z_CLA_C_INIT macro.
 * Within the structure the Max & Min parameters are the output bounds where as the IMin parameter
 * is used for saturating the lower bound while keeping an internal history.  The IMin parameter
 * should not be lower than -0.9.
 */

#ifndef CNTL_1P1Z_CLA_C_H_
#define CNTL_1P1Z_CLA_C_H_

/**
 * Two-pole two-zero controller structures.
 */
typedef struct {
    // Coefficients
    float32 KiTs;
    float32 Kp;

    // Output saturation limits
    float32 Max;
    float32 IMin;
    float32 Min;
} CNTL_1P1Z_CLA_C_Coeffs;

typedef struct {
    // Inputs
    float32 Ref;
    float32 Fdbk;

    // Internal values
    float32 Errn;
    float32 Errn1;

    // Output values
    float32 Out;
    float32 Out1;
    float32 OutPresat;
} CNTL_1P1Z_CLA_C_Vars;

/**
 * Calculates a second order control law with IIR filter and programmable output saturation.
 * @param CNTL_1P1Z_CLA_C_Coeffs structure with proper coefficient values.
 * @param CNTL_1P1Z_CLA_C_Vars structure with internal & output values.
 * @return CNTL_1P1Z_CLA_C_Vars Out parameter.
 */
#define CNTL_1P1Z_CLA_C(v, k)                                                                   \
        /* Calculate error */                                                                   \
        k.Errn = k.Ref - k.Fdbk;                                                                \
        k.Out = k.Out1 + (v.Kp * (k.Errn - k.Errn1))+ (v.KiTs * k.Errn);                        \
                                                                                                \
        /* Update error values */                                                               \
        k.Errn1 = k.Errn;                                                                       \
                                                                                                \
        /* Determine new output */                                                              \
        k.Out = __fmin(k.Out,v.Max);                                                         \
        k.Out = __fmax(k.Out,v.Min);                                                         \
        /* Store outputs */                                                                     \
        k.Out1 = k.Out;                                                                         \

/*
 * Initial values for CNTL_1P1Z_CLA_C structures.
 */
#define CNTL_1P1Z_CLA_C_VAR_INIT(k)             \
        /* Initialize variables */              \
        k.Ref = 0;                              \
        k.Fdbk = 0;                             \
        k.Errn = 0;                             \
        k.Errn1 = 0;                            \
        k.Out = 0;                              \
        k.Out1 = 0;                             \
        k.OutPresat = 0;

#define CNTL_1P1Z_CLA_C_COEFF_INIT(v)           \
        /* Initialize coefficients */           \
        v.KiTs = 0;                         \
        v.Kp = 0;                         \
        /* IMin cannot be lower than -0.9 */    \
        v.IMin = -0.9;                          \
        v.Max = 1;                              \
        v.Min = (0);

#endif /* CNTL_1P1Z_CLA_C_H_ */
