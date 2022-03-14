#!/bin/bash

CHARGING_STATUS=/sys/class/power_supply/BAT0/status
PERC=$(cat /sys/class/power_supply/BAT0/capacity)
RED="#bf616a"

if [ $PERC -eq 100 ] ; then
	echo -n " $PERC%"
else
	if grep -q "Charging" $CHARGING_STATUS ; then
		echo -n " $PERC%"
	else
		if [ $PERC -ge 80 ] ; then
			echo -n " $PERC%"
		elif [ $PERC -ge 60 ] ; then
			echo -n " $PERC%"
		elif [ $PERC -ge 40 ] ; then
			echo -n " $PERC%"
		elif [ $PERC -ge 20 ] ; then
			echo -n " $PERC%"
		else
			echo -n "%{F$RED}%{F-} $PERC%"
			dunstify "Low battery" -a "ignorehistory" -u critical -r 9998
		fi
	fi
fi
