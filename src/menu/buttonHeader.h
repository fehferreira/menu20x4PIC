/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   HEADER BUTTON FILE
*/

extern sfr sbit buttonVoltar;
extern sfr sbit buttonEsquerda;
extern sfr sbit buttonDireita;
extern sfr sbit buttonOK;

extern sfr sbit TRIS_buttonVoltar;
extern sfr sbit TRIS_buttonEsquerda;
extern sfr sbit TRIS_buttonDireita;
extern sfr sbit TRIS_buttonOK;

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
void configButton(void);
void configTMR0(void);
void resetTMR0(void);