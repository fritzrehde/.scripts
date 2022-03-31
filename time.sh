#!/bin/sh

TIME=$(date +"%H:%M")
dunstify "$TIME" -a "ignorehistory" -u low -t 0 -r 9986
