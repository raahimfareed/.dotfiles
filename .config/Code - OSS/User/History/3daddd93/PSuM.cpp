#include <Arduino.h>

int myFunction(int, int);

void setup()
{
  Serial.begin(115200);
  int result = myFunction(2, 3);
}

void loop()
{
}

int myFunction(int x, int y)
{
  return x + y;
}