/*
 * File:   Driver_Project4.c
 * Author: Mathew McLeod
 *
 * Created on October 19, 2022, 1:46 PM
 */

#include <xc.h>
#include "functions.h"
#include "xc.h"
#include <p24fxxxx.h>
#include <p24F16KA101.h>
#include <stdio.h>
#include <math.h>
#include <errno.h>

//// CONFIGURATION BITS - PRE-PROCESSOR DIRECTIVES ////

// Code protection 
#pragma config BSS = OFF // Boot segment code protect disabled
#pragma config BWRP = OFF // Boot sengment flash write protection off
#pragma config GCP = OFF // general segment code protecion off
#pragma config GWRP = OFF

// CLOCK CONTROL 
#pragma config IESO = OFF    // 2 Speed Startup disabled
#pragma config FNOSC = FRC  // Start up CLK = 8 MHz
#pragma config FCKSM = CSECMD // Clock switching is enabled, clock monitor disabled
#pragma config SOSCSEL = SOSCLP // Secondary oscillator for Low Power Operation
#pragma config POSCFREQ = MS  //Primary Oscillator/External clk freq betwn 100kHz and 8 MHz. Options: LS, MS, HS
#pragma config OSCIOFNC = ON  //CLKO output disabled on pin 8, use as IO. 
#pragma config POSCMOD = NONE  // Primary oscillator mode is disabled

// WDT
#pragma config FWDTEN = OFF // WDT is off
#pragma config WINDIS = OFF // STANDARD WDT/. Applicable if WDT is on
#pragma config FWPSA = PR32 // WDT is selected uses prescaler of 32
#pragma config WDTPS = PS1 // WDT postscler is 1 if WDT selected

//MCLR/RA5 CONTROL
#pragma config MCLRE = OFF // RA5 pin configured as input, MCLR reset on RA5 diabled

//BOR  - FPOR Register
#pragma config BORV = LPBOR // LPBOR value=2V is BOR enabled
#pragma config BOREN = BOR0 // BOR controlled using SBOREN bit
#pragma config PWRTEN = OFF // Powerup timer disabled
#pragma config I2C1SEL = PRI // Default location for SCL1/SDA1 pin

//JTAG FICD Register
#pragma config BKBUG = OFF // Background Debugger functions disabled
#pragma config ICS = PGx2 // PGC2 (pin2) & PGD2 (pin3) are used to connect PICKIT3 debugger

// Deep Sleep RTCC WDT
#pragma config DSWDTEN = OFF // Deep Sleep WDT is disabled
#pragma config DSBOREN = OFF // Deep Sleep BOR is disabled
#pragma config RTCOSC = LPRC// RTCC uses LPRC 32kHz for clock
#pragma config DSWDTOSC = LPRC // DeepSleep WDT uses Lo Power RC clk
#pragma config DSWDTPS = DSWDTPS7 // DSWDT postscaler set to 32768 


// GLOBAL VARIABLES
//int TMR2flag = 0; // Timer 2 flag bit.  Not currently being used.
uint8_t CNflag = 0; // CN interrupt flag bit.
uint16_t i = 0;     // initialize counter.


// MACROS
#define Nop() {__asm__ volatile ("nop");}
#define ClrWdt() {__asm__ volatile ("clrwdt");}
#define Sleep() {__asm__ volatile ("pwrsav #0");}   // set sleep mode
#define Idle() {__asm__ volatile ("pwrsav #1");}
#define dsen() {__asm__ volatile ("BSET DSCON, #15");}
        
int main(void) {

    // Initialize IO pins.
    IOinit();
    
    // Configure RA2 as a digital input.
    AD1PCFG = 0xFFFF;  // Turn all analog pins to digital
    
    // Initialize UART2 conditions.
    UART2init();
    
    // Set clk to 8MHz
    NewCLK(8);
    
    // Set ADC interrupt
    IEC0bits.AD1IE = 1;     // Enables ADC interrupt.
    
    // Set CN interrupts.
    IEC1bits.CNIE = 1;      // Enables CN on all peripherals.
    CNEN1bits.CN0IE = 1;    // Enable CN interrupt on RA4-pin10.
    CNEN1bits.CN1IE = 1;    // Enable CN interrupt on RB4-pin9.
    CNEN2bits.CN30IE = 1;   // Enable CN interrupt on RA2-pin7.
     
    // No PBx's pressed, all LEDs off.
    LATBbits.LATB8 == 0;    //  Initializes LED to off.
    
    //  Initialize required instances for App1 project.
    int state;          // State variable    
    int min;            // Minute variable.
    int sec;            // Second variable.

    state = 0;
    min = 0;
    sec = 0;
    
    // infinite loop
    while(1)
    {
        
//        Idle();  // Puts device into Idle mode until interrupt
                 // occurs for power saving.
                 // Sit in Idle() while in State 0.
        
        // Condition entered upon CN interrupt.
        if (CNflag == 1)
        {
            CNflag = 0;
//            display_check();
//            IOcheck();
//            timer_check();
            timer_check(&min, &sec, &state);        // Runs the timer.
        }
    }    
    return 0;
}


// Timer 2 interrupt subroutine
void __attribute__((interrupt,no_auto_psv)) _T2Interrupt(void)
{
    IFS0bits.T2IF = 0;  // Clear timer 2 interrupt flag.
    T2CONbits.TON = 0;  // Turn timer off.
//    TMR2flag = 1;      // global variable created by user.
}

// Change of Notification interrupt subroutine.
void __attribute__((interrupt,no_auto_psv)) _CNInterrupt(void)
{
    IPC4bits.CNIP = 6;  // Set CN priority.
    IFS1bits.CNIF = 0;  // Clear change notification interrupt flag.
    CNflag = 1;  // Global flag variable.
}


//// ADC interrupt subroutine
void __attribute__((interrupt, no_auto_psv)) _ADC1Interrupt(void)
{
    IPC3bits.AD1IP = 5;     // Set interrupt priority level.
    IFS0bits.AD1IF = 0;     // Clear the ADC1 Interrupt Flag
    CNflag = 1;             // Global flag variable.
}