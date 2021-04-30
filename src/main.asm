
_InitializeSystem:

;main.c,23 :: 		void InitializeSystem(void){
;main.c,24 :: 		TRISA = 0b00000000;
	CLRF        TRISA+0 
;main.c,25 :: 		TRISB = 0b00000000;
	CLRF        TRISB+0 
;main.c,27 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;main.c,29 :: 		}
L_end_InitializeSystem:
	RETURN      0
; end of _InitializeSystem

_main:

;main.c,31 :: 		void main(void){
;main.c,32 :: 		InitializeSystem();
	CALL        _InitializeSystem+0, 0
;main.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
