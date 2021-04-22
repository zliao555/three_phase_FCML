
#include "F28x_Project.h"     // Device Headerfile and Examples Include File
#include "initialize.h"

void disable_unused_clk()
{
	EALLOW;
	CpuSysRegs.PCLKCR0.bit.CLA1 = 0;
	CpuSysRegs.PCLKCR0.bit.DMA = 0;
	CpuSysRegs.PCLKCR0.bit.CPUTIMER0 = 0;
	CpuSysRegs.PCLKCR0.bit.CPUTIMER1 = 0;
	CpuSysRegs.PCLKCR0.bit.CPUTIMER2 = 0;
	//CpuSysRegs.PCLKCR0.bit.HRPWM = 1;
	//CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 1;

	CpuSysRegs.PCLKCR1.bit.EMIF1 = 0;
	CpuSysRegs.PCLKCR1.bit.EMIF2 = 0;

	//CpuSysRegs.PCLKCR2.bit.EPWM1 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM2 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM3 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM4 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM5 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM6 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM7 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM8 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM9 = 1;
	//CpuSysRegs.PCLKCR2.bit.EPWM10 = 0;
	//CpuSysRegs.PCLKCR2.bit.EPWM11 = 0;
	//CpuSysRegs.PCLKCR2.bit.EPWM12 = 0;

	CpuSysRegs.PCLKCR3.bit.ECAP1 = 0;
	CpuSysRegs.PCLKCR3.bit.ECAP2 = 0;
	CpuSysRegs.PCLKCR3.bit.ECAP3 = 0;
	CpuSysRegs.PCLKCR3.bit.ECAP4 = 0;
	CpuSysRegs.PCLKCR3.bit.ECAP5 = 0;
	CpuSysRegs.PCLKCR3.bit.ECAP6 = 0;

	CpuSysRegs.PCLKCR4.bit.EQEP1 = 0;
	CpuSysRegs.PCLKCR4.bit.EQEP2 = 0;
	CpuSysRegs.PCLKCR4.bit.EQEP3 = 0;

	CpuSysRegs.PCLKCR6.bit.SD1 = 0;
	CpuSysRegs.PCLKCR6.bit.SD2 = 0;

	CpuSysRegs.PCLKCR7.bit.SCI_A = 0;
	CpuSysRegs.PCLKCR7.bit.SCI_B = 0;
	CpuSysRegs.PCLKCR7.bit.SCI_C = 0;
	CpuSysRegs.PCLKCR7.bit.SCI_D = 0;

	//CpuSysRegs.PCLKCR8.bit.SPI_A = 0;
	CpuSysRegs.PCLKCR8.bit.SPI_B = 0;
	CpuSysRegs.PCLKCR8.bit.SPI_C = 0;

	CpuSysRegs.PCLKCR9.bit.I2C_A = 0;
	CpuSysRegs.PCLKCR9.bit.I2C_B = 0;

	CpuSysRegs.PCLKCR10.bit.CAN_A = 0;
	CpuSysRegs.PCLKCR10.bit.CAN_B = 0;

	CpuSysRegs.PCLKCR11.bit.McBSP_A = 0;
	CpuSysRegs.PCLKCR11.bit.McBSP_B = 0;
	CpuSysRegs.PCLKCR11.bit.USB_A = 0;

	CpuSysRegs.PCLKCR12.bit.uPP_A = 0;

	//CpuSysRegs.PCLKCR13.bit.ADC_A = 1;
	//CpuSysRegs.PCLKCR13.bit.ADC_B = 1;
	//CpuSysRegs.PCLKCR13.bit.ADC_C = 1;
	//CpuSysRegs.PCLKCR13.bit.ADC_D = 1;

	CpuSysRegs.PCLKCR14.bit.CMPSS1 = 0;
	CpuSysRegs.PCLKCR14.bit.CMPSS2 = 0;
	CpuSysRegs.PCLKCR14.bit.CMPSS3 = 0;
	CpuSysRegs.PCLKCR14.bit.CMPSS4 = 0;
	CpuSysRegs.PCLKCR14.bit.CMPSS5 = 0;
	CpuSysRegs.PCLKCR14.bit.CMPSS6 = 0;
	CpuSysRegs.PCLKCR14.bit.CMPSS7 = 0;
	CpuSysRegs.PCLKCR14.bit.CMPSS8 = 0;

	//CpuSysRegs.PCLKCR16.bit.DAC_A = 0;
	//CpuSysRegs.PCLKCR16.bit.DAC_B = 0;
	//CpuSysRegs.PCLKCR16.bit.DAC_C = 0;

	EDIS;
}

void init_DACs(){

    // Enable DACOUTA
    EALLOW;
    //Use VDAC as the reference for DAC
    DacaRegs.DACCTL.bit.DACREFSEL = 1;
    //Enable DAC output
    DacaRegs.DACCTL.bit.LOADMODE = 0;
    //Set DAC to some initial value
    DacaRegs.DACOUTEN.bit.DACOUTEN = 1;
    //Choose the update timing of DACVAL
    DacaRegs.DACVALS.bit.DACVALS = 2048;

    //Use VDAC as the reference for DAC
    DacbRegs.DACCTL.bit.DACREFSEL = 1;
    //Enable DAC output
    DacaRegs.DACCTL.bit.LOADMODE = 0;
    //Set DAC to some initial value
    DacbRegs.DACOUTEN.bit.DACOUTEN = 1;
    //Set DAC to some initial value
    DacbRegs.DACVALS.bit.DACVALS = 2048;

    //Use VDAC as the reference for DAC
    DaccRegs.DACCTL.bit.DACREFSEL = 1;
    //Enable DAC output
    DacaRegs.DACCTL.bit.LOADMODE = 0;
    //Set DAC to some initial value
    DaccRegs.DACOUTEN.bit.DACOUTEN = 1;
    //Set DAC to some initial value
    DaccRegs.DACVALS.bit.DACVALS = 2048;
    EDIS;
}

void spi_fifo_init()
{
    //
    // Initialize SPI FIFO registers
    //
    SpiaRegs.SPIFFTX.all = 0xE040;
    SpiaRegs.SPIFFRX.all = 0x2044;
    SpiaRegs.SPIFFCT.all = 0x0;

    //
    // Initialize core SPI registers
    //
    InitSpi();
}

void spi_xmit(Uint16 a)
{
    SpiaRegs.SPITXBUF = a;
}

// end of code
