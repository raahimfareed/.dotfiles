#!/bin/bash
brightness=$(xbacklight -get)

brightness="${brightness%\.*}"

if ((brightness > 10)); then
	((brightness=brightness-5))
elif ((brightness > 5)); then
	((brightness=brightness-1))
fi

xbacklight -set "${brightness}"
