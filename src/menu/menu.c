/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU MAIN FILE
*/

#include "menuHeader.h"

typedef void (*pointerDisplayFunction)(unsigned short valueReceive);
typedef void (*pointerFunction)(void);

pointerFunction genericMenuCondition(pointerDisplayFunction functionDisplay, pointerFunction functions[]){
    while(!backBtnPress()){
        while(!okOrBackBtnPress())
            functionDisplay(getSelectValue());
        if(okBtnPress()){
            return functions[getSelectValue()];
        }
    }
    cleanBtnBack();
}

void mainMenu(void){
    pointerFunction functions[] = {&menu1, &menu2, &menu3};
    setValueMenuButton(0,0,2,1);
    genericMenuCondition(&showMainMenu, functions);
}