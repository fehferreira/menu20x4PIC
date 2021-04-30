
_testButton:

;button.c,10 :: 		void testButton(void){
;button.c,11 :: 		if(flagsButton.flagVoltar){
	BTFSS       _flagsButton+0, 0 
	GOTO        L_testButton0
;button.c,12 :: 		flagsButton.flagVoltar = 0;
	BCF         _flagsButton+0, 0 
;button.c,13 :: 		}
L_testButton0:
;button.c,14 :: 		}
L_end_testButton:
	RETURN      0
; end of _testButton
