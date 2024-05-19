#!/bin/bash
bluetoothctl power on
bluetoothctl devices

echo "Type a mac address of the device you want to connect to"
read mac

bluetoothctl connect $mac
