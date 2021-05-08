
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

_showMenu1:

;viewMenu.c,17 :: 		void showMenu1(void){
;viewMenu.c,18 :: 		if(flagCleanLCDisSet())
	CALL        _flagCleanLCDisSet+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_showMenu10
;viewMenu.c,19 :: 		cleanLCD();
	CALL        _cleanLCD+0, 0
L_showMenu10:
;viewMenu.c,20 :: 		Lcd_Out(3,1,"->Menu1");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_viewMenu+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_viewMenu+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;viewMenu.c,21 :: 		}
L_end_showMenu1:
	RETURN      0
; end of _showMenu1

_showMenu2:

;viewMenu.c,23 :: 		void showMenu2(void){
;viewMenu.c,24 :: 		if(flagCleanLCDisSet())
	CALL        _flagCleanLCDisSet+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_showMenu21
;viewMenu.c,25 :: 		cleanLCD();
	CALL        _cleanLCD+0, 0
L_showMenu21:
;viewMenu.c,26 :: 		Lcd_Out(3,1,"->Menu2");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_viewMenu+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_viewMenu+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;viewMenu.c,27 :: 		}
L_end_showMenu2:
	RETURN      0
; end of _showMenu2

_showMenu3:

;viewMenu.c,29 :: 		void showMenu3(void){
;viewMenu.c,30 :: 		if(flagCleanLCDisSet())
	CALL        _flagCleanLCDisSet+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_showMenu32
;viewMenu.c,31 :: 		cleanLCD();
	CALL        _cleanLCD+0, 0
L_showMenu32:
;viewMenu.c,32 :: 		Lcd_Out(3,1,"->Menu3");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_viewMenu+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_viewMenu+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;viewMenu.c,33 :: 		}
L_end_showMenu3:
	RETURN      0
; end of _showMenu3

_showMainMenu:

;viewMenu.c,35 :: 		void showMainMenu(unsigned short valueReceive){
;viewMenu.c,36 :: 		if(flagCleanLCDisSet())
	CALL        _flagCleanLCDisSet+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_showMainMenu3
;viewMenu.c,37 :: 		cleanLCD();
	CALL        _cleanLCD+0, 0
L_showMainMenu3:
;viewMenu.c,39 :: 		Lcd_Out(1,1,"->MONTADORAS");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_viewMenu+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_viewMenu+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;viewMenu.c,40 :: 		Lcd_Out(2,2,montadoras[valueReceive]);
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
;viewMenu.c,41 :: 		}
L_end_showMainMenu:
	RETURN      0
; end of _showMainMenu
