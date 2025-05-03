#ifndef SSD1306_H
#define SSD1306H

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

void updateDisplay(Adafruit_SSD1306 &display, int number);

#endif