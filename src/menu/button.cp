#line 1 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/menu/button.c"
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
#line 10 "C:/Users/Felipe-Oficina/Documents/Programação/MIKROC/menu20-4Library/src/menu/button.c"
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
