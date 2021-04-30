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