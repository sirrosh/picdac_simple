list	p=16f648a
radix dec
#include "p16f648a.inc"
;__config 0x3f78
__CONFIG   _CP_OFF & _CPD_OFF & _WDT_OFF & _PWRTE_ON & _INTRC_OSC_NOCLKOUT & _MCLRE_OFF & _LVP_OFF

RES_VECT CODE    0x0000          ; processor reset vector
    NOP                             ; for ICD
    banksel TRISB
    CLRF   TRISB            ; port B to output
    banksel PORTB
    GOTO   0x007D

SINE_TABLE CODE 0x007D
#include "simple.inc"
    MOVWF PCL


    END