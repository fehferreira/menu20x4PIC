/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   BUTTON MAIN FILE
*/

#include "buttonHeader.h"

void testButton(void){
    if(flagsButton.flagVoltar){
        flagsButton.flagVoltar = 0;
    }
}