
_genericMenuCondition:

;menu.c,10 :: 		void genericMenuCondition(void (*pointerDisplayFunction)(unsigned short valueReceive)){
;menu.c,11 :: 		while(!backBtnPress()){
L_genericMenuCondition0:
	CALL        _backBtnPress+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_genericMenuCondition1
;menu.c,12 :: 		while(!backBtnPress() || !okBtnPress())
L_genericMenuCondition2:
	CALL        _backBtnPress+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__genericMenuCondition7
	CALL        _okBtnPress+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__genericMenuCondition7
	GOTO        L_genericMenuCondition3
L__genericMenuCondition7:
;menu.c,13 :: 		pointerDisplayFunction(getSelectValue());
	CALL        _getSelectValue+0, 0
	MOVF        FARG_genericMenuCondition_pointerDisplayFunction+2, 0 
	MOVWF       FSR1+0 
	MOVF        FARG_genericMenuCondition_pointerDisplayFunction+3, 0 
	MOVWF       FSR1+1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_genericMenuCondition_pointerDisplayFunction+0, 0 
	MOVWF       R0 
	MOVF        FARG_genericMenuCondition_pointerDisplayFunction+1, 0 
	MOVWF       R1 
	CALL        _____DoIFC+0, 0
	GOTO        L_genericMenuCondition2
L_genericMenuCondition3:
;menu.c,15 :: 		if(okBtnPress()){
	CALL        _okBtnPress+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_genericMenuCondition6
;menu.c,16 :: 		return;
	GOTO        L_end_genericMenuCondition
;menu.c,17 :: 		}
L_genericMenuCondition6:
;menu.c,18 :: 		}
	GOTO        L_genericMenuCondition0
L_genericMenuCondition1:
;menu.c,19 :: 		cleanBtnBack();
	CALL        _cleanBtnBack+0, 0
;menu.c,20 :: 		}
L_end_genericMenuCondition:
	RETURN      0
; end of _genericMenuCondition

_mainMenu:

;menu.c,22 :: 		void mainMenu(void){
;menu.c,23 :: 		setValueMenuButton(0,0,2,1);
	CLRF        FARG_setValueMenuButton_initVar+0 
	CLRF        FARG_setValueMenuButton_minVar+0 
	MOVLW       2
	MOVWF       FARG_setValueMenuButton_maxVar+0 
	MOVLW       1
	MOVWF       FARG_setValueMenuButton_incVar+0 
	CALL        _setValueMenuButton+0, 0
;menu.c,24 :: 		genericMenuCondition(&showMainMenu);
	MOVLW       _showMainMenu+0
	MOVWF       FARG_genericMenuCondition_pointerDisplayFunction+0 
	MOVLW       hi_addr(_showMainMenu+0)
	MOVWF       FARG_genericMenuCondition_pointerDisplayFunction+1 
	MOVLW       FARG_showMainMenu_valueReceive+0
	MOVWF       FARG_genericMenuCondition_pointerDisplayFunction+2 
	MOVLW       hi_addr(FARG_showMainMenu_valueReceive+0)
	MOVWF       FARG_genericMenuCondition_pointerDisplayFunction+3 
	CALL        _genericMenuCondition+0, 0
;menu.c,25 :: 		}
L_end_mainMenu:
	RETURN      0
; end of _mainMenu
