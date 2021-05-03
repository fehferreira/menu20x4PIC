/*
*   HW: PIC18F4550          VER: 0.0.1
*   DATE: APRIL 2021        AUTHOR: FELIPE FERREIRA
*   LIBRARY OF MENUS ON LCD 20X4
*   MAIN FILE
*/

#include "menu/buttonHeader.h"
#include "menu/menuHeader.h"

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

sbit buttonBack  at RB4_bit;
sbit buttonLeft  at RB5_bit;
sbit buttonRight at RB6_bit;
sbit buttonOK    at RB7_bit;

sbit TRIS_buttonBack    at TRISB4_bit;
sbit TRIS_buttonLeft    at TRISB5_bit;
sbit TRIS_buttonRight   at TRISB6_bit;
sbit TRIS_buttonOK      at TRISB7_bit;

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