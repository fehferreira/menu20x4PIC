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

bit flagMenuOk,
    flagMenuBack;

char valueButton,
     minValue,
     maxValue,
     incrementValue;

void testButton(void){
    if(!flagsButton.flagBack    && buttonBack)  flagsButton.flagBack = 1;
    if(!flagsButton.flagLeft    && buttonLeft)  flagsButton.flagLeft = 1;
    if(!flagsButton.flagRight   && buttonRight) flagsButton.flagRight = 1;
    if(!flagsButton.flagOk      && buttonOK)    flagsButton.flagOk = 1;
    
    if(flagsButton.flagBack    && !buttonBack){
        flagsButton.flagBack = 0;
        flagMenuBack = 1;
    }
    
    if(flagsButton.flagLeft    && !buttonLeft){
        flagsButton.flagLeft = 0;
        if(valueButton > minValue && valueButton <= maxValue)
            valueButton -= incrementValue;
    }
    
    if(flagsButton.flagRight   && !buttonRight){
        flagsButton.flagRight = 0;
        if(valueButton < maxValue && valueButton >= minValue)
            valueButton += incrementValue;
    }
    
    if(flagsButton.flagOk      && !buttonOK){
        flagsButton.flagOk = 0;
        flagMenuOk = 1;
    }
}

void configButton(void){
    TRIS_buttonBack = 1;
    TRIS_buttonLeft = 1;
    TRIS_buttonRight = 1;
    TRIS_buttonOK = 1;
    
    flagMenuBack = 0;
    flagMenuOk = 0;
    
}

void configTMR0(void){
    T0CON         = 0x88;  //config TMR0 interrupt by 4ms
    TMR0H         = 0xB1;
    TMR0L         = 0xE0;
    
    if(!GIEH_bit) GIEH_bit = 1;
    if(!GIEL_bit) GIEL_bit = 1;
    if(!IPEN_bit) IPEN_bit = 1;
    
    TMR0IE_bit  = 1;
    TMR0IP_bit  = 0;
    TMR0IF_bit  = 0;
}

void resetTMR0(void){
    TMR0H         = 0xB1;
    TMR0L         = 0xE0;
    TMR0IF_bit   = 0;
}

bool backBtnPress(void){
    if(flagMenuBack)
        return true;
    return false;
}

bool okBtnPress(void){
    if(flagMenuOk)
        return true;
    return false;
}

void cleanBtnOk(void){
    flagMenuOk = 0;
}

void cleanBtnBack(void){
    flagMenuBack = 0;
}

unsigned short getSelectValue(void){
    return valueButton;
}

void setValueMenuButton(char initVar, char minVar, char maxVar, char incVar){
    valueButton = initVar;
    minValue = minVar;
    maxValue = maxVar;
    incrementValue = incVar;
}