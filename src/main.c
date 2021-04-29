/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MAIN FILE
*/

void InitializeSystem(void){
    TRISA = 0b00000000;
    TRISB = 0b00000000;

}

void main(void){

    InitializeSystem();

}