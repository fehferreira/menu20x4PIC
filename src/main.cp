#line 1 "C:/Users/Felipe-HOME/Documents/programas/PIC/menu20x4PIC/src/main.c"
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
#line 1 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/menuheader.h"
#line 1 "c:/users/felipe-home/documents/programas/pic/menu20x4pic/src/menu/buttonheader.h"
#line 1 "c:/users/felipe-home/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"
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
#line 11 "C:/Users/Felipe-HOME/Documents/programas/PIC/menu20x4PIC/src/main.c"
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;

sbit buttonBack at RB4_bit;
sbit buttonLeft at RB5_bit;
sbit buttonRight at RB6_bit;
sbit buttonOK at RB7_bit;

sbit TRIS_buttonBack at TRISB4_bit;
sbit TRIS_buttonLeft at TRISB5_bit;
sbit TRIS_buttonRight at TRISB6_bit;
sbit TRIS_buttonOK at TRISB7_bit;

void InitializeSystem(void){
 TRISA = 0b00000000;
 TRISB = 0b00000000;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 configTMR0();
 configButton();
}

void main(void){
 InitializeSystem();

 while(1){
 mainMenu();
 }
}

void interrupt_low(void){
 if(TMR0IF_bit){
 resetTMR0();
 testButton();
 }
}
