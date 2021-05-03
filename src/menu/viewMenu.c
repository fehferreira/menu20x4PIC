/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   VIEW MENU FILE
*/

#include "menuHeader.h"

char montadoras[3][20] = {"->FIAT","->FORD","->GM"};

void cleanLCD(void){
    cleanFlagCleanLCD();
    Lcd_Cmd(_LCD_CLEAR);
}

void showMainMenu(unsigned short valueReceive){
    if(flagCleanLCDisSet())
        cleanLCD();

    Lcd_Out(1,1,"->MONTADORAS");
    Lcd_Out(2,2,montadoras[valueReceive]);
}