
_InitializeSystem:

;main.c,35 :: 		void InitializeSystem(void){
;main.c,36 :: 		TRISA = 0b00000000;
	CLRF        TRISA+0 
;main.c,37 :: 		TRISB = 0b00000000;
	CLRF        TRISB+0 
;main.c,39 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,40 :: 		configTMR0();
	CALL        _configTMR0+0, 0
;main.c,41 :: 		configButton();
	CALL        _configButton+0, 0
;main.c,42 :: 		}
L_end_InitializeSystem:
	RETURN      0
; end of _InitializeSystem

_main:

;main.c,44 :: 		void main(void){
;main.c,45 :: 		InitializeSystem();
	CALL        _InitializeSystem+0, 0
;main.c,47 :: 		while(1){
L_main0:
;main.c,48 :: 		mainMenu();
	CALL        _mainMenu+0, 0
;main.c,49 :: 		}
	GOTO        L_main0
;main.c,50 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;main.c,52 :: 		void interrupt_low(void){
;main.c,53 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt_low2
;main.c,54 :: 		resetTMR0();
	CALL        _resetTMR0+0, 0
;main.c,55 :: 		testButton();
	CALL        _testButton+0, 0
;main.c,56 :: 		}
L_interrupt_low2:
;main.c,57 :: 		}
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
