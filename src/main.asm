
_InitializeSystem:

;main.c,34 :: 		void InitializeSystem(void){
;main.c,35 :: 		TRISA = 0b00000000;
	CLRF        TRISA+0 
;main.c,36 :: 		TRISB = 0b00000000;
	CLRF        TRISB+0 
;main.c,38 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,39 :: 		configTMR0();
	CALL        _configTMR0+0, 0
;main.c,40 :: 		configButton();
	CALL        _configButton+0, 0
;main.c,41 :: 		}
L_end_InitializeSystem:
	RETURN      0
; end of _InitializeSystem

_main:

;main.c,43 :: 		void main(void){
;main.c,44 :: 		InitializeSystem();
	CALL        _InitializeSystem+0, 0
;main.c,46 :: 		while(1){
L_main0:
;main.c,48 :: 		}
	GOTO        L_main0
;main.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;main.c,51 :: 		void interrupt_low(void){
;main.c,52 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt_low2
;main.c,53 :: 		resetTMR0();
	CALL        _resetTMR0+0, 0
;main.c,54 :: 		testButton();
	CALL        _testButton+0, 0
;main.c,55 :: 		}
L_interrupt_low2:
;main.c,56 :: 		}
L_end_interrupt_low:
L__interrupt_low6:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low
