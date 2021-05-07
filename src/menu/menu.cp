#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20x4Library/src/menu/menu.c"
#line 1 "c:/users/felipe-oficina/documents/programação/mikroc/menu20x4library/src/menu/menuheader.h"
#line 1 "c:/users/felipe-oficina/documents/programação/mikroc/menu20x4library/src/menu/buttonheader.h"
#line 1 "c:/users/felipe-oficina/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 10 "c:/users/felipe-oficina/documents/programação/mikroc/menu20x4library/src/menu/buttonheader.h"
extern sfr sbit buttonBack;
extern sfr sbit buttonLeft;
extern sfr sbit buttonRight;
extern sfr sbit buttonOK;

extern sfr sbit TRIS_buttonBack;
extern sfr sbit TRIS_buttonLeft;
extern sfr sbit TRIS_buttonRight;
extern sfr sbit TRIS_buttonOK;

void testButton(void);
void configButton(void);
void configTMR0(void);
void resetTMR0(void);

 _Bool  backBtnPress(void);
 _Bool  okBtnPress(void);
 _Bool  okOrBackBtnPress(void);
 _Bool  flagCleanLCDisSet(void);

void cleanBtnOk(void);
void cleanBtnBack(void);
void setFlagCleanLCD(void);
void cleanFlagCleanLCD(void);

unsigned short getSelectValue(void);
void setValueMenuButton(char initVar, char minVar, char maxVar, char incVar);
#line 10 "c:/users/felipe-oficina/documents/programação/mikroc/menu20x4library/src/menu/menuheader.h"
void mainMenu(void);

void showMenu1(void);
void showMenu2(void);
void showMenu3(void);
void showMainMenu(unsigned short valueReceive);
#line 1 "c:/users/felipe-oficina/documents/programação/mikroc/menu20x4library/src/menu/datatype_header.h"
#line 8 "c:/users/felipe-oficina/documents/programação/mikroc/menu20x4library/src/menu/datatype_header.h"
typedef void (*pointerDisplayFunction)(unsigned short valueReceive);
typedef void (*pointerFunction)(void);

typedef struct{
 pointerFunction *functionsSelect;
 pointerDisplayFunction functionDisplay;
}MenuFunctions;

void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction);
#line 11 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20x4Library/src/menu/menu.c"
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
