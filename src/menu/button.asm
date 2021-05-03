
_testButton:

;button.c,28 :: 		void testButton(void){
;button.c,29 :: 		if(!flagsButton.flagBack    && buttonBack)  flagsButton.flagBack = 1;
	BTFSC       _flagsButton+0, 0 
	GOTO        L_testButton2
	BTFSS       buttonBack+0, BitPos(buttonBack+0) 
	GOTO        L_testButton2
L__testButton43:
	BSF         _flagsButton+0, 0 
L_testButton2:
;button.c,30 :: 		if(!flagsButton.flagLeft    && buttonLeft)  flagsButton.flagLeft = 1;
	BTFSC       _flagsButton+0, 1 
	GOTO        L_testButton5
	BTFSS       buttonLeft+0, BitPos(buttonLeft+0) 
	GOTO        L_testButton5
L__testButton42:
	BSF         _flagsButton+0, 1 
L_testButton5:
;button.c,31 :: 		if(!flagsButton.flagRight   && buttonRight) flagsButton.flagRight = 1;
	BTFSC       _flagsButton+0, 2 
	GOTO        L_testButton8
	BTFSS       buttonRight+0, BitPos(buttonRight+0) 
	GOTO        L_testButton8
L__testButton41:
	BSF         _flagsButton+0, 2 
L_testButton8:
;button.c,32 :: 		if(!flagsButton.flagOk      && buttonOK)    flagsButton.flagOk = 1;
	BTFSC       _flagsButton+0, 3 
	GOTO        L_testButton11
	BTFSS       buttonOK+0, BitPos(buttonOK+0) 
	GOTO        L_testButton11
L__testButton40:
	BSF         _flagsButton+0, 3 
L_testButton11:
;button.c,34 :: 		if(flagsButton.flagBack    && !buttonBack){
	BTFSS       _flagsButton+0, 0 
	GOTO        L_testButton14
	BTFSC       buttonBack+0, BitPos(buttonBack+0) 
	GOTO        L_testButton14
L__testButton39:
;button.c,35 :: 		flagsButton.flagBack = 0;
	BCF         _flagsButton+0, 0 
;button.c,36 :: 		flagMenuBack = 1;
	BSF         _flagMenuBack+0, BitPos(_flagMenuBack+0) 
;button.c,37 :: 		}
L_testButton14:
;button.c,39 :: 		if(flagsButton.flagLeft    && !buttonLeft){
	BTFSS       _flagsButton+0, 1 
	GOTO        L_testButton17
	BTFSC       buttonLeft+0, BitPos(buttonLeft+0) 
	GOTO        L_testButton17
L__testButton38:
;button.c,40 :: 		flagsButton.flagLeft = 0;
	BCF         _flagsButton+0, 1 
;button.c,41 :: 		if((valueButton - incrementValue) < minValue || (valueButton - incrementValue) >= maxValue)
	MOVF        _incrementValue+0, 0 
	SUBWF       _valueButton+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testButton45
	MOVF        _minValue+0, 0 
	SUBWF       R1, 0 
L__testButton45:
	BTFSS       STATUS+0, 0 
	GOTO        L__testButton37
	MOVF        _incrementValue+0, 0 
	SUBWF       _valueButton+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testButton46
	MOVF        _maxValue+0, 0 
	SUBWF       R1, 0 
L__testButton46:
	BTFSC       STATUS+0, 0 
	GOTO        L__testButton37
	GOTO        L_testButton20
L__testButton37:
;button.c,42 :: 		valueButton = minValue;
	MOVF        _minValue+0, 0 
	MOVWF       _valueButton+0 
L_testButton20:
;button.c,43 :: 		valueButton -= incrementValue;
	MOVF        _incrementValue+0, 0 
	SUBWF       _valueButton+0, 1 
;button.c,44 :: 		}
L_testButton17:
;button.c,46 :: 		if(flagsButton.flagRight   && !buttonRight){
	BTFSS       _flagsButton+0, 2 
	GOTO        L_testButton23
	BTFSC       buttonRight+0, BitPos(buttonRight+0) 
	GOTO        L_testButton23
L__testButton36:
;button.c,47 :: 		flagsButton.flagRight = 0;
	BCF         _flagsButton+0, 2 
;button.c,48 :: 		if((valueButton + incrementValue) > maxValue || (valueButton + incrementValue) == 0)
	MOVF        _incrementValue+0, 0 
	ADDWF       _valueButton+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testButton47
	MOVF        R1, 0 
	SUBWF       _maxValue+0, 0 
L__testButton47:
	BTFSS       STATUS+0, 0 
	GOTO        L__testButton35
	MOVF        _incrementValue+0, 0 
	ADDWF       _valueButton+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__testButton48
	MOVLW       0
	XORWF       R1, 0 
L__testButton48:
	BTFSC       STATUS+0, 2 
	GOTO        L__testButton35
	GOTO        L_testButton26
L__testButton35:
;button.c,49 :: 		valueButton = maxValue;
	MOVF        _maxValue+0, 0 
	MOVWF       _valueButton+0 
L_testButton26:
;button.c,50 :: 		valueButton += incrementValue;
	MOVF        _incrementValue+0, 0 
	ADDWF       _valueButton+0, 1 
;button.c,51 :: 		}
L_testButton23:
;button.c,53 :: 		if(flagsButton.flagOk      && !buttonOK){
	BTFSS       _flagsButton+0, 3 
	GOTO        L_testButton29
	BTFSC       buttonOK+0, BitPos(buttonOK+0) 
	GOTO        L_testButton29
L__testButton34:
;button.c,54 :: 		flagsButton.flagOk = 0;
	BCF         _flagsButton+0, 3 
;button.c,55 :: 		flagMenuOk = 1;
	BSF         _flagMenuOk+0, BitPos(_flagMenuOk+0) 
;button.c,56 :: 		}
L_testButton29:
;button.c,57 :: 		}
L_end_testButton:
	RETURN      0
; end of _testButton

_configButton:

;button.c,59 :: 		void configButton(void){
;button.c,60 :: 		TRIS_buttonBack = 1;
	BSF         TRIS_buttonBack+0, BitPos(TRIS_buttonBack+0) 
;button.c,61 :: 		TRIS_buttonLeft = 1;
	BSF         TRIS_buttonLeft+0, BitPos(TRIS_buttonLeft+0) 
;button.c,62 :: 		TRIS_buttonRight = 1;
	BSF         TRIS_buttonRight+0, BitPos(TRIS_buttonRight+0) 
;button.c,63 :: 		TRIS_buttonOK = 1;
	BSF         TRIS_buttonOK+0, BitPos(TRIS_buttonOK+0) 
;button.c,65 :: 		flagMenuBack = 0;
	BCF         _flagMenuBack+0, BitPos(_flagMenuBack+0) 
;button.c,66 :: 		flagMenuOk = 0;
	BCF         _flagMenuOk+0, BitPos(_flagMenuOk+0) 
;button.c,68 :: 		}
L_end_configButton:
	RETURN      0
; end of _configButton

_configTMR0:

;button.c,70 :: 		void configTMR0(void){
;button.c,71 :: 		T0CON         = 0x88;  //config TMR0 interrupt by 4ms
	MOVLW       136
	MOVWF       T0CON+0 
;button.c,73 :: 		TMR0H         = 0xB1;
	MOVLW       177
	MOVWF       TMR0H+0 
;button.c,74 :: 		TMR0L         = 0xE0;
	MOVLW       224
	MOVWF       TMR0L+0 
;button.c,75 :: 		if(!GIEL_bit)GIEL_bit = 1;
	BTFSC       GIEL_bit+0, BitPos(GIEL_bit+0) 
	GOTO        L_configTMR030
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_configTMR030:
;button.c,76 :: 		if(!IPEN_bit) IPEN_bit = 1;
	BTFSC       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_configTMR031
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
L_configTMR031:
;button.c,78 :: 		TMR0IE_bit         = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;button.c,79 :: 		TMR0IF_bit   = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;button.c,80 :: 		}
L_end_configTMR0:
	RETURN      0
; end of _configTMR0

_resetTMR0:

;button.c,82 :: 		void resetTMR0(void){
;button.c,83 :: 		TMR0H         = 0xB1;
	MOVLW       177
	MOVWF       TMR0H+0 
;button.c,84 :: 		TMR0L         = 0xE0;
	MOVLW       224
	MOVWF       TMR0L+0 
;button.c,85 :: 		TMR0IF_bit   = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;button.c,86 :: 		}
L_end_resetTMR0:
	RETURN      0
; end of _resetTMR0

_backBtnPress:

;button.c,88 :: 		bool backBtnPress(void){
;button.c,89 :: 		if(flagMenuBack)
	BTFSS       _flagMenuBack+0, BitPos(_flagMenuBack+0) 
	GOTO        L_backBtnPress32
;button.c,90 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_backBtnPress
L_backBtnPress32:
;button.c,91 :: 		return false;
	CLRF        R0 
;button.c,92 :: 		}
L_end_backBtnPress:
	RETURN      0
; end of _backBtnPress

_okBtnPress:

;button.c,94 :: 		bool okBtnPress(void){
;button.c,95 :: 		if(flagMenuOk)
	BTFSS       _flagMenuOk+0, BitPos(_flagMenuOk+0) 
	GOTO        L_okBtnPress33
;button.c,96 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_okBtnPress
L_okBtnPress33:
;button.c,97 :: 		return false;
	CLRF        R0 
;button.c,98 :: 		}
L_end_okBtnPress:
	RETURN      0
; end of _okBtnPress

_cleanBtnOk:

;button.c,100 :: 		void cleanBtnOk(void){
;button.c,101 :: 		flagMenuOk = 0;
	BCF         _flagMenuOk+0, BitPos(_flagMenuOk+0) 
;button.c,102 :: 		}
L_end_cleanBtnOk:
	RETURN      0
; end of _cleanBtnOk

_cleanBtnBack:

;button.c,104 :: 		void cleanBtnBack(void){
;button.c,105 :: 		flagMenuBack = 0;
	BCF         _flagMenuBack+0, BitPos(_flagMenuBack+0) 
;button.c,106 :: 		}
L_end_cleanBtnBack:
	RETURN      0
; end of _cleanBtnBack

_getSelectValue:

;button.c,108 :: 		unsigned short getSelectValue(void){
;button.c,109 :: 		return valueButton;
	MOVF        _valueButton+0, 0 
	MOVWF       R0 
;button.c,110 :: 		}
L_end_getSelectValue:
	RETURN      0
; end of _getSelectValue

_setValueMenuButton:

;button.c,112 :: 		void setValueMenuButton(char initVar, char minVar, char maxVar, char incVar){
;button.c,113 :: 		valueButton = initVar;
	MOVF        FARG_setValueMenuButton_initVar+0, 0 
	MOVWF       _valueButton+0 
;button.c,114 :: 		minValue = minVar;
	MOVF        FARG_setValueMenuButton_minVar+0, 0 
	MOVWF       _minValue+0 
;button.c,115 :: 		maxValue = maxVar;
	MOVF        FARG_setValueMenuButton_maxVar+0, 0 
	MOVWF       _maxValue+0 
;button.c,116 :: 		incrementValue = incVar;
	MOVF        FARG_setValueMenuButton_incVar+0, 0 
	MOVWF       _incrementValue+0 
;button.c,117 :: 		}
L_end_setValueMenuButton:
	RETURN      0
; end of _setValueMenuButton
