#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/menu20x4PIC/src/menu/menu.c"
#line 1 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/menuheader.h"
#line 1 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/buttonheader.h"
#line 1 "c:/users/felipe-home/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 10 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/buttonheader.h"
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
void setValueButton(char initVar);
void setValueMenuButton(char minVar, char maxVar, char incVar);
#line 10 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/menuheader.h"
void mainMenu(void);

void showMenu1(void);
void showMenu2(void);
void showMenu3(void);
void showMainMenu(unsigned short valueReceive);
#line 1 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/datatypeheader.h"
#line 8 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/datatypeheader.h"
typedef void (*pointerDisplayFunction)(unsigned short valueReceive);
typedef void (*pointerFunction)(void);

typedef struct{
 pointerFunction *functionsSelect;
 pointerDisplayFunction functionDisplay;
}MenuFunctions;

void addFunctions(MenuFunctions *dataMenu, pointerFunction *functions, pointerDisplayFunction displayFunction);
#line 11 "C:/Users/Felipe-HOME/Documents/programas/PIC/menu20x4PIC/src/menu/menu.c"
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
 cleanBtnOk( );
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
