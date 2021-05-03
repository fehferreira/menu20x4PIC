#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/main.c"
#line 1 "c:/users/felipe-oficina/documents/programação/mikroc/menu20-4library/src/menu/buttonheader.h"
#line 1 "c:/users/felipe-oficina/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 10 "c:/users/felipe-oficina/documents/programação/mikroc/menu20-4library/src/menu/buttonheader.h"
extern sfr sbit buttonVoltar;
extern sfr sbit buttonEsquerda;
extern sfr sbit buttonDireita;
extern sfr sbit buttonOK;

extern sfr sbit TRIS_buttonVoltar;
extern sfr sbit TRIS_buttonEsquerda;
extern sfr sbit TRIS_buttonDireita;
extern sfr sbit TRIS_buttonOK;

void testButton(void);
void configButton(void);
void configTMR0(void);
void resetTMR0(void);

 _Bool  backBtnPress(void);
 _Bool  okBtnPress(void);

void cleanBtnOk(void);
void cleanBtnBack(void);
unsigned short getSelectValue(void);
#line 10 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/main.c"
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

sbit buttonVoltar at RB4_bit;
sbit buttonEsquerda at RB5_bit;
sbit buttonDireita at RB6_bit;
sbit buttonOK at RB7_bit;

sbit TRIS_buttonVoltar at TRISB4_bit;
sbit TRIS_buttonEsquerda at TRISB5_bit;
sbit TRIS_buttonDireita at TRISB6_bit;
sbit TRIS_buttonOK at TRISB7_bit;

void InitializeSystem(void){
 TRISA = 0b00000000;
 TRISB = 0b00000000;

 Lcd_Init();
 configTMR0();
 configButton();
}

void main(void){
 InitializeSystem();

 while(1){

 }
}

void interrupt_low(void){
 if(TMR0IF_bit){
 resetTMR0();
 testButton();
 }
}
