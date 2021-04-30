#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/main.c"
#line 1 "c:/users/felipe-oficina/documents/programação/mikroc/menu20-4library/src/menu/buttonheader.h"
#line 8 "c:/users/felipe-oficina/documents/programação/mikroc/menu20-4library/src/menu/buttonheader.h"
extern char *buttonVoltar;
extern char *buttonEsquerda;
extern char *buttonDireita;
extern char *buttonOK;

union flagButton{
 char flagsJuntas;
 struct{
 char flagVoltar: 1;
 char flagEsquerda: 1;
 char flagDireita: 1;
 char flagOk: 1;
 };
}flagsButton;

void testButton(void);
void configTMR0(void);
void resetTMR0(void);
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


char msnInicial [21] = "---- JC MODULOS ----";
char tracos [21] = "--------------------";

void InitializeSystem(void){
 TRISA = 0b00000000;
 TRISB = 0b00000000;

 Lcd_Init();
 configTMR0();

}

void main(void){
 InitializeSystem();

 Lcd_Out(1,1,tracos);
 Lcd_Out(2,1,msnInicial);
 Lcd_Out(3,1,msnInicial);
 Lcd_Out(4,1,tracos);

 while(1){

 }
}

void interrupt_low(void){
 if(TMR0IF_bit){
 resetTMR0();
 testButton();
 }
}
