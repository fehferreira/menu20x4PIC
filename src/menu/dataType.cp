#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/menu20x4PIC/src/menu/dataType.c"
#line 1 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/datatypeheader.h"
#line 8 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/datatypeheader.h"
typedef void (*pointerDisplayFunction)(unsigned short valueReceive);
typedef void (*pointerFunction)(void);

typedef struct{
 pointerFunction *functionsSelect;
 pointerDisplayFunction functionDisplay;
}MenuFunctions;

void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction);
#line 10 "C:/Users/Felipe-HOME/Documents/programas/PIC/menu20x4PIC/src/menu/dataType.c"
void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction){
 dataMenu->functionsSelect = functions;
 dataMenu->functionDisplay = displayFunction;
}
