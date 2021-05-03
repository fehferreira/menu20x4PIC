#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/menu/menu.c"
#line 1 "c:/users/felipe-oficina/documents/programação/mikroc/menu20-4library/src/menu/menuheader.h"
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
#line 10 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/menu/menu.c"
void mainMenu(void){
 while(!backBtnPress()){
#line 24 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/menu/menu.c"
 }

}
