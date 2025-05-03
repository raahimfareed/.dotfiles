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
    static int frame = 0;
    display.clearDisplay();
    display.drawBitmap(32, 0, frames[frame], FRAME_WIDTH, FRAME_HEIGHT, 1);
    display.display();
    frame = (frame + 1) % FRAME_COUNT;
    delay(FRAME_DELAY);
}