/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   HEADER BUTTON FILE
*/

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

