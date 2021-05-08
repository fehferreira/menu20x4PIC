/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU MAIN FILE
*/

#include "menuHeader.h"
#include "dataTypeHeader.h"

unsigned short statusMenuValue[5];
unsigned short actualPosition = 0;

unsigned short updateStatusMenuValue(char chooseAction, unsigned short valueReceive){
    if(chooseAction){
        statusMenuValue[actualPosition] = valueReceive;
        actualPosition++;
        return statusMenuValue[actualPosition];
    }
    if(actualPosition > 0){
        actualPosition--;
        actualPosition = statusMenuValue[actualPosition];
        return 0;
    }
    return 0;
}

pointerFunction genericMenuCondition(MenuFunctions receiveFunctions){
    while(!backBtnPress()){
        while(!okOrBackBtnPress())
            receiveFunctions.functionDisplay(getSelectValue());
        if(okBtnPress()){
            unsigned short valueReceive = getSelectValue();
            cleanBtnOk(    );
            updateStatusMenuValue(1, valueReceive);
            return receiveFunctions.functionsSelect[valueReceive];
        }
    }
    updateStatusMenuValue(0,0);
    cleanBtnBack();
}

void mainMenu(void){
    MenuFunctions mainMenuFunctions;
    pointerFunction functions[] = {&showMenu1, &showMenu2, &showMenu3};
    pointerFunction returnedFunction;
    
    addFunctions(&mainMenuFunctions, &functions, &showMainMenu);
    
    setValueMenuButton(0,2,1);
    returnedFunction = genericMenuCondition(mainMenuFunctions);
    returnedFunction();
}