
_mainMenu:

;menu.c,10 :: 		void mainMenu(void){
;menu.c,11 :: 		while(!backBtnPress()){
L_mainMenu0:
	CALL        _backBtnPress+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_mainMenu1
;menu.c,24 :: 		}
	GOTO        L_mainMenu0
L_mainMenu1:
;menu.c,26 :: 		}
L_end_mainMenu:
	RETURN      0
; end of _mainMenu
