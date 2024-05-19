#include <Arduino.h>
#include <WiFi.h>
#include <FirebaseESP32.h>
#include <addons/RTDBHelper.h>
#define WIFI_SSID "Xiaomi 11T"
#define WIFI_PASSWORD "arrow007"
#define DATABASE_URL "smart-parking-fc814-default-rtdb.asia-southeast1.firebasedatabase.app"

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

void connectWiFi();

void setup()
{
  Serial.begin(9600);
  Serial2.begin(9600, SERIAL_8N1, 16, 17);
  connectWiFi();
}

void loop()
{
  if (Serial2.available() > 0)
  {
    String valuesStr = Serial2.readStringUntil('\n');
    char Ir1 = valuesStr.charAt(0);
    char Ir2 = valuesStr.charAt(1);
    char Ir3 = valuesStr.charAt(2);
    char Ir4 = valuesStr.charAt(3);
    char Ir5 = valuesStr.charAt(4);
    char Ir6 = valuesStr.charAt(5);
    String packet = String(Ir1) + String(Ir2) + String(Ir3) + String(Ir4) + String(Ir5) + String(Ir6);
    Serial.println("Received data: " + packet);
    Firebase.setString(fbdo, "/Data", packet);
  }
}

void connectWiFi()
{
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  config.database_url = DATABASE_URL;
  config.signer.test_mode = true;
  Firebase.begin(&config, &auth);
}