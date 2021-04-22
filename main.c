//###########################################################################
//
// FILE:   adc_soc_epwm_cpu01.c
//
// TITLE:  ADC triggering via epwm for F2837xD.
//
//! \addtogroup cpu01_example_list
//! <h1> ADC ePWM Triggering (adc_soc_epwm)</h1>
//!
//! This example sets up the ePWM to periodically trigger the ADC.
//!
//! After the program runs, the memory will contain:\n
//! - \b AdcaResults \b: A sequence of analog-to-digital conversion samples from
//! pin A0. The time between samples is determined based on the period
//! of the ePWM timer.
//
//###########################################################################
// $TI Release: F2837xD Support Library v210 $
// $Release Date: Tue Nov  1 14:46:15 CDT 2016 $
// $Copyright: Copyright (C) 2013-2016 Texas Instruments Incorporated -
//             http://www.ti.com/ ALL RIGHTS RESERVED $
//###########################################################################

//
// Included Files
//
#include "F28x_Project.h"     // Device Headerfile and Examples Include File
#include "initialize.h"
#include "PLL.h"
#include "CNTL_1P1Z_CLA_C.h"
#include "Math_EMAVG_CLA_C.h"
#define PI2D3 2.094395102393195
#define TwoDThree 0.66666666666667
#define TpinewL 0.000013222822811
//
// Function Prototypes
//
void ConfigureADC(void);
void ConfigureEPWM(void);
void SetupADCEpwm(void);
interrupt void adcd1_isr(void);

//
// Globals
//

float ach_max = 0;
float ach_min = 0;
float Da_temp;
float Db_temp;
float Dc_temp;
float Da_temp1;
float Db_temp1;
float Dc_temp1;
float Da_temp2;
float Db_temp2;
float Dc_temp2;
float Vz_max;
float Vz_min;
float Vz;
float Vza_new;
float Vzb_new;
float Vzc_new;
float Vz_new_max;
float Vz_new_min;
float Vz_new;
Uint16 Da = 0;
Uint16 Db = 0;
Uint16 Dc = 0;
Uint16 Da_past = 0;
Uint16 Db_past = 0;
Uint16 Dc_past = 0;
int16 Da_ch = 0;
int16 Db_ch = 0;
int16 Dc_ch= 0;
Uint16 D_ch_flag = 0;
Uint16 i = 0;
Uint16 start = 0;
double theta =0.0;
double sinp1 = 0.0;
double sinp11 = 0.0;
double sinp2 = 0.0;
double sinp21 = 0.0;
double sinp3 = 0.0;
double sinp31 = 0.0;
float a = 0.0;
float Vin1_plltest = 0;
float Vin2_plltest = 0;
float Vin3_plltest = 0;
float Vina = 0;
float Vina1 = 0;
float Vinb = 0;
float Vinb1 = 0;
float Vinc = 0;
float Vinc1 = 0;
float Vina_test = 0;
float Temp_Da = 0;
float Temp_Db = 0;
float Temp_Dc = 0;
float Vind = 0;
float Vinq = 0;
float ILa = 0;
float ILb = 0;
float ILc = 0;
float ILd = 0;
float ILd_emavg = 0;
float ILq = 0;
float ILq_emavg = 0;
float Vocomp = 0;
float Ed = 0;
float DEd = 0;
float ccILdref = 0;
float ccILqref = 0;
float Vo = 0;
float Vo_calc = 134;
float Vo_ini = 13.4;
float start_cntr = 0;
float ccUd = 0;
float ccUq = 0;
float Vo_ref = 0;
float ccVd = 0;
float ccVq = 0;
float ccVaa = 0;
float ccVbb = 0;
float ccVcc = 0;
float x1 = 7.0;
float x = 56.56;
float ILa_temp = 0;
float ILb_temp = 0;
float ILc_temp = 0;
float Vo_temp = 0;
float ILd_max = 3;
float ILd_min = 3;
float Openduty = 0.0;
unsigned long comp_cntr = 0;
Uint16 Vbus_ok = 0;
Uint16 protect = 0;
Uint16 Vo_Full = 0;
//float start = 0;
volatile Uint16 bufferFull;

//============================= MCU Marco =============================//
PLL_Coeffs PLL_threephase_Coeffs;
PLL_Vars PLL_threephase_Vars;
CNTL_1P1Z_CLA_C_Coeffs Voltage_threephase_Coeffs;
CNTL_1P1Z_CLA_C_Vars Voltage_threephase_Vars;
CNTL_1P1Z_CLA_C_Coeffs Currentd_threephase_Coeffs;
CNTL_1P1Z_CLA_C_Vars Currentd_threephase_Vars;
CNTL_1P1Z_CLA_C_Coeffs Currentq_threephase_Coeffs;
CNTL_1P1Z_CLA_C_Vars Currentq_threephase_Vars;
//MATH_EMAVG_CLA_C_Var ILd_EMAVG_Vars;
//MATH_EMAVG_CLA_C_Var ILq_EMAVG_Vars;
MATH_EMAVG_CLA_C_Var Vo_EMAVG_Vars;



//
// ConfigureADC - Write ADC configurations and power up the ADC for both
//                ADC A and ADC B
//
void ConfigureADC(void)
{
    EALLOW;

    //
    //write configurations
    //
    AdcaRegs.ADCCTL2.bit.PRESCALE = 6; //set ADCCLK divider to /4
    AdcbRegs.ADCCTL2.bit.PRESCALE = 6; //set ADCCLK divider to /4
    AdccRegs.ADCCTL2.bit.PRESCALE = 6; //set ADCCLK divider to /4
    AdcdRegs.ADCCTL2.bit.PRESCALE = 6; //set ADCCLK divider to /4

    AdcSetMode(ADC_ADCA, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    AdcSetMode(ADC_ADCB, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    AdcSetMode(ADC_ADCC, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    AdcSetMode(ADC_ADCD, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    //
    //Set pulse positions to late (ADC interrupt will trigger after the adcresult register update)
    //
    AdcaRegs.ADCCTL1.bit.INTPULSEPOS = 1;
    AdcbRegs.ADCCTL1.bit.INTPULSEPOS = 1;
    AdccRegs.ADCCTL1.bit.INTPULSEPOS = 1;
    AdcdRegs.ADCCTL1.bit.INTPULSEPOS = 1;

    //
    //power up the ADC
    //
    AdcaRegs.ADCCTL1.bit.ADCPWDNZ = 1;
    AdcbRegs.ADCCTL1.bit.ADCPWDNZ = 1;
    AdccRegs.ADCCTL1.bit.ADCPWDNZ = 1;
    AdcdRegs.ADCCTL1.bit.ADCPWDNZ = 1;

    //
    //delay for 1ms to allow ADC time to power up
    //
    DELAY_US(1000);

    EDIS;
}



//
// SetupADCEpwm - Setup ADC EPWM acquisition window
//
void SetupADCEpwm(void)
{
//    Uint16 acqps;

    //
    // Determine minimum acquisition window (in SYSCLKS) based on resolution
    //
//    if(ADC_RESOLUTION_12BIT == AdcaRegs.ADCCTL2.bit.RESOLUTION)
//    {
//        acqps = 14; //75ns
//    }
//    else //resolution is 16-bit
//    {
//        acqps = 63; //320ns
//    }

    //
    //Select the channels to convert and end of conversion flag
    //
    EALLOW;
//    AdccRegs.ADCCTL2.bit.RESOLUTION = 0;
//    AdccRegs.ADCCTL2.bit.SIGNALMODE = 0;
//    Cmpss5Regs.COMPCTL.bit.COMPLSOURCE = 1;
//    Cmpss5Regs.COMPCTL.bit.COMPHSOURCE = 1;

    AdcaRegs.ADCSOC0CTL.bit.CHSEL = 2;     //SOC1 will convert pin ADC-A2(VaN)
    AdcaRegs.ADCSOC0CTL.bit.ACQPS = 18;    //sample window is 100 SYSCLK cycles
    AdcaRegs.ADCSOC0CTL.bit.TRIGSEL = 4;   //trigger by external
    AdcaRegs.ADCSOC1CTL.bit.CHSEL = 4;     //SOC1 will convert pin ADC-A4(Empty)
    AdcaRegs.ADCSOC1CTL.bit.ACQPS = 319;    //sample window is 100 SYSCLK cycles
    AdcaRegs.ADCSOC1CTL.bit.TRIGSEL = 4;   //trigger by external
    AdcaRegs.ADCSOC2CTL.bit.CHSEL = 5;     //SOC0 will convert pin ADC-A5(Ib)
    AdcaRegs.ADCSOC2CTL.bit.ACQPS = 511;   //sample window is 100 SYSCLK cycles
    AdcaRegs.ADCSOC2CTL.bit.TRIGSEL = 4;   //trigger by external

    AdcbRegs.ADCSOC0CTL.bit.CHSEL = 5;     //SOC1 will convert pin ADC-B5(VbN)
    AdcbRegs.ADCSOC0CTL.bit.ACQPS = 18;    //sample window is 100 SYSCLK cycles
    AdcbRegs.ADCSOC0CTL.bit.TRIGSEL = 4;   //trigger by external
    AdcbRegs.ADCSOC1CTL.bit.CHSEL = 1;     //SOC1 will convert pin ADC-B1(Empty)
    AdcbRegs.ADCSOC1CTL.bit.ACQPS = 319;    //sample window is 100 SYSCLK cycles
    AdcbRegs.ADCSOC1CTL.bit.TRIGSEL = 4;   //trigger by external
    AdcbRegs.ADCSOC2CTL.bit.CHSEL = 0;     //SOC0 will convert pin ADC-B0(Ia)
    AdcbRegs.ADCSOC2CTL.bit.ACQPS = 511;   //sample window is 100 SYSCLK cycles
    AdcbRegs.ADCSOC2CTL.bit.TRIGSEL = 4;   //trigger by external

    AdccRegs.ADCSOC0CTL.bit.CHSEL = 1;     //SOC1 will convert pin ADC-A1(Empty)
    AdccRegs.ADCSOC0CTL.bit.ACQPS = 18;    //sample window is 100 SYSCLK cycles
    AdccRegs.ADCSOC0CTL.bit.TRIGSEL = 4;   //trigger by external
	AdccRegs.ADCSOC1CTL.bit.CHSEL = 2;     //SOC0 will convert pin ADC-C2(Empty)
    AdccRegs.ADCSOC1CTL.bit.ACQPS = 319;    //sample window is 100 SYSCLK cycles
    AdccRegs.ADCSOC1CTL.bit.TRIGSEL = 4;   //trigger by external
    AdccRegs.ADCSOC2CTL.bit.CHSEL = 3;     //SOC0 will convert pin ADC-C3(Ic)
    AdccRegs.ADCSOC2CTL.bit.ACQPS = 511;   //sample window is 100 SYSCLK cycles
    AdccRegs.ADCSOC2CTL.bit.TRIGSEL = 4;   //trigger by external
	
    AdcdRegs.ADCSOC0CTL.bit.CHSEL = 2;     //SOC1 will convert pin ADC-D2(VcN)
    AdcdRegs.ADCSOC0CTL.bit.ACQPS = 18;    //sample window is 100 SYSCLK cycles
    AdcdRegs.ADCSOC0CTL.bit.TRIGSEL = 4;   //trigger by external
    AdcdRegs.ADCSOC1CTL.bit.CHSEL = 5;     //SOC0 will convert pin ADC-D5(Vo)
    AdcdRegs.ADCSOC1CTL.bit.ACQPS = 18;    //sample window is 100 SYSCLK cycles
    AdcdRegs.ADCSOC1CTL.bit.TRIGSEL = 4;   //trigger by external

    AdcdRegs.ADCINTSEL1N2.bit.INT1SEL = 1; //end of SOC1 will set INT1 flag
    AdcdRegs.ADCINTSEL1N2.bit.INT1E = 1;   //enable INT1 flag
    AdcdRegs.ADCINTFLGCLR.bit.ADCINT1 = 1; //make sure INT1 f lag is cleared
    EDIS;
}
//
// ConfigureEPWM - Configure EPWM SOC and compare values
//
void ConfigureEPWM(void)
{
    EALLOW;
    // Assumes ePWM clock is already enabled
    EPwm1Regs.ETSEL.bit.SOCAEN    = 1;    // Disable SOC on A group
    EPwm1Regs.ETSEL.bit.SOCASEL    = 2;   // Select SOC on PRD
    EPwm1Regs.ETPS.bit.SOCAPRD = 1;       // Generate pulse on 1st event
    EPwm1Regs.CMPA.bit.CMPA = 300;     // Set compare A value to 2048 counts
    EPwm1Regs.TBPRD = 500;             // Set period to 4096 counts
    EPwm1Regs.TBCTL.bit.CTRMODE = 2;      // up-down count mode

    EDIS;
}

void main(void)
{
//
// Step 1. Initialize System Control:
// PLL, WatchDog, enable Peripheral Clocks
// This example function is found in the F2837xD_SysCtrl.c file.25
//`
    InitSysCtrl();

//// Step 2. Initialize GPIO:
// This example function is found in the F2837xD_Gpio.c file and
// illustrates how to set the GPIO to it's default state M VGT5421234567890-]\
    .
//efault state.
// The default state is all PIE interru
    InitGpio(); // Skipped for this example

    EALLOW;
    GpioCtrlRegs.GPAPUD.bit.GPIO0 = 0;    // Enable pull-up on GPIO0
    GpioCtrlRegs.GPAMUX1.bit.GPIO0 = 0;   // Configure GPIO0 as GPIO
    GpioCtrlRegs.GPAGMUX1.bit.GPIO0 = 0;
    GpioCtrlRegs.GPADIR.bit.GPIO0 = 0;    // Set as input pin
    GpioCtrlRegs.GPAQSEL1.bit.GPIO0 = 0;  // GPIO0 Synch to SYSCLKOUT only
    InputXbarRegs.INPUT5SELECT = 0;       //GPIO0 as the source of InputXbar5

    GpioCtrlRegs.GPAPUD.bit.GPIO1 = 0;    // Enable pull-up on GPIO1
    GpioCtrlRegs.GPAMUX1.bit.GPIO1 = 0;   // Configure GPIO1 as GPIO
    GpioCtrlRegs.GPAGMUX1.bit.GPIO1 = 0;
    GpioCtrlRegs.GPADIR.bit.GPIO1  = 1;    // Set as Output pin
    GpioDataRegs.GPADAT.bit.GPIO1 = 0;

    GpioCtrlRegs.GPAPUD.bit.GPIO2 = 0;    // Enabl e pull-up on GPIO2
    GpioCtrlRegs.GPAMUX1.bit.GPIO2 = 0;   // Configure GPIO2 as GPIO
    GpioCtrlRegs.GPAGMUX1.bit.GPIO2 = 0;
    GpioCtrlRegs.GPADIR.bit.GPIO2 = 1;    // Set as Output pin
    GpioDataRegs.GPADAT.bit.GPIO2 = 0;
    EDIS;
//
// Step 3. Clear all interrupts and initialize PIE vector table:
// Disable CPU interrupts
//
    DINT;

//
// Initialize the PIE control registers to their dpts disabled and flags
// are cleared.
// This function is found in the F2837xD_PieCtrl.c file.
//
    InitPieCtrl();

//
// Disable CPU interrupts and clear all CPU interrupt flags:
//
    IER = 0x0000;
    IFR = 0x0000;

//
// Initialize the PIE vector table with pointers to the shell Interrupt
// Service Routines (ISR).
// This will populate the entire table, even if the interrupt
// is not used in this example.  This is useful for debug purposes.
// The shell ISR routines are found in F2837xD_DefaultIsr.c.
// This function is found in F2837xD_PieVect.c.
//
    InitPieVectTable();

    // Step 4. Initialize the Device Peripherals:
    //
    spi_fifo_init();     // Initialize the SPI FIFO
    InitSpiaGpio();
//
// Map ISR functions
//
    EALLOW;
    PieVectTable.ADCD1_INT = &adcd1_isr; //function for ADCA interrupt 1
    EDIS;

//
// Configure the ADC and power it up
//
    ConfigureADC();

//
// Configure the ePWM
//
//    ConfigureEPWM();

//
// Setup the ADC for ePWM triggered conversions on channel 0
//
    SetupADCEpwm();
// Setup DAC Register
    init_DACs();

//
// Enable global Interrupts and higher priority real-time debug events:
//
    IER |= M_INT1; //Enable group 1 interrupts
    EINT;  // Enable Global interrupt INTM
    ERTM;  // Enable Global realtime interrupt DBGM

//
// Initialize PLL register and compensator registor
    PLL_VARS_INIT(PLL_threephase_Vars);
    PLL_COEFF_INIT(PLL_threephase_Coeffs);

    CNTL_1P1Z_CLA_C_VAR_INIT(Voltage_threephase_Vars);
    CNTL_1P1Z_CLA_C_COEFF_INIT(Voltage_threephase_Coeffs);
    Voltage_threephase_Coeffs.Kp = 7.461089871660142;   //0.132651467738127(Vin 20V)
    Voltage_threephase_Coeffs.KiTs = 0.002343970512858; //0.000416736876534(Vin 20V)
    Voltage_threephase_Coeffs.IMin = -0.9;
    Voltage_threephase_Coeffs.Max = 5950;
    Voltage_threephase_Coeffs.Min = 0;

    CNTL_1P1Z_CLA_C_VAR_INIT(Currentd_threephase_Vars);
    CNTL_1P1Z_CLA_C_COEFF_INIT(Currentd_threephase_Coeffs);
    Currentd_threephase_Coeffs.Kp = 0.190204708471241; //0.06104167717343(Vin 20V       )
    Currentd_threephase_Coeffs.KiTs = 0.010755822866606; //0.007670723382834(Vin 20V)
    Currentd_threephase_Coeffs.IMin = -300;
    Currentd_threephase_Coeffs.Max = 2;
    Currentd_threephase_Coeffs.Min = -300;

    CNTL_1P1Z_CLA_C_VAR_INIT(Currentq_threephase_Vars);
    CNTL_1P1Z_CLA_C_COEFF_INIT(Currentq_threephase_Coeffs);
    Currentq_threephase_Coeffs.Kp = 0.190204708471241;   //0.06104167717343(Vin 20V)
    Currentq_threephase_Coeffs.KiTs = 0.010755822866606;    //0.007670723382834(Vin 20V)
    Currentq_threephase_Coeffs.IMin = -10;
    Currentq_threephase_Coeffs.Max = 2;
    Currentq_threephase_Coeffs.Min = -10;

//    MATH_EMAVG_CLA_C_INIT(ILd_EMAVG_Vars);
//    ILd_EMAVG_Vars.Multiplier = 0.3141593;
//
//    MATH_EMAVG_CLA_C_INIT(ILq_EMAVG_Vars);
//    ILq_EMAVG_Vars.Multiplier = 0.3141593;

    MATH_EMAVG_CLA_C_INIT(Vo_EMAVG_Vars);
    Vo_EMAVG_Vars.Multiplier = 0.125663706143592;

    DacaRegs.DACVALS.bit.DACVALS = 0;
    DacbRegs.DACVALS.bit.DACVALS = 0;

//
// enable PIE interrupt
//
    PieCtrlRegs.PIEIER1.bit.INTx6 = 1; //enable adcd interrupt

// sync ePWM
//
    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 1;
//
//take conversions indefinitely in loop
//


     while(1)
    {

    }
}



interrupt void adcd1_isr(void)
{
////    DacaRegs.DACVALS.bit.DACVALS = 4095;
//////    if(i < 1667)
//////    {
//////        i++;
//////    }
//////    else
//////    {
//////        i = 0;
//////    }
//////
//////    Vina = x * __cospuf32(0.0006 * i);                 //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//////    Vinb = x * __cospuf32(0.0006 * i - 0.333333333);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//////    Vinc = x * __cospuf32(0.0006 * i - 0.666666667);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//////    Vo = 10;
//////   DacaRegs.DACVALS.bit.DACVALS = 4095;
//////   ILa = AdcbResultRegs.ADCRESULT0;
//////   ILa = ILa - 2239;//2212
//////   ILa = ILa * 0.029282668936056;  //  original 0.020318712626405
//////   ILb = AdcaResultRegs.ADCRESULT0;
//////   ILb = ILb - 2237;//2203
//////   ILb = ILb * 0.029282668936056;
//////   ILc = AdccResultRegs.ADCRESULT0;
//////   ILc = ILc - 2245;//2206
//////   ILc = ILc * 0.029282668936056;
//   Vina = AdcaResultRegs.ADCRESULT0;
//   Vina = Vina - 1833;
//   Vina = Vina * 0.077163298454323;// 0.067981191885038
//   Vinb = AdcbResultRegs.ADCRESULT0;
//   Vinb = Vinb - 1833;
//   Vinb = Vinb * 0.077163298454323;
//   Vinc = AdcdResultRegs.ADCRESULT0;
//   Vinc = Vinc - 1827;
//   Vinc = Vinc * 0.077163298454323;
//
//   PLL_threephase_Vars.Vin1 = Vina;
//   PLL_threephase_Vars.Vin2 = Vinb;
//   PLL_threephase_Vars.Vin3 = Vinc;
//   Vo = AdcdResultRegs.ADCRESULT1;
//   Vo = Vo - 19;
//   Vo = Vo * 0.171718370637824;//0.159664412510566
//
//   Vo_EMAVG_Vars.In = Vo;
//   MATH_EMAVG_CLA_C(Vo_EMAVG_Vars);
//   Vo = Vo_EMAVG_Vars.Out;
//
//   if(Vo > 422.5)
//   {
//       protect = 1;
//       Vo_temp = Vo;
//       DacbRegs.DACVALS.bit.DACVALS = 4095;
//   }
//
////   //DQ Transformation
////   ILd = ILa * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta));
////   ILd = ILd + ILb * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));
////   ILd = ILd + ILc * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3));
////   ILd = ILd * TwoDThree;
////
////   ILq = -ILa * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta));
////   ILq = ILq - ILb * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));
////   ILq = ILq - ILc * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3));
////   ILq = ILq * TwoDThree;
//
////   ILd_EMAVG_Vars.In = ILd;
////   MATH_EMAVG_CLA_C(ILd_EMAVG_Vars);
////   ILd = ILd_EMAVG_Vars.Out;
////
////   ILq_EMAVG_Vars.In = ILq;
////   MATH_EMAVG_CLA_C(ILq_EMAVG_Vars);
////   ILq = ILq_EMAVG_Vars.Out;
//
////     Vo_EMAVG_Vars.In = Vo;
////     MATH_EMAVG_CLA_C(Vo_EMAVG_Vars);
////     Vo = Vo_EMAVG_Vars.Out;
//
//   //Three Phase PFC
//   if(Vo > 11.5)
//   {
//       start_cntr += 1;
//       start_cntr = __fmin(start_cntr,2300000);
//       PLL_C(PLL_threephase_Coeffs,PLL_threephase_Vars);
//       Ed = PLL_threephase_Vars.pllVdp2f;
//       DEd = __divf32(1,Ed);
//       Vina_test = x * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta));
//   }
//
//   if(Vbus_ok == 1 && (Vo < 140 || Ed < 50))
//   {
//       protect = 1;
//   }
//   if(protect == 1)
//   {
//       GpioDataRegs.GPADAT.bit.GPIO1 = 0;
//   }
//   DacaRegs.DACVALS.bit.DACVALS = 0;
//   if((protect == 0) && (start == 1))
//   {
//       if(start_cntr > 2200000)
//       {
//           if(Vo > 115)
//           {
//               comp_cntr++;
//               comp_cntr = __fmin(comp_cntr,2100000);
//           }
//
//           if(Vo > 250)
//           {
//               Vbus_ok = 1;
//           }
//
//    //        Vind = Vina * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta));
//    //        Vind = Vind + Vinb * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));
//    //        Vind = Vind + Vinc * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3));
//    //        Vind = Vind * TwoDThree;
//    //
//    //        Vinq = -Vina * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta));
//    //        Vinq = Vinq - Vinb * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));
//    //        Vinq = Vinq - Vinc * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3));
//    //        Vinq = Vinq * TwoDThree;
////           if(comp_cntr > 2099900)
////           {
////               if(ILd > ILd_max)
////               {
////                   ILd_max = ILd;
////               }
////
////               if(ILd < ILd_min)
////               {
////                   ILd_min = ILd;
////               }
////           }
//
//           if(comp_cntr > 2000000)
//           {
//               if(comp_cntr == 2000001)
//               {
//                  Vind = Vina * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta));
//                  Vind = Vind + Vinb * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));
//                  Vind = Vind + Vinc * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3));
//                  Vind = Vind * TwoDThree;
//
//                  Vinq = -Vina * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta));
//                  Vinq = Vinq - Vinb * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));
//                  Vinq = Vinq - Vinc * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3));
//                  Vinq = Vinq * TwoDThree;
//                  ccUd = ILq * TpinewL - Vind;
//                  ccUq = -ILd * TpinewL - Vinq;
//                  Currentd_threephase_Vars.Out1 = ccUd;
//                  Currentq_threephase_Vars.Out1 = ccUq;
//                   Vo_ref = Vo;
//    //               Voltage_threephase_Vars.Out1 = Ed * ILd;
//                  ccILdref = ILd;
//    //               ccILqref = ILq;
//              }
//              if(Ed > 100)
//              {
//                  Vo_Full = 1;
//              }
//              //Voltage Loop
//               Vo_ref = Vo_ref + 0.00008;
//               if(Vo_Full == 1)
//               {
//                   Vo_ref = __fmin(Vo_ref,400);
//               }
//               else
//               {
//                   Vo_ref = __fmin(Vo_ref,385);
//               }
//               Voltage_threephase_Vars.Ref = Vo_ref;
//               Voltage_threephase_Vars.Fdbk = Vo;
//               CNTL_1P1Z_CLA_C(Voltage_threephase_Coeffs, Voltage_threephase_Vars);
//               ccILdref = Voltage_threephase_Vars.Out;
//               ccILdref = ccILdref * DEd;
//               ccILdref = __fmin(ccILdref,35);
//               //Voltage Open Loop
////               ccILdref = ccILdref + 0.0005;
////               ccILdref = __fmin(ccILdref,5.28);
//
//    //            if(ccILqref > 0)
//    //            {
//    //                ccILqref = ccILqref - 0.00005;
//    //                ccILqref = __fmax(ccILqref,0);
//    //            }
//    //            if(ccILqref < 0)
//    //            {
//    //                ccILqref = ccILqref + 0.00005;
//    //                ccILqref = __fmin(ccILqref,0);
//    //            }
//
//              //Current Loop
//
//               ILa = AdcbResultRegs.ADCRESULT2;
//               ILa = ILa - 2215;//2212
//               ILa = ILa * 0.029282668936056;  //  original 0.020318712626405
//               ILb = AdcaResultRegs.ADCRESULT2;
//               ILb = ILb - 2215;//2203
//               ILb = ILb * 0.029282668936056;
//               ILc = AdccResultRegs.ADCRESULT2;
//               ILc = ILc - 2220;//2206
//               ILc = ILc * 0.029282668936056;
//
//              if((ILa > 40) || (ILb > 40) || (ILc > 40) || (ILa < -40)|| (ILb < -40)|| (ILc < -40))
//              {
//                  protect = 1;
//                  ILa_temp = ILa;
//                  ILb_temp = ILb;
//                  ILc_temp = ILc;
////                  DacaRegs.DACVALS.bit.DACVALS = 4095;
//              }
//
//              //DQ Transformation
//              ILd = ILa * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta));
//              ILd = ILd + ILb * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));
//              ILd = ILd + ILc * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3));
//              ILd = ILd * TwoDThree;
//
//              ILq = -ILa * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta));
//              ILq = ILq - ILb * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));
//              ILq = ILq - ILc * __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3));
//              ILq = ILq * TwoDThree;
//
//              Currentd_threephase_Vars.Ref = ccILdref;
//              Currentq_threephase_Vars.Ref = ccILqref;
//              Currentd_threephase_Vars.Fdbk = ILd;
//              Currentq_threephase_Vars.Fdbk = ILq;
//              CNTL_1P1Z_CLA_C(Currentd_threephase_Coeffs,Currentd_threephase_Vars);
//              CNTL_1P1Z_CLA_C(Currentq_threephase_Coeffs,Currentq_threephase_Vars);
//
//              ccVd = ILq * TpinewL - Currentd_threephase_Vars.Out;
//              ccVq = -ILd * TpinewL - Currentq_threephase_Vars.Out;
//
//              ccVaa = __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta)) * ccVd;
//              ccVaa = ccVaa - __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta)) * ccVq;
//              ccVbb = __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3)) * ccVd;
//              ccVbb = ccVbb -  __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3)) * ccVq;
//              ccVcc = __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3)) * ccVd;
//              ccVcc = ccVcc - __sinpuf32(__div2pif32(PLL_threephase_Vars.plltheta + PI2D3)) * ccVq;
//
//              Temp_Da = ccVaa *  __einvf32(Vo);
//              Temp_Db = ccVbb *  __einvf32(Vo);
//              Temp_Dc = ccVcc *  __einvf32(Vo);
//           }
//           else
//           {
//               ILa = AdcbResultRegs.ADCRESULT2;
//               ILa = ILa - 2215;//2212
//               ILa = ILa * 0.029282668936056;  //  original 0.020318712626405
//               ILb = AdcaResultRegs.ADCRESULT2;
//               ILb = ILb - 2215;//2203
//               ILb = ILb * 0.029282668936056;
//               ILc = AdccResultRegs.ADCRESULT2;
//               ILc = ILc - 2220;//2206
//               ILc = ILc * 0.029282668936056;
//               if((ILa > 40) || (ILb > 40) || (ILc > 40) || (ILa < -40)|| (ILb < -40)|| (ILc < -40))
//               {
//                   protect = 1;
//                   ILa_temp = ILa;
//                   ILb_temp = ILb;
//                   ILc_temp = ILc;
////                   DacaRegs.DACVALS.bit.DACVALS = 4095;
//               }
//
//               Vina1 = x * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta));   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//               Vinb1 = x * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta - PI2D3));   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//               Vinc1 = x * __cospuf32(__div2pif32((PLL_threephase_Vars.plltheta - PI2D3*2)));   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//
//               Temp_Da = Vina1 *  __einvf32(Vo_calc);
//               Temp_Db = Vinb1 *  __einvf32(Vo_calc);
//               Temp_Dc = Vinc1 *  __einvf32(Vo_calc);
//           }
//       }
//       else
//       {
//           ILa = AdcbResultRegs.ADCRESULT2;
//           ILa = ILa - 2215;//2212
//           ILa = ILa * 0.029282668936056;  //  original 0.020318712626405
//           ILb = AdcaResultRegs.ADCRESULT2;
//           ILb = ILb - 2215;//2203
//           ILb = ILb * 0.029282668936056;
//           ILc = AdccResultRegs.ADCRESULT2;
//           ILc = ILc - 2220;//2206
//           ILc = ILc * 0.029282668936056;
//           if((ILa > 40) || (ILb > 40) || (ILc > 40) || (ILa < -40)|| (ILb < -40)|| (ILc < -40))
//           {
//               protect = 1;
//               ILa_temp = ILa;
//               ILb_temp = ILb;
//               ILc_temp = ILc;
////               DacaRegs.DACVALS.bit.DACVALS = 4095;
//           }
//           Temp_Da = Vina *  __einvf32(Vo_ini);
//           Temp_Db = Vinb *  __einvf32(Vo_ini);
//           Temp_Dc = Vinc *  __einvf32(Vo_ini);
//       }
//       Temp_Da = __fmax(Temp_Da,-0.475);
//       Temp_Da = __fmin(Temp_Da,0.475);
//       Temp_Db = __fmax(Temp_Db,-0.475);
//       Temp_Db = __fmin(Temp_Db,0.475);
//       Temp_Dc = __fmax(Temp_Dc,-0.475);
//       Temp_Dc = __fmin(Temp_Dc,0.475);
//
//       Vz_max = Temp_Da;
//       Vz_max = __fmax(Vz_max,Temp_Db);
//       Vz_max = __fmax(Vz_max,Temp_Dc);
//
//       Vz_min = Temp_Da;
//       Vz_min = __fmin(Vz_min,Temp_Db);
//       Vz_min = __fmin(Vz_min,Temp_Dc);
//
//       Vz = -0.5 * (Vz_max + Vz_min);
//
//       Da_temp1 = Temp_Da + Vz + 0.5;
//       Db_temp1 = Temp_Db + Vz + 0.5;
//       Dc_temp1 = Temp_Dc + Vz + 0.5;
//
//       Vza_new = __fracf32(Da_temp1 * 5) * 0.2;
//       Vzb_new = __fracf32(Db_temp1 * 5) * 0.2;
//       Vzc_new = __fracf32(Dc_temp1 * 5) * 0.2;
//
//       Vz_new_max = Vza_new;
//       Vz_new_max = __fmax(Vz_new_max,Vzb_new);
//       Vz_new_max = __fmax(Vz_new_max,Vzc_new);
//
//       Vz_new_min = Vza_new;
//       Vz_new_min = __fmin(Vz_new_min,Vzb_new);
//       Vz_new_min = __fmin(Vz_new_min,Vzc_new);
//
//       Vz_new = -0.5 * (Vz_new_max + Vz_new_min);
//
//       Da_temp2 = Da_temp1 + Vz_new + 0.1; // 0.1 = 1/2/(N-1), N is number of levels
//       Db_temp2 = Db_temp1 + Vz_new + 0.1;
//       Dc_temp2 = Dc_temp1 + Vz_new + 0.1;
//
//       Da = (Uint16)(Da_temp2 * 500);
//       Db = (Uint16)(Db_temp2 * 500);
//       Dc = (Uint16)(Dc_temp2 * 500);
//
//       spi_xmit(Da << 7);
//       spi_xmit(Db << 7);
//       spi_xmit(Dc << 7);
//
//        GpioDataRegs.GPADAT.bit.GPIO1 = 1;
//   }
//   else
//   {
//        GpioDataRegs.GPADAT.bit.GPIO1 = 0;
//   }
//
//   if (start == 0)
//   {
//       start = 1;
//   }
////	GpioDataRegs.GPADAT.bit.GPIO1 = 0;
//
////   //DAC
////   DacaRegs.DACVALS.bit.DACVALS = (int)(Currentq_threephase_Vars.Errn * 409) + 2048;
////   DacbRegs.DACVALS.bit.DACVALS = (int)(Currentq_threephase_Vars.Errn * 409) + 2048;
//////   DacbRegs.DACVALS.bit.DACVALS = (int)(Vinc * 20) + 2048;
//////   DacaRegs.DACVALS.bit.DACVALS = (int)(ILd * 500) + 100;
//////   DacbRegs.DACVALS.bit.DACVALS = (int)(ILd * 500) + 100;
//////   DacaRegs.DACVALS.bit.DACVALS = (int)(Da * 8);
//////   DacbRegs.DACVALS.bit.DACVALS = (int)(Db * 8);
//////   DacaRegs.DACVALS.bit.DACVALS = 2045 * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta)) + 2048;
//////   DacbRegs.DACVALS.bit.DACVALS = 2045 * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta)) + 2048;
////
////// PLL Compensator Test
////
//////    if(i < 1667)
//////    {
//////        i++;
//////    }
//////    else
//////    {
//////        i = 0;
//////    }
//////
//////    Vina = x1 * __cospuf32(0.0006 * i);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//////
//////    Vinb = x1 * __cospuf32(0.0006 * i - 0.333333333);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//////
//////    Vinc = x1 * __cospuf32(0.0006 * i - 0.666666667);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//////
//////    PLL_threephase_Vars.Vin1 = Vina;
//////    PLL_threephase_Vars.Vin2 = Vinb;
//////    PLL_threephase_Vars.Vin3 = Vinc;
//////
//////    PLL_C(PLL_threephase_Coeffs,PLL_threephase_Vars);
//////    Ed = PLL_threephase_Vars.pllVdp2f;
//////
//////    Vina1 = x1 * __cospuf32(__div2pif32(PLL_threephase_Vars.plltheta));   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//////    DacaRegs.DACVALS.bit.DACVALS = (int)(Vina * 20) + 2048;
//////    DacbRegs.DACVALS.bit.DACVALS = (int)(Vina1 * 20) + 2048;
//Open loop duty for three phase inverter
//     GpioDataRegs.GPADAT.bit.GPIO1 = 1;
//     if(i < 1667)
//     {
//         i++;
//     }
//     else
//     {
//         i = 0;
//     }
//
//     Vina1 = x * __cospuf32(0.0006 * i);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//
//     Vinb1 = x * __cospuf32(0.0006 * i - 0.333333333);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//
//     Vinc1 = x * __cospuf32(0.0006 * i - 0.666666667);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//
//     Temp_Da = Vina1 *  __einvf32(Vo_calc);
//     Temp_Db = Vinb1 *  __einvf32(Vo_calc);
//     Temp_Dc = Vinc1 *  __einvf32(Vo_calc);
//
//     Temp_Da = __fmax(Temp_Da,-0.475);
//     Temp_Da = __fmin(Temp_Da,0.475);
//     Temp_Db = __fmax(Temp_Db,-0.475);
//     Temp_Db = __fmin(Temp_Db,0.475);
//     Temp_Dc = __fmax(Temp_Dc,-0.475);
//     Temp_Dc = __fmin(Temp_Dc,0.475);
//
//     Vz_max = Temp_Da;
//     Vz_max = __fmax(Vz_max,Temp_Db);
//     Vz_max = __fmax(Vz_max,Temp_Dc);
//
//     Vz_min = Temp_Da;
//     Vz_min = __fmin(Vz_min,Temp_Db);
//     Vz_min = __fmin(Vz_min,Temp_Dc);
//
//     Vz = -0.5 * (Vz_max + Vz_min);
//
//     Da_temp = Temp_Da + 0.5;
//     Db_temp = Temp_Db + 0.5;
//     Dc_temp = Temp_Dc + 0.5;
//
//     Da_temp1 = Temp_Da + Vz + 0.5;
//     Db_temp1 = Temp_Db + Vz + 0.5;
//     Dc_temp1 = Temp_Dc + Vz + 0.5;
//
//     Vza_new = __fracf32(Da_temp1 * 5) * 0.2;
//     Vzb_new = __fracf32(Db_temp1 * 5) * 0.2;
//     Vzc_new = __fracf32(Dc_temp1 * 5) * 0.2;
//
//     Vz_new_max = Vza_new;
//     Vz_new_max = __fmax(Vz_new_max,Vzb_new);
//     Vz_new_max = __fmax(Vz_new_max,Vzc_new);
//
//     Vz_new_min = Vza_new;
//     Vz_new_min = __fmin(Vz_new_min,Vzb_new);
//     Vz_new_min = __fmin(Vz_new_min,Vzc_new);
//
//     Vz_new = -0.5 * (Vz_new_max + Vz_new_min);
//
//     Da_temp2 = Da_temp1 + Vz_new + 0.1; // 0.1 = 1/2/(N-1), N is number of levels
//     Db_temp2 = Db_temp1 + Vz_new + 0.1;
//     Dc_temp2 = Dc_temp1 + Vz_new + 0.1;
//
//     Da = (Uint16)(Da_temp2 * 500);
//     Db = (Uint16)(Db_temp2 * 500);
//     Dc = (Uint16)(Dc_temp2 * 500);
////    Da = (Uint16)(1365);
////    Db = (Uint16)(1365);
////    Dc = (Uint16)(1365);
//Open loop duty for single phase inverter
//    GpioDataRegs.GPADAT.bit.GPIO1 = 1;
//    if(i < 167)
//    {
//        i++;
//    }
//    else
//    {
//        i = 0;
//    }
//
//    Vina1 = x * __cospuf32(0.0006 * i);   //0.0006 = 60(line frequency) * 1/100k(interrupt freq) 2*pi is included in sinpuf32 function
//
//    Temp_Da = Vina1 *  __einvf32(Vo_calc);
//
//    Temp_Da = __fmax(Temp_Da,-0.475);
//    Temp_Da = __fmin(Temp_Da,0.475);
//
//    Da_temp1 = Temp_Da + 0.5;
//
//    Da = (Uint16)(Da_temp1 * 500);
//    Db = (Uint16)(Da_temp1 * 500);
//    Dc = (Uint16)(Da_temp1 * 500);
//for open loop DD
    GpioDataRegs.GPADAT.bit.GPIO1 = 1;

    Da_temp2 = 0.3 + AdcdResultRegs.ADCRESULT1;
    Db_temp2 = 0.3 + AdcdResultRegs.ADCRESULT1;
    Dc_temp2 = 0.3 + AdcdResultRegs.ADCRESULT1;

    Da = (Uint16)(Da_temp2 * 500);
    Db = (Uint16)(Db_temp2 * 500);
    Dc = (Uint16)(Dc_temp2 * 500);

    spi_xmit(Da << 7);
    spi_xmit(Db << 7);
    spi_xmit(Dc << 7);
//Error Preventing method for spi and transmit data by spi
//    Da_ch = abs(Da - Da_past);
//    Db_ch = abs(Db - Db_past);
//    Dc_ch = abs(Dc - Dc_past);
//
//    Da_past = Da;
//    Db_past = Db;
//    Dc_past = Dc;
//    if((Da_ch >= 5) || (Db_ch >= 5) || (Da_ch >= 5) || (start > 0))
//    {
//        Da = Da + 512;
//        Db = Db + 512;
//        Dc = Dc + 512;
//        start = start - 1;
//        D_ch_flag = 1;
//    }
//    else if(D_ch_flag == 1)
//    {
//        Da = Da + 512;
//        Db = Db + 512;
//        Dc = Dc + 512;
////        D_ch_flag = 0;
//    }
////    else
////    {
////        ach_max = __fmax(ach_max,Da_ch);
////        ach_min = __fmin(ach_min,Da_ch);
////    }
//    if(start < 0)
//    {
//        start = 0;
//    }
//
//    spi_xmit(Da << 7);
//    spi_xmit(Db << 7);
//    spi_xmit(Dc << 7);
//    DacaRegs.DACVALS.bit.DACVALS = 0;
    AdcdRegs.ADCINTFLGCLR.bit.ADCINT1 = 1; //clear INT1 flag
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}

//
// End of file
//
