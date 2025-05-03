#ifndef SSD1306_H
#define SSD1306H

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define NUMFLAKES 10
#define LOGO_HEIGHT 16
#define LOGO_WIDTH 16

static const unsigned char PROGMEM logo_bmp[] =
    {0b00000000, 0b11000000,
     0b00000001, 0b11000000,
     0b00000001, 0b11000000,
     0b00000011, 0b11100000,
     0b11110011, 0b11100000,
     0b11111110, 0b11111000,
     0b01111110, 0b11111111,
     0b00110011, 0b10011111,
     0b00011111, 0b11111100,
     0b00001101, 0b01110000,
     0b00011011, 0b10100000,
     0b00111111, 0b11100000,
     0b00111111, 0b11110000,
     0b01111100, 0b11110000,
     0b01110000, 0b01110000,
     0b00000000, 0b00110000};

void testdrawline(); // Draw many lines

void testdrawrect(); // Draw rectangles (outlines)

void testfillrect(); // Draw rectangles (filled)

void testdrawcircle(); // Draw circles (outlines)

void testfillcircle(); // Draw circles (filled)

void testdrawroundrect(); // Draw rounded rectangles (outlines)

void testfillroundrect(); // Draw rounded rectangles (filled)

void testdrawtriangle(); // Draw triangles (outlines)

void testfilltriangle(); // Draw triangles (filled)

void testdrawchar(); // Draw characters of the default font

void testdrawstyles(); // Draw 'stylized' characters

void testscrolltext(); // Draw scrolling text

void testdrawbitmap();

void testanimate(const uint8_t *, uint8_t, uint8_t);

#endif