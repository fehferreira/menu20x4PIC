/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   BUTTON MAIN FILE
*/

#include "buttonHeader.h"

union flagButton{
    char flagsJuntas;
    struct{
        char flagVoltar: 1;
        char flagEsquerda: 1;
        char flagDireita: 1;
        char flagOk: 1;
    };
}flagsButton;

unsigned short valueButton;

void testButton(void){
    if(!flagsButton.flagVoltar      && buttonVoltar)   flagsButton.flagVoltar = 1;
    if(!flagsButton.flagEsquerda    && buttonEsquerda) flagsButton.flagEsquerda = 1;
    if(!flagsButton.flagDireita     && buttonDireita)  flagsButton.flagDireita = 1;
    if(!flagsButton.flagOk          && buttonOK)       flagsButton.flagOk = 1;
    
    if(flagsButton.flagVoltar      && !buttonVoltar){
        flagsButton.flagVoltar = 0;
    }
    
    if(flagsButton.flagEsquerda    && !buttonEsquerda){
        flagsButton.flagEsquerda = 0;
    }
    
    if(flagsButton.flagDireita     && !buttonDireita){
        flagsButton.flagDireita = 0;
    }
    
    if(flagsButton.flagOk          && !buttonOK){
        flagsButton.flagOk = 0;
    }
}

void configButton(void){
    TRIS_buttonVoltar = 1;
    TRIS_buttonEsquerda = 1;
    TRIS_buttonDireita = 1;
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
    if(buttonVoltar)
        return true;
    return false;
}

bool okBtnPress(void){
    if(buttonOK)
        return true;
    return false;
}

void cleanBtnOk(void){
    flagsButton.flagOk = 0;
}

void cleanBtnBack(void){
    flagsButton.flagVoltar = 0;
}

unsigned short getSelectValue(void){
    return valueButton;
}

