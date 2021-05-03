#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/menu/button.c"
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
#line 10 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/menu/button.c"
union flagButton{
 char flagsJuntas;
 struct{
 char flagVoltar: 1;
 char flagEsquerda: 1;
 char flagDireita: 1;
 char flagOk: 1;
 };
}flagsButton;

unsigned short valueButton;

void testButton(void){
 if(!flagsButton.flagVoltar && buttonVoltar) flagsButton.flagVoltar = 1;
 if(!flagsButton.flagEsquerda && buttonEsquerda) flagsButton.flagEsquerda = 1;
 if(!flagsButton.flagDireita && buttonDireita) flagsButton.flagDireita = 1;
 if(!flagsButton.flagOk && buttonOK) flagsButton.flagOk = 1;

 if(flagsButton.flagVoltar && !buttonVoltar){
 flagsButton.flagVoltar = 0;
 }

 if(flagsButton.flagEsquerda && !buttonEsquerda){
 flagsButton.flagEsquerda = 0;
 }

 if(flagsButton.flagDireita && !buttonDireita){
 flagsButton.flagDireita = 0;
 }

 if(flagsButton.flagOk && !buttonOK){
 flagsButton.flagOk = 0;
 }
}

void configButton(void){
 TRIS_buttonVoltar = 1;
 TRIS_buttonEsquerda = 1;
 TRIS_buttonDireita = 1;
 TRIS_buttonOK = 1;
}

void configTMR0(void){
 T0CON = 0x88;

 TMR0H = 0xB1;
 TMR0L = 0xE0;
 if(!GIEL_bit)GIEL_bit = 1;
 if(!IPEN_bit) IPEN_bit = 1;

 TMR0IE_bit = 1;
 TMR0IF_bit = 0;
}

void resetTMR0(void){
 TMR0H = 0xB1;
 TMR0L = 0xE0;
 TMR0IF_bit = 0;
}

 _Bool  backBtnPress(void){
 if(buttonVoltar)
 return  1 ;
 return  0 ;
}

 _Bool  okBtnPress(void){
 if(buttonOK)
 return  1 ;
 return  0 ;
}

void cleanBtnOk(void){
 flagsButton.flagOk = 0;
}

void cleanBtnBack(void){
 flagsButton.flagVoltar = 0;
}

unsigned short getSelectValue(void){
 return valueButton;
}
