#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20x4Library/src/menu/dataType.c"
#line 1 "c:/users/felipe-oficina/documents/programação/mikroc/menu20x4library/src/menu/datatype_header.h"
#line 8 "c:/users/felipe-oficina/documents/programação/mikroc/menu20x4library/src/menu/datatype_header.h"
typedef void (*pointerDisplayFunction)(unsigned short valueReceive);
typedef void (*pointerFunction)(void);

typedef struct{
 pointerFunction *functionsSelect;
 pointerDisplayFunction functionDisplay;
}MenuFunctions;

void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction);
#line 10 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20x4Library/src/menu/dataType.c"
void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction){
 dataMenu->functionsSelect = functions;
 dataMenu->functionDisplay = displayFunction;
}
