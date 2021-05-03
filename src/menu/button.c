/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   BUTTON MAIN FILE
*/

#include "buttonHeader.h"

union flagButton{
    char allFlags;
    struct{
        char flagBack: 1;
        char flagLeft: 1;
        char flagRight: 1;
        char flagOk: 1;
    };
}flagsButton;

unsigned short valueButton;

void testButton(void){
    if(!flagsButton.flagBack    && buttonBack)  flagsButton.flagBack = 1;
    if(!flagsButton.flagLeft    && buttonLeft)  flagsButton.flagLeft = 1;
    if(!flagsButton.flagRight   && buttonRight) flagsButton.flagRight = 1;
    if(!flagsButton.flagOk      && buttonOK)    flagsButton.flagOk = 1;
    
    if(flagsButton.flagBack    && !buttonBack){
        flagsButton.flagBack = 0;
    }
    
    if(flagsButton.flagLeft    && !buttonLeft){
        flagsButton.flagLeft = 0;
    }
    
    if(flagsButton.flagRight   && !buttonRight){
        flagsButton.flagRight = 0;
    }
    
    if(flagsButton.flagOk      && !buttonOK){
        flagsButton.flagOk = 0;
    }
}

void configButton(void){
    TRIS_buttonBack = 1;
    TRIS_buttonLeft = 1;
    TRIS_buttonRight = 1;
    TRIS_buttonOK = 1;
}

void configTMR0(void){
    T0CON         = 0x88;  //config TMR0 interrupt by 4ms
    
    TMR0H         = 0xB1;
    TMR0L         = 0xE0;
    if(!GIEL_bit)GIEL_bit = 1;
    if(!IPEN_bit) IPEN_bit = 1;
    
    TMR0IE_bit         = 1;
    TMR0IF_bit   = 0;
}

void resetTMR0(void){
    TMR0H         = 0xB1;
    TMR0L         = 0xE0;
    TMR0IF_bit   = 0;
}

bool backBtnPress(void){
    if(flagsButton.flagBack)
        return true;
    return false;
}

bool okBtnPress(void){
    if(flagsButton.flagOk)
        return true;
    return false;
}

void cleanBtnOk(void){
    flagsButton.flagOk = 0;
}

void cleanBtnBack(void){
    flagsButton.flagBack = 0;
}

unsigned short getSelectValue(void){
    return valueButton;
}

