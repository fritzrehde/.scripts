#!/bin/sh

if [ -n "$(xrandr | grep "DP1 connected")" ]; then
	bspc monitor DP1 -d 1 2 3 4 5 6 7 8 9 0
else
	bspc monitor LVDS1 -d 1 2 3 4 5 6 7 8 9 0
fi
