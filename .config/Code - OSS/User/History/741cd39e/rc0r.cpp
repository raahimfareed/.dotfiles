#include <Arduino.h>
#include <Servo.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

#define I2C_ADDR 0x27 // Most common I2C address for 16x2 LCDs

const int irPins[] = {9, 8, 7, 6, 5, 4};
const int servoPin = 10;

Servo myServo;
LiquidCrystal_I2C lcd(I2C_ADDR, 16, 2);

bool prevIrStates[6] = {false, false, false, false, false, false};
int Ir6;
int state = 0;

const byte rPin = A0;
const byte gPin = A1;
const byte bPin = A2;

void setup()
{
  Serial.begin(115200);
  myServo.attach(servoPin);
  myServo.write(10);
  for (int i = 0; i < 6; i++)
  {
    pinMode(irPins[i], INPUT);
  }

  // Initialize the LCD
  lcd.init();
  lcd.backlight();
}

void loop()
{
  bool currentIrStates[6];
  bool anyStateChanged = false;
  for (int i = 0; i < 6; i++)
  {
    currentIrStates[i] = digitalRead(irPins[i]) == LOW;
    if (currentIrStates[i] != prevIrStates[i])
    {
      prevIrStates[i] = currentIrStates[i];
      anyStateChanged = true;
    }
  }
  if (anyStateChanged)
  {
    for (int i = 0; i < 6; i++)
    {
      Serial.print(currentIrStates[i] ? "1" : "0");
    }
    Serial.println();
  }

  Ir6 = digitalRead(irPins[5]);
  if (Ir6 == 0 and state == 0)
  {
    myServo.write(110);
    state = 1;
  }
  else if (Ir6 == 1 and state == 1)
  {
    delay(2500);
    myServo.write(10);
    state = 0;
  }

  // Display IR sensor states and parking status on the LCD
  lcd.setCursor(0, 0); // Set cursor to the second line
  lcd.print("Slots: ");
  for (int i = 0; i < 5; i++)
  {
    lcd.print(currentIrStates[i] ? "1" : "0");
    if (i < 4)
    {
      lcd.print(",");
    }
  }

  delay(1);
}