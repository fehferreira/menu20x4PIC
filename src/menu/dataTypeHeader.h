/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: MAY 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MENU DATATYPE HEADER
*/

typedef void (*pointerDisplayFunction)(unsigned short valueReceive);
typedef void (*pointerFunction)(void);

typedef struct{
    pointerFunction *functionsSelect;
    pointerDisplayFunction functionDisplay;
}MenuFunctions;

void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction);