
_testButton:

;button.c,20 :: 		void testButton(void){
;button.c,21 :: 		if(!flagsButton.flagVoltar      && buttonVoltar)   flagsButton.flagVoltar = 1;
	BTFSC       _flagsButton+0, 0 
	GOTO        L_testButton2
	BTFSS       buttonVoltar+0, BitPos(buttonVoltar+0) 
	GOTO        L_testButton2
L__testButton33:
	BSF         _flagsButton+0, 0 
L_testButton2:
;button.c,22 :: 		if(!flagsButton.flagEsquerda    && buttonEsquerda) flagsButton.flagEsquerda = 1;
	BTFSC       _flagsButton+0, 1 
	GOTO        L_testButton5
	BTFSS       buttonEsquerda+0, BitPos(buttonEsquerda+0) 
	GOTO        L_testButton5
L__testButton32:
	BSF         _flagsButton+0, 1 
L_testButton5:
;button.c,23 :: 		if(!flagsButton.flagDireita     && buttonDireita)  flagsButton.flagDireita = 1;
	BTFSC       _flagsButton+0, 2 
	GOTO        L_testButton8
	BTFSS       buttonDireita+0, BitPos(buttonDireita+0) 
	GOTO        L_testButton8
L__testButton31:
	BSF         _flagsButton+0, 2 
L_testButton8:
;button.c,24 :: 		if(!flagsButton.flagOk          && buttonOK)       flagsButton.flagOk = 1;
	BTFSC       _flagsButton+0, 3 
	GOTO        L_testButton11
	BTFSS       buttonOK+0, BitPos(buttonOK+0) 
	GOTO        L_testButton11
L__testButton30:
	BSF         _flagsButton+0, 3 
L_testButton11:
;button.c,26 :: 		if(flagsButton.flagVoltar      && !buttonVoltar){
	BTFSS       _flagsButton+0, 0 
	GOTO        L_testButton14
	BTFSC       buttonVoltar+0, BitPos(buttonVoltar+0) 
	GOTO        L_testButton14
L__testButton29:
;button.c,27 :: 		flagsButton.flagVoltar = 0;
	BCF         _flagsButton+0, 0 
;button.c,28 :: 		}
L_testButton14:
;button.c,30 :: 		if(flagsButton.flagEsquerda    && !buttonEsquerda){
	BTFSS       _flagsButton+0, 1 
	GOTO        L_testButton17
	BTFSC       buttonEsquerda+0, BitPos(buttonEsquerda+0) 
	GOTO        L_testButton17
L__testButton28:
;button.c,31 :: 		flagsButton.flagEsquerda = 0;
	BCF         _flagsButton+0, 1 
;button.c,32 :: 		}
L_testButton17:
;button.c,34 :: 		if(flagsButton.flagDireita     && !buttonDireita){
	BTFSS       _flagsButton+0, 2 
	GOTO        L_testButton20
	BTFSC       buttonDireita+0, BitPos(buttonDireita+0) 
	GOTO        L_testButton20
L__testButton27:
;button.c,35 :: 		flagsButton.flagDireita = 0;
	BCF         _flagsButton+0, 2 
;button.c,36 :: 		}
L_testButton20:
;button.c,38 :: 		if(flagsButton.flagOk          && !buttonOK){
	BTFSS       _flagsButton+0, 3 
	GOTO        L_testButton23
	BTFSC       buttonOK+0, BitPos(buttonOK+0) 
	GOTO        L_testButton23
L__testButton26:
;button.c,39 :: 		flagsButton.flagOk = 0;
	BCF         _flagsButton+0, 3 
;button.c,40 :: 		}
L_testButton23:
;button.c,41 :: 		}
L_end_testButton:
	RETURN      0
; end of _testButton

_configButton:

;button.c,43 :: 		void configButton(void){
;button.c,44 :: 		TRIS_buttonVoltar = 1;
	BSF         TRIS_buttonVoltar+0, BitPos(TRIS_buttonVoltar+0) 
;button.c,45 :: 		TRIS_buttonEsquerda = 1;
	BSF         TRIS_buttonEsquerda+0, BitPos(TRIS_buttonEsquerda+0) 
;button.c,46 :: 		TRIS_buttonDireita = 1;
	BSF         TRIS_buttonDireita+0, BitPos(TRIS_buttonDireita+0) 
;button.c,47 :: 		TRIS_buttonOK = 1;
	BSF         TRIS_buttonOK+0, BitPos(TRIS_buttonOK+0) 
;button.c,48 :: 		}
L_end_configButton:
	RETURN      0
; end of _configButton

_configTMR0:

;button.c,50 :: 		void configTMR0(void){
;button.c,51 :: 		T0CON         = 0x88;  //config TMR0 interrupt by 4ms
	MOVLW       136
	MOVWF       T0CON+0 
;button.c,53 :: 		TMR0H         = 0xB1;
	MOVLW       177
	MOVWF       TMR0H+0 
;button.c,54 :: 		TMR0L         = 0xE0;
	MOVLW       224
	MOVWF       TMR0L+0 
;button.c,55 :: 		if(!GIEL_bit)GIEL_bit = 1;
	BTFSC       GIEL_bit+0, BitPos(GIEL_bit+0) 
	GOTO        L_configTMR024
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_configTMR024:
;button.c,56 :: 		if(!IPEN_bit) IPEN_bit = 1;
	BTFSC       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_configTMR025
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
L_configTMR025:
;button.c,58 :: 		TMR0IE_bit         = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;button.c,59 :: 		TMR0IF_bit   = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;button.c,60 :: 		}
L_end_configTMR0:
	RETURN      0
; end of _configTMR0

_resetTMR0:

;button.c,62 :: 		void resetTMR0(void){
;button.c,63 :: 		TMR0H         = 0xB1;
	MOVLW       177
	MOVWF       TMR0H+0 
;button.c,64 :: 		TMR0L         = 0xE0;
	MOVLW       224
	MOVWF       TMR0L+0 
;button.c,65 :: 		TMR0IF_bit   = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;button.c,66 :: 		}
L_end_resetTMR0:
	RETURN      0
; end of _resetTMR0

_backBtnPress:

;button.c,68 :: 		bool backBtnPress(void){
;button.c,69 :: 		return buttonVoltar;
	MOVLW       0
	BTFSC       buttonVoltar+0, BitPos(buttonVoltar+0) 
	MOVLW       1
	MOVWF       R0 
;button.c,70 :: 		}
L_end_backBtnPress:
	RETURN      0
; end of _backBtnPress
