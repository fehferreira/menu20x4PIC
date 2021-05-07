
_genericMenuCondition:

;menu.c,11 :: 		pointerFunction genericMenuCondition(MenuFunctions receiveFunctions){
;menu.c,12 :: 		while(!backBtnPress()){
L_genericMenuCondition0:
	CALL        _backBtnPress+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_genericMenuCondition1
;menu.c,13 :: 		while(!okOrBackBtnPress())
L_genericMenuCondition2:
	CALL        _okOrBackBtnPress+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_genericMenuCondition3
;menu.c,14 :: 		receiveFunctions.functionDisplay(getSelectValue());
	CALL        _getSelectValue+0, 0
	MOVF        FARG_genericMenuCondition_receiveFunctions+4, 0 
	MOVWF       FSR1+0 
	MOVF        FARG_genericMenuCondition_receiveFunctions+5, 0 
	MOVWF       FSR1+1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_genericMenuCondition_receiveFunctions+2, 0 
	MOVWF       R0 
	MOVF        FARG_genericMenuCondition_receiveFunctions+3, 0 
	MOVWF       R1 
	CALL        _____DoIFC+0, 0
	GOTO        L_genericMenuCondition2
L_genericMenuCondition3:
;menu.c,15 :: 		if(okBtnPress()){
	CALL        _okBtnPress+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_genericMenuCondition4
;menu.c,16 :: 		cleanBtnOk();
	CALL        _cleanBtnOk+0, 0
;menu.c,17 :: 		return receiveFunctions.functionsSelect[getSelectValue()];
	CALL        _getSelectValue+0, 0
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R2, 1 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R2, 1 
	MOVF        R1, 0 
	ADDWF       FARG_genericMenuCondition_receiveFunctions+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R2, 0 
	ADDWFC      FARG_genericMenuCondition_receiveFunctions+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	GOTO        L_end_genericMenuCondition
;menu.c,18 :: 		}
L_genericMenuCondition4:
;menu.c,19 :: 		}
	GOTO        L_genericMenuCondition0
L_genericMenuCondition1:
;menu.c,20 :: 		cleanBtnBack();
	CALL        _cleanBtnBack+0, 0
;menu.c,21 :: 		}
L_end_genericMenuCondition:
	RETURN      0
; end of _genericMenuCondition

_mainMenu:

;menu.c,23 :: 		void mainMenu(void){
;menu.c,25 :: 		pointerFunction functions[] = {&showMenu1, &showMenu2, &showMenu3};
	MOVLW       _showMenu1+0
	MOVWF       mainMenu_functions_L0+0 
	MOVLW       hi_addr(_showMenu1+0)
	MOVWF       mainMenu_functions_L0+1 
	MOVLW       0
	MOVWF       mainMenu_functions_L0+2 
	MOVLW       0
	MOVWF       mainMenu_functions_L0+3 
	MOVLW       _showMenu2+0
	MOVWF       mainMenu_functions_L0+4 
	MOVLW       hi_addr(_showMenu2+0)
	MOVWF       mainMenu_functions_L0+5 
	MOVLW       0
	MOVWF       mainMenu_functions_L0+6 
	MOVLW       0
	MOVWF       mainMenu_functions_L0+7 
	MOVLW       _showMenu3+0
	MOVWF       mainMenu_functions_L0+8 
	MOVLW       hi_addr(_showMenu3+0)
	MOVWF       mainMenu_functions_L0+9 
	MOVLW       0
	MOVWF       mainMenu_functions_L0+10 
	MOVLW       0
	MOVWF       mainMenu_functions_L0+11 
;menu.c,28 :: 		addFunctions(&mainMenuFunctions, &functions, &showMainMenu);
	MOVLW       mainMenu_mainMenuFunctions_L0+0
	MOVWF       FARG_addFunctions_dataMenu+0 
	MOVLW       hi_addr(mainMenu_mainMenuFunctions_L0+0)
	MOVWF       FARG_addFunctions_dataMenu+1 
	MOVLW       mainMenu_functions_L0+0
	MOVWF       FARG_addFunctions_functions+0 
	MOVLW       hi_addr(mainMenu_functions_L0+0)
	MOVWF       FARG_addFunctions_functions+1 
	MOVLW       _showMainMenu+0
	MOVWF       FARG_addFunctions_displayFunction+0 
	MOVLW       hi_addr(_showMainMenu+0)
	MOVWF       FARG_addFunctions_displayFunction+1 
	MOVLW       FARG_showMainMenu_valueReceive+0
	MOVWF       FARG_addFunctions_displayFunction+2 
	MOVLW       hi_addr(FARG_showMainMenu_valueReceive+0)
	MOVWF       FARG_addFunctions_displayFunction+3 
	CALL        _addFunctions+0, 0
;menu.c,30 :: 		setValueMenuButton(0,0,2,1);
	CLRF        FARG_setValueMenuButton_initVar+0 
	CLRF        FARG_setValueMenuButton_minVar+0 
	MOVLW       2
	MOVWF       FARG_setValueMenuButton_maxVar+0 
	MOVLW       1
	MOVWF       FARG_setValueMenuButton_incVar+0 
	CALL        _setValueMenuButton+0, 0
;menu.c,31 :: 		returnedFunction = genericMenuCondition(mainMenuFunctions);
	MOVLW       6
	MOVWF       R0 
	MOVLW       FARG_genericMenuCondition_receiveFunctions+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(FARG_genericMenuCondition_receiveFunctions+0)
	MOVWF       FSR1L+1 
	MOVLW       mainMenu_mainMenuFunctions_L0+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(mainMenu_mainMenuFunctions_L0+0)
	MOVWF       FSR0L+1 
L_mainMenu5:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_mainMenu5
	CALL        _genericMenuCondition+0, 0
	MOVF        R0, 0 
	MOVWF       mainMenu_returnedFunction_L0+0 
	MOVF        R1, 0 
	MOVWF       mainMenu_returnedFunction_L0+1 
	MOVF        R2, 0 
	MOVWF       mainMenu_returnedFunction_L0+2 
	MOVF        R3, 0 
	MOVWF       mainMenu_returnedFunction_L0+3 
;menu.c,32 :: 		returnedFunction();
	MOVF        mainMenu_returnedFunction_L0+0, 0 
	MOVWF       R0 
	MOVF        mainMenu_returnedFunction_L0+1, 0 
	MOVWF       R1 
	CALL        _____DoIFC+0, 0
;menu.c,33 :: 		}
L_end_mainMenu:
	RETURN      0
; end of _mainMenu
