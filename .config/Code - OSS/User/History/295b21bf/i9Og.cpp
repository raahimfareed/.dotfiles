#include <Arduino.h>

#include <Keyboard.h>

#include <RotaryEncoder.h>

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#include "ssd1306.h"

const uint8_t rotarySwitch = 8;

RotaryEncoder encoder(A1, A2, RotaryEncoder::LatchMode::TWO03);

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64

#define OLED_RESET -1       // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3C ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

void setup()
{
  Serial.begin(115200);
  Serial.println("Hello, World!");

  Keyboard.begin();

  pinMode(rotarySwitch, INPUT_PULLUP);

  if (!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS))
  {
    Serial.println(F("SSD1306 allocation failed"));
    for (;;)
      ; // Don't proceed, loop forever
  }

  display.clearDisplay();
  display.drawPixel(10, 10, SSD1306_WHITE);
}

void loop()
{
  static int pos = 0;
  static bool invert = false;
  encoder.tick();
  int newPos = encoder.getPosition();

  int input = digitalRead(rotarySwitch);
  if (!input)
  {
    invert = !invert;
    delay(250);
  }

  display.invertDisplay(invert);

  if (pos != newPos)
  {
    Serial.print("pos:");
    Serial.println(newPos);
    updateDisplay(display, newPos * 5);

    int direction = (int)(encoder.getDirection());
    if (direction > 0)
    {
      Serial.println("Working");
      // Keyboard.press(KEY_VO);
      // Keyboard.write('R');
      // Keyboard.write('u');
      // Keyboard.write('y');
      // Keyboard.write('a');
      // Keyboard.write('n');
      Keyboard.print(" _________ ");
      Keyboard.write(KEY_KP_ENTER);
      Keyboard.print("< testing >");
      Keyboard.write(KEY_KP_ENTER);
      Keyboard.print(" _________ ");
      Keyboard.write(KEY_KP_ENTER);
      Keyboard.print("        \\   ^__^");
      Keyboard.write(KEY_KP_ENTER);
      Keyboard.print("         \\  (oo)\\_______");
      Keyboard.write(KEY_KP_ENTER);
      Keyboard.print("            (__)\\       )\\/\\");
      Keyboard.write(KEY_KP_ENTER);
      Keyboard.print("                ||----w |");
      Keyboard.write(KEY_KP_ENTER);
      Keyboard.print("                ||     ||");
      Keyboard.write(KEY_KP_ENTER);
    }
    else
    {
      // Keyboard.write(KEY_BACKSPACE);
      // Keyboard.write(KEY_BACKSPACE);
      // Keyboard.write(KEY_BACKSPACE);
      // Keyboard.write(KEY_BACKSPACE);
      // Keyboard.write(KEY_BACKSPACE);
    }
    pos = newPos;
  }
}
