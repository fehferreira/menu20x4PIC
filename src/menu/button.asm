
_testButton:

;button.c,10 :: 		void testButton(void){
;button.c,11 :: 		if(!flagsButton.flagVoltar      && buttonVoltar)   flagsButton.flagVoltar = 1;
	BTFSC       _flagsButton+0, 0 
	GOTO        L_testButton2
	MOVF        _buttonVoltar+0, 0 
	IORWF       _buttonVoltar+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_testButton2
L__testButton31:
	BSF         _flagsButton+0, 0 
L_testButton2:
;button.c,12 :: 		if(!flagsButton.flagEsquerda    && buttonEsquerda) flagsButton.flagEsquerda = 1;
	BTFSC       _flagsButton+0, 1 
	GOTO        L_testButton5
	MOVF        _buttonEsquerda+0, 0 
	IORWF       _buttonEsquerda+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_testButton5
L__testButton30:
	BSF         _flagsButton+0, 1 
L_testButton5:
;button.c,13 :: 		if(!flagsButton.flagDireita     && buttonDireita)  flagsButton.flagDireita = 1;
	BTFSC       _flagsButton+0, 2 
	GOTO        L_testButton8
	MOVF        _buttonDireita+0, 0 
	IORWF       _buttonDireita+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_testButton8
L__testButton29:
	BSF         _flagsButton+0, 2 
L_testButton8:
;button.c,14 :: 		if(!flagsButton.flagOk          && buttonOK)       flagsButton.flagOk = 1;
	BTFSC       _flagsButton+0, 3 
	GOTO        L_testButton11
	MOVF        _buttonOK+0, 0 
	IORWF       _buttonOK+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_testButton11
L__testButton28:
	BSF         _flagsButton+0, 3 
L_testButton11:
;button.c,16 :: 		if(flagsButton.flagVoltar      && !buttonVoltar){
	BTFSS       _flagsButton+0, 0 
	GOTO        L_testButton14
	MOVF        _buttonVoltar+0, 0 
	IORWF       _buttonVoltar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_testButton14
L__testButton27:
;button.c,17 :: 		flagsButton.flagVoltar = 0;
	BCF         _flagsButton+0, 0 
;button.c,18 :: 		}
L_testButton14:
;button.c,20 :: 		if(flagsButton.flagEsquerda    && !buttonEsquerda){
	BTFSS       _flagsButton+0, 1 
	GOTO        L_testButton17
	MOVF        _buttonEsquerda+0, 0 
	IORWF       _buttonEsquerda+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_testButton17
L__testButton26:
;button.c,21 :: 		flagsButton.flagEsquerda = 0;
	BCF         _flagsButton+0, 1 
;button.c,22 :: 		}
L_testButton17:
;button.c,24 :: 		if(flagsButton.flagDireita     && !buttonDireita){
	BTFSS       _flagsButton+0, 2 
	GOTO        L_testButton20
	MOVF        _buttonDireita+0, 0 
	IORWF       _buttonDireita+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_testButton20
L__testButton25:
;button.c,25 :: 		flagsButton.flagDireita = 0;
	BCF         _flagsButton+0, 2 
;button.c,26 :: 		}
L_testButton20:
;button.c,28 :: 		if(flagsButton.flagOk          && !buttonOK){
	BTFSS       _flagsButton+0, 3 
	GOTO        L_testButton23
	MOVF        _buttonOK+0, 0 
	IORWF       _buttonOK+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_testButton23
L__testButton24:
;button.c,29 :: 		flagsButton.flagOk = 0;
	BCF         _flagsButton+0, 3 
;button.c,30 :: 		}
L_testButton23:
;button.c,32 :: 		}
L_end_testButton:
	RETURN      0
; end of _testButton
