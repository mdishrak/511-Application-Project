

/*
 * File:   main.c 
 * Author: Md Ishrak Mashroor, Mohammad Mustafa, Shreosi Debnath
 * Group : 10
 * Project: Driver Project 2
 * Created on October 1, 2022, 12:58 PM
 */


#include "xc.h"
void main(void){
    
    
    
    TRISBbits.TRISB8 = 0;  // output
    
    TRISBbits.TRISB4 = 1;  //Pin 9, RB4, is input
    TRISAbits.TRISA4 = 1; //Pin 10
    TRISAbits.TRISA2 = 1; //Pin 7
    
    // setting up pull-up registers
    CNPU1bits.CN0PUE = 1; //pull-up on Pin 10
    CNPU1bits.CN1PUE = 1; //pull-up enable for Pin 9
    CNPU2bits.CN30PUE = 1; //pull-up on Pin 7
    
    
    
    AD1PCFG = 0xFFFF; // Turn all analog pins to digital
    
    
    const uint32_t pbOne1sec = 60000; // pbOne1sec ~~  push button one will allow 1sec time delay in real time
    const uint32_t pbTwo2sec = 120000;
    const uint32_t pbThree3sec = 180000;  
    
    
    while(1)
    {
        uint32_t delaybit = 0;
        int t = 0;
                              //  2 or more buttons pushed at the same time. combinations:  Ra2Ra4 ,Ra2Rb4 ,Ra4Rb4 ,Ra2Ra4Rb4//
        if(((PORTAbits.RA4 == 0 && PORTAbits.RA2 == 0 ) || (PORTAbits.RA4 == 0 && PORTBbits.RB4 == 0 )  ||  (PORTAbits.RA2 == 0 && PORTBbits.RB4 == 0 ) || (PORTAbits.RA4 == 0 && PORTAbits.RA2  && PORTBbits.RB4 == 0 ))){//this is for when two or more buttons are pressed
            LATBbits.LATB8 = 1; //similar to last assignment, it simply turns on the light without any blinking
        }
        
                                           // RA2 Fist button   1 sec interval //
        while (PORTAbits.RA2 == 0 && PORTBbits.RB4 == 1 && PORTAbits.RA4 == 1) {
            if (t){
                LATBbits.LATB8 = 0;
            }
            else
            {
                LATBbits.LATB8 = 1;
            }
            delaybit++;
            if (delaybit > pbOne1sec) {
                t =~ t;
                delaybit = 0;
            }  
        }
                                           // RB4 2nd button    2 sec interval //       
        while (PORTAbits.RA2 == 1 && PORTBbits.RB4 == 0 && PORTAbits.RA4 == 1){
            if (t){
                LATBbits.LATB8 = 0;
            }
            else
            {
                LATBbits.LATB8 = 1;
            }
            delaybit++;
            if (delaybit > pbTwo2sec) {
                t =~ t;
                delaybit = 0;
            }
        }
                                           // RA4 3rd button     3 sec interval //        
        while (PORTAbits.RA2 == 1 && PORTBbits.RB4 == 1 && PORTAbits.RA4 == 0){
            if (t){
                LATBbits.LATB8 = 0;
            }
            else
            {
                LATBbits.LATB8 = 1;
            }
            delaybit++;
            if (delaybit > pbThree3sec) {
                t =~ t;
                delaybit = 0;
            }
        }
        
        
 
        LATBbits.LATB8 = 0;
    }
}
