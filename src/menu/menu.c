/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU MAIN FILE
*/

#include "menuHeader.h"
#include "dataType_header.h"

pointerFunction genericMenuCondition(MenuFunctions receiveFunctions){
    while(!backBtnPress()){
        while(!okOrBackBtnPress())
            receiveFunctions.functionDisplay(getSelectValue());
        if(okBtnPress()){
            cleanBtnOk();
            return receiveFunctions.functionsSelect[getSelectValue()];
        }
    }
    cleanBtnBack();
}

void mainMenu(void){
    MenuFunctions mainMenuFunctions;
    pointerFunction functions[] = {&showMenu1, &showMenu2, &showMenu3};
    pointerFunction returnedFunction;
    
    addFunctions(&mainMenuFunctions, &functions, &showMainMenu);
    
    setValueMenuButton(0,0,2,1);
    returnedFunction = genericMenuCondition(mainMenuFunctions);
    returnedFunction();
}