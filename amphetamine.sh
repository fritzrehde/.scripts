#!/bin/sh

# toggle between prevent sleep and auto sleep

SCREEN_SAVER_TIMEOUT=$(xset q | grep "Standby:" | awk '{ print $2 }')

if [ $SCREEN_SAVER_TIMEOUT -ne 0 ]; then
	# xset s off
	xset dpms 0 0 0
	# xset -dpms
	polybar-msg action amphetamine hook 1
else
	# xset s on
	xset dpms 600 600 600
	# xset +dpms
	polybar-msg action amphetamine hook 0
fi
