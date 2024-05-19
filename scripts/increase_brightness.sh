#!/bin/bash
brightness=$(xbacklight -get)

brightness="${brightness%\.*}"

if ((brightness < 100)); then
	((brightness=brightness+5))

	xbacklight -set "${brightness}"
fi
