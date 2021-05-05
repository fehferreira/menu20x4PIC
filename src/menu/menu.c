/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU MAIN FILE
*/

#include "menuHeader.h"

typedef void (*pointerDisplayFunction)(unsigned short valueReceive);
typedef void (*pointerFunction)(void);

void genericMenuCondition(pointerDisplayFunction functionDisplay){
    while(!backBtnPress()){
        while(!backBtnPress() || !okBtnPress())
            functionDisplay(getSelectValue());

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