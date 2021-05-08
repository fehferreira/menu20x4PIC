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

void showMenu1(void){
    if(flagCleanLCDisSet())
        cleanLCD();
    Lcd_Out(3,1,"->Menu1");
}

void showMenu2(void){
    if(flagCleanLCDisSet())
        cleanLCD();
    Lcd_Out(3,1,"->Menu2");
}

void showMenu3(void){
    if(flagCleanLCDisSet())
        cleanLCD();
    Lcd_Out(3,1,"->Menu3");
}

void showMainMenu(unsigned short valueReceive){
    if(flagCleanLCDisSet())
        cleanLCD();

    Lcd_Out(1,1,"->MONTADORAS");
    Lcd_Out(2,2,montadoras[valueReceive]);
}