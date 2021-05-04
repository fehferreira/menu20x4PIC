/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU MAIN FILE
*/

#include "menuHeader.h"

void genericMenuCondition(void (*pointerDisplayFunction)(unsigned short valueReceive)){
    while(!backBtnPress()){
        while(!backBtnPress() || !okBtnPress())
            pointerDisplayFunction(getSelectValue());

        if(okBtnPress()){
            return;
        }
    }
    cleanBtnBack();
}

void mainMenu(void){
    setValueMenuButton(0,0,2,1);
    genericMenuCondition(&showMainMenu);
}