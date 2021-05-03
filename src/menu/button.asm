
_testButton:

;button.c,29 :: 		void testButton(void){
;button.c,30 :: 		if(!flagsButton.flagBack    && buttonBack)  flagsButton.flagBack = 1;
	BTFSC       _flagsButton+0, 0 
	GOTO        L_testButton2
	BTFSS       buttonBack+0, BitPos(buttonBack+0) 
	GOTO        L_testButton2
L__testButton45:
	BSF         _flagsButton+0, 0 
L_testButton2:
;button.c,31 :: 		if(!flagsButton.flagLeft    && buttonLeft)  flagsButton.flagLeft = 1;
	BTFSC       _flagsButton+0, 1 
	GOTO        L_testButton5
	BTFSS       buttonLeft+0, BitPos(buttonLeft+0) 
	GOTO        L_testButton5
L__testButton44:
	BSF         _flagsButton+0, 1 
L_testButton5:
;button.c,32 :: 		if(!flagsButton.flagRight   && buttonRight) flagsButton.flagRight = 1;
	BTFSC       _flagsButton+0, 2 
	GOTO        L_testButton8
	BTFSS       buttonRight+0, BitPos(buttonRight+0) 
	GOTO        L_testButton8
L__testButton43:
	BSF         _flagsButton+0, 2 
L_testButton8:
;button.c,33 :: 		if(!flagsButton.flagOk      && buttonOK)    flagsButton.flagOk = 1;
	BTFSC       _flagsButton+0, 3 
	GOTO        L_testButton11
	BTFSS       buttonOK+0, BitPos(buttonOK+0) 
	GOTO        L_testButton11
L__testButton42:
	BSF         _flagsButton+0, 3 
L_testButton11:
;button.c,35 :: 		if(flagsButton.flagBack    && !buttonBack){
	BTFSS       _flagsButton+0, 0 
	GOTO        L_testButton14
	BTFSC       buttonBack+0, BitPos(buttonBack+0) 
	GOTO        L_testButton14
L__testButton41:
;button.c,36 :: 		flagsButton.flagBack = 0;
	BCF         _flagsButton+0, 0 
;button.c,37 :: 		flagMenuBack = 1;
	BSF         _flagMenuBack+0, BitPos(_flagMenuBack+0) 
;button.c,38 :: 		}
L_testButton14:
;button.c,40 :: 		if(flagsButton.flagLeft    && !buttonLeft){
	BTFSS       _flagsButton+0, 1 
	GOTO        L_testButton17
	BTFSC       buttonLeft+0, BitPos(buttonLeft+0) 
	GOTO        L_testButton17
L__testButton40:
;button.c,41 :: 		flagsButton.flagLeft = 0;
	BCF         _flagsButton+0, 1 
;button.c,42 :: 		if(valueButton > minValue && valueButton <= maxValue)
	MOVF        _valueButton+0, 0 
	SUBWF       _minValue+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_testButton20
	MOVF        _valueButton+0, 0 
	SUBWF       _maxValue+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_testButton20
L__testButton39:
;button.c,43 :: 		valueButton -= incrementValue;
	MOVF        _incrementValue+0, 0 
	SUBWF       _valueButton+0, 1 
L_testButton20:
;button.c,44 :: 		}
L_testButton17:
;button.c,46 :: 		if(flagsButton.flagRight   && !buttonRight){
	BTFSS       _flagsButton+0, 2 
	GOTO        L_testButton23
	BTFSC       buttonRight+0, BitPos(buttonRight+0) 
	GOTO        L_testButton23
L__testButton38:
;button.c,47 :: 		flagsButton.flagRight = 0;
	BCF         _flagsButton+0, 2 
;button.c,48 :: 		if(valueButton < maxValue && valueButton >= minValue)
	MOVF        _maxValue+0, 0 
	SUBWF       _valueButton+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_testButton26
	MOVF        _minValue+0, 0 
	SUBWF       _valueButton+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_testButton26
L__testButton37:
;button.c,49 :: 		valueButton += incrementValue;
	MOVF        _incrementValue+0, 0 
	ADDWF       _valueButton+0, 1 
L_testButton26:
;button.c,50 :: 		}
L_testButton23:
;button.c,52 :: 		if(flagsButton.flagOk      && !buttonOK){
	BTFSS       _flagsButton+0, 3 
	GOTO        L_testButton29
	BTFSC       buttonOK+0, BitPos(buttonOK+0) 
	GOTO        L_testButton29
L__testButton36:
;button.c,53 :: 		flagsButton.flagOk = 0;
	BCF         _flagsButton+0, 3 
;button.c,54 :: 		flagMenuOk = 1;
	BSF         _flagMenuOk+0, BitPos(_flagMenuOk+0) 
;button.c,55 :: 		}
L_testButton29:
;button.c,56 :: 		}
L_end_testButton:
	RETURN      0
; end of _testButton

_configButton:

;button.c,58 :: 		void configButton(void){
;button.c,59 :: 		TRIS_buttonBack = 1;
	BSF         TRIS_buttonBack+0, BitPos(TRIS_buttonBack+0) 
;button.c,60 :: 		TRIS_buttonLeft = 1;
	BSF         TRIS_buttonLeft+0, BitPos(TRIS_buttonLeft+0) 
;button.c,61 :: 		TRIS_buttonRight = 1;
	BSF         TRIS_buttonRight+0, BitPos(TRIS_buttonRight+0) 
;button.c,62 :: 		TRIS_buttonOK = 1;
	BSF         TRIS_buttonOK+0, BitPos(TRIS_buttonOK+0) 
;button.c,64 :: 		flagMenuBack = 0;
	BCF         _flagMenuBack+0, BitPos(_flagMenuBack+0) 
;button.c,65 :: 		flagMenuOk = 0;
	BCF         _flagMenuOk+0, BitPos(_flagMenuOk+0) 
;button.c,66 :: 		flagCleanLCD = 0;
	BCF         _flagCleanLCD+0, BitPos(_flagCleanLCD+0) 
;button.c,68 :: 		}
L_end_configButton:
	RETURN      0
; end of _configButton

_configTMR0:

;button.c,70 :: 		void configTMR0(void){
;button.c,71 :: 		T0CON         = 0x88;  //config TMR0 interrupt by 4ms
	MOVLW       136
	MOVWF       T0CON+0 
;button.c,72 :: 		TMR0H         = 0xB1;
	MOVLW       177
	MOVWF       TMR0H+0 
;button.c,73 :: 		TMR0L         = 0xE0;
	MOVLW       224
	MOVWF       TMR0L+0 
;button.c,75 :: 		if(!GIEH_bit) GIEH_bit = 1;
	BTFSC       GIEH_bit+0, BitPos(GIEH_bit+0) 
	GOTO        L_configTMR030
	BSF         GIEH_bit+0, BitPos(GIEH_bit+0) 
L_configTMR030:
;button.c,76 :: 		if(!GIEL_bit) GIEL_bit = 1;
	BTFSC       GIEL_bit+0, BitPos(GIEL_bit+0) 
	GOTO        L_configTMR031
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_configTMR031:
;button.c,77 :: 		if(!IPEN_bit) IPEN_bit = 1;
	BTFSC       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_configTMR032
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
L_configTMR032:
;button.c,79 :: 		TMR0IE_bit  = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;button.c,80 :: 		TMR0IP_bit  = 0;
	BCF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;button.c,81 :: 		TMR0IF_bit  = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;button.c,82 :: 		}
L_end_configTMR0:
	RETURN      0
; end of _configTMR0

_resetTMR0:

;button.c,84 :: 		void resetTMR0(void){
;button.c,85 :: 		TMR0H         = 0xB1;
	MOVLW       177
	MOVWF       TMR0H+0 
;button.c,86 :: 		TMR0L         = 0xE0;
	MOVLW       224
	MOVWF       TMR0L+0 
;button.c,87 :: 		TMR0IF_bit   = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;button.c,88 :: 		}
L_end_resetTMR0:
	RETURN      0
; end of _resetTMR0

_backBtnPress:

;button.c,90 :: 		bool backBtnPress(void){
;button.c,91 :: 		if(flagMenuBack)
	BTFSS       _flagMenuBack+0, BitPos(_flagMenuBack+0) 
	GOTO        L_backBtnPress33
;button.c,92 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_backBtnPress
L_backBtnPress33:
;button.c,93 :: 		return false;
	CLRF        R0 
;button.c,94 :: 		}
L_end_backBtnPress:
	RETURN      0
; end of _backBtnPress

_okBtnPress:

;button.c,96 :: 		bool okBtnPress(void){
;button.c,97 :: 		if(flagMenuOk)
	BTFSS       _flagMenuOk+0, BitPos(_flagMenuOk+0) 
	GOTO        L_okBtnPress34
;button.c,98 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_okBtnPress
L_okBtnPress34:
;button.c,99 :: 		return false;
	CLRF        R0 
;button.c,100 :: 		}
L_end_okBtnPress:
	RETURN      0
; end of _okBtnPress

_cleanBtnOk:

;button.c,102 :: 		void cleanBtnOk(void){
;button.c,103 :: 		flagMenuOk = 0;
	BCF         _flagMenuOk+0, BitPos(_flagMenuOk+0) 
;button.c,104 :: 		}
L_end_cleanBtnOk:
	RETURN      0
; end of _cleanBtnOk

_cleanBtnBack:

;button.c,106 :: 		void cleanBtnBack(void){
;button.c,107 :: 		flagMenuBack = 0;
	BCF         _flagMenuBack+0, BitPos(_flagMenuBack+0) 
;button.c,108 :: 		}
L_end_cleanBtnBack:
	RETURN      0
; end of _cleanBtnBack

_getSelectValue:

;button.c,110 :: 		unsigned short getSelectValue(void){
;button.c,111 :: 		return valueButton;
	MOVF        _valueButton+0, 0 
	MOVWF       R0 
;button.c,112 :: 		}
L_end_getSelectValue:
	RETURN      0
; end of _getSelectValue

_setValueMenuButton:

;button.c,114 :: 		void setValueMenuButton(char initVar, char minVar, char maxVar, char incVar){
;button.c,115 :: 		valueButton = initVar;
	MOVF        FARG_setValueMenuButton_initVar+0, 0 
	MOVWF       _valueButton+0 
;button.c,116 :: 		minValue = minVar;
	MOVF        FARG_setValueMenuButton_minVar+0, 0 
	MOVWF       _minValue+0 
;button.c,117 :: 		maxValue = maxVar;
	MOVF        FARG_setValueMenuButton_maxVar+0, 0 
	MOVWF       _maxValue+0 
;button.c,118 :: 		incrementValue = incVar;
	MOVF        FARG_setValueMenuButton_incVar+0, 0 
	MOVWF       _incrementValue+0 
;button.c,119 :: 		}
L_end_setValueMenuButton:
	RETURN      0
; end of _setValueMenuButton

_flagCleanLCDisSet:

;button.c,121 :: 		bool flagCleanLCDisSet(void){
;button.c,122 :: 		if(flagCleanLCD)
	BTFSS       _flagCleanLCD+0, BitPos(_flagCleanLCD+0) 
	GOTO        L_flagCleanLCDisSet35
;button.c,123 :: 		return true;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_flagCleanLCDisSet
L_flagCleanLCDisSet35:
;button.c,124 :: 		return false;
	CLRF        R0 
;button.c,125 :: 		}
L_end_flagCleanLCDisSet:
	RETURN      0
; end of _flagCleanLCDisSet

_setFlagCleanLCD:

;button.c,127 :: 		void setFlagCleanLCD(void){
;button.c,128 :: 		flagCleanLCD = 1;
	BSF         _flagCleanLCD+0, BitPos(_flagCleanLCD+0) 
;button.c,129 :: 		}
L_end_setFlagCleanLCD:
	RETURN      0
; end of _setFlagCleanLCD

_cleanFlagCleanLCD:

;button.c,131 :: 		void cleanFlagCleanLCD(void){
;button.c,132 :: 		flagCleanLCD = 0;
	BCF         _flagCleanLCD+0, BitPos(_flagCleanLCD+0) 
;button.c,133 :: 		}
L_end_cleanFlagCleanLCD:
	RETURN      0
; end of _cleanFlagCleanLCD
