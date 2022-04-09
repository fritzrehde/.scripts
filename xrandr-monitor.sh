#!/bin/sh

# if [ -n "$(xrandr | grep "DP1 connected primary")" ]; then
if [ -n "$(xrandr | grep "DP2 connected")" ]; then
	xrandr \
		--output LVDS1 --off \
		--output DP2 --mode 1920x1080 --above LVDS1 --orientation normal
elif [ -n "$(xrandr | grep "DP1 connected")" ]; then
	xrandr \
		--output LVDS1 --off \
		--output DP1 --mode 1920x1080 --above LVDS1 --orientation normal
	# bspc monitor DP1 -d 1 2 3 4 5 6 7 8 9 0
	# bspc wm -r
		# --output LVDS1 --off
		# --output LVDS1 --primary --mode 1366x768 --orientation normal \
	# xrandr \
		# --output LVDS1 --off \
		# --output DP1 --primary --mode 1920x1080 --above LVDS1
else
	xrandr \
		--output LVDS1 --mode 1366x768 --below DP1 --orientation normal \
		--output DP1 --off
	# xrandr \
		# --output LVDS1 --primary --mode 1366x768 --below DP1 \
		# --output DP1 --off
fi

bspc wm -r
