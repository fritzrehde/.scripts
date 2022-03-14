#!/bin/bash

# battery health
BAT=/sys/class/power_supply/BAT0

RAW_FULL=$(cat $BAT/energy_full)
if [ -z $RAW_FULL ] ; then
	RAW_FULL=$(cat $BAT/charge_full)
	RAW_FULL_DESIGN=$(cat $BAT/charge_full_design)
else
	RAW_FULL_DESIGN=$(cat $BAT/energy_full)
fi

BAT_FULL=$(echo -n $RAW_FULL | cut -c -4)
BAT_FULL_DESIGN=$(echo -n $RAW_FULL_DESIGN | cut -c -4)
BAT_HEALTH=$((BAT_FULL * 100 / BAT_FULL_DESIGN))
# echo "battery: $BAT_FULL mAh ($BAT_HEALTH%)"

# free space
DF=$(df -H | grep home)
DISK_USED=$(echo "$DF" | awk '{ print $3 }')
DISK_USED_PERC=$(echo "$DF" | awk '{ print $5 }')
# echo "disk:    $DISK_USED ($DISK_USED_PERC)"

dunstify "bat:  $BAT_FULL mAh ($BAT_HEALTH%)
disk: $DISK_USED ($DISK_USED_PERC)" -a "ignorehistory" -u low -t 0 -r 9987
