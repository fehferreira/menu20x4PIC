/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: MAY 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU DATATYPE FILE
*/

#include "dataTypeHeader.h"

void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction){
    dataMenu->functionsSelect = functions;
    dataMenu->functionDisplay = displayFunction;
}