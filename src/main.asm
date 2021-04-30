
_InitializeSystem:

;main.c,28 :: 		void InitializeSystem(void){
;main.c,29 :: 		TRISA = 0b00000000;
	CLRF        TRISA+0 
;main.c,30 :: 		TRISB = 0b00000000;
	CLRF        TRISB+0 
;main.c,32 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,33 :: 		configTMR0();
	CALL        _configTMR0+0, 0
;main.c,35 :: 		}
L_end_InitializeSystem:
	RETURN      0
; end of _InitializeSystem

_main:

;main.c,37 :: 		void main(void){
;main.c,38 :: 		InitializeSystem();
	CALL        _InitializeSystem+0, 0
;main.c,40 :: 		Lcd_Out(1,1,tracos);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _tracos+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_tracos+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,41 :: 		Lcd_Out(2,1,msnInicial);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _msnInicial+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_msnInicial+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,42 :: 		Lcd_Out(3,1,msnInicial);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _msnInicial+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_msnInicial+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,43 :: 		Lcd_Out(4,1,tracos);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _tracos+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_tracos+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,45 :: 		while(1){
L_main0:
;main.c,47 :: 		}
	GOTO        L_main0
;main.c,48 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;main.c,50 :: 		void interrupt_low(void){
;main.c,51 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt_low2
;main.c,52 :: 		resetTMR0();
	CALL        _resetTMR0+0, 0
;main.c,53 :: 		testButton();
	CALL        _testButton+0, 0
;main.c,54 :: 		}
L_interrupt_low2:
;main.c,55 :: 		}
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
