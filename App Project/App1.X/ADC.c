/*
 * File:   ADC.c
 * Author: mathew
 *
 * Created on November 11, 2022, 1:53 PM
 */

#include "functions.h"
#include "xc.h"

unsigned int do_ADC(void)
//uint16_t do_ADC(void)
{
    unsigned int ADCvalue; // 16-bit register to hold ADC value.
//    uint16_t ADC_value;
    
    // AD1PCFG register.
    AD1PCFGbits.PCFG5 = 0;      // Config pin AN5-pin8 to analog mode.
    
    // ----ADC Initialization--- //
    
    // AD1CON1 register.
    AD1CON1bits.ADON = 1;       // turns ADC on.
    AD1CON1bits.FORM = 0b00;      // set data output format to integer.
    AD1CON1bits.SSRC = 0b111;     // Internal counter ends sampling 
                                // and starts conversion (auto-convert).
    AD1CON1bits.ASAM = 0;       // Sampling starts when this bit is set to 1.
    AD1CON1bits.DONE = 0;       // This bit is set to 1 when a conversion 
                                // is completed by the ADC.
    
    // AD1CON2 register.
    AD1CON2bits.VCFG = 0b000;     // Set Vref to supply voltage.
    AD1CON2bits.CSCNA = 0;      // Do not scan inputs.
    AD1CON2bits.SMPI = 0b000;     // Interrupts at each conversion.
    AD1CON2bits.BUFM = 0;       // Configs buffer as single 16-bit word.
    AD1CON2bits.ALTS = 0;       // Configs MUXA as input.
    
    // Interrupt
    IFS0bits.AD1IF = 0;         // Interrupt flag status bit.
    
    // AD1CON3 register.
    AD1CON3bits.ADRC = 0;       // Clock derived from system clk.
    AD1CON3bits.SAMC = 0b11111;   // Slowest sampling time. 
                                // Video states set sample time to 1/10th
                                // the time of signal being sampled.
 
    // AD1CHS register.
    AD1CHSbits.CH0NA = 0;       // Set negative input to ground.
    AD1CHSbits.CH0SA = 0b0101;    // Channel 0 positive input is AN5.
    
    // AD1CSSL register.
    AD1CSSL = 0;                // Omit pins from scan. Zero entire register.
    
    // ---- ADC Sampling and Conversion ---- //
    AD1CON1bits.SAMP = 1;       // Start sampling. Conversion starts 
                                // automatically after SSRC and SAMC setting.
    
    while(AD1CON1bits.DONE==0)  // holds code here until conversion complete.
    {
        Idle();                 // Enter Idle() mode while sampling to save power.
    }                      
    ADCvalue = ADC1BUF0;        // ADC output is stored in ADC1BUF0 
    AD1CON1bits.SAMP = 0;       // Stops sampling.
    AD1CON1bits.ADON = 0;       // Turns off ADC, value stored in ADC1BUF0.
        
    return (ADCvalue);           // Set ADC value back to calling function.
}