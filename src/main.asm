
_InitializeSystem:

;main.c,8 :: 		void InitializeSystem(void){
;main.c,9 :: 		TRISA = 0b00000000;
	CLRF        TRISA+0 
;main.c,10 :: 		TRISB = 0b00000000;
	CLRF        TRISB+0 
;main.c,12 :: 		}
L_end_InitializeSystem:
	RETURN      0
; end of _InitializeSystem

_main:

;main.c,14 :: 		void main(void){
;main.c,16 :: 		InitializeSystem();
	CALL        _InitializeSystem+0, 0
;main.c,18 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
