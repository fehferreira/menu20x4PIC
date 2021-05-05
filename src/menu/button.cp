#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20x4Library/src/menu/button.c"
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
 _Bool  flagCleanLCDisSet(void);

void cleanBtnOk(void);
void cleanBtnBack(void);
void setFlagCleanLCD(void);
void cleanFlagCleanLCD(void);

unsigned short getSelectValue(void);
void setValueMenuButton(char initVar, char minVar, char maxVar, char incVar);
#line 10 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20x4Library/src/menu/button.c"
union flagButton{
 char allFlags;
 struct{
 char flagBack: 1;
 char flagLeft: 1;
 char flagRight: 1;
 char flagOk: 1;
 };
}flagsButton;

bit flagMenuOk,
 flagMenuBack,
 flagCleanLCD;

char valueButton,
 minValue,
 maxValue,
 incrementValue;

void testButton(void){
 if(!flagsButton.flagBack && buttonBack) flagsButton.flagBack = 1;
 if(!flagsButton.flagLeft && buttonLeft) flagsButton.flagLeft = 1;
 if(!flagsButton.flagRight && buttonRight) flagsButton.flagRight = 1;
 if(!flagsButton.flagOk && buttonOK) flagsButton.flagOk = 1;

 if(flagsButton.flagBack && !buttonBack){
 flagsButton.flagBack = 0;
 flagMenuBack = 1;
 setFlagCleanLCD();
 }

 if(flagsButton.flagLeft && !buttonLeft){
 flagsButton.flagLeft = 0;
 if(valueButton > minValue && valueButton <= maxValue)
 valueButton -= incrementValue;
 setFlagCleanLCD();
 }

 if(flagsButton.flagRight && !buttonRight){
 flagsButton.flagRight = 0;
 if(valueButton < maxValue && valueButton >= minValue)
 valueButton += incrementValue;
 setFlagCleanLCD();
 }

 if(flagsButton.flagOk && !buttonOK){
 flagsButton.flagOk = 0;
 flagMenuOk = 1;
 setFlagCleanLCD();
 }
}

void configButton(void){
 TRIS_buttonBack = 1;
 TRIS_buttonLeft = 1;
 TRIS_buttonRight = 1;
 TRIS_buttonOK = 1;

 flagMenuBack = 0;
 flagMenuOk = 0;
 flagCleanLCD = 0;

}

void configTMR0(void){
 T0CON = 0x88;
 TMR0H = 0xB1;
 TMR0L = 0xE0;

 if(!GIEH_bit) GIEH_bit = 1;
 if(!GIEL_bit) GIEL_bit = 1;
 if(!IPEN_bit) IPEN_bit = 1;

 TMR0IE_bit = 1;
 TMR0IP_bit = 0;
 TMR0IF_bit = 0;
}

void resetTMR0(void){
 TMR0H = 0xB1;
 TMR0L = 0xE0;
 TMR0IF_bit = 0;
}

 _Bool  backBtnPress(void){
 if(flagMenuBack)
 return  1 ;
 return  0 ;
}

 _Bool  okBtnPress(void){
 if(flagMenuOk)
 return  1 ;
 return  0 ;
}

void cleanBtnOk(void){
 flagMenuOk = 0;
}

void cleanBtnBack(void){
 flagMenuBack = 0;
}

unsigned short getSelectValue(void){
 return valueButton;
}

void setValueMenuButton(char initVar, char minVar, char maxVar, char incVar){
 valueButton = initVar;
 minValue = minVar;
 maxValue = maxVar;
 incrementValue = incVar;
}

 _Bool  flagCleanLCDisSet(void){
 if(flagCleanLCD)
 return  1 ;
 return  0 ;
}

void setFlagCleanLCD(void){
 flagCleanLCD = 1;
}

void cleanFlagCleanLCD(void){
 flagCleanLCD = 0;
}
