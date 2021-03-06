list	p=16f648a
radix dec
#include "p16f648a.inc"
__CONFIG   _CP_OFF & _CPD_OFF & _WDT_OFF & _PWRTE_ON & _INTRC_OSC_NOCLKOUT & _MCLRE_OFF & _LVP_OFF

RES_VECT CODE    0x0000          ; processor reset vector
    NOP                             ; for ICD
    banksel TRISB
    CLRF   TRISB                ; port B to output
    banksel PORTB
    GOTO   0x007D               ; let's start generating!

SINE_TABLE CODE 0x007D          ; using predefined address (the last sine table value) to save one cycle on GOTO
#include "simple.inc"
    MOVWF PCL                   ; this will throw us to the beginning of the loop, at the 0x007D


    END
