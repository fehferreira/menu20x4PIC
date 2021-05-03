
_cleanLCD:

;viewMenu.c,12 :: 		void cleanLCD(void){
;viewMenu.c,13 :: 		cleanFlagCleanLCD();
	CALL        _cleanFlagCleanLCD+0, 0
;viewMenu.c,14 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;viewMenu.c,15 :: 		}
L_end_cleanLCD:
	RETURN      0
; end of _cleanLCD

_showMainMenu:

;viewMenu.c,17 :: 		void showMainMenu(unsigned short valueReceive){
;viewMenu.c,18 :: 		if(flagCleanLCDisSet())
	CALL        _flagCleanLCDisSet+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_showMainMenu0
;viewMenu.c,19 :: 		cleanLCD();
	CALL        _cleanLCD+0, 0
L_showMainMenu0:
;viewMenu.c,21 :: 		Lcd_Out(1,1,"->MONTADORAS");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_viewMenu+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_viewMenu+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;viewMenu.c,22 :: 		Lcd_Out(2,2,montadoras[valueReceive]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       20
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        FARG_showMainMenu_valueReceive+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _montadoras+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_montadoras+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;viewMenu.c,23 :: 		}
L_end_showMainMenu:
	RETURN      0
; end of _showMainMenu
