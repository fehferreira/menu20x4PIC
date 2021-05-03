
_mainMenu:

;menu.c,10 :: 		void mainMenu(void){
;menu.c,11 :: 		setValueMenuButton(0,0,2,1);
	CLRF        FARG_setValueMenuButton_initVar+0 
	CLRF        FARG_setValueMenuButton_minVar+0 
	MOVLW       2
	MOVWF       FARG_setValueMenuButton_maxVar+0 
	MOVLW       1
	MOVWF       FARG_setValueMenuButton_incVar+0 
	CALL        _setValueMenuButton+0, 0
;menu.c,12 :: 		while(!backBtnPress()){
L_mainMenu0:
	CALL        _backBtnPress+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_mainMenu1
;menu.c,13 :: 		while(!backBtnPress() || !okBtnPress())
L_mainMenu2:
	CALL        _backBtnPress+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__mainMenu11
	CALL        _okBtnPress+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__mainMenu11
	GOTO        L_mainMenu3
L__mainMenu11:
;menu.c,14 :: 		showMainMenu(getSelectValue());
	CALL        _getSelectValue+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_showMainMenu_valueReceive+0 
	CALL        _showMainMenu+0, 0
	GOTO        L_mainMenu2
L_mainMenu3:
;menu.c,16 :: 		if(okBtnPress()){
	CALL        _okBtnPress+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_mainMenu6
;menu.c,17 :: 		cleanBtnOk();
	CALL        _cleanBtnOk+0, 0
;menu.c,18 :: 		switch(getSelectValue()){
	CALL        _getSelectValue+0, 0
	GOTO        L_mainMenu7
;menu.c,19 :: 		case 0:
L_mainMenu9:
;menu.c,20 :: 		break;
	GOTO        L_mainMenu8
;menu.c,21 :: 		case 1:
L_mainMenu10:
;menu.c,22 :: 		break;
	GOTO        L_mainMenu8
;menu.c,23 :: 		}
L_mainMenu7:
	MOVF        R0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_mainMenu9
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_mainMenu10
L_mainMenu8:
;menu.c,24 :: 		}
L_mainMenu6:
;menu.c,25 :: 		}
	GOTO        L_mainMenu0
L_mainMenu1:
;menu.c,26 :: 		cleanBtnBack();
	CALL        _cleanBtnBack+0, 0
;menu.c,27 :: 		}
L_end_mainMenu:
	RETURN      0
; end of _mainMenu
