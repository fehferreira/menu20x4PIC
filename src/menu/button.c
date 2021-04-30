/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   BUTTON MAIN FILE
*/

#include "buttonHeader.h"

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

void configTMR0(void){
    T0CON	 = 0x88;  //config TMR0 interrupt by 4ms
    
    TMR0H	 = 0xB1;
    TMR0L	 = 0xE0;
    if(!GIEL_bit)GIEL_bit = 1;
    if(!IPEN_bit) IPEN_bit = 1;
    
    TMR0IE_bit	 = 1;
    TMR0IF_bit   = 0;
}

void configButton(char *btnVoltar, char *btnEsquerda, char *btnDireita, char *btnOK){

}

void resetTMR0(void){
    TMR0H	 = 0xB1;
    TMR0L	 = 0xE0;
    TMR0IF_bit   = 0;
}

