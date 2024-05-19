#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#include "ssd1306.h"

void updateDisplay(Adafruit_SSD1306 &display, int number)
{
    display.clearDisplay();
    display.setCursor(10, 31);

    display.setTextSize(1);
    display.setTextColor(SSD1306_WHITE);

    display.cp437(true);

    String formatted = "Rotation: " + String(number);

    display.write(formatted.c_str());

    display.display();
}

void animate(Adafruit_SSD1306 &display)
{
}