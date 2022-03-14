#!/bin/bash

echo -n "timer: " 
read MINUTES

dunstify "Timer: ${MINUTES} min" -a "ignorehistory" -u low -t 1000 -r 9990
# dunstify "Timer: ${MINUTES} min" -a "ignorehistory" -u low -t 1000 -r 9990 -h int:value:"$MINUTES"

setsid -f ~/.scripts/notify/timer.sh ${MINUTES}
