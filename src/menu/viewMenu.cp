#line 1 "C:/Users/Felipe-Oficina/Documents/Programa��o/MIKROC/menu20x4Library/src/menu/viewMenu.c"
#line 1 "c:/users/felipe-oficina/documents/programa��o/mikroc/menu20x4library/src/menu/menuheader.h"
#line 1 "c:/users/felipe-oficina/documents/programa��o/mikroc/menu20x4library/src/menu/buttonheader.h"
#line 1 "c:/users/felipe-oficina/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 10 "c:/users/felipe-oficina/documents/programa��o/mikroc/menu20x4library/src/menu/buttonheader.h"
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
 _Bool  flagCleanLCDisSet(void);

void cleanBtnOk(void);
void cleanBtnBack(void);
void setFlagCleanLCD(void);
void cleanFlagCleanLCD(void);

unsigned short getSelectValue(void);
void setValueMenuButton(char initVar, char minVar, char maxVar, char incVar);
#line 10 "c:/users/felipe-oficina/documents/programa��o/mikroc/menu20x4library/src/menu/menuheader.h"
void mainMenu(void);

void menu1(void);
void menu2(void);
void menu3(void);
void showMainMenu(unsigned short valueReceive);
#line 10 "C:/Users/Felipe-Oficina/Documents/Programa��o/MIKROC/menu20x4Library/src/menu/viewMenu.c"
char montadoras[3][20] = {"->FIAT","->FORD","->GM"};

void cleanLCD(void){
 cleanFlagCleanLCD();
 Lcd_Cmd(_LCD_CLEAR);
}

void menu1(void){
 if(flagCleanLCDisSet())
 cleanLCD();
 Lcd_Out(3,1,"menu1");
}

void menu2(void){
 if(flagCleanLCDisSet())
 cleanLCD();
 Lcd_Out(3,1,"menu2");
}

void menu3(void){
 if(flagCleanLCDisSet())
 cleanLCD();
 Lcd_Out(3,1,"menu3");
}

void showMainMenu(unsigned short valueReceive){
 if(flagCleanLCDisSet())
 cleanLCD();

 Lcd_Out(1,1,"->MONTADORAS");
 Lcd_Out(2,2,montadoras[valueReceive]);
}
