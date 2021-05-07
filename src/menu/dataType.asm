
_addFunctions:

;dataType.c,10 :: 		void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction){
;dataType.c,11 :: 		dataMenu->functionsSelect = functions;
	MOVFF       FARG_addFunctions_dataMenu+0, FSR1L+0
	MOVFF       FARG_addFunctions_dataMenu+1, FSR1H+0
	MOVF        FARG_addFunctions_functions+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_addFunctions_functions+1, 0 
	MOVWF       POSTINC1+0 
;dataType.c,12 :: 		dataMenu->functionDisplay = displayFunction;
	MOVLW       2
	ADDWF       FARG_addFunctions_dataMenu+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_addFunctions_dataMenu+1, 0 
	MOVWF       FSR1L+1 
	MOVF        FARG_addFunctions_displayFunction+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_addFunctions_displayFunction+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_addFunctions_displayFunction+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_addFunctions_displayFunction+3, 0 
	MOVWF       POSTINC1+0 
;dataType.c,13 :: 		}
L_end_addFunctions:
	RETURN      0
; end of _addFunctions
