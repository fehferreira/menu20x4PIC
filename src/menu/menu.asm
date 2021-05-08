
_insertStatusMenuValue:

;menu.c,14 :: 		unsigned short insertStatusMenuValue(char chooseAction, unsigned short valueReceive){
;menu.c,15 :: 		if(chooseAction){
	MOVF        FARG_insertStatusMenuValue_chooseAction+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_insertStatusMenuValue0
;menu.c,16 :: 		statusMenuValue[actualPosition] = valueReceive;
	MOVLW       _statusMenuValue+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_statusMenuValue+0)
	MOVWF       FSR1H 
	MOVF        _actualPosition+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        FARG_insertStatusMenuValue_valueReceive+0, 0 
	MOVWF       POSTINC1+0 
;menu.c,17 :: 		actualPosition++;
	INCF        _actualPosition+0, 1 
;menu.c,18 :: 		return statusMenuValue[actualPosition];
	MOVLW       _statusMenuValue+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_statusMenuValue+0)
	MOVWF       FSR0H 
	MOVF        _actualPosition+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	GOTO        L_end_insertStatusMenuValue
;menu.c,19 :: 		}
L_insertStatusMenuValue0:
;menu.c,20 :: 		if(actualPosition > 0){
	MOVF        _actualPosition+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_insertStatusMenuValue1
;menu.c,21 :: 		actualPosition--;
	DECF        _actualPosition+0, 1 
;menu.c,22 :: 		actualPosition = statusMenuValue[actualPosition];
	MOVLW       _statusMenuValue+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_statusMenuValue+0)
	MOVWF       FSR0H 
	MOVF        _actualPosition+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _actualPosition+0 
;menu.c,23 :: 		return;
	GOTO        L_end_insertStatusMenuValue
;menu.c,24 :: 		}
L_insertStatusMenuValue1:
;menu.c,25 :: 		return 0;
	CLRF        R0 
;menu.c,26 :: 		}
L_end_insertStatusMenuValue:
	RETURN      0
; end of _insertStatusMenuValue

_genericMenuCondition:

;menu.c,28 :: 		pointerFunction genericMenuCondition(MenuFunctions receiveFunctions){
;menu.c,29 :: 		while(!backBtnPress()){
L_genericMenuCondition2:
	CALL        _backBtnPress+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_genericMenuCondition3
;menu.c,30 :: 		while(!okOrBackBtnPress())
L_genericMenuCondition4:
	CALL        _okOrBackBtnPress+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_genericMenuCondition5
;menu.c,31 :: 		receiveFunctions.functionDisplay(getSelectValue());
	CALL        _getSelectValue+0, 0
	MOVF        FARG_genericMenuCondition_receiveFunctions+4, 0 
	MOVWF       FSR1 
	MOVF        FARG_genericMenuCondition_receiveFunctions+5, 0 
	MOVWF       FSR1H 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_genericMenuCondition_receiveFunctions+2, 0 
	MOVWF       R0 
	MOVF        FARG_genericMenuCondition_receiveFunctions+3, 0 
	MOVWF       R1 
	CALL        _____DoIFC+0, 0
	GOTO        L_genericMenuCondition4
L_genericMenuCondition5:
;menu.c,32 :: 		if(okBtnPress()){
	CALL        _okBtnPress+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_genericMenuCondition6
;menu.c,33 :: 		unsigned short valueReceive = getSelectValue();
	CALL        _getSelectValue+0, 0
	MOVF        R0, 0 
	MOVWF       genericMenuCondition_valueReceive_L2+0 
;menu.c,34 :: 		cleanBtnOk();
	CALL        _cleanBtnOk+0, 0
;menu.c,35 :: 		insertStatusMenuValue(0, valueReceive);
	CLRF        FARG_insertStatusMenuValue_chooseAction+0 
	MOVF        genericMenuCondition_valueReceive_L2+0, 0 
	MOVWF       FARG_insertStatusMenuValue_valueReceive+0 
	CALL        _insertStatusMenuValue+0, 0
;menu.c,36 :: 		return receiveFunctions.functionsSelect[valueReceive];
	MOVF        genericMenuCondition_valueReceive_L2+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       FARG_genericMenuCondition_receiveFunctions+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_genericMenuCondition_receiveFunctions+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	GOTO        L_end_genericMenuCondition
;menu.c,37 :: 		}
L_genericMenuCondition6:
;menu.c,38 :: 		}
	GOTO        L_genericMenuCondition2
L_genericMenuCondition3:
;menu.c,39 :: 		cleanBtnBack();
	CALL        _cleanBtnBack+0, 0
;menu.c,40 :: 		}
L_end_genericMenuCondition:
	RETURN      0
; end of _genericMenuCondition

_mainMenu:

;menu.c,42 :: 		void mainMenu(void){
;menu.c,44 :: 		pointerFunction functions[] = {&showMenu1, &showMenu2, &showMenu3};
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
;menu.c,47 :: 		addFunctions(&mainMenuFunctions, &functions, &showMainMenu);
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
;menu.c,49 :: 		setValueMenuButton(0,0,2,1);
	CLRF        FARG_setValueMenuButton_initVar+0 
	CLRF        FARG_setValueMenuButton_minVar+0 
	MOVLW       2
	MOVWF       FARG_setValueMenuButton_maxVar+0 
	MOVLW       1
	MOVWF       FARG_setValueMenuButton_incVar+0 
	CALL        _setValueMenuButton+0, 0
;menu.c,50 :: 		returnedFunction = genericMenuCondition(mainMenuFunctions);
	MOVLW       6
	MOVWF       R0 
	MOVLW       FARG_genericMenuCondition_receiveFunctions+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_genericMenuCondition_receiveFunctions+0)
	MOVWF       FSR1H 
	MOVLW       mainMenu_mainMenuFunctions_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(mainMenu_mainMenuFunctions_L0+0)
	MOVWF       FSR0H 
L_mainMenu7:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_mainMenu7
	CALL        _genericMenuCondition+0, 0
	MOVF        R0, 0 
	MOVWF       mainMenu_returnedFunction_L0+0 
	MOVF        R1, 0 
	MOVWF       mainMenu_returnedFunction_L0+1 
	MOVF        R2, 0 
	MOVWF       mainMenu_returnedFunction_L0+2 
	MOVF        R3, 0 
	MOVWF       mainMenu_returnedFunction_L0+3 
;menu.c,51 :: 		returnedFunction();
	MOVF        mainMenu_returnedFunction_L0+0, 0 
	MOVWF       R0 
	MOVF        mainMenu_returnedFunction_L0+1, 0 
	MOVWF       R1 
	CALL        _____DoIFC+0, 0
;menu.c,52 :: 		}
L_end_mainMenu:
	RETURN      0
; end of _mainMenu
