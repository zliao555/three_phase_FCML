/*
 * initialize.h
 *
 *  Created on: Nov 30, 2019
 *      Author: max syu for pilawa_group
 */

#ifndef FUNCTION_H_
#define FUNCTION_H_

//PID
float PID(float out_PID_prev, float err, float err_prev, float Kp, float KiTs);

//Low Pass Filter 30Hz
float LPF30Hz(float out_LPF_prev, float input);

//Limiter
float limit(float input, float max, float min);
#endif /* FUNCTION_H_ */
