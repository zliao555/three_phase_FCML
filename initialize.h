/*
 * initialize.h
 *
 *  Created on: Sep 13, 2016
 *      Author: Max
 */

#ifndef INITIALIZE_H_
#define INITIALIZE_H_

// disable unused clk to save power
void disable_unused_clk(void);
// ADC callibration

// measure bias value from analog amplifier

// initialize the necessary interrupts

//Spi
void spi_fifo_init(void);

void init_DACs(void);

void spi_xmit(Uint16 a);


// ADC callibration
//void InitSpiGpio(void);
//void InitSpiaGpio(void);

#endif /* INITIALIZE_H_ */
