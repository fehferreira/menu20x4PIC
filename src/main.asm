
_InitializeSystem:

;main.c,26 :: 		void InitializeSystem(void){
;main.c,27 :: 		TRISA = 0b00000000;
	CLRF        TRISA+0 
;main.c,28 :: 		TRISB = 0b00000000;
	CLRF        TRISB+0 
;main.c,30 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,32 :: 		}
L_end_InitializeSystem:
	RETURN      0
; end of _InitializeSystem

_main:

;main.c,34 :: 		void main(void){
;main.c,35 :: 		InitializeSystem();
	CALL        _InitializeSystem+0, 0
;main.c,37 :: 		Lcd_Out(1,1,tracos);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _tracos+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_tracos+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,38 :: 		Lcd_Out(2,1,msnInicial);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _msnInicial+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_msnInicial+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,39 :: 		Lcd_Out(3,1,msnInicial);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _msnInicial+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_msnInicial+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,40 :: 		Lcd_Out(4,1,tracos);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _tracos+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_tracos+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main.c,42 :: 		while(1){
L_main0:
;main.c,44 :: 		}
	GOTO        L_main0
;main.c,45 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
