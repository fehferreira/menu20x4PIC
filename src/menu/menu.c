/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU MAIN FILE
*/

#include "menuHeader.h"

void mainMenu(void){
    while(!backBtnPress()){
        while(!backBtnPress() || !okBtnPress())
            showMainMenu(getSelectValue());

        if(okBtnPress()){
            cleanBtnOk();
            switch(getSelectValue()){
                case 0:
                    break;
                case 1:
                    break;
            }
        }
    }
    cleanBtnBack();
}