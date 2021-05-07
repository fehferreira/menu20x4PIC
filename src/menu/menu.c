/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU MAIN FILE
*/

#include "menuHeader.h"

typedef void (*pointerDisplayFunction)(unsigned short valueReceive);
typedef void (*pointerFunction)(void);

typedef struct{
    pointerFunction *functionsSelect;
    pointerDisplayFunction functionDisplay;
}MenuFunctions;

pointerFunction genericMenuCondition(pointerDisplayFunction functionDisplay, pointerFunction functions[]){
    while(!backBtnPress()){
        while(!okOrBackBtnPress())
            functionDisplay(getSelectValue());
        if(okBtnPress()){
            cleanBtnOk();
            return functions[getSelectValue()];
        }
    }
    cleanBtnBack();
}

void mainMenu(void){
    MenuFunctions mainMenuFunctions;
    pointerFunction functions[] = {&showMenu1, &showMenu2, &showMenu3};
    pointerFunction returnedFunction;
    
    mainMenuFunctions.functionsSelect = functions;
    
    setValueMenuButton(0,0,2,1);
    returnedFunction = genericMenuCondition(&showMainMenu, functions);
    returnedFunction();
}